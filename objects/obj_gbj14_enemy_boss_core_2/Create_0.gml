/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

obeys_room = false;

movement_collision = false;

// The core is an invisible anchor the boss hovers around; it must never be
// hittable by attacks nor hurt the player by contact.
mask_index = msk_no_collision;
// With no collision mask the core cannot resolve a room region anyway, and
// it must never be region-hidden separately from its boss.
obeys_room = false;

// The boss and treasure this core links to are placed in the map by hand.
// The child cores set these to their specific god's objects; the actual
// linking happens on the first step (see Step), once all room instances
// exist regardless of creation order.
boss_object = obj_gbj14_enemy_boss_real;
treasure_object = obj_gbj14_item_treasure;
boss_id = noone;
linked = false;

// How far above the treasure the boss hovers. The god head sprites have
// their origin at the bottom (they hang 38px ABOVE this point), and the
// GameBoy view only shows ~96px above the player, so keep this small or
// the boss floats just off the top of the screen.
hover_height = 48;

// Rest where the designer placed the core until a treasure is linked.
target_pos = r2(x, y);
chase_id = id;
dom_distance = 0;
dom_distance_target = 64;