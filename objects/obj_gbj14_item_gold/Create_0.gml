event_inherited();

axis_max_speed = r3(120, 1200, 0);
up_vector = r3(0,-1,0);
r3_clone(up_vector, normal_vector);
force_gravity = 15;
friction_ground = 0.95;
walk_from_walls_multiplier[0] = -0.25;
walk_from_walls_multiplier[1] = -0.25;

apply_gravity_force = false;
movement_enabled = false;

worth = 1;
collection_sound = snd_gbj14_coin_small;
collection_sound_pitch = 1;
collection_timer = 1;

sparkle_index = spr_gbj14_fx_sparkle;
sparkle_anim_speed = 0.25;

settled = false;