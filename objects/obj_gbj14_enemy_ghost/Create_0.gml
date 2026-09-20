/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

movement_collision = false;
hp = 1;

direction = random(60) - 30 + choose(0, 180);
movement_sideways_cycle = 0;
movement_sideways_cycle_speed = 5;
movement_sideways_cycle_amount = 9;

axis_max_speed = r3(20, 20, 0);

anim_speed = 0.15;

apply_gravity_force = false;