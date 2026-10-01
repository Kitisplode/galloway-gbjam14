/// @description Insert description here
// You can write your code in this editor

if (!sleeping)
{
	cycle_x = (cycle_x + cycle_x_speed) mod 360;
	dom_offset_x = dom_base_offset_x - sin(degtorad(cycle_x)) * 48;
	
	cycle_y = (cycle_y + cycle_y_speed) mod 360;
	dom_offset_y = dom_base_offset_y - sin(degtorad(cycle_y)) * 8;
	
	if (!instance_exists(obj_base_player))
		return;

	if (image_alpha < 1.0)
		image_alpha += 0.05;
	else
	{
		shot_timer -= scr_get_tick_length();
		if (shot_timer <= 0)
		{
			shot_timer = shot_time;
			if (shot_count > 0)
				scr_spawn_projectiles_fan(shot_count,
					1, 270, obj_gbj14_enemy_shot,
					90, OBJECT_DEPTHS.EFFECT, true,
					shot_sprite, 0.5);
		}
	}
}

// Inherit the parent event
event_inherited();
