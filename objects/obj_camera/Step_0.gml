/// @description Update camera

// Update target
if (instance_exists(follow))
{
	// Keep the target point aligned with the player for now. This is separate
	// from the camera position so the camera can ease toward it.
	var _focus_target_x = 0;
	var _input_right = input_check("right");
	var _input_left = input_check("left");
	if (_input_right && !_input_left)
		_focus_target_x = camera_focus_distance;
	else if (_input_left && !_input_right)
		_focus_target_x = -camera_focus_distance;

	camera_focus_x = lerp(camera_focus_x, _focus_target_x, camera_focus_lerp_amount);
	var _focus_target_y = 0;
	if (follow.object_index == obj_gbj14_player && follow.velocity[1] > 0)
		_focus_target_y = camera_fall_focus_distance;
	camera_focus_y = lerp(camera_focus_y, _focus_target_y, camera_vertical_focus_lerp_amount);

	target_x = follow.x + offset_x + camera_focus_x;
	target_y = follow.y + offset_y + camera_vertical_offset + camera_focus_y;
}
else
{
	if (instance_exists(obj_base_player))
	{
		follow = obj_base_player;
	}
	else
	{
		target_x = x + view_width_half;
		target_y = y + view_height_half + camera_vertical_offset;
	}
}

// Convert the target point into the camera's top-left position, then move
// toward it with a tight, responsive interpolation.
var _target_camera_x = target_x - view_width_half;
var _target_camera_y = target_y - view_height_half;

// Keep camera center inside room
if (stay_in_room)
{
	if (instance_exists(global.active_room))
	{
		_target_camera_x = clamp(_target_camera_x,
			global.active_room.bbox_left - TILE_SIZE, 
			global.active_room.bbox_right + TILE_SIZE - view_width_half*2);
		_target_camera_y = clamp(_target_camera_y,
			global.active_room.bbox_top - TILE_SIZE, 
			global.active_room.bbox_bottom + TILE_SIZE - view_height_half*2);
	}
}

x = lerp(x, _target_camera_x, camera_lerp_amount);
y = lerp(y, _target_camera_y, camera_vertical_lerp_amount);

// Keep the interpolated camera inside the room as well, including when the
// room or active region changes while the camera is still catching up.
if (stay_in_room && instance_exists(global.active_room))
{
	x = clamp(x,
		global.active_room.bbox_left - TILE_SIZE,
		global.active_room.bbox_right + TILE_SIZE - view_width_half*2);
	y = clamp(y,
		global.active_room.bbox_top - TILE_SIZE,
		global.active_room.bbox_bottom + TILE_SIZE - view_height_half*2);
}

// Update screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Set camera position
if (!instance_exists(obj_base_player) && !instance_exists(obj_player_spawner))
{
	camera_set_view_pos(cam, x,y);
}
else if (!instance_exists(par_transition))
{
	if (stay_in_room)
	{
		//var _pos = r2(lerp(camera_get_view_x(cam),x,0.2), lerp(camera_get_view_y(cam),y,0.2));
		camera_set_view_pos(cam, x,y);
		//camera_set_view_pos(cam, 
		//	(lerp(camera_get_view_x(cam),x,0.1)), 
		//	(lerp(camera_get_view_y(cam),y,0.1)));
	}
	else
		camera_set_view_pos(cam, x,y);
}
else
{
	cam = view_camera[0];
	camera_set_view_pos(cam, x,y);
}

//x = round(x);
//y = round(y);
