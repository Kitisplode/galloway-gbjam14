/// @description Insert description here
// You can write your code in this editor

var _mat = scr_get_main_camera_matrix();
matrix_set(matrix_world, _mat);

// Inherit the parent event
event_inherited();



if (instance_exists(obj_gbj14_player))
{
	if (global.paused)
	{
		paused_alpha = lerp(paused_alpha, 1, 0.1);
	}
	else
	{
		paused_alpha = lerp(paused_alpha, 0, 0.1);
	}
	
	scr_draw_rectangle_color_alpha(0,0, 160,144, c_white, paused_alpha / 4);
	draw_sprite_ext(spr_gbj14_hud_paused, 0, 80, 72, 1,1, 0, c_white, paused_alpha);
	
	var _x = -10;
	var _y = 3;
	var _player = obj_gbj14_player;
	draw_sprite(spr_gbj14_hud_item_frame, 0 , _x,_y);
	if (ds_list_size(_player.list_items) > 0)
	{
		var _item = ds_list_find_value(_player.list_items, 0);
		var _sprite = _item.sprite;
		if (sprite_exists(_sprite))
		{
			draw_sprite(_sprite, 0, _x,_y);
		}
	}
	/*
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_font(fnt_points);
	draw_text(144, 3, string(global.player_score));
	*/
	var _money = "$" + string(global.player_score);
	var _right = 140 - string_length(_money)*8;
	draw_bitmap_text(spr_font_lexou, _right, 4, _money, 128);
}

matrix_set(matrix_world, matrix_build_identity());