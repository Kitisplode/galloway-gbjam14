/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

movement_collision = false;

boss_id = instance_create_depth(x,y, depth, obj_gbj14_enemy_boss_real);
boss_id.dom_id = id;

target_pos = r2_zero();
chase_id = id;
dom_distance = 0;
dom_distance_target = 64;