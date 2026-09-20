if (id != global.active_room)
{
	if (place_meeting(x, y, obj_base_player) && obj_base_player.is_on_ground)
	{
		global.active_room = id;
		global.player_spawn_x = obj_base_player.position[0];//floor(obj_base_player.position[0] / 16) * 16 + 8;
		global.player_spawn_y = obj_base_player.position[1];//floor(obj_base_player.position[1] / 16) * 16 + 8;
		global.player_spawn_z = obj_base_player.position[2];
		global.player_spawn_direction = obj_base_player.direction;
		//show_debug_message("room scroll: [{0}] ({1},{2})", id, x, y);
	}
}
