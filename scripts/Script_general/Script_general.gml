function scr_direction_compass(_start_x, _start_y, _target_x, _target_y)
{
	var _temp_direction = point_direction(_start_x,_start_y, _target_x,_target_y);
	return scr_snap_dir_to_compass(_temp_direction);
}

function scr_direction_cardinal(_start_x, _start_y, _target_x, _target_y)
{
	var _temp_direction = point_direction(_start_x,_start_y, _target_x,_target_y);

	return scr_snap_dir_to_cardinal(_temp_direction);
}

function scr_snap_dir_to_compass(_temp_direction)
{
	if (_temp_direction > 22.5 && _temp_direction <= 67.5) return 45;
	else if (_temp_direction > 67.5 && _temp_direction <= 112.5) return 90;
	else if (_temp_direction > 112.5 && _temp_direction <= 157.5) return 135;
	else if (_temp_direction > 157.5 && _temp_direction <= 202.5) return 180;
	else if (_temp_direction > 202.5 && _temp_direction <= 247.5) return 225;
	else if (_temp_direction > 247.5 && _temp_direction <= 292.5) return 270;
	else if (_temp_direction > 292.5 && _temp_direction <= 337.5) return 315;
	else return 0;
}

function scr_snap_dir_to_cardinal(_temp_direction)
{
	if (_temp_direction > 45 && _temp_direction <= 135) return 90;
	else if (_temp_direction > 135 && _temp_direction <= 225) return 180;
	else if (_temp_direction > 225 && _temp_direction <= 315) return 270;
	else return 0;
}

//function scr_darken_color(_original_color, _percentage)
//{
//	var temp_hue = color_get_hue(_original_color);
//	var temp_sat = color_get_saturation(_original_color);
//	var temp_val = color_get_value(_original_color);
//	temp_val *= _percentage;
//	return make_color_hsv(temp_hue,temp_sat,temp_val);
//}

function scr_effect_create(_x, _y, _sprite_index, _anim_speed, _depth, _view_locked=false)
{
	if (!sprite_exists(_sprite_index)) return -1;
	var _temp_id = instance_create_depth(_x,_y, _depth, obj_effect_fade);
	_temp_id.sprite_index = _sprite_index;
	_temp_id.anim_speed = _anim_speed;
	_temp_id.affected_by_pause = affected_by_pause;
	if (_anim_speed < 0) _temp_id.anim_frame = sprite_get_number(_sprite_index) - 1;
	_temp_id.view_locked = _view_locked;
	return _temp_id;
}

function scr_effect_create_khepri_hit(_x, _y, _sprite_index, _anim_speed, _depth, _sparkle_count, _view_locked=false)
{
	scr_effect_create(_x,_y, _sprite_index, _anim_speed, _depth)
	for (var _i = 0; _i < _sparkle_count; _i++)
	{
		var _eff = scr_effect_create(_x,_y, spr_effect_sparkle_small_outlined, 0.25, _depth);
		var _direction = random(360);
		_eff.velocity[0] = cos(degtorad(_direction)) * random(120);
		_eff.velocity[1] = -sin(degtorad(_direction)) * random(120);
		_eff.view_locked = _view_locked;
	}
}

function scr_check_out_of_view(_instance, _boundary, _left_offset=16)
{
	if (!instance_exists(_instance)) return false;
	var _tl = r2_zero();
	var _br = r2(room_width,room_height); 
	if (instance_exists(obj_camera))
	{
		_tl[0] = camera_get_view_x(obj_camera.cam) + _left_offset;
		_tl[1] = camera_get_view_y(obj_camera.cam);
		_br[0] = camera_get_view_x(obj_camera.cam) + camera_get_view_width(obj_camera.cam);
		_br[1] = camera_get_view_y(obj_camera.cam) + camera_get_view_height(obj_camera.cam);
	}
	return scr_check_outside_region(_instance, _boundary, _tl,_br);
}

function scr_check_outside_region(_instance, _boundary, _tl, _br)
{
	return (_instance.bbox_right  < _tl[0] + _boundary ||
			_instance.bbox_bottom < _tl[1] + _boundary ||
			_instance.bbox_left   > _br[0]  - _boundary ||
	        _instance.bbox_top    > _br[1] - _boundary);
}

function scr_check_off_screen_self(_boundary)
{
	if (!instance_exists(id)) return false;
	return scr_check_off_screen(id, _boundary);
}

function scr_check_off_screen(_instance, _boundary)
{
	return (_instance.bbox_right  < _boundary ||
			_instance.bbox_bottom < _boundary ||
			_instance.bbox_left   > room_width  - _boundary ||
	        _instance.bbox_top    > room_height - _boundary);	
}

function scr_check_partly_off_screen(_instance, _boundary)
{
	return (_instance.bbox_left   < _boundary ||
			_instance.bbox_top    < _boundary ||
			_instance.bbox_right  > room_width  - _boundary ||
	        _instance.bbox_bottom > room_height - _boundary);	
}

function scr_execute_script(_script_name)
{
	var _temp_script = asset_get_index(_script_name);
	if (_temp_script > -1)
	{
		script_execute(_temp_script);
	}
	else
	{
		show_message(string(_script_name) + " didn't exist???");	
	}
}

function scr_change_sprite(_new_sprite)
{
	if (!sprite_exists(_new_sprite)) return false;
	if (sprite_index != _new_sprite)
	{
		anim_frame = 0;
	}
	sprite_index = _new_sprite;
	return true;
}

function scr_animation_end_destroy()
{
	instance_destroy();
}

function scr_darkness_add_light(_id, _light)
{
	if (instance_exists(obj_level_darkness))
	{
		for (var _i = 0; _i < ds_list_size(obj_level_darkness.list_lights); _i++)
		{
			var _temp = ds_list_find_value(obj_level_darkness.list_lights, _i);
			if (_temp._id == _id)
			{
				_temp._light = _light;
				return;
			}
		}
		
		ds_list_add(obj_level_darkness.list_lights, {_id: _id, _light: _light});
	}
}

function scr_setup_shader_outline(_outline_thickness, _outline_color, _texture)
{
	var _shader_active = false;
	if (_outline_thickness > 0)
	{
		var _outline_pixel_stage = shader_get_uniform(sh_outline,"texture_Pixel")
		var _outline_thickness_stage = shader_get_uniform(sh_outline,"thickness_power")
		var _outline_color_stage = shader_get_uniform(sh_outline,"RGBA")
	
		shader_set(sh_outline);
		var tex_w=texture_get_texel_width(_texture)
		var tex_h=texture_get_texel_height(_texture)
		shader_set_uniform_f(_outline_pixel_stage,tex_w,tex_h)
		shader_set_uniform_f(_outline_thickness_stage, _outline_thickness)//line thickness
		shader_set_uniform_f(_outline_color_stage, color_get_red(_outline_color) / 255,
													color_get_green(_outline_color) / 255,
													color_get_blue(_outline_color) / 255,
													image_alpha)//line color
		_shader_active = true;
	}
	return _shader_active;
}

function scr_text_draw()
{
	if (view_locked)
		matrix_set(matrix_world, scr_get_main_camera_matrix());
	var temp_alpha = image_alpha;
	if (flash_rate > 0)
	{
		flasher += 1;
		flasher = flasher mod flash_rate;
		if (flasher > flash_rate / 2)
			temp_alpha *= flash_alpha;
	}

	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	//draw_bitmap_text(spr_font_lexou, x, y, text, 128);
	draw_text_transformed_color(x,y, text, scale,scale, image_angle,
								image_blend,image_blend,image_blend,image_blend, temp_alpha);
	if (view_locked)
		matrix_set(matrix_world, matrix_build_identity());
}


function scr_create_text_string_ext(_pos_x, _pos_y, _depth,
									_text, _type_rate, 
									_font, _halign, _valign,
									_scale, _color, _destroy_timer_in_seconds,
									_view_locked=false)
{
	var temp_text_ID = instance_create_depth(_pos_x, _pos_y, _depth, obj_text_string);
	temp_text_ID.text = _text;
	temp_text_ID.text_type_rate = _type_rate;
	temp_text_ID.font = _font;
	temp_text_ID.halign = _halign;
	temp_text_ID.valign = _valign;
	temp_text_ID.image_blend = _color;
	temp_text_ID.scale = _scale;
	temp_text_ID.destroy_timer = _destroy_timer_in_seconds;
	temp_text_ID.view_locked = _view_locked;
	return temp_text_ID;
}

function scr_create_text_paragraph_ext(_pos_x, _pos_y, _depth,
									   _text, _type_rate, 
									   _font, _halign, _valign,
									   _scale, _color, _destroy_timer_in_seconds,
									   _view_locked=false)
{
	var temp_text_ID = instance_create_depth(_pos_x, _pos_y, _depth, obj_text_paragraph);
	temp_text_ID.text = _text;
	temp_text_ID.text_type_rate = _type_rate;
	temp_text_ID.font = _font;
	temp_text_ID.halign = _halign;
	temp_text_ID.valign = _valign;
	temp_text_ID.image_blend = _color;
	temp_text_ID.scale = _scale;
	temp_text_ID.destroy_timer = _destroy_timer_in_seconds;
	temp_text_ID.view_locked = _view_locked;
	return temp_text_ID;
}

function scr_reset_game()
{
	scr_transition_fade_to_color(global.start_room, 1, c_white);
	global.player_hp = global.player_hp_max;
	global.player_spawn_x = NaN;
	global.player_spawn_y = NaN;
	global.player_spawn_z = NaN;
	global.player_spawn_direction = 0;
	global.player_spawn_index = obj_gbjam12_player;
	global.player_has_mask = true;
	global.player_score = 0;
	global.player_score_saved = 0;
	ds_map_clear(global.map_switches);
}

function scr_continue_game()
{
	scr_transition_fade_to_color(global.start_room, 1, c_white);
	global.player_hp = global.player_hp_max;
	//global.player_spawn_x = NaN;
	//global.player_spawn_y = NaN;
	//global.player_spawn_z = NaN;
	//global.player_spawn_direction = 270;
	//global.player_spawn_index = obj_gbjam12_player;
}

function scr_snap_pos_to_grid(_pos, _grid_size)
{
	return r3(round(_pos[0] / _grid_size) * _grid_size,
			round(_pos[1] / _grid_size) * _grid_size,
			round(_pos[2] / _grid_size) * _grid_size);
}