
if (!initialized) exit;

var _mat = scr_get_main_camera_matrix();
matrix_set(matrix_world, _mat);

// portrait + name tag, above the box on the speaker's side
if (speaker >= 0)
{
	var _info = scr_character_info(speaker);
	if (_info != undefined)
	{
		// draw portrait
		var _has_portrait = (_info.portrait != -1 && sprite_exists(_info.portrait));
		var _ps = portrait_size;
		var _px = (_info.side == 0) ? box_x : box_x + box_w - _ps;
		var _py = box_y - _ps - 2;
		if (_has_portrait)
		{
			draw_sprite(_info.portrait, 0, _px, _py);
		}

		// draw name next to the portrait
		var _nw = string_length(_info.name) * 8;
		var _nh = 8;
		var _nx;
		var _ny = box_y - 12;
		if (!_has_portrait)       _nx = (_info.side == 0) ? box_x : box_x + box_w - _nw;
		else if (_info.side == 0) _nx = _px + _ps + 4;
		else                      _nx = _px - _nw - 4;

		draw_set_color(c_black); draw_rectangle(_nx - 2, _ny - 2, _nx + _nw, _ny + _nh, false);
		draw_set_color(c_white); draw_rectangle(_nx - 2, _ny - 2, _nx + _nw, _ny + _nh, true);
		draw_bitmap_text_line(font, _nx, _ny, _info.name);
	}
}

// Box background // TODO make actual sprite
draw_set_color(c_black);
draw_rectangle(box_x, box_y,
	box_x + box_w,
	box_y + box_h,
	false);
draw_set_color(c_white);
draw_rectangle(box_x + 1, box_y + 1,
	box_x + box_w - 2,
	box_y + box_h - 2,
	true);
draw_set_color(c_white);

// Typewriter text across the pre-wrapped lines of the current chunk
var _budget = floor(chars_visible);
var _ty = box_y + text_pad;
for (var i = 0; i < array_length(lines); ++i)
{
	if (_budget <= 0) break;
	var _line = lines[i];
	var _count = min(_budget, string_length(_line));
	draw_bitmap_text_line(font, box_x + text_pad, _ty, string_copy(_line, 1, _count));
	_budget -= _count;
	_ty += 8;
}

// Blinking A button
if (page_done && (arrow_blink mod 0.8) < 0.4)
{
	draw_bitmap_text_line(font, box_x + box_w - 12, box_y + box_h - 10, "\x14");
}

matrix_set(matrix_world, matrix_build_identity());
