// Manage the music playing / looping.
scr_audio_music_main();

// Remove any audio instances that are no longer playing.
for (var _i = 0; _i < ds_list_size(list_audio_instances); _i++)
{
	var _audio_instance = ds_list_find_value(list_audio_instances, _i);
	if (!audio_exists(_audio_instance))
	{
		ds_list_delete(list_audio_instances, _i);
		_i--;
	}
}