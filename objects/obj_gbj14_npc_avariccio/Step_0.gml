if (face_player && !vanishing && instance_exists(obj_gbj14_player))
{
	var _player = instance_find(obj_gbj14_player, 0);
	image_xscale = (_player.x < x) ? -1 : 1;
}

if (!vanishing)
{
	if (cutscene_id < array_length(global.cutscene_played)
		&& global.cutscene_played[cutscene_id]
		&& !global.cutscene_playing
		&& !instance_exists(obj_gbj14_dialogue))
	{
		vanishing = true;
		if (vanish_effect != -1)
			scr_effect_create(x, y + 16, vanish_effect, 1, depth - 1);
		if (vanish_sound != -1)
			play_sound(vanish_sound, 1, 0, 1, 1, 0.1);
	}
}
else
{
	image_alpha -= scr_get_tick_as_percent(vanish_fade_time);
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}