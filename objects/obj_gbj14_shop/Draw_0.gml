/// @description Insert description here
// You can write your code in this editor

var _mat = scr_get_main_camera_matrix();
matrix_set(matrix_world, _mat);

// Inherit the parent event
event_inherited();


if (instance_exists(obj_gbj14_player) && global.in_shop)
{
	var _player = obj_gbj14_player;
	
	draw_sprite_ext(spr_gbj14_hud_shop_bg, 0, 80 -16, 60, 1,1, 0, c_white, 1);
	
	var _x = 0;
	var _y = -8;
	var _item;
	for (var _i = 0; _i < array_length(shop_items); ++_i)
	{
		if (_i % shop_row_size == 0)
		{
			_x = 40 -16;
			_y += 32;
		}
		_item = shop_items[_i];
		draw_sprite(spr_gbj14_hud_item_frame, 0, _x,_y);
		if (sprite_exists(_item.sprite))
		{
			draw_sprite(_item.sprite, 0, _x,_y);
		}
		if (_i == selected_item)
		{
			draw_sprite(spr_gbj14_player_cursor, 0, _x,_y);
		}
		
		_x += 32;
	}
	if (selected_item >= 0 && selected_item < array_length(shop_items))
	{
		_item = shop_items[selected_item];
		var _price = "$" + string(_item.price);
		var _right = 120 - string_length(_price)*8;
		draw_bitmap_text(spr_font_lexou, _right,  88, _price,            128);
		draw_bitmap_text(spr_font_lexou,      8,  88, _item.name,        128);
		draw_bitmap_text(spr_font_lexou,      0, 112, _item.description, 128);
	}
}

matrix_set(matrix_world, matrix_build_identity());