/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	float_cycle += float_cycle_rate;
	float_cycle = float_cycle mod 360;
	velocity[1] = cos(degtorad(float_cycle)) * 10;
	if (float_cycle == 0)
	{
		var _temp_id = scr_effect_create(x,y + 3, spr_effect_ring_large, 0.15, depth + 1);
		_temp_id.image_yscale = 0.5;
	}
}

// Inherit the parent event
event_inherited();

