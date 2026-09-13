/// @description Change rooms
// Only if the player is interacting, and the player's center must be within the object.
if (other.position[0] > bbox_left && other.position[0] < bbox_right &&
	other.position[1] > bbox_top && other.position[1] < bbox_bottom &&
	other.interacting && !instance_exists(par_transition))
{
	if (is_nan(next_x)) global.player_spawn_x = other.x;
	else global.player_spawn_x = next_x;
	if (is_nan(next_y)) global.player_spawn_y = other.y;
	else global.player_spawn_y = next_y;
	if (is_nan(next_z)) global.player_spawn_z = other.z;
	else global.player_spawn_z = next_z;
	if (is_nan(next_direction)) global.player_spawn_direction = other.direction;
	else global.player_spawn_direction = next_direction;
	
	// TODO: Start the player on a new animation (e.g. a door entering animation)
	
	scr_transition_fade_to_color(next_room);
}