/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//movement_collision = false;
pushes_others = true;

// obj_block hides level blocks at create; the altar is a visible platform.
visible = true;

// The altar is the visual pedestal. The deposit spots (obj_gbj14_treasure_spot)
// can be placed by hand in the room, scaled to the size of each deposit area;
// if none exist, the altar spawns three default ones on its slab on its first
// step. The finale itself is run by the spots (see obj_gbj14_treasure_spot).
spots_checked = false;

depth = 350;
