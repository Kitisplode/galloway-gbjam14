function scr_nm_en_aim_c_01_step_Reaim_Shots(_steer_amount)
{
	var _object_index = obj_nm_en_aim_a_01;
	if (!instance_exists(obj_base_player)) return 0;
	var _player = obj_base_player.id;
	var _i = 0;
	for (; _i < instance_number(_object_index); _i++)
	{
		var _id = instance_find(_object_index, _i);
		if (!instance_exists(_id)) continue;
		if (scr_check_off_screen(_id, 0)) continue;
		if (_id.phase != 4 && _id.phase != -1) continue;
		var _direction = point_direction(_id.position[0], _id.position[1], _player.position[0],_player.position[1]);
		_id.velocity[0] += cos(degtorad(_direction)) * _steer_amount;
		_id.velocity[1] -= sin(degtorad(_direction)) * _steer_amount;
	}
	return _i;
}