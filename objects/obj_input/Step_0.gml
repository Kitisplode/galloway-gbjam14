scr_Input_Process();

direction_input = input_direction(-1, "left", "right", "up", "down");

if (mouse_available && !mouse_active && input_mouse_moved())
{
	mouse_active = true;
	mouse_position[0] = mouse_x;
	mouse_position[1] = mouse_y;
}
else if (mouse_active && (direction_input != -1 || !input_window_has_focus()))
{
	mouse_active = false;
}

if (mouse_active)
{
	window_set_cursor(cr_none);
	window_mouse_set_locked(true);
	mouse_position[0] = scr_constrain_value(mouse_position[0] + window_mouse_get_delta_x() / obj_main_graphics.view_ratio, -8, room_width+8);
	mouse_position[1] = scr_constrain_value(mouse_position[1] + window_mouse_get_delta_y() / obj_main_graphics.view_ratio, -8, room_height+8);
}
else
{
	window_set_cursor(cr_none);
	window_mouse_set_locked(false);
}