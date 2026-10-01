/// @description Thrown carryable objects defeat enemies on impact.

if (other.is_thrown && other.movement_enabled && (abs(other.velocity[0]) > 30 || abs(other.velocity[1]) > 30))
{
	obj_enemy_takedamage(1, other.x, other.y);

	// Stop the projectile so one throw cannot repeatedly trigger the enemy.
	other.is_thrown = false;
	other.velocity[0] = 0;
	other.velocity[1] = 0;
}
