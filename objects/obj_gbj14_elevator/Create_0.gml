/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

movement_collision = false;

treasure_spot[0] = instance_create_depth(x + 64, y + 24, depth, obj_gbj14_treasure_spot);
treasure_spot[1] = instance_create_depth(x + 129, y + 24, depth, obj_gbj14_treasure_spot);
treasure_spot[2] = instance_create_depth(x + 193, y + 24, depth, obj_gbj14_treasure_spot);

for (var _i = 0; _i < 3; _i++)
{
	treasure_spot[_i].dom_id = id;
	treasure_spot[_i].dom_offset_x = treasure_spot[_i].x - x;
	treasure_spot[_i].dom_offset_y = treasure_spot[_i].y - y;
}

ready = false;