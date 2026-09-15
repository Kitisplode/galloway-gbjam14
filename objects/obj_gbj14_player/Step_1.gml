/// @description Insert description here
// You can write your code in this editor

if (input_check_pressed("start"))
{
	global.paused = !global.paused;
}

// Inherit the parent event
event_inherited();

