event_inherited();

axis_max_speed = r3(120, 1200, 0);
up_vector = r3(0,-1,0);
r3_clone(up_vector, normal_vector);
force_gravity = 15;
friction_ground = 0.8;
walk_from_walls_multiplier[0] = -0.25;
walk_from_walls_multiplier[1] = -0.25;

anim_speed = 1;
bomb_timer_max = 5;
bomb_timer = bomb_timer_max;
show_flashing = false;
flash_counter = 0;

damage = 5;
