/// @description A thrown shuffle bug defeats an enemy on impact.

if (other.is_thrown && other.movement_enabled && (abs(other.velocity[0]) > 30 || abs(other.velocity[1]) > 30))
{
	hp = 0;
	damage_timer = damage_time;
	if (audio_exists(sound_damage_dead))
		play_sound(sound_damage_dead, 1, false, 0.8 * sound_volume, sound_pitch, 0);

	// Keep a thrown bug in its airborne state so it can still recover when it
	// reaches the ground after hitting another enemy.
	if (other.object_index != obj_gbj14_enemy_shuffle)
		other.is_thrown = false;
	other.velocity[0] = 0;
	other.velocity[1] = 0;
}
