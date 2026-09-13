/// @description Fade in from color
circle_diameter += scr_get_tick_as_percent(fade_time);
if (circle_diameter >= circle_diameter_max)
{
	instance_destroy();
}