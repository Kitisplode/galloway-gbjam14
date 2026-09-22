
enum Terrain
{
    NONE,
    EARTH,
    ROCKY,
    SANDY,
    BRICK,
    length
}



global.terrains = array_create(Terrain.length);
global.terrains[Terrain.NONE] = [];
global.terrains[Terrain.EARTH] = [
	108, 109, 110, 111, 112, 113, 114, 115, 118, 155, 156, 157, 158, 159, 160, 161,
	162, 163, 164, 165, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 249,
	250, 251, 252, 253, 343, 344, 345, 346, 347];
global.terrains[Terrain.ROCKY] = [
	39, 40, 41, 42, 43, 44, 45, 46, 86, 87, 88, 89, 90, 91, 92, 93,
	133, 134, 135, 136, 137, 138, 139, 140, 182, 183, 184, 185, 186, 187, 227, 228,
	229, 231, 232, 233, 274, 275, 276, 277, 278, 279, 280, 281, 374, 421, 422, 468,
	469];
global.terrains[Terrain.SANDY] = [
	498, 499, 500, 501, 511, 545, 546, 547, 548, 552, 553, 556, 557, 558, 592, 593,
	594, 595, 598, 599, 600, 601, 603, 604, 605, 639, 640, 641, 642, 644, 645, 646,
	647, 648, 649, 650, 651, 652, 686, 687, 688, 689, 691, 692, 693, 694, 695, 696,
	697, 698, 699, 738, 739, 740, 741, 742, 743, 744, 745, 746];
global.terrains[Terrain.BRICK] = [
	38, 83, 84, 85, 130, 131, 132, 177, 178, 179, 224, 225, 226, 271, 272, 273,
	316, 317, 318, 319, 320, 363, 364, 365, 366, 367, 410, 411, 412, 413, 414, 457,
	458, 459, 460, 461];

global.terrain_tile_prob = {};
global.terrain_tile_prob[$ "42"] = 0.1;
global.terrain_tile_prob[$ "46"] = 0.1;
global.terrain_tile_prob[$ "87"] = 0.0;
global.terrain_tile_prob[$ "89"] = 0.0;
global.terrain_tile_prob[$ "90"] = 0.0;
global.terrain_tile_prob[$ "91"] = 0.0;
global.terrain_tile_prob[$ "92"] = 0.0;
global.terrain_tile_prob[$ "93"] = 0.0;
global.terrain_tile_prob[$ "133"] = 0.1;
global.terrain_tile_prob[$ "135"] = 0.1;
global.terrain_tile_prob[$ "137"] = 0.0;
global.terrain_tile_prob[$ "139"] = 0.0;
global.terrain_tile_prob[$ "156"] = 0.0;
global.terrain_tile_prob[$ "157"] = 0.0;
global.terrain_tile_prob[$ "158"] = 0.0;
global.terrain_tile_prob[$ "203"] = 0.0;
global.terrain_tile_prob[$ "204"] = 0.0;
global.terrain_tile_prob[$ "205"] = 0.0;
global.terrain_tile_prob[$ "279"] = 0.0;
global.terrain_tile_prob[$ "343"] = 0.0;
global.terrain_tile_prob[$ "344"] = 0.0;
global.terrain_tile_prob[$ "345"] = 0.0;
global.terrain_tile_prob[$ "346"] = 0.0;
global.terrain_tile_prob[$ "347"] = 0.0;
global.terrain_tile_prob[$ "364"] = 0.0;
global.terrain_tile_prob[$ "365"] = 0.0;
global.terrain_tile_prob[$ "366"] = 0.0;
global.terrain_tile_prob[$ "374"] = 0.0;
global.terrain_tile_prob[$ "375"] = 0.0;
global.terrain_tile_prob[$ "410"] = 0.0;
global.terrain_tile_prob[$ "411"] = 0.0;
global.terrain_tile_prob[$ "412"] = 0.0;
global.terrain_tile_prob[$ "413"] = 0.0;
global.terrain_tile_prob[$ "414"] = 0.0;
global.terrain_tile_prob[$ "421"] = 0.0;
global.terrain_tile_prob[$ "422"] = 0.0;
global.terrain_tile_prob[$ "468"] = 0.0;
global.terrain_tile_prob[$ "469"] = 0.0;
global.terrain_tile_prob[$ "545"] = 0.0;
global.terrain_tile_prob[$ "546"] = 0.0;
global.terrain_tile_prob[$ "547"] = 0.0;
global.terrain_tile_prob[$ "548"] = 0.0;
global.terrain_tile_prob[$ "550"] = 0.0;
global.terrain_tile_prob[$ "551"] = 0.0;
global.terrain_tile_prob[$ "552"] = 0.0;
global.terrain_tile_prob[$ "553"] = 0.0;
global.terrain_tile_prob[$ "554"] = 0.0;
global.terrain_tile_prob[$ "555"] = 0.0;
global.terrain_tile_prob[$ "592"] = 0.0;
global.terrain_tile_prob[$ "593"] = 0.0;
global.terrain_tile_prob[$ "594"] = 0.0;
global.terrain_tile_prob[$ "595"] = 0.0;
global.terrain_tile_prob[$ "597"] = 0.0;
global.terrain_tile_prob[$ "598"] = 0.0;
global.terrain_tile_prob[$ "599"] = 0.0;
global.terrain_tile_prob[$ "600"] = 0.0;
global.terrain_tile_prob[$ "601"] = 0.0;
global.terrain_tile_prob[$ "602"] = 0.0;
global.terrain_tile_prob[$ "639"] = 0.0;
global.terrain_tile_prob[$ "640"] = 0.0;
global.terrain_tile_prob[$ "641"] = 0.0;
global.terrain_tile_prob[$ "642"] = 0.0;
global.terrain_tile_prob[$ "644"] = 0.0;
global.terrain_tile_prob[$ "645"] = 0.0;
global.terrain_tile_prob[$ "646"] = 0.0;
global.terrain_tile_prob[$ "647"] = 0.0;
global.terrain_tile_prob[$ "648"] = 0.0;
global.terrain_tile_prob[$ "649"] = 0.0;
global.terrain_tile_prob[$ "691"] = 0.0;
global.terrain_tile_prob[$ "692"] = 0.0;
global.terrain_tile_prob[$ "693"] = 0.0;
global.terrain_tile_prob[$ "694"] = 0.0;
global.terrain_tile_prob[$ "695"] = 0.0;
global.terrain_tile_prob[$ "696"] = 0.0;
global.terrain_tile_prob[$ "738"] = 0.0;
global.terrain_tile_prob[$ "739"] = 0.0;
global.terrain_tile_prob[$ "740"] = 0.0;
global.terrain_tile_prob[$ "741"] = 0.0;
global.terrain_tile_prob[$ "742"] = 0.0;
global.terrain_tile_prob[$ "743"] = 0.0;

global.terrain_tiles = array_create(Terrain.length, undefined);

var _t = array_create(256, undefined);
_t[0b00000001] = [347];	// neighbors: TL
_t[0b00000010] = [210];	// end cap, bottom
_t[0b00000100] = [343];	// neighbors: TR
_t[0b00001000] = [163];	// end cap, left
_t[0b00001110] = [249];	// outer corner, bottom-left
_t[0b00001111] = [344];	// neighbors: T R TL TR
_t[0b00100000] = [164];	// end cap, top
_t[0b00100010] = [165];	// vertical strip
_t[0b00111000] = [108];	// outer corner, top-left
_t[0b00111110] = [155, 202];	// left edge
_t[0b01010101] = [118];	// STANDALONE block (corners-only label; used for all no-edge masks)
_t[0b01111111] = [162];	// neighbors: T R B TL TR BR BL
_t[0b10000000] = [211];	// end cap, right
_t[0b10000011] = [253];	// outer corner, bottom-right
_t[0b10000111] = [346];	// neighbors: T L TL TR
_t[0b10001000] = [212];	// horizontal strip
_t[0b10001111] = [250, 251, 252, 345];	// bottom edge
_t[0b10111111] = [115];	// inner corner, gap at BL
_t[0b11011111] = [114];	// neighbors: T R L TL TR BR BL
_t[0b11100000] = [112];	// outer corner, top-right
_t[0b11100011] = [159, 206];	// right edge
_t[0b11101111] = [113];	// inner corner, gap at BR
_t[0b11110111] = [160];	// neighbors: T B L TL TR BR BL
_t[0b11111000] = [109, 110, 111];	// top edge
_t[0b11111011] = [207];	// inner corner, gap at TR
_t[0b11111101] = [208];	// neighbors: R B L TL TR BR BL
_t[0b11111110] = [209];	// inner corner, gap at TL
_t[0b11111111] = [161, 156, 157, 158, 203, 204, 205];	// interior (fully surrounded)
global.terrain_tiles[Terrain.EARTH] = _t;

var _t = array_create(256, undefined);
_t[0b00000010] = [274];	// end cap, bottom
_t[0b00001000] = [227];	// end cap, left
_t[0b00001110] = [183];	// outer corner, bottom-left
_t[0b00100000] = [228];	// end cap, top
_t[0b00100010] = [229];	// vertical strip
_t[0b00111000] = [231, 42];	// outer corner, top-left
_t[0b00111110] = [136, 89];	// left edge
_t[0b01010101] = [182];	// STANDALONE block (corners-only label; used for all no-edge masks)
_t[0b01111111] = [88];	// neighbors: T R B TL TR BR BL
_t[0b10000000] = [275];	// end cap, right
_t[0b10000011] = [187];	// outer corner, bottom-right
_t[0b10001000] = [276];	// horizontal strip
_t[0b10001111] = [184, 185, 186];	// bottom edge
_t[0b10111111] = [41];	// inner corner, gap at BL
_t[0b11011111] = [40];	// neighbors: T R L TL TR BR BL
_t[0b11100000] = [233, 46];	// outer corner, top-right
_t[0b11100011] = [140, 93];	// right edge
_t[0b11101111] = [39];	// inner corner, gap at BR
_t[0b11110111] = [86];	// neighbors: T B L TL TR BR BL
_t[0b11111000] = [43, 44, 45, 232, 277, 281];	// top edge
_t[0b11111011] = [280, 133];	// inner corner, gap at TR
_t[0b11111101] = [134];	// neighbors: R B L TL TR BR BL
_t[0b11111110] = [278, 135];	// inner corner, gap at TL
_t[0b11111111] = [138, 87, 90, 91, 92, 137, 139, 279, 374, 421, 422, 468, 469];	// interior (fully surrounded)
global.terrain_tiles[Terrain.ROCKY] = _t;

var _t = array_create(256, undefined);
_t[0b00000010] = [603];	// end cap, bottom
_t[0b00001000] = [556];	// end cap, left
_t[0b00001110] = [686];	// outer corner, bottom-left
_t[0b00100000] = [557];	// end cap, top
_t[0b00100010] = [558];	// vertical strip
_t[0b00111000] = [498];	// outer corner, top-left
_t[0b00111110] = [545, 592, 639];	// left edge
_t[0b01010101] = [511];	// STANDALONE block (corners-only label; used for all no-edge masks)
_t[0b01111000] = [552];	// neighbors: R B BR BL
_t[0b01111100] = [598, 644];	// neighbors: R B TR BR BL
_t[0b01111111] = [699];	// neighbors: T R B TL TR BR BL
_t[0b10000000] = [604];	// end cap, right
_t[0b10000011] = [689];	// outer corner, bottom-right
_t[0b10001000] = [605];	// horizontal strip
_t[0b10001111] = [687, 688];	// bottom edge
_t[0b10111111] = [652];	// inner corner, gap at BL
_t[0b11011111] = [651];	// neighbors: T R L TL TR BR BL
_t[0b11100000] = [501];	// outer corner, top-right
_t[0b11100011] = [548, 595, 642];	// right edge
_t[0b11101111] = [650];	// inner corner, gap at BR
_t[0b11110000] = [553];	// neighbors: B L BR BL
_t[0b11110001] = [601, 649];	// neighbors: B L TL BR BL
_t[0b11110111] = [697];	// neighbors: T B L TL TR BR BL
_t[0b11111000] = [499, 500];	// top edge
_t[0b11111011] = [744];	// inner corner, gap at TR
_t[0b11111101] = [745];	// neighbors: R B L TL TR BR BL
_t[0b11111110] = [746];	// inner corner, gap at TL
_t[0b11111111] = [698, 546, 547, 593, 594, 599, 600, 640, 641, 645, 646, 647, 648, 691, 692, 693, 694, 695, 696, 738, 739, 740, 741, 742, 743];	// interior (fully surrounded)
global.terrain_tiles[Terrain.SANDY] = _t;

var _t = array_create(256, undefined);
_t[0b00000010] = [130];	// end cap, bottom
_t[0b00001000] = [83];	// end cap, left
_t[0b00001110] = [457];	// outer corner, bottom-left
_t[0b00100000] = [84];	// end cap, top
_t[0b00100010] = [85];	// vertical strip
_t[0b00111000] = [316];	// outer corner, top-left
_t[0b00111110] = [363, 410];	// left edge
_t[0b01010101] = [38];	// STANDALONE block (corners-only label; used for all no-edge masks)
_t[0b01111111] = [226];	// neighbors: T R B TL TR BR BL
_t[0b10000000] = [131];	// end cap, right
_t[0b10000011] = [461];	// outer corner, bottom-right
_t[0b10001000] = [132];	// horizontal strip
_t[0b10001111] = [458, 459, 460];	// bottom edge
_t[0b10111111] = [179];	// inner corner, gap at BL
_t[0b11011111] = [178];	// neighbors: T R L TL TR BR BL
_t[0b11100000] = [320];	// outer corner, top-right
_t[0b11100011] = [367, 414];	// right edge
_t[0b11101111] = [177];	// inner corner, gap at BR
_t[0b11110111] = [224];	// neighbors: T B L TL TR BR BL
_t[0b11111000] = [317, 318, 319];	// top edge
_t[0b11111011] = [271];	// inner corner, gap at TR
_t[0b11111101] = [272];	// neighbors: R B L TL TR BR BL
_t[0b11111110] = [273];	// inner corner, gap at TL
_t[0b11111111] = [225, 364, 365, 366, 411, 412, 413];	// interior (fully surrounded)
global.terrain_tiles[Terrain.BRICK] = _t;

function terrain_mask_canonical(_m)
{
    var _r = _m & 0b10101010; // keep edges (T=2, R=8, B=32, L=128)
    if ((_m & 1)  != 0 && (_m & 2)  != 0 && (_m & 128) != 0) _r |= 1;   // TL
    if ((_m & 4)  != 0 && (_m & 2)  != 0 && (_m & 8)   != 0) _r |= 4;   // TR
    if ((_m & 16) != 0 && (_m & 8)  != 0 && (_m & 32)  != 0) _r |= 16;  // BR
    if ((_m & 64) != 0 && (_m & 32) != 0 && (_m & 128) != 0) _r |= 64;  // BL
    return _r;
}

function __terrain_bit_count(_m)
{
    var _n = 0;
    while (_m != 0) { _n += _m & 1; _m = _m >> 1; }
    return _n;
}

function __terrain_mask_distance(_a, _b)
{
    var _x = _a ^ _b;
    return __terrain_bit_count(_x & 0b10101010) * 8
         + __terrain_bit_count(_x & 0b01010101);
}

function terrain_build_lookup()
{
    global.terrain_lookup = array_create(Terrain.length, undefined);
    for (var _type = 0; _type < Terrain.length; _type++)
    {
        var _authored = global.terrain_tiles[_type];
        if (_authored == undefined) continue;

        var _masks = [];
        for (var _m = 0; _m < 256; _m++)
            if (_authored[_m] != undefined) array_push(_masks, _m);
        if (array_length(_masks) == 0) continue;

        var _lut = array_create(256, undefined);
        for (var _m = 0; _m < 256; _m++)
        {
            if (_authored[_m] != undefined) { _lut[_m] = _authored[_m]; continue; }

            var _c = terrain_mask_canonical(_m);
            if (_authored[_c] != undefined) { _lut[_m] = _authored[_c]; continue; }

            // No edge neighbors at all -> use the standalone block
            // (authored in the tsx as corners-only, mask 0b01010101).
            if ((_c & 0b10101010) == 0 && _authored[0b01010101] != undefined)
            {
                _lut[_m] = _authored[0b01010101];
                continue;
            }

            var _best   = _masks[0];
            var _best_d = __terrain_mask_distance(_c, _best);
            for (var _i = 1; _i < array_length(_masks); _i++)
            {
                var _d = __terrain_mask_distance(_c, _masks[_i]);
                if (_d < _best_d) { _best = _masks[_i]; _best_d = _d; }
            }
            _lut[_m] = _authored[_best];
        }
        global.terrain_lookup[_type] = _lut;
    }
}
terrain_build_lookup();



global.terrain_type_by_tile = array_create(1024, Terrain.NONE);
for (var _type = 0; _type < Terrain.length; _type++)
{
    var _arr = global.terrains[_type];
    for (var _i = 0; _i < array_length(_arr); _i++)
        global.terrain_type_by_tile[_arr[_i]] = _type;
}

function terrain_get_type(_tile)
{
    if (_tile < 0 || _tile >= 1024) return Terrain.NONE;
    return global.terrain_type_by_tile[_tile];
}



function terrain_is_slope(_tile)
{
    return (_tile == 231 || _tile == 233 ||
            _tile == 599 || _tile == 602 ||
            _tile == 645 || _tile == 650);
}


function terrain_is_type(_tilemap, _x, _y, _type)
{
    var _terrain_w = room_width  / 16;
    var _terrain_h = room_height / 16;
    if (_x < 0 || _x >= _terrain_w ||
        _y < 0 || _y >= _terrain_h)
        return false;
    var _tile = tilemap_get(_tilemap, _x, _y);
    return (terrain_get_type(_tile) == _type);
}

function terrain_get_mask(_tilemap, _x, _y, _type)
{
    if (_type == Terrain.NONE)
        return 0;

    var _mask = 0;
    if (terrain_is_type(_tilemap, _x - 1, _y - 1, _type)) _mask |= 1;
    if (terrain_is_type(_tilemap, _x,     _y - 1, _type)) _mask |= 2;
    if (terrain_is_type(_tilemap, _x + 1, _y - 1, _type)) _mask |= 4;
    if (terrain_is_type(_tilemap, _x + 1, _y,     _type)) _mask |= 8;
    if (terrain_is_type(_tilemap, _x + 1, _y + 1, _type)) _mask |= 16;
    if (terrain_is_type(_tilemap, _x,     _y + 1, _type)) _mask |= 32;
    if (terrain_is_type(_tilemap, _x - 1, _y + 1, _type)) _mask |= 64;
    if (terrain_is_type(_tilemap, _x - 1, _y,     _type)) _mask |= 128;
    return _mask;
}

function terrain_tile_weight(_tile)
{
    var _w = global.terrain_tile_prob[$ string(_tile)];
    return (_w == undefined) ? 1 : _w;
}

/// Deterministic random pick among variants (same cell -> same tile).
function terrain_pick_variant(_variants, _x, _y)
{
    var _n = array_length(_variants);
    if (_n == 0) return -1;
    if (_n == 1) return _variants[0];

    var _total = 0;
    for (var _i = 0; _i < _n; _i++)
        _total += terrain_tile_weight(_variants[_i]);
    if (_total <= 0) return _variants[0];

    var _h = ((_x * 73856093) + (_y * 19349663)) mod 100000;
    var _r = (_h / 100000) * _total;
    for (var _i = 0; _i < _n; _i++)
    {
        _r -= terrain_tile_weight(_variants[_i]);
        if (_r < 0) return _variants[_i];
    }
    return _variants[_n - 1];
}

function terrain_get_tile(_tilemap, _x, _y)
{
    var _tile = tilemap_get(_tilemap, _x, _y);
    var _type = terrain_get_type(_tile);
    if (_type == Terrain.NONE)
        return -1;

    var _mask = terrain_get_mask(_tilemap, _x, _y, _type);
    var _variants = global.terrain_lookup[_type][_mask];
    if (_variants == undefined || array_length(_variants) == 0)
        return -1;
    return terrain_pick_variant(_variants, _x, _y);
}

function terrain_update_tile(_tilemap, _x, _y)
{
    var _terrain_w = room_width  / 16;
    var _terrain_h = room_height / 16;
    if (_x < 0 || _x >= _terrain_w ||
        _y < 0 || _y >= _terrain_h)
        return;
		
	if (terrain_is_slope(tilemap_get(_tilemap, _x, _y)))
		return;

    var _tile = terrain_get_tile(_tilemap, _x, _y);
    if (_tile > -1)
        tilemap_set(_tilemap, _tile, _x, _y);
}

function terrain_update_region(_tilemap, _x, _y)
{
    for (var yy = _y - 1; yy <= _y + 1; yy++)
    {
        for (var xx = _x - 1; xx <= _x + 1; xx++)
        {
            terrain_update_tile(_tilemap, xx, yy);
        }
    }
}



/// function to fix things getting stuck when terrain changes under them
function scr_Unstick_From_Solids(_max_push = 16)
{
    if (!scr_Check_For_Solids(position, false))
		return true;

    var _dirs = [[0,-1], [0,1], [-1,0], [1,0]];
    for (var _step = 1; _step <= _max_push; _step++)
    {
        for (var _d = 0; _d < 4; _d++)
        {
            var _try = [
				position[0] + _dirs[_d][0] * _step,
                position[1] + _dirs[_d][1] * _step,
                position[2]
			];
            if (!scr_Check_For_Solids(_try, false))
            {
                position[0] = _try[0];
                position[1] = _try[1];
                x = position[0];
                y = position[1];
                return true;
            }
        }
    }
    return false;
}
