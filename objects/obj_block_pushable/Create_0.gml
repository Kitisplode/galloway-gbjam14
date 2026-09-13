/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

axis_max_speed = r3(120, 1200, 0);
up_vector = r3(0,-1,0);
r3_clone(up_vector, normal_vector);
force_gravity = 15;

ds_list_add(global.list_pushables, id);