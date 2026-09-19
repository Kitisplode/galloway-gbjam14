/// @description Setup
#macro TILE_SIZE 16

cam = view_camera[0];
camera_set_view_size(cam, obj_main_graphics.view_width, obj_main_graphics.view_height);
view_width_half = camera_get_view_width(cam) * 0.5;
view_height_half = camera_get_view_height(cam) * 0.5;
// This point is the camera's target. It currently follows the player, but
// keeping it separate lets us add look-ahead and other target behavior later.
target_x = xstart + view_width_half;
target_y = ystart + view_height_half - 24;
camera_lerp_amount = 0.25;
camera_vertical_lerp_amount = 0.1;

// The target sits above the player so more of the space ahead is visible.
camera_vertical_offset = -24;
camera_focus_y = 0;
camera_fall_focus_distance = 20;
camera_vertical_focus_lerp_amount = 0.02;

// Horizontal look-ahead moves very smoothly based on the current input.
camera_focus_x = 0;
camera_focus_distance = 32;
camera_focus_lerp_amount = 0.04;

stay_in_room = true;

shake_remain = 0;
shake_length = 0;
shake_magnitude = 0;

follow = obj_base_player;
offset_x = 0;
offset_y = 0;

depth = 99999;
