function scr_shot_wall_die(_axis, _collision_id)
{
	instance_destroy();
	return true;
}

function scr_khepri_enemy_horse_wall(_axis, _collision_id)
{
	if (_axis == 0 && phase == attack_dash + 1)
	{
		phase++;
		attack_timer = 0.1;
		velocity[0] *= -0.25;
		velocity[1] = -200;
		obj_camera.shake_remain = 10;
		obj_camera.shake_magnitude = 2;
		obj_camera.shake_length = 5;
		play_sound(snd_gbjam12_statue_stomp, 1, 0, 0.8, 1,0);
		after_effect_active = false;
		return true;
	}
	return false;
}

function scr_khepri_enemy_ball_wall(_axis, _collision_id)
{
	if (id_player == id)
	{
		// If the ball's movement is parallel to the block's normal, then it dies.
		// Otherwise, it bounces.
		if (instance_exists(_collision_id))
		{
			if (r3_parallel(velocity, _collision_id.normal_vector))
			{
				scr_effect_create_khepri_hit(position[0],position[1], spr_effect_hit_01, 0.1, depth - 5, random(5));
				play_sound(snd_gbjam12_player_sword, 1, 0, 1.2, 0.6,0.1);
				dying = true;
				instance_destroy();
			}
			else
			{
				bounces -= 1;
				if (bounces < 0)
				{
					scr_effect_create_khepri_hit(position[0],position[1], spr_effect_hit_01, 0.1, depth - 5, random(5));
					play_sound(snd_gbjam12_player_sword, 1, 0, 1.2, 0.6,0.1);
					dying = true;
					instance_destroy();
				}
				else
				{
					//show_message(string(velocity) + ", " + string(_collision_id.normal_vector));
					scr_effect_create_khepri_hit(position[0],position[1], spr_effect_hit_01, 0.1, depth - 5, random(5));
					var _mirrored = r3_reflection(velocity, _collision_id.normal_vector);
					r3_clone(_mirrored, velocity);
					return true;
				}
			}
		}
	}
	return false;
}

function scr_khepri_player_wall(_axis, _collision_id)
{
	// If we're in the water, don't do this stuff lol
	if (is_in_water)
		return true;
	// If we're moving along the horizontal axis and we're dashing, bounce off the wall!
	if (_axis == 0)
	{
		if (action == 1)
		{
			var _pos_x = -8;
			if (velocity[0] > 0) _pos_x = 8;
			scr_effect_create_khepri_hit(position[0] + _pos_x,position[1], spr_effect_hit_01, 0.1, depth - 5, random(5));
			
			hurt_timer = hurt_time;
			velocity[0] = -sign(image_xscale) * dash_speed * 0.5;
			velocity[1] = -jump_force * 0.35;
			action = 0;
			play_sound(snd_gbjam12_skeleton_roll, 1, 0, 0.5, 1.5,0.1);
			
			return true;
		}
	}
	return false;
}

function scr_khepri_enemy_wallhug_wall(_axis, _collision_id)
{
	if (instance_exists(_collision_id))
	{
		var _angle_between = r3_get_angle_between_2d(_collision_id.normal_vector, up_vector);
		r3_clone(_collision_id.normal_vector, up_vector);
		r3_clone(up_vector, normal_vector);
		r3_rotate(velocity, _angle_between, velocity);
		return true;
	}
	return false;
}

function scr_khepri_enemy_wallhug_nowall(_axis)
{
	var _check_position = r3_subtract(position, r3_unit(up_vector));
	// If we're on the ground, there's no need to check for this stuff.
	if (scr_Check_For_Solids(_check_position, true)) return;
	// Otherwise, we want to rotate around until we find another good angle to go in.
	var _angle_between = r3_get_angle_between_2d(up_vector, velocity);
	if (is_undefined(_angle_between)) return;
	_angle_between = sign(_angle_between);
	// Loop through a bunch of different angles and see if we can find some ground ahead of us at any of those angles.
	for (var _i = 0; _i < 360; _i+=45)
	{
		var _up = r3_unit(r3_rotate(up_vector, _angle_between * _i));
		if (scr_Check_For_Solids(r3_subtract(_check_position, _up), true))
		{
			r3_rotate(velocity, _angle_between * _i, velocity);
			r3_clone(_up, up_vector);
			r3_clone(_check_position, position);
			break;
		}
	}
}