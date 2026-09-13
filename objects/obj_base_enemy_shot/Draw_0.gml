/// @description Insert description here
// You can write your code in this editor

if (angle_based_on_velocity)
{
	if (!r3_equals(position_previous, position))
		image_angle = point_direction(position_previous[0], position_previous[1], position[0], position[1]);
	else
		image_angle = point_direction(0,0, velocity[0],velocity[1]);
	
}

// Inherit the parent event
event_inherited();

