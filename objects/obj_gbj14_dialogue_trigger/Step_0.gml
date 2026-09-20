if (instance_exists(obj_gbj14_player))
{
    var _player = instance_find(obj_gbj14_player, 0);

    if (point_in_rectangle(
		_player.x, _player.y,
		x, y,
		x + sprite_width,
		y + sprite_height))
    {
		if (!global.cutscene_played[cutscene_id])
		{
			//show_debug_message("cutscene trigger hit: {0}", cutscene_id);
			scr_cutscene_play(cutscene_id);
			instance_destroy();
		}
    }
}