/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

movement_enabled = false;
apply_gravity_force = false;
sprite_index = spr_gbj14_player_die;
anim_speed = 0.25;
anim_loop = false;

depth = OBJECT_DEPTHS.TRANSITION - 10;

text_time = 1;
text_timer = text_time;
