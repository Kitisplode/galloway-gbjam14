/// @description Insert description here
// You can write your code in this editor

depth = OBJECT_DEPTHS.HUD;

// Reset the ending flag whenever the gamemode (re)starts.
global.gbj14_ending = false;

// Inherit the parent event
event_inherited();

paused_alpha = 0;

death_alpha = 0;