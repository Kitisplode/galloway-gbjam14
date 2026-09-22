/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!paused)
{
	if (is_on_ground)
	{
		velocity[0] *= friction_ground;
		velocity[1] *= friction_ground;
	}
	
	bomb_timer -= scr_get_tick_length();
	if (bomb_timer <= 0)
	{
		play_sound(snd_gbj14_bomb_explosion, 2, 0, 1, 1,0.5);
		var _boom = instance_create_depth(position[0],position[1]-8, OBJECT_DEPTHS.EFFECT, obj_gbj14_proj_bomb);
		_boom.damage = damage;
		instance_destroy();
	}
	
	// bomb flashing
	var _min_interval = 2;
	var _max_interval = 30;
	var _current_interval = lerp(
		_min_interval,
		_max_interval,
		bomb_timer / bomb_timer_max);
	flash_counter += 1;
	if (flash_counter >= _current_interval)
	{
		show_flashing = !show_flashing;
		flash_counter = 0;
	}
}