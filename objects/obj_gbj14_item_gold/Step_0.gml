/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!paused)
{
	collection_timer -= scr_get_tick_length();
	if (is_on_ground)
	{
		velocity[0] *= friction_ground;
		velocity[1] *= friction_ground;
	}
}