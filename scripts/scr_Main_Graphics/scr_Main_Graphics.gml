function scr_Main_Graphics_add_palette(_c1=#000000,_c2=#000000,_c3=#000000,_c4=#000000)
{
	palette[palette_count] = {
		c1	: _c1,
		c2  : _c2,
		c3  : _c3,
		c4  : _c4
	}
	//palette[palette_count,0] = _c1;
	//palette[palette_count,1] = _c2;
	//palette[palette_count,2] = _c3;
	//palette[palette_count,3] = _c4;
	palette_count++;
}

function scr_get_main_camera_matrix()
{
	var _offset = r2_zero();
	if (instance_exists(obj_camera))
	{
		_offset[0] = camera_get_view_x(obj_camera.cam) + 16;
		_offset[1] = camera_get_view_y(obj_camera.cam);
	}

	return matrix_build(_offset[0],_offset[1], 0, 0,0,0, 1,1,1);
}