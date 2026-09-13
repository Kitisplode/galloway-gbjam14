// Additional methods added to the GMLinear extension r3 vectors.

///@func r3_constrain(v1, r, <vout>)
///@arg {r3} v1 The first 3D vector.
///@arg {Real} r The amount to constrain by.
///@arg {r3} <vout> (Optional) The output 3D vector to overwrite. If unspecified, return a new vector.
///@desc Return 3D vector constrained by r.
function r3_constrain(_v1, r, vout=[0, 0, 0])
{
	return r3_scale(r3_unit(_v1), r, vout);
}

function r3_get_fractional(_v1, vout=[0, 0, 0])
{
	vout[0] = scr_Get_Smart_Floor_Remainder(_v1[0]);
	vout[1] = scr_Get_Smart_Floor_Remainder(_v1[1]);
	vout[2] = scr_Get_Smart_Floor_Remainder(_v1[2]);
	return vout;
}

///@desc Returns the angle between v1 and v2 in radians.
function r3_get_angle_between(_v1, _v2)
{
	if (r3_norm(_v1) == 0 || r3_norm(_v2) == 0) return undefined;
	return arccos(r3_dot(_v1,_v2) / (r3_norm(_v1) * r3_norm(_v2)))
}

function r3_get_angle_2d(_v1)
{
	if (r3_norm(_v1) == 0) return undefined;
	return point_direction(0,0, _v1[0], _v1[1]);
	//return r3_get_angle_between(_v1, [1,0,0]);
}

function r3_get_angle_between_2d(_v1, _v2)
{
	if (r3_norm(_v1) == 0 || r3_norm(_v2) == 0) return undefined;
	var _angle_1 = r3_get_angle_2d(_v1);
	var _angle_2 = r3_get_angle_2d(_v2);
	return _angle_1 - _angle_2;
}

function r3_equals(_v1, _v2)
{
	return _v1[0] == _v2[0] && _v1[1] == _v2[1] && _v1[2] == _v2[2];
}

function r3_reflection(_v, _normal)
{
	return r3_subtract(_v, r3_scale(r3_unit(_normal), 2 * r3_dot(_v, r3_unit(_normal))));
}

function r3_parallel(_v1, _v2)
{
	return abs(r3_norm(r3_cross(_v1, _v2))) <= 0.001;
}

function r3_perpendicular(_v1, _v2)
{
	return r3_dot(_v1, _v2) == 0;
}

function r3_get_total(_v1)
{
	return abs(_v1[0]) + abs(_v1[1]) + abs(_v1[2]);
}

function r3_rotate(_v1, _angle, _vout=[0, 0, 0])
{
	var _temp_angle = degtorad(-_angle);
	var _v1_0 = _v1[0] * cos(_temp_angle) - _v1[1] * sin(_temp_angle);
	var _v1_1 = _v1[0] * sin(_temp_angle) - _v1[1] * cos(_temp_angle);
	_vout[@0] = _v1_0;
	_vout[@1] = _v1_1;
	return _vout;
}

function r3_zero_out(_vout=[0,0,0])
{
	_vout[@0] = 0;
	_vout[@1] = 0;
	_vout[@2] = 0;
	return _vout;
}

function tri_r3_translate(_tri, _v, _tri_out=[[0,0,0],[0,0,0],[0,0,0]])
{
	r3_add(_tri[0], _v, _tri_out[0]);
	r3_add(_tri[1], _v, _tri_out[1]);
	r3_add(_tri[2], _v, _tri_out[2]);
	return _tri_out;
}

function r3_matrix_multiply(_v, _m)
{
	var _v1_4 = r4(_v[0], _v[1], _v[2], 0);
	
	var a00 = _m[00];
	var a01 = _m[04];
	var a02 = _m[08];
	var a03 = _m[12];
	var a10 = _m[01];
	var a11 = _m[05];
	var a12 = _m[09];
	var a13 = _m[13];
	var a20 = _m[02];
	var a21 = _m[06];
	var a22 = _m[10];
	var a23 = _m[14];
	var a30 = _m[03];
	var a31 = _m[07];
	var a32 = _m[11];
	var a33 = _m[15];
	var b0 = _v1_4[0];
	var b1 = _v1_4[1];
	var b2 = _v1_4[2];
	var b3 = _v1_4[3];
	return r4(a00*b0 + a01*b1 + a02*b2 + a03*b3,
			  a10*b0 + a11*b1 + a12*b2 + a13*b3,
			  a20*b0 + a21*b1 + a22*b2 + a23*b3,
			  a30*b0 + a31*b1 + a32*b2 + a33*b3);
}