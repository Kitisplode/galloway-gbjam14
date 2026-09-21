/// @description Insert description here
// You can write your code in this editor

// Link up with the boss and treasure placed in the map. Retried until both
// are found, so instance ordering or culling can't leave us half-linked.
if (!linked)
{
	
	// Nearest boss of our type that no other core has claimed yet.
	var _nearest = noone;
	var _nearest_dist = infinity;
	if (boss_id == noone) with (boss_object)
	{
		if (dom_id != id) continue; // already following another core
		var _d = point_distance(x, y, other.x, other.y);
		if (_d < _nearest_dist) { _nearest_dist = _d; _nearest = id; }
	}
	if (_nearest != noone)
	{
		boss_id = _nearest;
		boss_id.dom_id = id;
		// Keep the boss where the designer placed it relative to the core.
		boss_id.dom_base_offset_x = boss_id.x - x;
		boss_id.dom_base_offset_y = boss_id.y - y;
	}
	
	// Nearest treasure of our type: this is what the boss guards.
	var _treasure = (chase_id == id) ? instance_nearest(x, y, treasure_object) : noone;
	if (_treasure != noone)
	{
		chase_id = _treasure;
		_treasure.boss_id = id;
		// Rest at the height the designer placed the core above the treasure.
		var _dy = _treasure.position[1] - position[1];
		if (_dy > 0) hover_height = _dy;
	}
	
	linked = (boss_id != noone && chase_id != id);
}

if (!paused)
{
	// If our boss is gone (killed), the core has no purpose anymore.
	if (boss_id != noone && !instance_exists(boss_id))
	{
		instance_destroy();
		exit;
	}
	
	if (chase_id != id)
	{
		if (!instance_exists(chase_id))
		{
			instance_destroy();
			exit;
		}
		else
		{
			if (chase_id.dom_id != chase_id.id)
			{
				// Chase near the top-center of the screen. obj_camera is the view's
				// top-left; the head sprite hangs 38px above the target point.
				target_pos[0] = obj_camera.x + 80;
				target_pos[1] = obj_camera.y + 60;
				//if (dom_distance < dom_distance_target) dom_distance += 1;
				//boss_id.image_alpha = dom_distance / dom_distance_target;
			}
			else
			{
				target_pos[0] = chase_id.position[0];
				target_pos[1] = chase_id.position[1] - hover_height;
				//if (dom_distance > 0) dom_distance -= 1;
				//else dom_distance = 0;
				//boss_id.image_alpha = dom_distance / dom_distance_target;
			}
		}
	}
	
	if (r2_dist(position, target_pos) > 2)
	{
		r2_lerp(position, target_pos, 0.01, position);
	}
	else
	{
		r2_clone(target_pos, position);
	}
}

// Inherit the parent event
event_inherited();
