/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

obeys_room = false;

movement_collision = false;

dom_base_offset_x = 0;
dom_base_offset_y = 0;

cycle_x = 0;
cycle_x_speed = 1.5;
cycle_y = 0;
cycle_y_speed = 5;

shot_time = -1;
shot_timer = shot_time;
shot_count = 0;
shot_sprite = spr_gbj14_shot_1;

is_boss = true;
hp_max = 7;
hp = hp_max;
raises_kill_signal = false;

death_effect_index = spr_effect_ring_large;
death_effect_size = 2;
gold_drop = 50;

sleeping = true;
image_alpha = 0.0;
