/// @description Insert description here
// You can write your code in this editor

if (has_ankh)
{
	if (text_timer > 0)
		text_timer -= scr_get_tick_length();
	if (phase == 0 && text_timer <= 0)
	{
		text_timer = 3;
		phase = 1;
		text_id = instance_create_depth(position[0] - image_xscale * 8,position[1] - 32, depth - 1, par_animation);
		text_id.sprite_index = spr_gbj14_hud_item_ankh;
		text_id.anim_speed = 0;
		text_id.sparkle_index = spr_gbj14_fx_sparkle;
		text_id.sparkle_time = 0.25;
		text_id.sparkle_anim_speed = 0.25;
		text_id.hover_cycle_speed = 6;
		text_id.hover_cycle_distance = 4;
		play_sound(snd_gbj14_sparkle, 1, 0, 1, 1,0);
	}
	else if (phase == 1 && text_timer <= 0)
	{
		sparkle_index = spr_gbj14_fx_sparkle;
		sparkle_time = 0.25;
		sparkle_anim_speed = 0.25;
		text_timer = 0.5;
		phase = 2;
		outline_color = c_dkgray;
		outline_thickness = 1;
	}
	else if (phase == 2 && text_timer <= 0)
	{
		text_timer = 0.5;
		phase = 3;
		outline_color = c_ltgray;
		outline_thickness = 2;
	}
	else if (phase == 3 && text_timer <= 0)
	{
		text_timer = 0.25;
		phase = 4;
		outline_color = c_white;
		scr_change_sprite(spr_gbj14_player_live);
		anim_speed = 0.15;
	}
	else if (phase == 4 && anim_looped != 0)
	{
		phase = 5;
	}
	if (phase == 5 || input_check_pressed(["a", "b", "start"]))
	{
		var _player = instance_create_depth(position[0], position[1], OBJECT_DEPTHS.PLAYER, obj_gbj14_player);
		obj_camera.follow = _player;
		_player.invuln_timer = _player.invuln_time;
		_player.image_xscale = image_xscale;
		_player.direction_facing = direction_facing;
		ds_list_clear(_player.list_items);
		for (var _i = 0; _i < ds_list_size(list_item); _i++)
		{
			var _item = ds_list_find_value(list_item, _i);
			var _new_item = {
				name:_item.name,
				uses:_item.uses,
				sprite:_item.sprite,
				sound:_item.sound,
				script:_item.script,
				show_cursor:_item.show_cursor
				};
			ds_list_add(_player.list_items,_new_item);
		}
		
		depth = OBJECT_DEPTHS.TRANSITION + 10;
		if (instance_exists(text_id))
		{
			text_id.fade_rate = 0;
			instance_destroy(text_id);
		}
		if (instance_exists(text_id_2))
		{
			text_id_2.fade_rate = 0;
			instance_destroy(text_id_2);
		}
		if (instance_exists(text_id_3))
		{
			text_id_3.fade_rate = 0;
			instance_destroy(text_id_3);
		}
		if (instance_exists(text_2_id)) instance_destroy(text_2_id);
		instance_destroy();
		exit;
	}
}
else
{
	if (input_check_pressed(["a", "b", "start"]))
		{
			depth = OBJECT_DEPTHS.TRANSITION + 10;
			scr_transition_respawn(288,1350, c_white);
		}
	//if (phase == 0)
	//{
	//	if (text_timer > 0)
	//	{
	//		text_timer -= scr_get_tick_length();
	//		if (text_timer <= 0)
	//		{
	//			//text_id = scr_create_text_paragraph_ext(position[0], position[1] - 64, depth - 1, "Get up\nDon Bruto!",
	//			//						1/10, global.font_lexou, fa_center, fa_middle,
	//			//						1, c_white, 3,false);
	//			//text_id.text_height = 16;
	//			//text_id.fade_rate = 0.5;
	//			phase = 1;
	//			text_timer = 5;
	//		}
	//	}
	//}
	//else if (phase == 1)
	//{
	//	if (!instance_exists(text_id))
	//	{
	//		//text_id_2 = scr_create_text_paragraph_ext(position[0], position[1] - 64, depth - 1, "You may not\nsleep on\nthe job!",
	//		//						1/10, global.font_lexou, fa_center, fa_middle,
	//		//						1, c_white, 3,false);
	//		//text_id_2.text_height = 16;
	//		//text_id_2.fade_rate = 0.5;
	//		phase = 2;
	//	}
	//}
	//else if (phase == 2)
	//{
	//	if (!instance_exists(text_id_2))
	//	{
	//		//text_id_3 = scr_create_text_paragraph_ext(position[0], position[1] - 64, depth - 1, "GET BACK\nTO WORK!",
	//		//						1/10, global.font_lexou, fa_center, fa_middle,
	//		//						1, c_white, 3,false);
	//		//text_id_3.text_height = 16;
	//		//text_id_3.fade_rate = 0.5;
	//		phase = 3;
	//	}
	//}

	//if (phase > 1)
	//{
	//	if (text_2_id == id)
	//	{
	//		//text_2_id = scr_create_text_string_ext(position[0], position[1] + 16, depth - 1, "Press @!",
	//		//					-1, global.font_lexou, fa_center, fa_middle,
	//		//					1, c_white, -1, false);
	//	}
	//	if (input_check_pressed(["a", "b", "start"]))
	//	{
	//		depth = OBJECT_DEPTHS.TRANSITION + 10;
	//		if (instance_exists(text_id))
	//		{
	//			text_id.fade_rate = 0;
	//			instance_destroy(text_id);
	//		}
	//		if (instance_exists(text_id_2))
	//		{
	//			text_id_2.fade_rate = 0;
	//			instance_destroy(text_id_2);
	//		}
	//		if (instance_exists(text_id_3))
	//		{
	//			text_id_3.fade_rate = 0;
	//			instance_destroy(text_id_3);
	//		}
	//		if (instance_exists(text_2_id)) instance_destroy(text_2_id);
	//		scr_transition_respawn(288,1350, c_white);
	//	}
	//}
}

// Inherit the parent event
event_inherited();
