if (!paused)
{
	if (fall_through_oneway_timer > 0)
	{
		fall_through_oneway = true;
		fall_through_oneway_timer -= scr_get_tick_length();
	}
	else
		fall_through_oneway = false;
	
	if (invuln_timer > 0)
	{
		invuln_timer -= scr_get_tick_length();
	}
}

event_inherited();

