/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (tilemap == -1)
{
	tilemap = layer_tilemap_get_id(layer_get_id(layer_name));
}