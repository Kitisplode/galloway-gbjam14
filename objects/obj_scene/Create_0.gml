/// @description Insert description here
// You can write your code in this editor

queue_steps = ds_queue_create();
map_sprites = ds_map_create();

queue_steps_skip = ds_queue_create();

ready_to_continue = false;
wait_timer = 0;
action = "none";
action_id = id;
expected_input = undefined;

step = -1;

skip_input = ["a", "b", "start"];
skip_to = -1;

room_to_skip = room;