function scr_nm_map_setup()
{
	var _origin_x = 160;
	var _origin_y = 0;
	var _angle = point_direction(160,0, 0,144);
	for (var _i = 0; _i < 8; _i += 1)
	{
		var _j = 8 - _i;
		var _angle_extra = 0;
		//if (!global.enemy_done[_j])
		{
			if (scr_is_even(_i)) _angle_extra = 7;
			else _angle_extra = -7;
			//if (_i == 6) _angle_extra = 5;
			//else if (_i == 5) _angle_extra = -5;
		}
		var _x = _origin_x + cos(degtorad(_angle + _angle_extra)) * 22.5 * (_i + 1);
		var _y = _origin_y - sin(degtorad(_angle + _angle_extra)) * 20 * (_i + 1);
		var _temp_id = instance_create_depth(_x,_y,5, obj_nm_map_node);
		_temp_id.sprite_index = spr_nm_map_planet_mercury;
		if (_i == 1) _temp_id.sprite_index = spr_nm_map_planet_venus;
		else if (_i == 2) _temp_id.sprite_index = spr_nm_map_planet_earth;
		else if (_i == 3) _temp_id.sprite_index = spr_nm_map_planet_mars;
		else if (_i == 4) _temp_id.sprite_index = spr_nm_map_planet_jupiter;
		else if (_i == 5) _temp_id.sprite_index = spr_nm_map_planet_saturn;
		else if (_i == 6) _temp_id.sprite_index = spr_nm_map_planet_uranus;
		else if (_i == 7) _temp_id.sprite_index = spr_nm_map_planet_neptune;
		if (!global.enemy_done[_j])
		{
			var _temp_enemy_id = instance_create_depth(_x,_y, _temp_id.depth - 1, obj_nm_map_enemy);
			_temp_enemy_id.dom_id = _temp_id;
			_temp_enemy_id.enemy_type = _j;
		}
		else if (global.enemy_previous == _j && instance_exists(obj_base_player))
		{
			obj_base_player.position[0] = _x;
			obj_base_player.position[1] = _y;
		}
	}
	if (!global.enemy_done[9999])
	{
		var _temp_enemy_id = instance_create_depth(irandom_range(16, room_width - 16),irandom_range(16, room_height * 0.75),
													OBJECT_DEPTHS.ENEMY - 1, obj_nm_map_enemy);
			_temp_enemy_id.sprite_index = spr_effect_sparkle_small;
			_temp_enemy_id.enemy_type = 9999;
			_temp_enemy_id.image_alpha = 0.4;
	}
}