/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp_max = 1;
hp = hp_max;

velocity[0] = -15;
axis_max_speed = r3(50, 1200, 0);

// Death poof and gold reward.
death_effect_index = spr_effect_ring_large;
gold_drop = 5;
