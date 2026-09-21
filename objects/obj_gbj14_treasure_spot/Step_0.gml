/// @description Insert description here
// You can write your code in this editor
if (!paused)
{
	if (!ready)
	{
		if (place_meeting(x,y, obj_gbj14_item_treasure))
		{
			var _treasure = instance_nearest(x,y, obj_gbj14_item_treasure);
			var _new_treasure = instance_create_depth(x, y-8, OBJECT_DEPTHS.PLAYER + 10, par_animation);
			_new_treasure.sprite_index = _treasure.sprite_index;
			_new_treasure.sparkle_index = spr_gbj14_fx_sparkle;
			_new_treasure.sparkle_anim_speed = 0.15;
			
			_new_treasure.hover_cycle_speed = 6;
			_new_treasure.hover_cycle_distance = 4;
			
			var _effect = scr_effect_create(x,y-8, spr_effect_ring_large, 0.25, OBJECT_DEPTHS.EFFECT);
			_effect.fade_time = 10;
		
			instance_destroy(_treasure);
			ready = true;
			if (instance_exists(obj_music_director))
			{
				obj_music_director.no_music_timer = 5.72;
			}
			scr_audio_play_song_no_fade(mus_gbj14_lexou_jingle, false);
		}
	}
}