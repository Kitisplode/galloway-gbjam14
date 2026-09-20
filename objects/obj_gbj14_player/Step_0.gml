/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (global.player_hp <= 0 && hurt_timer <= 0 && is_on_ground)
	{
		//var _temp_id = instance_create_depth(x,y, depth, obj_gbjam12_player_dead);
		//_temp_id.sprite_index = sprite_index;
		//_temp_id.image_xscale = image_xscale;
		//_temp_id.image_angle = image_angle;
		//scr_transition_fade_to_color(rm_gbjam_gameover, 1);
		instance_destroy();
		exit;
	}
	
	if (hurt_timer <= 0 && is_on_ground && is_on_ground_previous)
	{
		r2_clone(position, last_safe_position);
	}
	
	if (action == -1)
	{
		if (!place_meeting(position[0],position[1], obj_block_ladder))
		{
			action = 0;
		}
	}
	
	// While hurt, the player cannot move.
	if (hurt_timer > 0 || global.player_hp <= 0)
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
		// Lifting an item
		if (action == 1)
		{
			can_move = false;
			can_act = false;
		}
	}

	// Keep a short jump window after leaving the ground so jumps do not
	// require pixel-perfect timing at an edge.
	if (is_on_ground)
		jump_coyote_timer = jump_coyote_time;
	else
		jump_coyote_timer = max(0, jump_coyote_timer - scr_get_tick_length());
	
	// Update the input.
	direction_input = id_input.direction_input;
	var _horizontal_input = can_move && (input_check("left") || input_check("right"));

	// Remember a recent jump press briefly so landing does not require
	// frame-perfect input timing.
	if (jump_buffer_timer > 0)
		jump_buffer_timer = max(0, jump_buffer_timer - scr_get_tick_length());
	if (can_move && scr_Input_Read(id_input, input_jump, 0))
		jump_buffer_timer = jump_buffer_time;

	// Use the input to move.
	if (direction_input > -1 && can_move)
	{
		if (action > -1)
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
			var _accel = accel_run;
		
			if (direction_input > 0 && direction_input < 180)
				velocity[1] -= _accel;
			else if (direction_input > 180)
				velocity[1] += _accel;
			
		}
	}
	// Apply friction only when there is no horizontal input. When the player
	// holds the opposite direction, acceleration will brake the player first
	// and then move them back in the new direction.
	if (is_on_ground && !_horizontal_input)
	{
		var _temp_friction = friction_ground;
		if (action == 1) _temp_friction = 1;
		if (hurt_timer > 0) _temp_friction = friction_hurt;
		velocity[0] *= _temp_friction;
	}
	if (action <= -1)
	{
		velocity[1] *= friction_ground;
	}
	
	if (can_move)
	{
		if (action > -1)
		{
			// Fall through one way platforms when tapping down.
			if (input_check_pressed("down") && is_on_ground)
			{
				fall_through_oneway_timer = fall_through_oneway_time;
			}
			// Jump!
			if (jump_buffer_timer > 0)
			{
				if (jump_coyote_timer > 0)
				{
					play_sound(snd_gbj14_player_jump, 1, 0, 1, 1, 0);
					velocity[1] = -jump_force * 0.97;
					jump_coyote_timer = 0;
					jump_buffer_timer = 0;
				}
			}
			// When the player releases jump while jumping upwards, stop them and start falling.
			if (input_check_released(input_jump) && !is_on_ground && velocity[1] < -30)
			{
				velocity[1] *= 0.3;
			}
		}
		else
		{
			// Jump!
			if (jump_buffer_timer > 0)
			{
				action = 0;
				play_sound(snd_gbj14_player_jump, 1, 0, 1, 1, 0);
				velocity[1] = -jump_force * 0.97;
				jump_buffer_timer = 0;
			}
			else if (input_check_pressed("left") || input_check_pressed("right"))
			{
				action = 0;
			}
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
					var _result = script_execute(_script);
					if (_item.uses > 0 && _result)
					{
						_item.uses -= 1;
						if (_item.uses <= 0) ds_list_delete(list_items, 0);
					}
					else if (_item.name == "Throw")
					{
						ds_list_delete(list_items, 0);
					}
				}
			}
		}
		
		// If the player is colliding with a ladder and they press up or down, grab onto the ladder.
		if (action != -1 && carry_id == id)
		{
			var _ladder = instance_place(position[0],position[1], obj_block_ladder);
			if (instance_exists(_ladder) && (input_check("down") || input_check("up")))
			{
				position[0] = _ladder.position[0];
				x = position[0];
				velocity[0] = 0;
				velocity[1] = 0;
				action = -1;
			}
		}
		
		// Change the active item to Throw when we are carrying an item.
		if (carry_id != id)
		{
			if (instance_exists(carry_id))
			{
				if (ds_list_size(list_items) > 0)
				{
					var _item = ds_list_find_value(list_items, 0);
					if (_item.name != "Throw")
					{
						ds_list_insert(list_items, 0, item_throw);
					}
				}
			}
			// If the item being carried is gone suddenly, get rid of the throw item.
			else
			{
				carry_id = id;
				if (ds_list_size(list_items) > 0)
				{
					var _item = ds_list_find_value(list_items, 0);
					if (_item.name == "Throw")
					{
						ds_list_delete(list_items, 0);
					}
				}
			}
		}
	
		// Allow the player to cycle through items.
		if (scr_Input_Read(id_input, input_swap, 0) && carry_id == id)
		{
			scr_gbj14_player_Scroll_Item();
		}
	}
}

// Use stronger gravity once the player starts falling.
if (velocity[1] > 0)
{
	force_gravity = gravity_force * fall_gravity_multiplier;
	axis_max_speed[1] = max_fall_speed;
}
else
{
	force_gravity = gravity_force;
	// Keep the upward limit high so the fall cap does not shorten jumps.
	axis_max_speed[1] = 1200;
}

// Inherit the parent event
event_inherited();

if (direction_input > -1 || input_check(["a","b"]))
{
	idle_animation_timer = 0;
}
else if (idle_animation_timer < idle_animation_time)
	idle_animation_timer += scr_get_tick_length();

// If we're holding a block, adjust its position according to the current animation frame.
if (carry_id != id)
{
	if (instance_exists(carry_id))
	{
		var _dir = cos(degtorad(direction_facing));
		var _pos = r2(_dir * 4,-29);
		if (sprite_index == spr_gbj14_player_lift)
		{
			switch (floor(anim_frame))
			{
				case 0: _pos[0] = _dir * 20; _pos[1] = 0; break;
				case 1: _pos[0] = _dir * 20; _pos[1] = -1; break;
				case 2: _pos[0] = _dir * 19; _pos[1] = -3; break;
				case 3: _pos[0] = _dir * 18; _pos[1] = -31; break;
				case 4: _pos[0] = _dir * 16; _pos[1] = -35; break;
				case 5: _pos[0] = _dir * 14; _pos[1] = -37; break;
				case 6: _pos[0] = _dir * 12; _pos[1] = -40; break;
				case 7: _pos[0] = _dir * 10; _pos[1] = -40; break;
				case 8: _pos[0] = _dir * 7; _pos[1] = -36; break;
				case 9: _pos[0] = _dir * 4; _pos[1] = -29; break;
			}
		}
		// The bug's sprite origin is at its feet. As it rotates onto its
		// back, compensate vertically so the artwork stays on the player's
		// back instead of swinging down through the player's head.
		if (carry_id.object_index == obj_gbj14_enemy_shuffle)
		{
			var _rotation_offset = sprite_get_height(carry_id.sprite_index) * 0.5
				* (cos(degtorad(carry_id.carry_visual_angle)) - 1);
			_pos[1] += _rotation_offset;
		}
		carry_id.dom_offset_x = _pos[0];
		carry_id.dom_offset_y = _pos[1];
	}
	else
		carry_id = id;
}
