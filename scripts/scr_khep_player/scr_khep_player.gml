function scr_khep_player_Behavior_In_Air()
{
	up_vector = r3(0,-1,0);
	slide_slopes_up = true;
	slide_slopes_down = true;
	slide_around_blocks = false;
	force_gravity = gravity_in_air;
	axis_max_speed[1] = 1200;
	
	if (direction_input > -1 && can_move)
	{
		var _accel = accel_run;
		
		if (direction_input < 90 || direction_input > 270)
			direction_facing = 0;
		else if (direction_input > 90 && direction_input < 270)
			direction_facing = 180;
		direction_aiming = direction_facing;
		
		if ((direction_input >= 0 && direction_input < 90) ||
			direction_input > 270)
			velocity[0] += _accel;
		else if (direction_input < 270 && direction_input > 90)
			velocity[0] -= _accel;
	}
	else
	{
		direction_aiming = direction_facing;
	}
	
	if (is_on_ground)
	{
		var _temp_friction = friction_ground;
		if (action == 1) _temp_friction = 1;
		if (hurt_timer > 0) _temp_friction = friction_hurt;
		velocity[0] *= _temp_friction;
	}
	
	if (can_move)
	{
		if (input_check_pressed("down") && is_on_ground)
		{
			fall_through_oneway_timer = fall_through_oneway_time;
		}
		if (scr_Input_Read(id_input, input_jump, 0))
		{
			if (id_holding != self)
			{
				if (instance_exists(id_holding))
				{
					id_holding.id_player = id_holding;
					id_holding.dom_id = id_holding;
					id_holding.movement_enabled = true;
					id_holding.apply_gravity_force = false;
					id_holding.slide_slopes_up = false;
					id_holding.slide_slopes_down = false;
					id_holding.velocity[0] = sign(image_xscale) * id_holding.axis_max_speed[0] * 0.5;
					id_holding.velocity[1] = -id_holding.axis_max_speed[0] * 0.5;
					if (!is_on_ground)
					{
						id_holding.velocity[1] *= -1;
						play_sound(snd_gbjam12_statue_jump, 1, 0, 0.5, 1.5, 0);
						velocity[1] = -jump_force * 1.2;
					}
					id_holding.after_effect_active = true;
					id_holding.after_effect_time = 0.05;
					id_holding.sparkle_index = spr_effect_sparkle_small_outlined;
					id_holding.sparkle_time = 0.05;
					id_holding.mask_index = spr_khep_en_ball_01;
					if (image_xscale > 1) id_holding.player_direction = 0;
					else id_holding.player_direction = 180;
					
					play_sound(snd_boom_01, 1, 0, 0.25, 0.8,0.1);
					scr_effect_create_khepri_hit(position[0] + sign(image_xscale) * 8,position[1], spr_effect_hit_01, 0.25, depth - 5, random(5));
					
					kick_timer = kick_time;
				}
				id_holding = self;
			}
			else if (is_on_ground)
			{
				play_sound(snd_gbjam12_statue_jump, 1, 0, 0.5, 1.5, 0);
				velocity[1] = -jump_force * 0.97;
			}
		}
		if (input_check(input_jump) && !is_on_ground && velocity[1] > 0)
		{
			velocity[1] *= 0.80;
		}
		if (input_check_released(input_jump) && !is_on_ground && velocity[1] < -30)
		{
			velocity[1] = -30;
		}
	}
	
	if (can_act)
	{
		if (id_holding != self)
		{
			if (image_xscale > 0 && input_check_double("left"))
			{
				image_xscale = -1;
				id_holding.position[0] = position[0];
			}
			else if (image_xscale < 0 && input_check_double("right"))
			{
				image_xscale = 1;
				id_holding.position[0] = position[0];
			}
		}
		
		if (scr_Input_Read(id_input, input_attack, 0))
		{
			if (id_holding == self)
			{
				action = 1;
				anim_frame = 0;
				play_sound(snd_enemy_dash, 1, 0, 0.25, 1.5,0.1);
				scr_effect_create_khepri_hit(position[0],position[1], -1, 0.25, depth - 5, random(5));
				
				dash_timer = dash_time;
				apply_gravity_force = false;
				axis_max_speed[0] = dash_speed;
				after_effect_active = true;
				after_effect_time = 0.075;
			
				velocity[0] = -sign(direction_facing - 90) * dash_speed;
				velocity[1] = 0;
			}
			else
			{
				if (instance_exists(id_holding))
				{
					id_holding.id_player = id_holding;
					id_holding.dom_id = id_holding;
					id_holding.movement_enabled = true;
					id_holding.apply_gravity_force = false;
					id_holding.slide_slopes_up = true;
					id_holding.slide_slopes_down = false;
					id_holding.velocity[0] = sign(image_xscale) * id_holding.axis_max_speed[0] * 0.66;
					id_holding.velocity[1] = 0;
					id_holding.after_effect_active = true;
					id_holding.after_effect_time = 0.05;
					id_holding.sparkle_index = spr_effect_sparkle_small_outlined;
					id_holding.sparkle_time = 0.05;
					id_holding.mask_index = spr_khep_en_ball_01;
					if (image_xscale > 1) id_holding.player_direction = 0;
					else id_holding.player_direction = 180;
					
					play_sound(snd_boom_01, 1, 0, 0.25, 0.8,0.1);
					scr_effect_create_khepri_hit(position[0] + sign(image_xscale) * 8,position[1], spr_effect_hit_01, 0.25, depth - 5, random(5));
					
					kick_timer = kick_time;
					velocity[1] = -jump_force / 2;
				}
				id_holding = self;
			}
		}
	}
}

function scr_khep_player_Behavior_In_Water()
{
	if (!is_in_water_previous)
		jump_from_water_timer = 0;
	
	up_vector = r3(0,0,1);
	slide_slopes_up = false;
	slide_slopes_down = false;
	slide_around_blocks = true;
	force_gravity = gravity_in_water;
		
	if (direction_input > -1 && can_move)
	{
		var _accel = accel_water;
		direction_aiming = scr_snap_dir_to_compass(direction_input);
			
		if (direction_input < 90 || direction_input > 270)
			direction_facing = 0;
		else if (direction_input > 90 && direction_input < 270)
			direction_facing = 180;
			
		if (abs(velocity[0]) < 90)
			velocity[0] += cos(degtorad(direction_aiming)) * _accel;
		if (jump_from_water_timer <= 0 && abs(velocity[1]) < 90)
			velocity[1] -= sin(degtorad(direction_aiming)) * _accel;
		
		if (!scr_check_position_for_water(r3(position[0], position[1] + sign(velocity[1]) * 8, 0))
			&& jump_from_water_timer <= 0)
		{
			velocity[1] *= 0.01;
		}
	}
	else if (can_move && scr_check_position_for_water(r3(position[0], position[1] - 8, 0)))
	{
		velocity[1] -= 5;
	}
		
	var _temp_friction = friction_water;
	if (action == 1) _temp_friction = 1;
	if (hurt_timer > 0) _temp_friction = friction_hurt;
	velocity[0] *= _temp_friction;
	if (jump_from_water_timer <= 0)
		velocity[1] *= _temp_friction;
		
	if (can_move)
	{
		if (scr_Input_Read(id_input, input_jump, 0))
		{
			if (!scr_check_position_for_water(r3(position[0], position[1] - 18, 0))
				&& id_holding == self)
			{
				play_sound(snd_gbjam12_statue_jump, 1, 0, 0.5, 1.5, 0);
				velocity[1] = -jump_force * 0.97;
				jump_from_water_timer = jump_from_water_time;
			}
		}
	}
		
	if (can_act)
	{
		if (scr_Input_Read(id_input, input_attack, 0))
		{
			if (id_holding == self)
			{
				action = 1;
				anim_frame = 0;
				play_sound(snd_enemy_dash, 1, 0, 0.25, 1.5,0.1);
				scr_effect_create_khepri_hit(position[0],position[1], -1, 0.25, depth - 5, random(5));
					
				dash_timer = dash_time;
				apply_gravity_force = false;
				axis_max_speed[0] = dash_speed;
				after_effect_active = true;
				after_effect_time = 0.075;
			
				velocity[0] = cos(degtorad(direction_aiming)) * dash_speed;
				velocity[1] = -sin(degtorad(direction_aiming)) * dash_speed;
			}
			else
			{
				if (instance_exists(id_holding))
				{
					var _x = position[0] + cos(degtorad(direction_aiming)) * 16;
					var _y = position[1] - sin(degtorad(direction_aiming)) * 16;
					var _id_new_ball = instance_create_depth(position[0],position[1], id_holding.depth, obj_khep_ball);
					
					_id_new_ball.movement_enabled = true;
					_id_new_ball.apply_gravity_force = false;
					_id_new_ball.slide_slopes_up = false;
					_id_new_ball.slide_slopes_down = false;
					_id_new_ball.dont_walk_off_cliffs = false;
					_id_new_ball.velocity[0] = cos(degtorad(direction_aiming)) * id_holding.axis_max_speed[0] * 0.66;
					_id_new_ball.velocity[1] = -sin(degtorad(direction_aiming)) * id_holding.axis_max_speed[0] * 0.66;
					_id_new_ball.after_effect_active = true;
					_id_new_ball.after_effect_time = 0.05;
					_id_new_ball.sparkle_index = spr_effect_sparkle_small_outlined;
					_id_new_ball.sparkle_time = 0.05;
					_id_new_ball.mask_index = spr_khep_en_ball_01;
					
					play_sound(snd_boom_01, 1, 0, 0.25, 0.8,0.1);
					scr_effect_create_khepri_hit(_x,_y, spr_effect_hit_01, 0.25, depth - 5, random(5));
					
					kick_timer = kick_time;
					instance_destroy(id_holding);
				}
				id_holding = self;
			}
		}
	}
}