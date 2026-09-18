function draw_bitmap_text(_font, _x, _y, _text, _width)
{
    var _start_x = _x;
    var _line_height = 8;

    var _words = string_split(_text, " ");
    var _line = "";

    for (var i = 0; i < array_length(_words); ++i)
    {
        var _word = _words[i];
        var _test = (_line == "") ? _word : _line + " " + _word;

        if (string_length(_test) * 8 > _width && _line != "")
        {
            draw_bitmap_text_line(_font, _start_x, _y, _line);
            _line = _word;
            _y += _line_height;
        }
        else
        {
            _line = _test;
        }
    }

    if (_line != "")
        draw_bitmap_text_line(_font, _start_x, _y, _line);
}

function draw_bitmap_text_line(_font, _x, _y, _text)
{
    for (var i = 1; i <= string_length(_text); ++i)
    {
        var c = ord(string_char_at(_text, i));

        var sx = (c mod 16) * 8;
        var sy = (c div 16) * 8;

        draw_sprite_part(
            _font, 0,
            sx, sy, 8, 8,
            _x, _y);

        _x += 8;
    }
}