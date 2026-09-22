/// @description Insert description here
// You can write your code in this editor

// No damage during the ending sequence.
if (action == 3) exit;

var _invuln_timer_previous = invuln_timer;

// Inherit the parent event
event_inherited();

if (_invuln_timer_previous != invuln_timer)
{
	scr_gbj14_player_TakeDamage(other);
}
