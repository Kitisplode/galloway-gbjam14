/// @description Fire shots on a timer.
event_inherited();

shot_timer -= scr_get_tick_length();
if (shot_timer < 0)
{
	scr_player_shoot(shot_count, direction_aiming, shot_width,
						shot_scale, shot_speed,
						0,-8, shot_object);
	shot_timer = shot_rate;
}