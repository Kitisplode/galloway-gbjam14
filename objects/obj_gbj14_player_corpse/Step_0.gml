/// @description Insert description here
// You can write your code in this editor

if (text_timer > 0)
{
	text_timer -= scr_get_tick_length();
	if (text_timer <= 0)
	{
		scr_create_text_string_ext(position[0], position[1] - 32, depth - 1, "YOU DIED",
									1/30, global.font_pik, fa_center, fa_middle,
									1, c_white, -1,false);
	}
}

// Inherit the parent event
event_inherited();
