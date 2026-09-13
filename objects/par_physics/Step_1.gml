// Find out if we're on the ground or not.
event_inherited();

turned_around_at_cliff = false;
is_on_ground_previous = is_on_ground;
is_on_ground = scr_par_physics_Check_On_Ground();
is_in_water_previous = is_in_water;
is_in_water = scr_par_physics_Check_In_Water();

collision_this_frame = false;
collisions_this_frame = r3_zero();
r3_clone(velocity, velocity_previous);