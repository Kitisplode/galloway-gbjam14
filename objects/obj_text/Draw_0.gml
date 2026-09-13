/// @description Draw text
event_inherited();
var _shader_active = scr_setup_shader_outline(outline_thickness, outline_color, font_get_texture(font));
scr_text_draw();
if (_shader_active)
	shader_reset();