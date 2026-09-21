/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (!instance_exists(boss_id))
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
