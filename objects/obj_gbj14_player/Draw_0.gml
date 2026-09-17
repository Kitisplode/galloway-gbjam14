/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (ds_list_size(list_items) > 0 && can_act)
{
	var _item = ds_list_find_value(list_items, 0);
	var _script = asset_get_index(_item.show_cursor);
	if (script_exists(_script))
	{
		var _pos = script_execute(_script);
		draw_sprite(spr_gbj14_player_cursor,0, floor(_pos[0] / 16) * 16,floor(_pos[1] / 16) * 16);
	}
}