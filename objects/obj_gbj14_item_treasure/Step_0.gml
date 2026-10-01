// Inherit the parent event
event_inherited();

if (!moved)
{
	if (is_undefined(spawn_x) && is_undefined(spawn_y))
	{
		spawn_x = x;
		spawn_y = y;
	}
	else if (spawn_x != x)
	{
		moved = true;
	}
}
