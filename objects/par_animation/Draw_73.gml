/// @description update animation
var _paused = scr_Is_Paused(TRANSITION_PAUSE.ANIMATIONS);
if (!_paused)
{
	// Animate the sprite.
    anim_looped = 0;
    anim_frame_count = sprite_get_number(sprite_index);
    if (anim_speed != 0)
    {
		var _info = sprite_get_info(sprite_index);
		var _speed_div = 1;
		if (!is_undefined(_info.frame_info))
		{
			_speed_div = _info.frame_info[anim_frame].duration;
		}
        anim_frame_previous = anim_frame;
        anim_frame += (anim_speed / _speed_div) * global.gameplay_speed_scale;
		// See if we updated the frame now.
		if (floor(anim_frame) != floor(anim_frame_previous))
			anim_frame_updated = floor(anim_frame);
		else
			anim_frame_updated = -1;
		
		// Constrain the current frame to the number of frames in the sprite.
        if (anim_frame < 0)
        {
            anim_frame = (anim_frame_count - 1) - (abs(anim_frame) mod anim_frame_count);
            anim_looped = -1;
        }
        else if (anim_frame >= anim_frame_count)
        {
            anim_frame = anim_frame mod anim_frame_count;
            anim_looped = 1;
        }
		// If the animation looped, call the animation end method.
		if (anim_looped != 0)
		{
			if (!anim_loop)
			{
				anim_speed = 0;
				anim_frame = anim_frame_previous;
			}
			//var temp_script_ID = asset_get_index(animation_end_script);
			//if (temp_script_ID > -1)
			//{
			//	script_execute(temp_script_ID);
			//}
			//event_perform(ev_animation_end, 0);
		}
    }
	// Reduce any shake and pump applied.
	if (r3_norm(shake) < 0.1)
		shake = r3_zero();
	else
		shake = r3_lerp(shake, r3_zero(), 0.25);
	if (r3_norm(pump) < 0.1)
		pump = r3_zero();
	else
		pump = r3_lerp(pump, r3_zero(), 0.25);
}
