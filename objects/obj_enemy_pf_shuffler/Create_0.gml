/// @description Shuffles back and forth.
// Enemy object that shuffles back and forth on a platform.
// Examples: koopa troopa (super mario bros), zombie (metroid fusion)

// Inherit the parent event
event_inherited();

hp_max = 100;
hp = hp_max;

velocity[0] = -50;

dont_walk_off_cliffs = true;
walk_off_cliffs_multiplier = -1;
walk_from_walls_multiplier = r3(-1,0,0);

// Set up physics
axis_max_speed = r3(120, 1200, 120);
up_vector = r3(0,-1,0);
r3_clone(up_vector, normal_vector);
force_gravity = 30;

slide_slopes_distance = 2;
slide_around_blocks = false;
slide_around_blocks_distance = 8;

ds_list_add(global.list_pushables, id);

draw_2d_z = false;