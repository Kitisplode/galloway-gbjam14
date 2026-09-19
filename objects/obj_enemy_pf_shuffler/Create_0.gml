/// @description Shuffles back and forth.
// Enemy object that shuffles back and forth on a platform.
// Examples: koopa troopa (super mario bros), zombie (metroid fusion)

// Inherit the parent event
event_inherited();

hp_max = 100;
hp = hp_max;
normal_damage = damage;

velocity[0] = -50;

// This is enabled when the player releases a carryable bug.
is_thrown = false;
throw_has_left_ground = false;
is_throw_stunned = false;
throw_stun_timer = 0;
throw_stun_time = 0.25;

// Visual-only carried rotation. The physics/collision angle stays unchanged.
carry_visual_angle = 0;
carry_visual_angle_lerp = 0.16;

// Keep the bug's animation clock running while it is being carried.
anim_speed = 0.15;

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
