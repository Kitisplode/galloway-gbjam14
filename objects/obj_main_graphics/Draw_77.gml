if (shaders_on)
{
	var _window_width = view_width;
	var _window_height = view_height;
	if (window_get_height() > view_height)
	{
		view_ratio = floor(window_get_height() / view_height);
		_window_width = view_ratio * view_width;
		_window_height = view_ratio * view_height;
	}
	gpu_set_blendenable(false);
	shader_set(sh_gameboy);
	draw_surface_stretched(application_surface,
							window_get_width() / 2 - _window_width / 2,
							window_get_height() / 2 - _window_height / 2,
							_window_width, _window_height);
	shader_reset();
	gpu_set_blendenable(true);
}