/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

outline_thickness = 1;
outline_color = c_white;

sparkle_index = spr_gbj14_fx_sparkle;
sparkle_anim_speed = 0.15;

pushes_others = false;

solid = false;
normal_vector = r3(0,-1,0);

// obj_block hides all level blocks at create (visible = global.debug_show_level_blocks),
// but the treasure is a visible pushable item, so turn drawing back on.
visible = true;

// Spawns the boss core that guards this treasure. The child treasures call
// this with their specific core object instead of the generic one.
spawn_boss_core = function(_core_object)
{
	boss_id = instance_create_depth(x, y - 80, OBJECT_DEPTHS.ENEMY, _core_object);
	boss_id.chase_id = id;
}
if (object_index == obj_gbj14_item_treasure)
	spawn_boss_core(obj_gbj14_enemy_boss_core_2);