/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	cycle = (cycle + cycle_speed) mod 360;
	dom_offset_y = -sin(degtorad(cycle)) * 16;
}

// Inherit the parent event
event_inherited();
