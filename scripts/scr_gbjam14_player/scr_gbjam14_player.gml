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
	var _new_item = {
		name:_item.name,
		uses:_item.uses,
		sprite:_item.sprite,
		sound:_item.sound,
		script:_item.script,
		show_cursor:_item.show_cursor
	};
	ds_list_insert(_player.list_items, 0, _new_item);
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

function scr_gbj14_player_Cursor_Tool()
{
	if (input_check("up"))
	{
		return scr_gbj14_player_Cursor_Tool_High();
	}
	else if (input_check("down"))
	{
		return scr_gbj14_player_Cursor_Tool_Low();
	}
	else
	{
		return scr_gbj14_player_Cursor_Tool_Mid();
	}
}
function scr_gbj14_player_Cursor_Tool_High()
{
	var _x = position[0] + cos(degtorad(direction_facing)) * 24;
	var _y = position[1] - 24;
	return r2(_x,_y);
}
function scr_gbj14_player_Cursor_Tool_Mid()
{
	var _x = position[0] + cos(degtorad(direction_facing)) * 24;
	var _y = position[1] - 8;
	return r2(_x,_y);
}
function scr_gbj14_player_Cursor_Tool_Low()
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
				_block.is_thrown = false;
				_block.axis_max_speed[0] = 120;
				play_sound(snd_gbj14_player_lift, 1, false, 1, 1, 0);
				action = 1;
				velocity[0] = 0;
				velocity[1] = 0;
				scr_change_sprite(spr_gbj14_player_lift);
			}
		}
	}
	return true;
}

function _scr_gbj14_player_Use_Item_Throw(_velocity)
{
	if (carry_id != id && instance_exists(carry_id))
	{
		carry_id.dom_id = carry_id.id;
		carry_id.movement_enabled = true;
		carry_id.apply_gravity_force = true;
		carry_id.mask_index = carry_id.sprite_index;
		carry_id.is_thrown = true;
		carry_id.throw_has_left_ground = false;
		var _throw_speed = 180;
		if (carry_id.object_index == obj_gbj14_enemy_shuffle)
		{
			// Bugs use the same launch profile as crates and cannot hurt the
			// player while they are in their thrown state.
			carry_id.damage = 0;
			// Match the pushable crate's physics while airborne.
			carry_id.movement_collision = true;
			carry_id.force_gravity = 15;
			carry_id.friction_ground = 0.8;
			carry_id.axis_max_speed[1] = 1200;
			carry_id.axis_max_speed[2] = 0;
			carry_id.slide_slopes_up = true;
			carry_id.slide_slopes_down = true;
			carry_id.slide_around_blocks = true;
			carry_id.slide_around_blocks_distance = 8;
			carry_id.dont_walk_off_cliffs = false;
			carry_id.walk_from_walls_multiplier = r3_zero();
			carry_id.carry_visual_angle = 180;
			carry_id.anim_angle = 180;
			carry_id.image_angle_matching_visual = false;
		}
		with (carry_id) { scr_Unstick_From_Solids(); }
		carry_id.axis_max_speed[0] = _throw_speed;
		//carry_id.velocity[0] = cos(degtorad(direction_facing)) * _throw_speed;
		//carry_id.velocity[1] = -80;
		r3_clone(_velocity, carry_id.velocity);
		carry_id = id;
	}
	return true;
}

function scr_gbj14_player_Use_Item_Lift()
{
	if (carry_id == id)
	{
		var _pos1 = scr_gbj14_player_Cursor_Tool_Mid();
		var _pos2 = scr_gbj14_player_Cursor_Tool_Low();
		var _block1 = instance_place(_pos1[0],_pos1[1], obj_block_pushable);
		var _block2 = instance_place(_pos2[0],_pos2[1], obj_block_pushable);
		var _block = undefined;
		if (instance_exists(_block1)) _block = _block1;
		else if (instance_exists(_block2)) _block = _block2;

		// The GBJam14 shuffle bug can also be picked up, even though it is an
		// enemy rather than a member of the pushable-block parent.
		if (is_undefined(_block) || !instance_exists(_block))
		{
			var _enemy = instance_place(_pos1[0],_pos1[1], obj_gbj14_enemy_shuffle);
			if (instance_exists(_enemy)) _block = _enemy;
			else
			{
				_enemy = instance_place(_pos2[0],_pos2[1], obj_gbj14_enemy_shuffle);
				if (instance_exists(_enemy)) _block = _enemy;
			}
		}

		if (!is_undefined(_block) && instance_exists(_block))
		{
			carry_id = _block;
			_block.dom_id = id;
			_block.dom_offset_x = 0;
			_block.dom_offset_y = -29;
			_block.mask_index = msk_no_collision;
			_block.movement_enabled = false;
			_block.apply_gravity_force = false;
			_block.is_thrown = false;
			_block.axis_max_speed[0] = 120;
			if (_block.object_index == obj_gbj14_enemy_shuffle)
			{
				_block.damage = 0;
				_block.is_throw_stunned = false;
				_block.throw_stun_timer = 0;
			}
			play_sound(snd_gbj14_player_lift, 1, false, 1, 1, 0);
			action = 1;
			velocity[0] = 0;
			velocity[1] = 0;
			scr_change_sprite(spr_gbj14_player_lift);
		}
	}
	// Throw
	else
	{		
		if (input_check("down"))
		{
			carry_id.position[0] = position[0] + cos(degtorad(direction_facing)) * 16;
			_scr_gbj14_player_Use_Item_Throw(r3_zero());
		}
		else
		{
			_scr_gbj14_player_Use_Item_Throw(r3(cos(degtorad(direction_facing)) * 180, -80,0));
		}
		play_sound(snd_gbj14_player_attack, 1, false, 1, 1, 0);
	}
	return true;
}

function scr_gbj14_player_Use_Item_Ladder()
{
	play_sound(snd_gbj14_knock, 1, 0, 1,1,0.1);
	var _max_ladder_length = 5;
	for (var _i = 0; _i < _max_ladder_length; _i++)
	{
		var _ladder = instance_create_depth(
			position[0], floor(position[1] / 16) * 16 - _i * 16,
			depth + 1, obj_block_ladder_player);
		if (instance_exists(_ladder))
		{
			var _valid = false;
			var _one_way_plat = false;
			with(_ladder)
			{
				_valid = scr_Check_For_Solids(position, 1);
				_one_way_plat = place_meeting(position[0],position[1], obj_block_oneway_up);
				if (_i == _max_ladder_length - 1)
				{
					instance_create_depth(position[0] - 8, position[1]-16, depth, obj_block_oneway_up);
				}
			}
			if (_valid)
			{
				instance_destroy(_ladder);
				break;
			}
			if (_one_way_plat) break;
		}
	}
	return true;
}

function scr_gbj14_player_Use_Item_Bomb()
{
	if (carry_id == id)
	{
		if (!instance_exists(obj_gbj14_item_bomb))
		{
			var _bomb = instance_create_depth(position[0],position[1], depth + 1, obj_gbj14_item_bomb);
			if (instance_exists(_bomb))
			{
				carry_id = _bomb;
				_bomb.dom_id = id;
				_bomb.dom_offset_x = 0;
				_bomb.dom_offset_y = -29;
				_bomb.mask_index = msk_no_collision;
				_bomb.movement_enabled = false;
				_bomb.apply_gravity_force = false;
				_bomb.is_thrown = false;
				_bomb.axis_max_speed[0] = 120;
				play_sound(snd_gbj14_player_lift, 1, false, 1, 1, 0);
				action = 1;
				velocity[0] = 0;
				velocity[1] = 0;
				scr_change_sprite(spr_gbj14_player_lift);
			}
		}
		else
			return false;
	}
	return true;
}
function scr_gbj14_player_Use_Item_Sword()
{
	if (action != 0) return false;
	
	play_sound(snd_gbj14_player_attack, 1, 0, 1,1,0.1);
	action = 2;
	scr_change_sprite(spr_gbj14_player_sword);
	
	var _dir = cos(degtorad(direction_facing));
	
	var _hitbox = instance_create_depth(position[0] + _dir * 14, position[1] - 12, depth + 1, obj_shot_player);
	if (instance_exists(_hitbox))
	{
		_hitbox.creator_ID = id;
		_hitbox.visible = false;
		_hitbox.mask_index = msk_gb12_player; // 12x12 scaled = 24x24 hitbox
		_hitbox.image_xscale = 2;
		_hitbox.image_yscale = 2;
		_hitbox.damage = damage;
		_hitbox.piercing = true;
		_hitbox.hits_only_once = true;
		_hitbox.dies_offscreen = false;
		_hitbox.movement_enabled = false;
		_hitbox.apply_gravity_force = false;
		_hitbox.dom_id = id;
		_hitbox.dom_offset_x = _dir * 14;
		_hitbox.dom_offset_y = -12;
		attack_hitbox_id = _hitbox;
	}
	var _left   = position[0] + _dir * 14 - 12;
	var _right  = position[0] + _dir * 14 + 12;
	var _top    = position[1] - 24;
	var _bottom = position[1];
	var _corners = {
		_l: floor(_left   / 16),
		_r: floor(_right  / 16) + 1,
		_t: floor(_top    / 16),
		_b: floor(_bottom / 16) + 1
	};
	_scr_gbj14_Destroy_Tilemap_Area(_corners, "tilemap_break");
	
	return true;
}
function scr_gbj14_player_Use_Item_Shovel()
{
	play_sound(snd_gbj14_player_attack, 1, 0, 1,1,0.1);
	var _pos = scr_gbj14_player_Cursor_Tool();
	var _x = floor(_pos[0]/16);
	var _y = floor(_pos[1]/16);
	var _dug = false;
	if (_scr_gbj14_player_Use_Item_Dig(_x,_y, "tilemap_break"))	_dug = _dug;
	if (_scr_gbj14_player_Use_Item_Dig(_x,_y, "tilemap_earth"))	_dug = true;
	return _dug;
}
function scr_gbj14_player_Use_Item_Pick()
{
	play_sound(snd_gbj14_player_attack, 1, 0, 1,1,0.1);
	var _pos = scr_gbj14_player_Cursor_Tool();
	var _x = floor(_pos[0]/16);
	var _y = floor(_pos[1]/16);
	var _dug = false;
	if (_scr_gbj14_player_Use_Item_Dig(_x,_y, "tilemap_break"))	_dug = _dug;
	if (_scr_gbj14_player_Use_Item_Dig(_x,_y, "tilemap_stone"))	_dug = true;
	return _dug;
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
			if (_scr_gbj14_Destroy_Tilemap_Block(_tilemap, _x,_y, _layer_name))
			{
				var _sound = asset_get_index("snd_gbj14_rock_break_0" + string(round(random_range(1,5))));
				if (audio_exists(_sound)) play_sound(_sound, 1, 0, 1, 1,0.5);
				return true;
			}
		}
	}
	return false;
}

function _scr_gbj14_Destroy_Tilemap_Block(_tilemap, _x,_y, _layer_name = "")
{
	if (_tilemap <= -1) return false;
	var _tile = tilemap_get(_tilemap, _x,_y);
	if (_tile > 0)
	{
		tilemap_set(_tilemap, 0, _x,_y);
		terrain_update_region(_tilemap, _x, _y);
		with (obj_gbj14_player) { scr_Unstick_From_Solids(); }
		_scr_gbj14_Spawn_Crumbs(_x,_y);
		// spawn gold depending on terrain
		if (_layer_name == "tilemap_break")
		{
			_scr_gbj14_spawn_gold(random_range(5,10),
				_x * 16 + 8,
				_y * 16 + 12,
				OBJECT_DEPTHS.PLAYER + 10);
		}
		else if (_layer_name == "tilemap_earth")
		{
			if (random_range(0,100) < 50)
				_scr_gbj14_spawn_gold(random_range(0,5),
					_x * 16 + 8,
					_y * 16 + 12,
					OBJECT_DEPTHS.PLAYER + 10);
		}
		else if (_layer_name == "tilemap_stone")
		{
			_scr_gbj14_spawn_gold(random_range(1,5),
				_x * 16 + 8,
				_y * 16 + 12,
				OBJECT_DEPTHS.PLAYER + 10);
		}
		return true;
	}
	return false;
}

/// Removes every collision tile (all obj_block_tileset layers) inside the
/// pixel rectangle, with a scattering of crumb effects. Used to open the
/// central passage once the three treasures are returned.
function _scr_gbj14_Open_Gate(_x1,_y1, _x2,_y2)
{
	var _l = floor(_x1 / 16), _r = ceil(_x2 / 16);
	var _t = floor(_y1 / 16), _b = ceil(_y2 / 16);
	var _cleared = 0;
	for (var _i = 0; _i < ds_list_size(global.list_solids); _i++)
	{
		var _id = ds_list_find_value(global.list_solids, _i);
		if (!instance_exists(_id)) continue;
		if (_id.object_index != obj_block_tileset) continue;
		var _tilemap = _id.tilemap;
		if (_tilemap <= -1) continue;
		for (var _x = _l; _x < _r; _x++)
		{
			for (var _y = _t; _y < _b; _y++)
			{
				if (tilemap_get(_tilemap, _x,_y) > 0)
				{
					tilemap_set(_tilemap, 0, _x,_y);
					terrain_update_region(_tilemap, _x,_y);
					if (irandom(3) == 0) _scr_gbj14_Spawn_Crumbs(_x,_y);
					_cleared++;
				}
			}
		}
	}
	with (obj_gbj14_player) { scr_Unstick_From_Solids(); }
	return _cleared;
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
				if (_scr_gbj14_Destroy_Tilemap_Block(_tilemap, _x,_y, _layer_name))
				{
					var _sound = asset_get_index("snd_gbj14_rock_break_0" + string(round(random_range(1,5))));
					if (audio_exists(_sound)) play_sound(_sound, 1, 0, 1, 1,0.5);
				}
			}
		}
		break;
	}
}

function _scr_gbj14_spawn_gold(_count, _x,_y, _depth)
{
	var _gold_spawner = instance_create_depth(_x,_y, _depth, obj_gbj14_gold_spawner);
	if (instance_exists(_gold_spawner))
	{
		_gold_spawner.spawn_count = _count;
	}
	return _gold_spawner;
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


// Ending sequence: the player loses control, the golden transformation anim plays once
global.gbj14_ending = false;

function scr_gbj14_ending_start()
{
	global.gbj14_ending = true;
	with (obj_gbj14_player)
	{
		// Drop anything being carried so the animation reads cleanly.
		if (carry_id != id)
		{
			_scr_gbj14_player_Use_Item_Throw(r3_zero());
			if (ds_list_size(list_items) > 0)
			{
				var _item = ds_list_find_value(list_items, 0);
				if (_item.name == "Throw") ds_list_delete(list_items, 0);
			}
		}
		velocity[0] = 0;
		direction_facing = 0;
		action = 3;
		ending_anim_done = false;
		ending_timer = ending_wait_time;
		ending_fade_started = false;
		scr_change_sprite(spr_gbj14_player_ending);
		anim_speed = 0.2;
	}
}
