/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!paused)
{
	if (is_on_ground)
	{
		velocity[0] *= friction_ground;
	}
}