/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ds_list_destroy(list_items);

if (attack_hitbox_id != noone && instance_exists(attack_hitbox_id))
	instance_destroy(attack_hitbox_id);

// If the player is destroyed due to HP being 0, spawn a corpse.
if (global.player_hp <= 0)
{
	var _corpse = instance_create_depth(position[0],position[1], depth, obj_gbj14_player_corpse);
	_corpse.image_xscale = image_xscale;
	scr_audio_play_song_no_fade(mus_gbj14_jopes_spanish_death_2, false);
	if (instance_exists(obj_camera))
	{
		obj_camera.follow = _corpse;
	}
	global.player_hp = global.player_hp_max;
}