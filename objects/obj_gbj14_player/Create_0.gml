/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Set up input
direction_input = -1;
input_jump = "a";
input_attack = "b";
with(id_input)
{
	scr_Input_Add_Verb(other.input_jump);
	scr_Input_Add_Verb(other.input_attack);
}
id_input.mouse_available = false;

// Behavior vars
hurt_timer = 0;

direction_facing = 0;
direction_aiming = 0;
can_move = true;
can_act = true;
action = 0;
run_speed = 90;
jump_force = 200;

accel_run = 60;
accel_water = 35;
friction_ground = 0.6;
friction_hurt = 0.9;

damage = 1;

// Set up physics
axis_max_speed = r3(120, 1200, 0);
up_vector = r3(0,-1,0);
r3_clone(up_vector, normal_vector);
force_gravity = 15;

slide_slopes_down = true;
slide_slopes_up = true;
slide_slopes_distance = 2;
slide_around_blocks = false;
slide_around_blocks_distance = 8;

collision_script = asset_get_index("scr_khepri_player_wall");

ds_list_add(global.list_pushables, id);

draw_2d_z = false;

outline_thickness = 1;
outline_color = c_ltgray;