function scr_vt_add_part(_list, _spr, _speed, _x,_y,_z, _sx=1,_sy=1, _rx=0,_ry=0,_rz=0, _rot_lock=false)
{
	var _id_part = instance_create_depth(_x,_y, depth - 1, obj_vt_part);
	_id_part.rot_lock = _rot_lock;
	_id_part.rotation = r3(_rx,_ry,_rz);
	_id_part.z = _z;
	_id_part.position[2] = _z;
	_id_part.sprite_index = _spr;
	_id_part.anim_speed = _speed;
	_id_part.image_xscale = _sx;
	_id_part.image_yscale = _sy;
	
	ds_list_add(_list, _id_part);
	return _id_part;
}