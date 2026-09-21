/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (!ready)
	{
		var _ready_count = 0;
		for (var _i = 0; _i < 3; _i++)
		{
			if (treasure_spot[_i].ready) _ready_count++;
		}
		if (_ready_count >= 3) ready = true;
	}
}

// Inherit the parent event
event_inherited();

