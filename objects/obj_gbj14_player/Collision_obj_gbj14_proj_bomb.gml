/// @description Insert description here
// You can write your code in this editor

// No damage during the ending sequence.
if (action == 3) exit;

var _invuln_timer_previous = invuln_timer;
var _damage = 1; //other.damage
if (!global.debug_player_invincible && !invincible && invuln_timer <= 0 && _damage > 0)
{
	if (other.position[2] > position[2] + z_height ||
		other.position[2] + other.z_height < position[2]) exit;
	if (hp > 0) hp -= _damage;
	global.player_hp -= _damage;
	invuln_timer = invuln_time;
}

if (_invuln_timer_previous != invuln_timer)
{
	scr_gbj14_player_TakeDamage(other);
}
