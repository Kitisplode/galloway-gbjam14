/// @description Insert description here
// You can write your code in this editor

// Hide the HUD during the ending sequence.
if (global.gbj14_ending) exit;

var _mat = scr_get_main_camera_matrix();
matrix_set(matrix_world, _mat);

// Full-screen flash, fading out over half a second.
if (global.gbj14_flash > 0)
{
	draw_set_alpha(global.gbj14_flash);
	draw_set_color(c_white);
	draw_rectangle(-16, -16, 176, 160, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	global.gbj14_flash = max(0, global.gbj14_flash - scr_get_tick_length() * 2);
}

// Inherit the parent event
event_inherited();

if (instance_exists(obj_gbj14_player))
{
	// display current item
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
		if (_item.uses > 0)
		{
			_x += 20;
			_y = 4;
			var _uses = "x" + string(_item.uses);
			draw_bitmap_text(spr_font_lexou, _x, _y, _uses, 32);
		}
	}
	// display money
	var _money = "$" + string(global.player_score);
	var _right = 140 - string_length(_money)*8;
	draw_bitmap_text(spr_font_lexou, _right, 4, _money, 128);
	//display health
	var _hp = "\x01" + string(global.player_hp);
	draw_bitmap_text(spr_font_lexou, -12, 132, _hp, 128);
	
	// display pause screen
	if (!global.cutscene_playing)
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
		draw_sprite_ext(spr_gbj14_hud_paused, 0, 80 -16, 72, 1,1, 0, c_white, paused_alpha);
	}
	death_alpha = lerp(death_alpha, 0, 0.1);
}
else
{
	if (death_alpha < 1) death_alpha += 0.005;
}
if (death_alpha > 0)scr_draw_rectangle_color_alpha(0,0, 160,144, c_black, death_alpha);
	
matrix_set(matrix_world, matrix_build_identity());
