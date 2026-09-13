// Inherit the parent event
event_inherited();

// Set up the input source.
id_input = instance_create_depth(0,0, OBJECT_DEPTHS.HUD, obj_input);

hp_max = 4;
hp = hp_max;
invuln_time = 1.5;
invuln_timer = 0;

invincible = false;

depth = OBJECT_DEPTHS.PLAYER;

// If this is true, begin interactions with other objects (e.g. doors, pipes, talking to someone, etc.)
interacting = false;