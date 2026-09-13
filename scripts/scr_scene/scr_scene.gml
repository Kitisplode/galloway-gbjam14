function scr_scene_Add_Step(_queue, _wait_time, _verb="none", _object=undefined)
{
	var _struct =
	{
		wait_after	: _wait_time,
		verb		: _verb,
		object		: _object
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_TextVN(_queue, _wait_time, _text, _x,_y, _type_rate=0.25, _type_sound=-1)
{
	var _struct = {
		wait_after  : _wait_time,
		verb		: "text_vn",
		text		: _text,
		x			: _x,
		y			: _y,
		type_rate	: _type_rate,
		type_sound	: _type_sound,
		font		: _font
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_TextFade(_queue, _wait_time, _text, _x,_y, _font,  _fade_time=1, _type_rate=0.25, _type_sound=-1)
{
	var _struct = {
		wait_after	: _wait_time,
		verb		: "text_fade",
		text		: _text,
		x			: _x,
		y			: _y,
		fade_time	: _fade_time,
		type_rate	: _type_rate,
		type_sound  : _type_sound,
		font		: _font
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Effect(_queue, _sprite_name, _sprite_index, _anim_speed, _depth, _x,_y, _frame_index=0, _xscale=1,_yscale=1)
{
	scr_scene_Add_Step_Sprite_Add(_queue, _sprite_name, _sprite_index, _frame_index, _anim_speed, _depth, _x,_y, 0, 1, _xscale,_yscale);
}

function scr_scene_Add_Step_Sprite_Add(_queue, _sprite_name, _sprite_index, _frame_index, _anim_speed, _depth, _x=0,_y=0, _fade_time=0, _loop_type=0, _xscale=1,_yscale=1, _angle=0, _blend=c_white, _alpha=1, _outline=0, _out_color=c_white)
{
	var _struct = 
	{
		wait_after	: 0,
		verb		: "sprite_fade_in",
		sprite_name		: _sprite_name,
		sprite_index	: _sprite_index,
		anim_frame		: _frame_index,
		anim_speed		: _anim_speed,
		depth			: _depth,	
		x				: _x,
		y				: _y,
		xscale			: _xscale,
		yscale			: _yscale,
		angle			: _angle,
		blend			: _blend,
		alpha			: _alpha,
		fade_time		: _fade_time,
		loop_type		: _loop_type,
		outline_thickness: _outline,
		outline_color	: _out_color
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Sprite_Remove(_queue, _sprite_name, _fade_time=0)
{
	var _struct = {
		wait_after: 0,
		verb:		"sprite_fade_out",
		sprite_name: _sprite_name,
		fade_time: _fade_time
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Sprite_Alpha(_queue, _sprite_name, _alpha, _fade_time=1)
{
	var _struct = {
		wait_after: 0,
		verb:		"sprite_alpha",
		sprite_name: _sprite_name,
		alpha: _alpha,
		fade_time: _fade_time
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Sprite_Scale(_queue, _sprite_name, _scale_x,_scale_y, _scale_time = 1)
{
	var _struct = {
		wait_after: 0,
		verb:		"sprite_scale",
		sprite_name: _sprite_name,
		scale_x: _scale_x,
		scale_y: _scale_y,
		scale_time: _scale_time
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Sprite_Move(_queue, _sprite_name, _x,_y, _move_time=1, _move_bounce=0)
{
	var _struct = {
		wait_after: 0,
		verb:		"sprite_move",
		sprite_name: _sprite_name,
		x				: _x,
		y				: _y,
		move_time: _move_time,
		move_bounce: _move_bounce
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Sprite_Shake(_queue, _sprite_name, _shake, _pump)
{
	var _struct = {
		wait_after: 0,
		verb:		"sprite_shake",
		sprite_name: _sprite_name,
		shake		: _shake,
		pump		: _pump
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Sprite_Hover(_queue, _sprite_name, _hover_amount, _hover_cycle_time)
{
	var _struct = {
		wait_after: 0,
		verb: "sprite_hover",
		sprite_name: _sprite_name,
		hover_amount: _hover_amount,
		hover_cycle_time: _hover_cycle_time
	};
	ds_queue_enqueue(_queue, _struct);
}


function scr_scene_Add_Step_Pause_For_Input(_queue, _expected_input)
{
	var _struct = {
		wait_after: 0,
		verb: "pause_for_input",
		input: _expected_input
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_RoomFade(_queue, _room_id, _fade_time=1, _color=c_black)
{
	var _struct = 
	{
		wait_after	: 0,
		verb		: "room_fade",
		room_id		: _room_id,
		fade_time	: _fade_time,
		color		: _color
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Play_Music(_queue, _music_id, _fade_time=1, _loop=true)
{
	var _struct = {
		wait_after: 0,
		verb:		"play_music",
		music_id: _music_id,
		fade_time: _fade_time,
		loop: _loop
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Add_Step_Play_Sound(_queue, _sound_id ,_volume=1, _pitch=1, _pitch_offset=0)
{
	var _struct = {
		wait_after: 0,
		verb:		"play_sound",
		sound_id: _sound_id,
		volume: _volume,
		pitch: _pitch,
		pitch_offset: _pitch_offset
	};
	ds_queue_enqueue(_queue, _struct);
}

function scr_scene_Process_Step(_action, _next_step)
{
	switch(_action)
	{
		case "text_vn":
		{
			action_id = instance_create_depth(_next_step.x, _next_step.y, OBJECT_DEPTHS.HUD, obj_vn_textbox);
			action_id.text = _next_step.text;
			action_id.text_x = _next_step.x;
			action_id.text_y = _next_step.y;
			action_id.text_type_rate = _next_step.type_rate;
			action_id.sprite_index = spr_nm_scene_bubble_speech;
			action_id.text_type_sound_ID = _next_step.type_sound;
			break;
		}
		case "text_fade":
		{
			var _wait_timer = _next_step.fade_time;
			action_id = scr_create_text_paragraph_ext(_next_step.x, _next_step.y, OBJECT_DEPTHS.HUD, _next_step.text,
											_next_step.type_rate, _next_step.font, fa_center, fa_middle,
											1, c_white, _wait_timer);
			
			action_id.fade_rate = _next_step.fade_time;
			wait_timer = _wait_timer;
			break;
		}
		
		case "sprite_fade_in":
		{
			var _id = ds_map_find_value(map_sprites, _next_step.sprite_name)
			var _sprite_existed = true;
			if (!instance_exists(_id))
			{
				_id = instance_create_depth(_next_step.x, _next_step.y, _next_step.depth, obj_vn_sprite);
				_sprite_existed = false;
			}
			_id.sprite_index = _next_step.sprite_index;
			_id.anim_frame = _next_step.anim_frame;
			_id.anim_speed = _next_step.anim_speed;
			_id.alpha_target = _next_step.alpha;
			_id.xscale_target = _next_step.xscale;
			_id.yscale_target = _next_step.yscale;
			_id.image_xscale = _next_step.xscale;
			_id.image_yscale = _next_step.yscale;
			_id.image_angle = _next_step.angle;
			_id.image_blend = _next_step.blend;
			_id.fade_time = _next_step.fade_time;
			_id.loop_type = _next_step.loop_type;
			_id.outline_thickness = _next_step.outline_thickness;
			_id.outline_color = _next_step.outline_color;
			if (!_sprite_existed) ds_map_add(map_sprites, _next_step.sprite_name, _id);
			break;
		}
		case "sprite_fade_out":
		{
			var _id = ds_map_find_value(map_sprites, _next_step.sprite_name);
			if (instance_exists(_id))
			{
				_id.alpha_target = 0;
				_id.fade_time = _next_step.fade_time;
				if (_id.fade_time <= 0) _id.image_alpha = 0;
			}
			break;
		}
		case "sprite_alpha":
		{
			var _id = ds_map_find_value(map_sprites, _next_step.sprite_name);
			if (instance_exists(_id))
			{
				_id.alpha_target = _next_step.alpha;
				var _d = abs(_next_step.alpha - _id.image_alpha);
				if (_d > 0) _id.fade_time = _next_step.fade_time / _d;
				if (_id.fade_time <= 0) _id.image_alpha = 0;
			}
			break;
		}	
		case "sprite_scale":
		{
			var _id = ds_map_find_value(map_sprites, _next_step.sprite_name);
			if (instance_exists(_id))
			{
				_id.xscale_target = _next_step.scale_x;
				var _d = abs(_next_step.scale_x - _id.image_xscale);
				if (_d > 0) _id.xscale_time = _next_step.scale_time / _d;
				else _id.xscale_time = 0;
				
				_id.yscale_target = _next_step.scale_y;
				var _d = abs(_next_step.scale_y - _id.image_yscale);
				if (_d > 0) _id.yscale_time = _next_step.scale_time / _d;
				else _id.yscale_time = 0;
			}
			break;
		}
		case "sprite_move":
		{
			var _id = ds_map_find_value(map_sprites, _next_step.sprite_name);
			if (instance_exists(_id))
			{
				_id.move_stop_bounce = _next_step.move_bounce;
				_id.move_target_pos[0] = _next_step.x;
				_id.move_target_pos[1] = _next_step.y;
				var _v = r3_subtract(_id.move_target_pos, _id.position);
				var _d = r3_norm(_v) * scr_get_tick_as_percent(_next_step.move_time);
				r3_clone(r3_scale(r3_unit(_v), _d), _id.velocity);
				if (_next_step.move_time <= 0) r3_clone(_id.move_target_pos, _id.position);
			}
			break;
		}
		case "sprite_shake":
		case "sprite_bump":
		{
			var _id = ds_map_find_value(map_sprites, _next_step.sprite_name);
			if (instance_exists(_id))
			{
				if (!is_undefined(_next_step.shake)) r3_clone(_next_step.shake, _id.shake);
				if (!is_undefined(_next_step.pump)) r3_clone(_next_step.pump, _id.pump);
			}
			break;
		}
		case "sprite_hover":
		{
			var _id = ds_map_find_value(map_sprites, _next_step.sprite_name);
			if (instance_exists(_id))
			{
				_id.hover_amount = _next_step.hover_amount;
				_id.hover_cycle_time = _next_step.hover_cycle_time;
			}
			break;
		}
		
		case "pause_for_input":
		{
			expected_input = _next_step.input;
			break;
		}
		
		case "play_sound":
		{
			play_sound(_next_step.sound_id, 1, 0, _next_step.volume, _next_step.pitch, _next_step.pitch_offset);
			break;
		}
		
		case "play_music":
		{
			scr_audio_play_song_fade(_next_step.music_id, _next_step.fade_time, _next_step.loop);
			break;
		}
		
		case "room_fade":
		{
			scr_transition_fade_to_color(_next_step.room_id, _next_step.fade_time, _next_step.color);
			break;
		}
	}
}