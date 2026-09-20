
/// One parallax layer inside a zone.
/// _px/_py: parallax factors.
/// _xoff/_yoff: offset of the sprite from the zone anchor, in bg pixels.
/// _tile_h/_tile_v: whether the sprite repeats in that direction.
function BgLayer(_sprite, _px, _py, _xoff = 0, _yoff = 0, _tile_h = true, _tile_v = false) constructor
{
	sprite = _sprite;
	px     = _px;
	py     = _py;
	xoff   = _xoff;
	yoff   = _yoff;
	tile_h = _tile_h;
	tile_v = _tile_v;
}

/// One background zone.
/// _rects:  array of [x1, y1, x2, y2] rectangles (room pixels).
/// _layers: array of BgLayers, drawn in order
/// _fill:   background colour drawn behind the layers
/// _anchor_*: world point the layers are anchored to. Default is top-left
function BgZone(_rects, _layers, _fill = -1, _anchor_x = undefined, _anchor_y = undefined) constructor
{
	rects    = _rects;
	layers   = _layers;
	fill     = _fill;
	anchor_x = _anchor_x ?? _rects[0][0];
	anchor_y = _anchor_y ?? _rects[0][1];
}

function scr_bg_zones_init()
{
	global.bg_zones = [

		new BgZone([
				[   0,    0, 5600, 1500],
			],
			[
				new BgLayer(spr_gbj14_bg_pyramid_1, 0.02, 0.005),
				new BgLayer(spr_gbj14_bg_pyramid_2, 0.08, 0.025),
				new BgLayer(spr_gbj14_bg_pyramid_3, 0.14, 0.050),
			],
			c_white
		),

		new BgZone([
				[2064, 1200, 4170, 1700],
				[1680, 1440, 2848, 1888],
				[2768,  480, 3472,  720],
				[2976,  272, 3264,  608],
			],
			[
				new BgLayer(spr_gbj14_bg_pillars_1, 0.05, 0.01),
				new BgLayer(spr_gbj14_bg_pillars_2, 0.10, 0.05),
				new BgLayer(spr_gbj14_bg_pillars_3, 0.20, 0.10),
			],
			c_black
		),

		new BgZone([
				[4000, 1600, 5600, 3200],
				[1200, 1888, 2960, 3333],
			],
			[
				new BgLayer(spr_gbj14_bg_temple, 0.15, 0.08, 0, 0, true, true),
			],
			c_black
		),

		new BgZone([
				[2960, 1560, 3260, 3333],
			],
			[
				new BgLayer(spr_gbj14_bg_temple_holes, 0.15, 0.08, 0, 0, true, true),
			],
			c_black
		),

		new BgZone([
				[2240, 1000, 4064, 1200],
				[2560,  700, 3952, 1000],
			],
			[
				new BgLayer(spr_gbj14_bg_temple_windows, 0.15, 0.08, 0, 0, true, true),
			],
			c_black
		),

		new BgZone([
				[   0, 1600, 1270, 4800],
				[3300, 1500, 5600, 4800],
				[   0, 3333, 5600, 4800],
			],
			[
				new BgLayer(spr_gbj14_bg_caves, 0.20, 0.10, 0, 0, true, true),
			],
			c_black
		),
	];
}

/// Draws every zone, clipped to the visible part of its rects.
function scr_bg_zones_draw()
{
	if (!instance_exists(obj_camera)) return;

	var _cam = obj_camera.cam;
	var _cx  = camera_get_view_x(_cam);
	var _cy  = camera_get_view_y(_cam);
	var _cw  = camera_get_view_width(_cam);
	var _ch  = camera_get_view_height(_cam);
	var _cx2 = _cx + _cw;
	var _cy2 = _cy + _ch;

	var _zone_count = array_length(global.bg_zones);
	for (var _z = 0; _z < _zone_count; _z++)
	{
		var _zone = global.bg_zones[_z];
		var _rect_count = array_length(_zone.rects);

		for (var _r = 0; _r < _rect_count; _r++)
		{
			var _rect = _zone.rects[_r];

			// World-space clip: intersection of this rect with the view.
			var _l = max(_rect[0], _cx);
			var _t = max(_rect[1], _cy);
			var _rgt = min(_rect[2], _cx2);
			var _btm = min(_rect[3], _cy2);
			if (_rgt <= _l || _btm <= _t) continue; // not on screen

			if (_zone.fill != -1)
			{
				draw_set_color(_zone.fill);
				draw_rectangle(_l, _t, _rgt - 1, _btm - 1, false);
				draw_set_color(c_white);
			}

			var _layer_count = array_length(_zone.layers);
			for (var _i = 0; _i < _layer_count; _i++)
			{
				var _lay = _zone.layers[_i];

				// Parallax-space origin, anchored to the zone anchor:
				// px = 0 -> origin rides with the camera (never scrolls),
				// px = 1 -> origin fixed in the world (scrolls like tiles).
				var _ox = lerp(_cx, _zone.anchor_x, _lay.px) + _lay.xoff;
				var _oy = lerp(_cy, _zone.anchor_y, _lay.py) + _lay.yoff;

				__bg_draw_clipped_tiled(_lay.sprite, _ox, _oy,
					_l, _t, _rgt, _btm, _lay.tile_h, _lay.tile_v);
			}
		}
	}
}

/// Tiles a sprite from origin (_ox,_oy), drawing only the parts inside
/// the clip rect [_cx1,_cy1)-[_cx2,_cy2). All coordinates are world space.
function __bg_draw_clipped_tiled(_spr, _ox, _oy, _cx1, _cy1, _cx2, _cy2, _tile_h, _tile_v)
{
	var _w = sprite_get_width(_spr);
	var _h = sprite_get_height(_spr);

	// First tile position that can touch the clip rect.
	var _sx = _tile_h ? _ox + floor((_cx1 - _ox) / _w) * _w : _ox;
	var _sy = _tile_v ? _oy + floor((_cy1 - _oy) / _h) * _h : _oy;

	var _y = _sy;
	do
	{
		var _x = _sx;
		do
		{
			var _pl = max(_x, _cx1);
			var _pt = max(_y, _cy1);
			var _pr = min(_x + _w, _cx2);
			var _pb = min(_y + _h, _cy2);
			if (_pr > _pl && _pb > _pt)
			{
				draw_sprite_part(_spr, 0,
					_pl - _x, _pt - _y,   // source offset inside the sprite
					_pr - _pl, _pb - _pt, // source size
					_pl, _pt);            // world position
			}
			_x += _w;
		}
		until (!_tile_h || _x >= _cx2);
		_y += _h;
	}
	until (!_tile_v || _y >= _cy2);
}