/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (attack_hitbox_id != noone && instance_exists(attack_hitbox_id))
	instance_destroy(attack_hitbox_id);

// If the player is destroyed due to HP being 0, spawn a corpse.
if (global.player_hp <= 0)
{
	var _corpse = instance_create_depth(position[0],position[1], depth, obj_gbj14_player_corpse);
	_corpse.image_xscale = image_xscale;
	_corpse.direction_facing = direction_facing;
	
	if (instance_exists(obj_camera))
	{
		obj_camera.follow = _corpse;
	}
	for (var _i = 0; _i < ds_list_size(list_items); _i++)
	{
		var _item = ds_list_find_value(list_items, _i);
		if (_item.sprite == spr_gbj14_hud_item_ankh)
		{
			_corpse.has_ankh = true;
			_item.uses--;
			if (_item.uses <= 0)
			{
				ds_list_delete(list_items, _i);
				_i--;
				continue;
			}
		}
		var _new_item = {
			name:_item.name,
			uses:_item.uses,
			sprite:_item.sprite,
			sound:_item.sound,
			script:_item.script,
			show_cursor:_item.show_cursor
			};
		ds_list_add(_corpse.list_item,_new_item);
	}
	global.player_hp = global.player_hp_max;
	if (!_corpse.has_ankh) scr_audio_play_song_no_fade(mus_gbj14_jopes_spanish_death_2, false);
	else scr_audio_play_song_no_fade(-1);
}

ds_list_destroy(list_items);