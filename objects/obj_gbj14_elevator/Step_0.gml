/// @description Insert description here
// You can write your code in this editor

// First step: if the room has no hand-placed deposit spots, create the
// default three on the slab surface (collision strip at y+48..y+63).
if (!spots_checked)
{
	spots_checked = true;
	if (!instance_exists(obj_gbj14_treasure_spot))
	{
		var _spot_y = y + 40;
		var _xs = [x + 64, x + 128, x + 192];
		for (var _i = 0; _i < 3; _i++)
		{
			var _spot = instance_create_depth(_xs[_i], _spot_y, depth, obj_gbj14_treasure_spot);
			_spot.image_xscale = 2; // 32x48 deposit area
			_spot.image_yscale = 3;
		}
	}
}

// Inherit the parent event
event_inherited();
