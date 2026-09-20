/// @description Insert description here
// You can write your code in this editor

// If the enemy is tied to a switch, and the switch is active, it should despawn.
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

// Pause if too far from the player.
if (inactive_when_far_away && instance_exists(obj_base_player))
{
	var _distance = r2_dist(position, obj_base_player.position);
	if (_distance > distance_far_away)
	{
		if (despawn_when_far_away)
		{
			instance_destroy();
			exit;
		}
		paused = true;
		_distance = point_distance(xstart,ystart, obj_base_player.position[0],obj_base_player.position[1]);
		if (respawn_when_far_away && _distance > distance_far_away)
		{
			position[0] = xstart;
			position[1] = ystart;
			x = position[0];
			y = position[1];
		}
	}
}

// Pause also if the player is not in the same room region as the enemy.
if (obeys_room)
{
	if (active_room == id)
	{
		if (instance_exists(obj_room_region))
		{
			var _temp_id = instance_place(x,y, obj_room_region);
			if (_temp_id != noone) active_room = _temp_id;
		}
	}

	if (active_room != id && instance_exists(active_room))
	{
		if (active_room != global.active_room)
		{
			paused = true;
			visible = false;
		}
		else
		{
			visible = true;
		}
	}
}

// If the enemy's hp reaches zero, it should die.
if (hp <= 0)
{
	movement_collision = false;
	if ((delayed_death_effect && damage_timer <= 0) || !delayed_death_effect )
		instance_destroy();
}