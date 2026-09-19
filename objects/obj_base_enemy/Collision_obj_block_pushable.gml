/// @description Thrown carryable objects defeat enemies on impact.

if (other.is_thrown && other.movement_enabled && (abs(other.velocity[0]) > 30 || abs(other.velocity[1]) > 30))
{
	// This is intentionally an instant kill: the new interaction rule is that
	// any object the player can lift is lethal when thrown at an enemy.
	hp = 0;
	damage_timer = damage_time;
	if (audio_exists(sound_damage_dead))
		play_sound(sound_damage_dead, 1, false, 0.8 * sound_volume, sound_pitch, 0);

	// Stop the projectile so one throw cannot repeatedly trigger the enemy.
	other.is_thrown = false;
	other.velocity[0] = 0;
	other.velocity[1] = 0;
}
