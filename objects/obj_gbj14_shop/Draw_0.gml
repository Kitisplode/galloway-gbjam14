/// @description Insert description here
// You can write your code in this editor

var _mat = scr_get_main_camera_matrix();
matrix_set(matrix_world, _mat);

// Inherit the parent event
event_inherited();


global.in_shop = global.paused; // TODO change this
if (instance_exists(obj_gbj14_player) && global.in_shop)
{
	var _player = obj_gbj14_player;
	
	draw_sprite_ext(spr_gbj14_hud_shop_bg, 0, 80 -16, 60, 1,1, 0, c_white, 1);
	
	var _x = 40 -16;
	var _y = 32;
	
	for (var _i = 0; _i < array_length(shop_items); ++_i)
	{
		var _item = shop_items[_i];
		draw_sprite(spr_gbj14_hud_item_frame, 0, _x,_y);
		if (sprite_exists(_item.sprite))
		{
			draw_sprite(_item.sprite, 0, _x,_y);
		}
		_x += 32;
		if (_x > 120 -16)
		{
			_x = 40 -16;
			_y += 32;
		}
	}
	
	//draw_set_halign(fa_right);
	//draw_set_valign(fa_top);
	//draw_set_font(fnt_points);
	//draw_text(144, 3, string(global.player_score));
}

matrix_set(matrix_world, matrix_build_identity());