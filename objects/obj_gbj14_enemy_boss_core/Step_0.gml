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
			chase_id = id;
		}
		else
		{
			if (chase_id.dom_id != chase_id.id)
			{
				position[0] = obj_camera.x + 80;
				position[1] = obj_camera.y + 20;
				if (dom_distance < dom_distance_target)
				{
					dom_distance += 1;
				}
				dom_offset_y = -dom_distance;
				boss_id.image_alpha = dom_distance / dom_distance_target;
			}
			else
			{
				dom_offset_x = 0;
				dom_offset_y = 0;
				if (dom_distance > 0)
				{
					dom_distance -= 1;
				} else dom_distance = 0;
				boss_id.image_alpha = dom_distance / dom_distance_target;
				boss_id.mask_index = msk_no_collision;
			}
		}
	}
}

// Inherit the parent event
event_inherited();
