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

// The treasure, its boss core and its boss are all placed in the map by
// hand. The core finds the nearest treasure of its type on its first step
// and links up (setting boss_id here to itself).
boss_id = noone;
