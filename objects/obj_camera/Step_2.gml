#macro CULL_MARGIN 64   // 4 tiles of active area around the screen

/// obj_camera - End Step: activation window culling (allow-list version)
var _cam = view_get_camera(0);
var _l = camera_get_view_x(_cam)      - CULL_MARGIN;
var _t = camera_get_view_y(_cam)      - CULL_MARGIN;
var _w = camera_get_view_width(_cam)  + CULL_MARGIN * 2;
var _h = camera_get_view_height(_cam) + CULL_MARGIN * 2;

// only physics objects should sleep when offscreen
instance_deactivate_object(par_physics);
// then wake only the ones near the screen:
instance_activate_region(_l, _t, _w, _h, true);
// and wake the par_physics objects that must never sleep:
instance_activate_object(obj_block_tileset);
instance_activate_object(obj_base_player);
instance_activate_object(obj_text);