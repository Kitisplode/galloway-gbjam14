/// @description Setup
#macro TILE_SIZE 16

cam = view_camera[0];
camera_set_view_size(cam, obj_main_graphics.view_width, obj_main_graphics.view_height);
view_width_half = camera_get_view_width(cam) * 0.5;
view_height_half = camera_get_view_height(cam) * 0.5;
x_to = xstart;
y_to = ystart;

stay_in_room = true;

shake_remain = 0;
shake_length = 0;
shake_magnitude = 0;

follow = obj_base_player;
offset_x = 0;
offset_y = 0;