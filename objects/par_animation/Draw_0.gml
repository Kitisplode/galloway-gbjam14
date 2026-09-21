if (draw_gui) exit;

if (view_locked)
	matrix_set(matrix_world, scr_get_main_camera_matrix());

// Adjust the y position to draw according to the current z level.
var _temp_y = position[1];
if (draw_2d_z)
{
	_temp_y = position[1] - position[2];
	depth = -position[1] * 10 -(position[2] + z_height);
	//depth = -position[1] * 100 - position[2];
}

if (image_angle_matching_visual) anim_angle = image_angle;

if (sprite_exists(sprite_index))
{
	var _shader_active = scr_setup_shader_outline(outline_thickness, outline_color, sprite_get_texture(sprite_index, anim_frame));
	
	hover_cycle += hover_cycle_speed;
	var _hover_distance = cos(degtorad(hover_cycle)) * hover_cycle_distance;
	
	draw_sprite_ext(sprite_index, anim_frame,
					position[0] + shake[0], _temp_y + shake[1] + _hover_distance,
					image_xscale + sign(image_xscale) * pump[0], image_yscale + pump[1],
					anim_angle, image_blend, image_alpha);
		
	if (_shader_active)
		shader_reset();
}

if (view_locked)
	matrix_set(matrix_world, matrix_build_identity());