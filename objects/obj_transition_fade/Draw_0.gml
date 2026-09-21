/// @description Draw the fade as a big rectangle


var _mat = scr_get_main_camera_matrix();
matrix_set(matrix_world, _mat);

var _xport = 0;
var _yport = 0;
var _wport = window_get_width();
var _hport = window_get_height();

var _viewx = camera_get_view_x(view_get_camera(0));
var _viewy = camera_get_view_y(view_get_camera(0));

if (!view_get_visible(0))
{
	_viewx = 0;
	_viewy = 0;
}
scr_draw_rectangle_color_alpha(_viewx,_viewy, _viewx + _wport, _viewy + _hport, fade_color, image_alpha);

matrix_set(matrix_world, matrix_build_identity());