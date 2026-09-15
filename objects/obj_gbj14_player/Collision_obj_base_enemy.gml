/// @description Insert description here
// You can write your code in this editor

var _invuln_timer_previous = invuln_timer;

// Inherit the parent event
event_inherited();

if (_invuln_timer_previous != invuln_timer)
{
	var _dir = point_direction(other.position[0],other.position[1], position[0],position[1]);
	action = 0;
	hurt_timer = hurt_time;
	velocity[0] = cos(degtorad(_dir)) * run_speed;
	velocity[1] = -abs(sin(degtorad(_dir)) * run_speed);
	play_sound(snd_gbj14_player_hurt, 1, 0, 2,1,0.5);
	play_sound(snd_gbj14_knock, 1, 0, 1,1,0);
}