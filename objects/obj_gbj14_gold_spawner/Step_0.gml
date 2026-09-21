/// @description Insert description here
// You can write your code in this editor
if (!paused)
{
	spawn_timer -= scr_get_tick_length();
	if (spawn_timer <= 0)
	{
		var _index = obj_gbj14_item_gold;
		var _value = 1;
		if (spawn_count >= 2) { if (random_range(0,100) < 50) { _index = obj_gbj14_item_gold_large; _value = 2; } }
		if (spawn_count >= 5) { if (random_range(0,100) < 50) { _index = obj_gbj14_item_gold_coin;  _value = 5; } }
		var _gold = instance_create_depth(position[0],position[1], depth, _index);
		if (instance_exists(_gold))
		{
			_gold.velocity[0] = random_range(-100, 100);
			_gold.velocity[1] = -random_range(150, 200);
			_gold.movement_enabled = true;
			_gold.apply_gravity_force = true;
		}
		spawn_timer = spawn_time;
		spawn_count -= _value;
		if (spawn_count <= 0) instance_destroy();
	}
}

event_inherited();