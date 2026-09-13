// Represents a source for player input.
// Tells player objects what to do, based on either local input, network data, or replays.

input_map = ds_map_create();

direction_input = -1;

mouse_available = true;
mouse_active = false;
mouse_position = r2(0,0);