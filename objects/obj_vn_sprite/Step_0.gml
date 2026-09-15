/// @description Insert description here
// You can write your code in this editor

var _distance_from_move_target = point_distance(position[0],position[1], move_target_pos[0],move_target_pos[1]);
if (_distance_from_move_target <= 1)
{
	r3_clone(move_target_pos, position);
	if (move_stop_bounce > 0)
	{
		shake[0] = r3_unit(velocity)[0] * move_stop_bounce;
		shake[1] = r3_unit(velocity)[1] * move_stop_bounce;
	}
	r3_zero_out(velocity);
}

// Inherit the parent event
event_inherited();

r3_clone(r3_add(position, velocity), position);
