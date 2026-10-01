
function obj_enemy_takedamage(_damage, _from_x, _from_y)
{
	if (invulnerable)
	{
		if (audio_exists(sound_armor))
			play_sound(sound_armor, 1, false, 1, sound_pitch,0.2 * sound_pitch);
		return;
	}
	if (_damage > 0)
	{
		hp -= _damage;
		damage_timer = damage_time;
		if (audio_exists(sound_damage_crit) && is_boss && _damage > 8)
			play_sound(sound_damage_crit, 1, false, sound_volume * 3,  0.75,0.1);
		if (audio_exists(sound_damage_boss) && is_boss)
			play_sound(sound_damage_boss, 1, false, sound_volume * 1,  sound_pitch/2,0.1);
		if (audio_exists(sound_damage))
			play_sound(sound_damage, 1, false, sound_volume,  sound_pitch,0.2);
		if (hp <= 0 && audio_exists(sound_damage_dead))
			play_sound(sound_damage_dead, 1, false, 0.8 * sound_volume,  sound_pitch,0);
		var _temp_direction = point_direction(_from_x,_from_y, x,y);
		shake[0] = +cos(degtorad(_temp_direction));
		shake[1] = -sin(degtorad(_temp_direction));
	}
}
