/// @description Insert description here
// You can write your code in this editor

depth = OBJECT_DEPTHS.HUD;

// Reset the ending flag whenever the gamemode (re)starts.
global.gbj14_ending = false;
// Full-screen white flash alpha (set to 1 by events like the gate opening).
global.gbj14_flash = 0;
// Set once the three treasures have been returned and the gate opened.
global.gbj14_gate_opened = false;

// Inherit the parent event
event_inherited();

paused_alpha = 0;

death_alpha = 0;