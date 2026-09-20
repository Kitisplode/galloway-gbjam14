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

boss_id = instance_create_depth(x, y -80, OBJECT_DEPTHS.ENEMY, obj_gbj14_enemy_boss_core_2);
boss_id.chase_id = id;