/// @description step processor

//if (keyboard_check_pressed(ord("C"))) scr_transition_fade_to_color(room_to_skip);
if (input_check_pressed(skip_input) && skip_to > step)
{
	// Remove the steps remaining between the current step and skip to step.
	while (step < skip_to)
	{
		step++;
		ds_queue_dequeue(queue_steps);
	}
	// Remove all existent sprites and text.
	while (ds_map_size(map_sprites) > 0)
	{
		var _key = ds_map_find_first(map_sprites);
		if (is_undefined(_key)) break;
		var _id = ds_map_find_value(map_sprites, _key);
		if (instance_exists(_id))
			instance_destroy(_id);
		ds_map_delete(map_sprites, _key);
	}
	// Perform the skip to steps.
	while (ds_queue_size(queue_steps_skip) > 0)
	{
		var _step = ds_queue_dequeue(queue_steps_skip);
		scr_scene_Process_Step(_step.verb, _step);
	}
	wait_timer = 0;
}

// If we can continue, count down the timer.
if (ready_to_continue) wait_timer -= 1 / game_get_speed(gamespeed_fps);
// Otherwise, use the current step action to determine if we can continue now.
else
{
	switch(action)
	{
		case "text_vn":
		{
			if (!instance_exists(action_id)) ready_to_continue = true;
			break;
		}
		case "pause_for_input":
		{
			if (is_undefined(expected_input)) ready_to_continue = true;
			else if (input_check_pressed(expected_input)) ready_to_continue = true;
			break;
		}
		default:
		{
			ready_to_continue = true;
		}
	}
}

if (ready_to_continue && wait_timer < 0)
{
	ready_to_continue = false;
	// Grab the next step from the queue.
	var _next_step = ds_queue_dequeue(queue_steps);
	// If we don't have a next step, just die i guess
	if (is_undefined(_next_step))
	{
		instance_destroy();
		exit;
	}
	step++;
	wait_timer = _next_step.wait_after;
	action = _next_step.verb;
	scr_scene_Process_Step(action, _next_step);
}