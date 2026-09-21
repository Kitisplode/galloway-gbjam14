/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

obeys_room = false;

movement_collision = false;

// Set by the core when it links up, so the boss hovers around the spot
// the designer placed it at relative to the core.
dom_base_offset_x = 0;
dom_base_offset_y = 0;

cycle_x = 0;
cycle_x_speed = 1.5;
cycle_y = 0;
cycle_y_speed = 5;

shot_time = 2.5;
shot_timer = shot_time;
shot_count = 1;

is_boss = true;
hp_max = 5;
hp = hp_max;
raises_kill_signal = false;

// Death poof and gold reward: bigger poof and a big payout for bosses.
death_effect_index = spr_effect_ring_large;
death_effect_size = 2;
gold_drop = 25;
