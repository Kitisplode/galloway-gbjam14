// Call these functions only from within obj_gbj14_player

function scr_gbj14_player_Add_Item(_player, _item)
{
	// if player already has this item, just add uses to it
	for (var _i = 0; _i < ds_list_size(_player.list_items); ++_i)
	{
		var _player_item = ds_list_find_value(_player.list_items, _i);
		if (_player_item.sprite == _item.sprite)
		{
			_player_item.uses += _item.uses;
			return;
		}
	}
	// otherwise add new item to list
	ds_list_add(_player.list_items, _item);
}

function scr_gbj14_player_Scroll_Item()
{
	if (ds_list_size(list_items) <= 0) return;
	// Get the first item from the item list.
	var _item = ds_list_find_value(list_items, 0);
	// Pull it out of the list.
	ds_list_delete(list_items, 0);
	// Add it back in at the end of the list.
	ds_list_add(list_items, _item);
}

function scr_gbj14_player_Cursor_Pick()
{
	var _x = position[0] + cos(degtorad(direction_facing)) * 24;
	var _y = position[1] - 8;
	return r2(_x,_y);
}
function scr_gbj14_player_Cursor_Shovel()
{
	var _x = position[0] + cos(degtorad(direction_facing)) * 8;
	var _y = position[1] + 8;
	return r2(_x,_y);
}

function scr_gbj14_player_Use_Item_Box()
{
	if (carry_id == id)
	{
		//if (!instance_exists(obj_gbj14_item_box))
		{
			var _block = instance_create_depth(position[0],position[1], depth + 1, obj_gbj14_item_box);
			if (instance_exists(_block))
			{
				carry_id = _block;
				_block.dom_id = id;
				_block.dom_offset_x = 0;
				_block.dom_offset_y = -29;
				_block.mask_index = msk_no_collision;
				_block.movement_enabled = false;
				_block.apply_gravity_force = false;
				play_sound(snd_gbj14_player_lift, 1, false, 1, 1, 0);
				action = 1;
				velocity[0] = 0;
				velocity[1] = 0;
				scr_change_sprite(spr_gbj14_player_lift);
			}
		}
	}
}

function scr_gbj14_player_Use_Item_Lift()
{
	if (carry_id == id)
	{
		var _pos1 = scr_gbj14_player_Cursor_Pick();
		var _pos2 = scr_gbj14_player_Cursor_Shovel();
		if (instance_exists(obj_block_pushable))
		{
			var _block1 = instance_place(_pos1[0],_pos1[1], obj_block_pushable);
			var _block2 = instance_place(_pos2[0],_pos2[1], obj_block_pushable);
			var _block = undefined;
			if (instance_exists(_block1)) _block = _block1;
			else if (instance_exists(_block2)) _block = _block2;
			if (!is_undefined(_block) && instance_exists(_block))
			{
				carry_id = _block;
				_block.dom_id = id;
				_block.dom_offset_x = 0;
				_block.dom_offset_y = -29;
				_block.mask_index = msk_no_collision;
				_block.movement_enabled = false;
				_block.apply_gravity_force = false;
				play_sound(snd_gbj14_player_lift, 1, false, 1, 1, 0);
				action = 1;
				velocity[0] = 0;
				velocity[1] = 0;
				scr_change_sprite(spr_gbj14_player_lift);
			}
		}
	}
	else
	{		
		carry_id.mask_index = carry_id.sprite_index;
		carry_id.dom_id = carry_id.id;
		carry_id.movement_enabled = true;
		carry_id.apply_gravity_force = true;
		carry_id.velocity[0] = cos(degtorad(direction_facing)) * 100;
		carry_id.velocity[1] = -100;
		carry_id = id;
		play_sound(snd_gbj14_player_attack, 1, false, 1, 1, 0);
	}
}

function scr_gbj14_player_Use_Item_Ladder()
{
	play_sound(snd_gbj14_knock, 1, 0, 1,1,0.1);
	var _max_ladder_length = 5;
	for (var _i = 0; _i < _max_ladder_length; _i++)
	{
		var _ladder = instance_create_depth(position[0], floor(position[1] / 16) * 16 - _i * 16, depth + 1, obj_block_ladder);
		if (instance_exists(_ladder))
		{
			var _valid = false;
			var _one_way_plat = false;
			with(_ladder)
			{
				_valid = scr_Check_For_Solids(position, 1);
				_one_way_plat = place_meeting(position[0],position[1], obj_block_oneway_up);
			}
			if (_valid)
			{
				instance_destroy(_ladder);
				break;
			}
			if (_one_way_plat) break;
		}
	}
}

function scr_gbj14_player_Use_Item_Bomb()
{
	var _bomb = instance_create_depth(position[0], position[1] - 24, depth - 1, obj_gbj14_item_bomb);
	if (instance_exists(_bomb))
	{
		_bomb.velocity[0] = cos(degtorad(direction_facing)) * 100;
		_bomb.velocity[1] = -100;
	}
}

function scr_gbj14_player_Use_Item_Pick()
{
	play_sound(snd_gbj14_player_attack, 1, 0, 1,1,0.1);
	var _pos = scr_gbj14_player_Cursor_Pick();
	_scr_gbj14_player_Use_Item_Dig(floor(_pos[0]/16), floor(_pos[1]/16), "tilemap_stone");
	_scr_gbj14_player_Use_Item_Dig(floor(_pos[0]/16), floor(_pos[1]/16), "tilemap_dirt");
	if (random_range(0,100) < 10)
	{
		_scr_gbj14_spawn_gold(floor(_pos[0]/16) * 16 + 8, floor(_pos[1]/16) * 16 + 12, 10, OBJECT_DEPTHS.PLAYER + 10);
	}
}
function scr_gbj14_player_Use_Item_Shovel()
{
	play_sound(snd_gbj14_player_attack, 1, 0, 1,1,0.1);
	var _pos = scr_gbj14_player_Cursor_Shovel();
	_scr_gbj14_player_Use_Item_Dig(floor(_pos[0]/16), floor(_pos[1]/16), "tilemap_dirt");
	if (random_range(0,100) < 10)
	{
		_scr_gbj14_spawn_gold(floor(_pos[0]/16) * 16 + 8, floor(_pos[1]/16) * 16 + 12, 10, OBJECT_DEPTHS.PLAYER + 10);
	}
}

function _scr_gbj14_player_Use_Item_Dig(_x,_y, _layer_name)
{
	for (var _i = 0; _i < ds_list_size(global.list_solids); _i++)
	{
		var _id = ds_list_find_value(global.list_solids, _i);
		if (!instance_exists(_id)) continue;
		if (_id.object_index != obj_block_tileset) continue;
		if (_id.layer_name != _layer_name) continue;
		var _tilemap = _id.tilemap;
		{
			if (_scr_gbj14_Destroy_Tilemap_Block(_tilemap, _x,_y))
			{
				var _sound = asset_get_index("snd_gbj14_rock_break_0" + string(round(random_range(1,5))));
				if (audio_exists(_sound)) play_sound(_sound, 1, 0, 1, 1,0.5);
			}
		}
		break;
	}
}

function _scr_gbj14_Destroy_Tilemap_Area(_corners, _layer_name)
{
	for (var _i = 0; _i < ds_list_size(global.list_solids); _i++)
	{
		var _id = ds_list_find_value(global.list_solids, _i);
		if (!instance_exists(_id)) continue;
		if (_id.object_index != obj_block_tileset) continue;
		if (_id.layer_name != _layer_name) continue;
		var _tilemap = _id.tilemap;
		for (var _x = _corners._l; _x < _corners._r; _x++)
		{
			for (var _y = _corners._t; _y < _corners._b; _y++)
			{
				if (_scr_gbj14_Destroy_Tilemap_Block(_tilemap, _x,_y))
				{
					var _sound = asset_get_index("snd_gbj14_rock_break_0" + string(round(random_range(1,5))));
					if (audio_exists(_sound)) play_sound(_sound, 1, 0, 1, 1,0.5);
				}
			}
		}
		break;
	}
}

function _scr_gbj14_spawn_gold(_x,_y, _count, _depth)
{
	var _gold_spawner = instance_create_depth(_x,_y, _depth, obj_gbj14_gold_spawner);
	if (instance_exists(_gold_spawner))
	{
		_gold_spawner.spawn_count = _count;
	}
	return _gold_spawner;
}

function _scr_gbj14_Destroy_Tilemap_Block(_tilemap, _x,_y)
{
	if (_tilemap <= -1) return false;
	var _tile = tilemap_get(_tilemap, _x,_y);
	if (_tile > 0)
	{
		tilemap_set(_tilemap, 0, _x,_y);
		_scr_gbj14_Spawn_Crumbs(_x,_y);
	}
	return true;
}

function _scr_gbj14_Spawn_Crumbs(_x,_y)
{
	for (var _j = 0; _j < 4; _j++)
		{
			var _angle = degtorad(45 + _j * 90);
			var _pos = r2(_x * 16 + 8 + cos(_angle) * 8, _y * 16 + 8 -sin(_angle) * 8);
			var _crumb = instance_create_depth(_pos[0],_pos[1], OBJECT_DEPTHS.EFFECT, obj_gbj14_block_crumb);
			if (instance_exists(_crumb))
			{
				_crumb.velocity[0] = (_pos[0] - _x * 16 - 8) * random_range(1,5) * 10;
				_crumb.velocity[1] = (_pos[1] - _y * 16 - 8) * random_range(1,5) * 10;
			}
		}
}