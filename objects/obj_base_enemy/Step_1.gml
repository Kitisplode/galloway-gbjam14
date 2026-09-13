/// @description Insert description here
// You can write your code in this editor

if (string_length(switch_name) > 0)
{
	var _value = ds_map_find_value(global.map_switches, switch_name);
	if (!is_undefined(_value))
	{
		if (_value)
		{
			instance_destroy();
			exit;
		}
	}
}

// Inherit the parent event
event_inherited();

if (hp <= 0)
{
	movement_collision = false;
	if ((delayed_death_effect && damage_timer <= 0) || !delayed_death_effect )
		instance_destroy();
}