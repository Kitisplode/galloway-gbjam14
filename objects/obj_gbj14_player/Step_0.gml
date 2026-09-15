/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	// While hurt, the player cannot move.
	if (hurt_timer > 0)
	{
		hurt_timer -= scr_get_tick_length();
		can_act = false;
		can_move = false;
		apply_gravity_force = true;
		axis_max_speed[0] = run_speed;
		after_effect_active = false;
	}
	else
	{
		// Standard state
		if (action == 0)
		{
			can_act = true;
			can_move = true;
			apply_gravity_force = true;
			axis_max_speed[0] = run_speed;
			after_effect_active = false;
		}
		// On a ladder
		if (action == -1)
		{
			can_act = false;
			apply_gravity_force = false;
		}
	}
	
	// Update the input.
	direction_input = id_input.direction_input;
	// Use the input to move.
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
	// Apply friction if we're on the ground
	if (is_on_ground)
	{
		var _temp_friction = friction_ground;
		if (action == 1) _temp_friction = 1;
		if (hurt_timer > 0) _temp_friction = friction_hurt;
		velocity[0] *= _temp_friction;
	}
	
	if (can_move)
	{
		// Fall through one way platforms when tapping down.
		if (input_check_pressed("down") && is_on_ground)
		{
			fall_through_oneway_timer = fall_through_oneway_time;
		}
		// Jump!
		if (scr_Input_Read(id_input, input_jump, 0))
		{
			if (is_on_ground)
			{
				play_sound(snd_gbj14_player_jump, 1, 0, 1, 1, 0);
				velocity[1] = -jump_force * 0.97;
			}
		}
		//// If jump is still held while falling, slow down our fall.
		//if (input_check(input_jump) && !is_on_ground && velocity[1] > 0)
		//{
		//	velocity[1] *= 0.90;
		//}
		// When the player releases jump while jumping upwards, stop them and start falling.
		if (input_check_released(input_jump) && !is_on_ground && velocity[1] < -30)
		{
			velocity[1] = -30;
		}
	}
	
	if (can_act)
	{
		if (scr_Input_Read(id_input, input_attack, 0))
		{
			// Perform the action of the current item.
			if (ds_list_size(list_items) > 0)
			{
				var _item = ds_list_find_value(list_items, 0);
				var _script = asset_get_index(_item.script);
				if (script_exists(_script))
				{
					script_execute(_script);
					if (_item.uses > 0)
					{
						_item.uses -= 1;
						if (_item.uses <= 0) ds_list_delete(list_items, 0);
					}
					if (audio_exists(_item.sound))
					{
						play_sound(_item.sound, 1, 0, 1,1,0.1);
					}
				}
			}
		}
	}
	
	if (scr_Input_Read(id_input, input_swap, 0))
	{
		scr_gbj14_player_Scroll_Item();
	}
}

// Inherit the parent event
event_inherited();

