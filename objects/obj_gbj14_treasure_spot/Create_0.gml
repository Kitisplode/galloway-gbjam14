/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Once this is true, it means a treasure has been deposited here.
ready = false;

// Once every treasure spot in the room is ready, the last one to fill
// runs the finale: rumble, flash, and blow open the central passage.
// Every collision tile inside this pixel rectangle [x1, y1, x2, y2] goes.
gate_rect = [2992, 1872, 3248, 2016];
finale_phase = -1;   // -1 = not running
finale_timer = 0;
