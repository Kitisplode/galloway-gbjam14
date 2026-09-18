/// @description Insert description here
// You can write your code in this editor
if (!paused)
{
	if (!boom)
	{
		var _corners = _scr_tilemap_find_corner_cells(position, -1);
		_scr_gbj14_Destroy_Tilemap_Area(_corners, "tilemap_stone");
		_scr_gbj14_Destroy_Tilemap_Area(_corners, "tilemap_dirt");
		boom = true;
	}
}

event_inherited();