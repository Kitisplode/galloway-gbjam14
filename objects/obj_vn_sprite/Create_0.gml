/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fade_setup = false;
fade_time = 0;
alpha_target = 1;

xscale_target = 1;
yscale_target = 1;
xscale_time = 0;
yscale_time = 0;

velocity = r3_zero();
move_target_pos = r3_clone(position);
move_stop_bounce = 0;

hover_amount = 0;
hover_cycle = 0;
hover_cycle_time = 1;

affected_by_pause = false;
apply_gravity_force = false;

loop_type = 0;