/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (paused) exit;

// Flip the sprites if we're facing west.
{
	if (direction_facing == 180) image_xscale = -1;
	else image_xscale = 1;
}

if (abs(velocity[0]) > 10)
{
	scr_change_sprite(spr_gbj14_player_walk);
	anim_speed = 0.15;
}
else
{
	scr_change_sprite(spr_gbj14_player_idle);
	anim_speed = 0;
}