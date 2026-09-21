/// @description Insert description here
// You can write your code in this editor
if (!paused)
{
	if (!ready)
	{
		// A treasure set down anywhere over this spot's area counts. The area
		// is the spot's own (possibly scaled) sprite box plus a small margin;
		// a carried treasure has no collision mask, so it only registers once
		// it has been dropped.
		var _treasure = collision_rectangle(bbox_left - 8, bbox_top - 16, bbox_right + 8, bbox_bottom + 8,
		                                    obj_gbj14_item_treasure, false, true);
		if (_treasure != noone)
		{
			var _new_treasure = instance_create_depth(x, bbox_top + 8, OBJECT_DEPTHS.PLAYER + 10, par_animation);
			_new_treasure.sprite_index = _treasure.sprite_index;
			_new_treasure.sparkle_index = spr_gbj14_fx_sparkle;
			_new_treasure.sparkle_anim_speed = 0.15;
			
			_new_treasure.hover_cycle_speed = 6;
			_new_treasure.hover_cycle_distance = 4;
			
			var _effect = scr_effect_create(x, bbox_top + 8, spr_effect_ring_large, 0.25, OBJECT_DEPTHS.EFFECT);
			_effect.fade_time = 10;
		
			instance_destroy(_treasure);
			ready = true;
			if (instance_exists(obj_music_director))
			{
				obj_music_director.no_music_timer = 5.72;
			}
			scr_audio_play_song_no_fade(mus_gbj14_lexou_jingle, false);
			
			// Are all the spots in the room filled now?
			var _spots = 0, _filled = 0;
			with (obj_gbj14_treasure_spot) { _spots++; if (ready) _filled++; }
			show_debug_message("Treasure deposited: {0}/{1} spots filled", _filled, _spots);
			if (_spots >= 3 && _filled >= _spots && !global.gbj14_gate_opened)
			{
				global.gbj14_gate_opened = true;
				finale_phase = 0;
				finale_timer = 6; // let the deposit jingle finish
			}
		}
	}
	
	// ---- Finale (only runs on the spot that received the last treasure) ----
	if (finale_phase >= 0)
	{
		if (finale_timer > 0) finale_timer -= scr_get_tick_length();
		
		// Phase 1: the ground starts to rumble.
		if (finale_phase == 0 && finale_timer <= 0)
		{
			finale_phase = 1;
			finale_timer = 1.5;
			if (instance_exists(obj_camera))
			{
				obj_camera.shake_remain = 3;
				obj_camera.shake_magnitude = 3;
				obj_camera.shake_length = 90;
			}
			play_sound(snd_gbj14_wind, 2, 0, 1, 1, 0);
		}
		// Phase 2: flash, big shake, and the central gate blows open.
		else if (finale_phase == 1 && finale_timer <= 0)
		{
			finale_phase = 2;
			global.gbj14_flash = 1;
			if (instance_exists(obj_camera))
			{
				obj_camera.shake_remain = 6;
				obj_camera.shake_magnitude = 6;
				obj_camera.shake_length = 45;
			}
			var _cleared = _scr_gbj14_Open_Gate(gate_rect[0], gate_rect[1], gate_rect[2], gate_rect[3]);
			show_debug_message("Gate opened: {0} tiles cleared", _cleared);
			play_sound(snd_gbjam9_boss_hit, 2, 0, 1, 1, 0);
			for (var _i = 1; _i <= 3; _i++)
			{
				var _sound = asset_get_index("snd_gbj14_rock_break_0" + string(irandom_range(1,5)));
				if (audio_exists(_sound)) play_sound(_sound, 1, 0, 1, random_range(0.8,1.2), 0.2);
			}
		}
	}
}
