/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

obeys_room = false;

movement_collision = false;

// The core is an invisible anchor the boss hovers around; it must never be
// hittable by attacks nor hurt the player by contact.
mask_index = msk_no_collision;

// Spawns the boss that this core carries around. The child cores call this
// with their specific boss object instead of the generic placeholder.
spawn_boss = function(_boss_object)
{
	boss_id = instance_create_depth(x, y, depth, _boss_object);
	boss_id.dom_id = id;
}
if (object_index == obj_gbj14_enemy_boss_core_2)
	spawn_boss(obj_gbj14_enemy_boss_real);

target_pos = r2_zero();
chase_id = id;
dom_distance = 0;
dom_distance_target = 64;