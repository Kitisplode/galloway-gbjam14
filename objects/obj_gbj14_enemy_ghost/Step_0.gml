/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	movement_sideways_cycle = (movement_sideways_cycle + movement_sideways_cycle_speed) mod 360;
	var _temp_movement_sideways = cos(degtorad(movement_sideways_cycle)) * movement_sideways_cycle_amount;
		
	velocity[0] += cos(degtorad(direction + _temp_movement_sideways)) * 50;
	velocity[1] += -sin(degtorad(direction + _temp_movement_sideways)) * 50;
	
	if (velocity[0] < 0)	image_xscale = -1;
	if (velocity[0] > 0)	image_xscale = +1;
}

// Inherit the parent event
event_inherited();
