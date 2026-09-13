circle_diameter -= scr_get_tick_as_percent(fade_time);
if (circle_diameter <= 0)
{
	circle_diameter = 0;
	transition_state = TRANSITION_STATE.SWITCH;
}