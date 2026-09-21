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
			// The final cutscene flows straight into the ending sequence.
			var _on_finish = undefined;
			if (cutscene_id == 5) _on_finish = scr_gbj14_ending_start;
			scr_cutscene_play(cutscene_id, _on_finish);
			instance_destroy();
		}
    }
}