/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Set up input
direction_input = -1;
input_jump = "a";
input_attack = "b";
input_swap = "select";
with(id_input)
{
	scr_Input_Add_Verb(other.input_jump);
	scr_Input_Add_Verb(other.input_attack);
	scr_Input_Add_Verb(other.input_swap);
}
id_input.mouse_available = false;

// Behavior vars
hurt_time = 0.3;
hurt_timer = 0;

direction_facing = 0;
direction_aiming = 0;
can_move = true;
can_act = true;
action = 0;
run_speed = 105;
max_fall_speed = run_speed * 2;
jump_force = 280;
jump_coyote_time = 0.15;
jump_coyote_timer = 0;
jump_buffer_time = 0.1;
jump_buffer_timer = 0;

accel_run = 10;
accel_water = 35;
friction_ground = 0.85;
friction_hurt = 0.9;

carry_id = id;

last_safe_position = r2_zero();
idle_animation_timer = 0;
idle_animation_time = 5;

list_items = ds_list_create();
scr_gbj14_player_Add_Item(self, {
	name: "Lift",
	price: 0,
	uses: -1,
	sprite:  spr_gbj14_hud_item_lift,
	sound:   snd_gbj14_player_attack,
	script: "scr_gbj14_player_Use_Item_Lift",
	show_cursor: "",
	description: "Lift and carry objects."
});
item_throw = {
	name: "Throw",
	price: 0,
	uses: -1,
	sprite:  spr_gbj14_hud_item_throw,
	sound:   snd_gbj14_player_attack,
	script: "scr_gbj14_player_Use_Item_Lift",
	show_cursor: "",
	description: "Throw objects"
};
scr_gbj14_player_Add_Item(self, {
	name: "Sword",
	price: 0,
	uses: -1,
	sprite:  spr_gbj14_hud_item_sword,
	sound:   snd_gbjam12_player_sword,
	script: "scr_gbj14_player_Use_Item_Sword",
	show_cursor: "",
	description: "Slash foes and break brittle things."
});
damage = 1;
attack_hitbox_id = noone;

// Ending sequence state (action == 3).
ending_wait_time = 2;
ending_timer = ending_wait_time;
ending_anim_done = false;
ending_fade_started = false;

// Set up physics
axis_max_speed = r3(120, 1200, 0);
up_vector = r3(0,-1,0);
r3_clone(up_vector, normal_vector);
gravity_force = 12;
fall_gravity_multiplier = 1.5;
force_gravity = gravity_force;

slide_slopes_down = true;
// Let horizontal movement step up small ledge corners instead of stopping
// the player's forward motion when they clip one while jumping.
slide_slopes_up = true;
slide_slopes_distance = 4;
slide_around_blocks = false;
slide_around_blocks_distance = 8;

// Use the standard collision stop; the legacy Khepri wall callback can
// forcibly reverse the player while carrying an object.
collision_script = -1;

ds_list_add(global.list_pushables, id);

draw_2d_z = false;

outline_thickness = 0;
outline_color = c_ltgray;

can_wrap = true;
