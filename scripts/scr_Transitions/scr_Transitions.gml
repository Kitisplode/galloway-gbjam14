// Scripts that start transitions.
function scr_transition_instant(_target_room)
{
	if (_target_room < 0) _target_room = room;
	var transition_ID = instance_create_depth(0,0, OBJECT_DEPTHS.TRANSITION, par_transition);
	if (instance_exists(transition_ID))
		transition_ID.target_room = _target_room;
	else
		transition_ID = -1;
	return transition_ID;
}

function scr_transition_fade_to_color(_target_room,
									  _fade_time = 0.25,
									  _fade_color = c_black,
								  	  _pause = TRANSITION_PAUSE.BOTH,
								  	  _start_sound = -1,
									  _end_sound = -1,
									  _start_timer = 0)
{
	if (_target_room < 0) _target_room = room;
	var transition_ID = instance_create_depth(0,0, OBJECT_DEPTHS.TRANSITION, obj_transition_fade);
	if (instance_exists(transition_ID))
	{
		transition_ID.target_room = _target_room;
		transition_ID.fade_time = _fade_time;
		transition_ID.fade_color = _fade_color;
		transition_ID.pause_during_transition = _pause;
		transition_ID.sound_end_room = _start_sound;
		transition_ID.sound_start_room = _end_sound;
		transition_ID.start_timer = _start_timer;
	}
	else
		transition_ID = -1;
	return transition_ID;
}

// used to transition back into the same room, for infinite wrapping
function scr_transition_wrap(_target_x)
{
    var _t = instance_create_depth(0, 0, OBJECT_DEPTHS.TRANSITION, obj_transition_fade);
    _t.wrap_target_x = _target_x;
	_t.switch_action = method(_t, function()
	{
	    with (obj_gbj14_player)
	    {
	        var _dx = other.wrap_target_x - position[0];

	        position[0] = other.wrap_target_x; // the authoritative coordinate
	        x = position[0];                   // keep the mirror in sync immediately
	        xprevious = x;                     // no giant one-frame delta

	        // Keep the hurt-respawn point on THIS side of the map, otherwise
	        // taking damage later warps you back across the world.
	        r2_clone(position, last_safe_position);

	        var _cam_dx = _dx;
	        with (obj_camera)
	        {
	            x += _cam_dx;
	            target_x += _cam_dx;
	            camera_set_view_pos(cam, x, y);
	        }
	    }
	});
}

function scr_transition_respawn(_target_x, _target_y, _color=c_white, _fade_time = 1)
{
	var _t = instance_create_depth(0,0, OBJECT_DEPTHS.TRANSITION, obj_transition_fade);
	_t.fade_color = _color;
	_t.fade_time = _fade_time;
	_t.warp_target_x = _target_x;
	_t.warp_target_y = _target_y;
	_t.switch_action = method(_t, function()
	{
		if (!instance_exists(obj_gbj14_player))
		{
			var _player = instance_create_depth(warp_target_x, warp_target_y, OBJECT_DEPTHS.PLAYER, obj_gbj14_player);
			obj_camera.follow = _player;
		}
		with (obj_gbj14_player)
		{
			invuln_timer = invuln_time;
	        var _dx = other.warp_target_x - position[0];
	        var _dy = other.warp_target_y - position[1];
			
			position[0] = other.warp_target_x;
			position[1] = other.warp_target_y;
			x = position[0];
			y = position[1];
			xprevious = x;
			yprevious = y;
	        r2_clone(position, last_safe_position);
			
			var _cam_dx = _dx;
			var _cam_dy = _dy;
	        with (obj_camera)
	        {
	            x += _cam_dx;
	            target_x += _cam_dx;
	            y += _cam_dy;
	            target_y += _cam_dy;
	            camera_set_view_pos(cam, x, y);
	        }
		}
		if (instance_exists(obj_gbj14_player_corpse))
		{
			instance_destroy(obj_gbj14_player_corpse);
		}
	});
}