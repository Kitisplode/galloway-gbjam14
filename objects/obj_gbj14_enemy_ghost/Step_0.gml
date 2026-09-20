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

if (!paused)
{
	// If the enemy leaves their active room, they should wrap to the other side.
	//if (active_room != id && instance_exists(active_room))
	{
		var _temp_view_x = camera_get_view_x(view_get_camera(0));
		var _temp_view_y = camera_get_view_y(view_get_camera(0));
		if (position[0] > _temp_view_x + 168 && velocity[0] > 0)
			position[0] = _temp_view_x - 8;
		else if (position[0] < _temp_view_x - 8 && velocity[0] < 0)
			position[0] = _temp_view_x + 168;
		if (position[1] > _temp_view_y + 156 && velocity[1] > 0)
			position[1] = _temp_view_y - 8;
		else if (position[1] < _temp_view_y - 8 && velocity[1] < 0)
			position[1] = _temp_view_y + 156;
	}
	//else
	//{
	//	if (position[0] > room_width + 8 && velocity[0] > 0)
	//		position[0] = -8;
	//	else if (position[0] < -8 && velocity[0] < 0)
	//		position[0] = room_width + 8;
	//	if (position[1] > room_height + 8 && velocity[1] > 0)
	//		position[1] = -8;
	//	else if (position[1] < -8 && velocity[1] < 0)
	//		position[1] = room_height + 8;
	//}
}