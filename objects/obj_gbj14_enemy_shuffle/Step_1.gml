/// @description Thrown bugs are defeated when they land.

// Preserve the inherited ground check and enemy update.
event_inherited();

if (is_thrown)
{
	// The bug may still have its pre-throw grounded state for one frame.
	// Require it to become airborne before treating ground contact as a landing.
	if (!is_on_ground)
	{
		throw_has_left_ground = true;
	}
	else if (throw_has_left_ground)
	{
		is_thrown = false;
		throw_has_left_ground = false;
		is_throw_stunned = true;
		throw_stun_timer = throw_stun_time;
		movement_enabled = false;
		apply_gravity_force = false;
		velocity[0] = 0;
		velocity[1] = 0;
		damage = 0;
		image_angle_matching_visual = false;
		anim_angle = 180;
	}
}
