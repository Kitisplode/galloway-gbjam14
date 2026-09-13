/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!paused)
{
	movement_vector_working = r3_scale(movement_vector, scr_get_tick_length() * movement_scale);

	if (enable_manual_fractional_movement)
		scr_par_physics_Apply_Fractional_Velocity(movement_vector_fractional, movement_vector_working);
		
	_scr_par_physics_Push_Pushables(position, movement_vector_working, true, true);
}