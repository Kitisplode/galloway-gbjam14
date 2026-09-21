/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (!ready)
	{
		var _ready_count = 0;
		for (var _i = 0; _i < 3; _i++)
		{
			if (treasure_spot[_i].ready) _ready_count++;
		}
		if (_ready_count >= 3)
		{
			ready = true;
			phase_timer = 6;
		}
	}
	else
	{
		if (phase_timer > 0) phase_timer -= scr_get_tick_length();
		if (phase == 0 && phase_timer <= 0)
		{
			phase = 1;
			shake[0] = random_range(-5,5);
			shake[1] = random_range(-5,5);
			phase_timer = 3;
			play_sound(snd_gbjam9_boss_hit, 2, 0, 1, 1, 1);
		}
		else if (phase == 1 && phase_timer <= 0)
		{
			phase = 2;
			shake[0] = random_range(-5,5);
			shake[1] = random_range(-5,5);
			phase_timer = 0.5;
			play_sound(snd_gbjam9_boss_hit, 2, 0, 1, 1, 1);
		}
		else if (phase == 2 && phase_timer <= 0)
		{
			phase = 3;
			shake[0] = random_range(-5,5);
			shake[1] = random_range(-5,5);
			phase_timer = 5;
			play_sound(snd_gbjam9_boss_hit, 2, 0, 1, 1, 1);
		}
		else if (phase == 3 && phase_timer <= 0)
		{
			phase = 4;
			velocity[1] = 50;
			phase_timer = random_range(1,5);
			play_sound(snd_gbj14_wind, 2, 0, 1, 1, 1);
		}
		else if (phase == 4 && phase_timer <= 0)
		{
			phase_timer = random_range(1,5);
			shake[0] = random_range(-5,5);
			shake[1] = random_range(-5,5);
			play_sound(snd_gbjam9_boss_hit, 2, 0, 1, 1, 1);
		}
	}
}

// Inherit the parent event
event_inherited();

