/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

movement_collision = false;
apply_gravity_force = false;

creator_ID = -1;

hp = 1;
damage = 1;
piercing = false;

death_effect = -1;

dies_offscreen = true;
dying = false;

hits_only_once = false;
list_hits = ds_list_create();

sound_dead = -1;
sound_volume = 1;
sound_pitch = 1;
