/// @description Insert description here
// You can write your code in this editor

application_surface_draw_enable(!shaders_on);
if (shaders_on)
{
	if (keyboard_check_pressed(ord("I")))
	{
		current_palette = (current_palette + 1) mod palette_count;
	}
	if (current_palette != previous_palette)
	{
		if (palette_lerp >= 1) palette_lerp = 0;
		palette_lerp += scr_get_tick_as_percent(palette_lerp_time);
		if (palette_lerp >= 1)
		{
			palette_lerp = 1;
			previous_palette = current_palette;
		}
		scr_set_gb_shader_colors(merge_color(palette[previous_palette].c1, palette[current_palette].c1, palette_lerp),
								 merge_color(palette[previous_palette].c2, palette[current_palette].c2, palette_lerp),
								 merge_color(palette[previous_palette].c3, palette[current_palette].c3, palette_lerp),
								 merge_color(palette[previous_palette].c4, palette[current_palette].c4, palette_lerp));
	}
}