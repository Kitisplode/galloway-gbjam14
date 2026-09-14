/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!fade_setup)
{
	if (fade_time > 0) image_alpha = 0;
	fade_setup = true;
}

if (image_alpha != alpha_target)
{
	if (fade_time > 0)
		image_alpha -= sign(image_alpha - alpha_target) * scr_get_tick_as_percent(fade_time);
	else image_alpha = alpha_target;
}

if (image_xscale != xscale_target)
{
	if (xscale_time > 0)
		image_xscale -= sign(image_xscale - xscale_target) * scr_get_tick_as_percent(xscale_time);
	else image_xscale = xscale_target;
}

if (image_yscale != yscale_target)
{
	if (yscale_time > 0)
		image_yscale -= sign(image_yscale - yscale_target) * scr_get_tick_as_percent(yscale_time);
	else image_yscale = yscale_target;
}

if (loop_type > 1) anim_loop = false;