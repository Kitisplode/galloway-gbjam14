/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_alpha = 0;
fade_in_time = 0.25;
phase = 0;

text = "";
string_list = ds_list_create();
paragraph_id = id;
text_done = false;

text_height = 10;
text_type_sound_ID = -1;
text_type_rate = scr_get_tick_length() * 20;
text_destroy_timer = 2.5;
text_fade_rate = 0.25;
text_x = 0;
text_y = 0;