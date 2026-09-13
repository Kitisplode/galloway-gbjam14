/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _state_previous = state;
var _value = ds_map_find_value(global.map_switches, switch_name);
if (!is_undefined(_value))
{
	if (_value) state = 1;
	else state = 0;
}

if (_state_previous != state)
{
	unlock_timer = unlock_time;
}

if (unlock_timer > 0)
{
	unlock_timer -= scr_get_tick_length();
	if (unlock_timer <= 0)
	{
		if (audio_exists(unlock_sound)) 
			play_sound(unlock_sound, 1, 0, 0.5, 1,0);
	}
}
else
{
	if (state == 1)
	{
		visible = false;
		mask_index = msk_no_collision;
	}
	else
	{
		visible = true;
		mask_index = sprite_index;
	}
}