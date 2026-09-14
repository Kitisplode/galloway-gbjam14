/// @description Insert description here
// You can write your code in this editor

var _shake_y = shake[1];
if (hover_amount > 0 && hover_cycle_time > 0)
{
	hover_cycle += scr_get_tick_length() / hover_cycle_time;
	if (hover_cycle >= 1) hover_cycle -=1;
	var _hover = cos(degtorad(hover_cycle * 360)) * hover_amount;
	shake[1] += _hover;
}

// Inherit the parent event
event_inherited();

shake[1] = _shake_y;