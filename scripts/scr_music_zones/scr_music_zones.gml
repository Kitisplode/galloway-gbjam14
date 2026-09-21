
function MusicZone(_rects, _song) constructor
{
	rects = _rects; // array of [x1, y1, x2, y2] in room pixels
	song  = _song;
}

function scr_music_zones_init()
{
	global.music_zones = [
		new MusicZone(
			[
				[0, 1100, 700, 1500],
			],
			mus_gbj14_jopes_spanish_fly
		),
		new MusicZone(
			[
				[5100, 4400, 5600, 4800],
			],
			mus_gbj14_jopes_spanish_alien
		),
		new MusicZone(
			[
				[   0, 0, 1940, 1770],
				[4224, 0, 5600, 1600]
			],
			mus_gbj14_jopes_spanish_adventuring
		),
		new MusicZone(
			[
				[2976, 2000, 3248, 4800],
			],
			mus_gbj14_lexou_conquistador_intro
		),
	];

	global.music_default_song = mus_gbj14_lexou_pyramid_intro;
	global.music_avariccio_song = mus_gbj14_lexou_conquistador_loop;

	// Fade times, in seconds
	global.music_zone_fade     = 1.5; // crossing between zones
	global.music_dialogue_fade = 0.5; // in/out of Avariccio dialogue
}

/// Call every Step
function scr_music_director()
{
	var _want = global.music_default_song;
	var _fade = global.music_zone_fade;

	if (instance_exists(obj_gbj14_player))
	{
		var _p = instance_find(obj_gbj14_player, 0);
		var _zone_count = array_length(global.music_zones);
		for (var _z = 0; _z < _zone_count; _z++)
		{
			var _zone = global.music_zones[_z];
			var _found = false;
			var _rect_count = array_length(_zone.rects);
			for (var _r = 0; _r < _rect_count; _r++)
			{
				var _rect = _zone.rects[_r];
				if (point_in_rectangle(_p.x, _p.y,
					_rect[0], _rect[1], _rect[2], _rect[3]))
				{
					_want = _zone.song;
					_found = true;
					break;
				}
			}
			if (_found) break;
		}
	}

	if (instance_exists(obj_gbj14_dialogue))
	{
		var _box = instance_find(obj_gbj14_dialogue, 0);
		var _page_count = array_length(_box.pages);
		for (var _i = 0; _i < _page_count; _i++)
		{
			if (_box.pages[_i].who == Characters.AVARICCIO)
			{
				_want = global.music_avariccio_song;
				_fade = global.music_dialogue_fade;
				break;
			}
		}
	}
	scr_audio_play_song_fade(_want, _fade);
}
