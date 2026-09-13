function scr_nm_en_gravity_Pull_All_Instances(_object_index, _gravity_strength, _effect_timer=0)
{
	var _i = 0;
	for (; _i < instance_number(_object_index); _i++)
	{
		var _id = instance_find(_object_index, _i);
		if (!instance_exists(_id)) continue;
		if (scr_check_off_screen(_id, 0)) continue;
		var _direction = point_direction(position[0],position[1], _id.position[0], _id.position[1]);
		_id.velocity[0] -= cos(degtorad(_direction)) * _gravity_strength;
		_id.velocity[1] += sin(degtorad(_direction)) * _gravity_strength;
		
		if (_effect_timer < 0)
		{
			var _temp_effect = instance_create_depth(_id.position[0], _id.position[1], _id.depth + 1, obj_effect_fade);
			r3_clone(r3_scale(r3_unit(r3_subtract(position, _id.position)), 100), _temp_effect.velocity);
			_temp_effect.anim_speed = 0;
			_temp_effect.sprite_index = _id.sprite_index;
			_temp_effect.anim_frame = _id.anim_frame;
		}
	}
	return _i;
}