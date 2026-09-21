/// @description Insert description here
// You can write your code in this editor
if (!paused)
{
	if (place_meeting(x,y, obj_gbj14_item_treasure))
	{
		var _treasure = instance_nearest(x,y, obj_gbj14_item_treasure);
		var _new_treasure = instance_create_depth(x, y - 8, OBJECT_DEPTHS.PLAYER + 10, par_animation);
		_new_treasure.sprite_index = _treasure.sprite_index;
		_new_treasure.sparkle_index = spr_gbj14_fx_sparkle;
		_new_treasure.sparkle_anim_speed = 0.15;
		
		instance_destroy(_treasure);
	}
}