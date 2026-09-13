function play_music(sound_index, priority, enable_loop, local_volume, pitch, pitch_range) {
	var tempSnd = audio_play_sound(sound_index, priority, enable_loop);
	if (tempSnd > -1)
	{
	    audio_sound_gain(tempSnd, global.volume_main * global.volume_music * local_volume, 0);
	    audio_sound_pitch(tempSnd, pitch - pitch_range + pitch_range * 2);
	}
	return tempSnd;
}

function play_sound(sound_index, priority, enable_loop, local_volume, pitch, pitch_range) {
	if (scr_Check_If_Sound_Is_Already_Starting(sound_index)) return -1;
	var tempSnd = audio_play_sound(sound_index, priority, enable_loop);
	if (tempSnd > -1)
	{
	    audio_sound_gain(tempSnd, global.volume_main * global.volume_sounds * local_volume, 0);
	    audio_sound_pitch(tempSnd, pitch - random(pitch_range) + pitch_range * 2);
		ds_list_add(obj_main_audio.list_audio_instances, tempSnd);
	}
	return tempSnd;
}


function scr_audio_music_start_playing(music_target_id)
{
	audio_stop_sound(global.music_current_id)
	global.music_current_id = music_target_id;
	music_looped_times = 0;
	if (global.music_current_id > -1)
	{
		global.music_current_instance = play_music(global.music_current_id, global.music_priority, 0,1,1,0);
	}
}

function scr_audio_music_main()
{
	// If the current music doesn't match the music we want right now, stop playing the current music and start playing the new music.
	if (global.music_current_id != global.music_target_id)
	{
		// If music fading is disabled, simply stop the current music and start playing the new music.
		if (!global.music_fade_enabled)
		{
			scr_audio_music_start_playing(global.music_target_id);
		}
		// If music fading is enabled, fade out the current music, then once that's done, start playing the new music.
		else
		{
			// Fade out the current music if any is playing.
			if (global.music_current_instance > -1)
			{
				if (audio_sound_get_gain(global.music_current_instance) > global.music_fade_cutoff)
				{
					audio_sound_gain(global.music_current_instance, 0, global.music_fade_time * 1000);
				}
				else
				{
					scr_audio_music_start_playing(global.music_target_id);
				}
			}
			// If no music is currently playing, just start the new music now.
			else
			{
				scr_audio_music_start_playing(global.music_target_id);	
			}
		}
	}
	
	// If there is currently no music playing and we want it to keep playing, start it. Also handle special song intros -> loop transitions.
	if (global.music_current_instance > -1 && global.music_current_id > -1)
	{
		if (!audio_is_playing(global.music_current_instance))
		{
			music_looped_times += 1;
			
			// If the song is in the intros list, start playing the associated loop now
			var temp_intro_ID = ds_list_find_index(list_music_intros, global.music_current_id);
			if (temp_intro_ID >= 0)
			{
				global.music_target_id = ds_list_find_value(list_music_loops, temp_intro_ID);
				scr_audio_music_start_playing(global.music_target_id);	
			}
			else
			{
				if (global.music_loop)
					global.music_current_instance = play_music(global.music_current_id, global.music_priority, 0,1,1,0);
			}
		}
	}
}

// Sets the currently playing music to the given music volume.
function scr_audio_set_current_music_volume(_new_volume = 1, _time_in_seconds = 0)
{
	if (global.music_current_instance > -1 && audio_is_playing(global.music_current_instance))
	{
		audio_sound_gain(global.music_current_instance,
						 global.volume_main * global.volume_music * _new_volume,
						 _time_in_seconds);
	}
}
// Sets the currently playing music to the given music pitch.
function scr_audio_set_current_music_pitch(_new_pitch = 1, _time_in_seconds = 0)
{
	if (global.music_current_instance > -1 && audio_is_playing(global.music_current_instance))
	{
		audio_sound_pitch(global.music_current_instance,
						  global.volume_main * global.volume_music * _new_pitch);
	}
}

// Call this only in the audio controller.
function scr_audio_add_song(_intro_index, _loop_index)
{
	ds_list_add(list_music_intros, _intro_index);
	ds_list_add(list_music_loops, _loop_index);
}

// Checks to see if the two songs given are part of the same song or not.
function scr_song_compare(_song_1, _song_2)
{
	if (_song_1 == _song_2) return true;
	if (instance_exists(obj_main_audio))
	{
		with (obj_main_audio)
		{
			var _song_1_in_intros = ds_list_find_index(list_music_intros, _song_1);
			var _song_1_in_loops = ds_list_find_index(list_music_loops, _song_1);
			var _song_2_in_intros = ds_list_find_index(list_music_intros, _song_2);
			var _song_2_in_loops = ds_list_find_index(list_music_loops, _song_2);
			if (_song_1_in_intros > -1 && _song_2_in_loops == _song_1_in_intros) return true;
			if (_song_1_in_loops > -1 && _song_2_in_intros == _song_1_in_loops) return true;
		}
	}
	return false;
}

//function scr_audio_play_song_fade_default(_music_index)
//{
//	if (_music_index == -1) return false;
//	global.music_target_id = _music_index;
//	global.music_fade_enabled = true;
//	global.music_fade_time = 5;
//	return true;
//}

function scr_audio_play_song_no_fade(_music_index, _loop=true)
{
	if (scr_song_compare(_music_index, global.music_current_id)) return;
	global.music_target_id = _music_index;
	global.music_fade_enabled = false;
	global.music_loop = _loop;
}

function scr_audio_play_song_fade(_music_index, _fade_time_in_seconds = 5, _loop=true)
{
	if (scr_song_compare(_music_index, global.music_current_id)) return;
	global.music_target_id = _music_index;
	global.music_fade_enabled = true;
	global.music_fade_time = _fade_time_in_seconds;
	global.music_loop = _loop;
}

function scr_Check_If_Sound_Is_Already_Starting(_sound_index)
{
	var _list = obj_main_audio.list_audio_instances;
	for (var _i = 0; _i < ds_list_size(_list); _i++)
	{
		var _audio_instance = ds_list_find_value(_list, _i);
		if (audio_exists(_audio_instance))
		{
			if (audio_sound_get_asset(_audio_instance) == _sound_index && 
				audio_sound_get_track_position(_audio_instance) == 0)
				return true;
		}
	}
	return false;
}

function scr_Grab_Matching_Sound(_sound_index)
{
	var _list = obj_main_audio.list_audio_instances;
	for (var _i = 0; _i < ds_list_size(_list); _i++)
	{
		var _audio_instance = ds_list_find_value(_list, _i);
		if (audio_exists(_audio_instance))
		{
			if (audio_sound_get_asset(_audio_instance) == _sound_index)
				return _audio_instance;
		}
	}
	return -1;
}