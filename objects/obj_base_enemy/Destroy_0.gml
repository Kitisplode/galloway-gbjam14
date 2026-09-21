/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _temp_id_self = ds_list_find_index(global.list_enemies, id);
if (_temp_id_self > -1)
{
	ds_list_delete(global.list_enemies, _temp_id_self);
}

if ((hp <= 0 || global.enemy_kill_signal) && death_effect_index > -1)
{
	var _eff_id = scr_effect_create(x,y, death_effect_index, 0.5, depth - 5);
	_eff_id.image_xscale = death_effect_size;
	_eff_id.image_yscale = death_effect_size;
	if (audio_exists(sound_dead)) play_sound(sound_dead, 1, false, 1, sound_pitch,0);
}

// Drop gold on death.
if ((hp <= 0 || global.enemy_kill_signal) && gold_drop > 0)
{
	_scr_gbj14_spawn_gold(gold_drop, x, y, OBJECT_DEPTHS.PLAYER + 10);
}

if (global.enemy_kill_signal) dying = true;
if (is_boss && raises_kill_signal) global.enemy_kill_signal = true;
if (death_next_enemy_index > -1)
{
	if (hp <= 0 || debug_killed)
	{
		var _temp_id = instance_create_depth(x,y, depth, death_next_enemy_index);
		_temp_id.damage_color = damage_color;
		if (death_next_enemy_sprite == -2) _temp_id.sprite_index = sprite_index;
		else if (death_next_enemy_sprite > -1) _temp_id.sprite_index = death_next_enemy_sprite;
		_temp_id.death_next_phase = death_next_phase;
		_temp_id.enemy_type = enemy_type;
		dying = false;
	}
}

if (string_length(switch_name) > 0)
{
	ds_map_replace(global.map_switches, switch_name, true);
}
