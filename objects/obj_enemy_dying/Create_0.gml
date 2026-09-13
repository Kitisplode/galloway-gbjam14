/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

movement_collision = false;
axis_max_speed = r3(120, 1200, 120);
up_vector = r3(0,-1,0);
r3_clone(up_vector, normal_vector);
force_gravity = 30;

roll_angle = 0;
roll_amount = 5;
roll_interval = 45/2;

if (depth == 0) depth = OBJECT_DEPTHS.HUD;
image_angle_matching_visual = false;