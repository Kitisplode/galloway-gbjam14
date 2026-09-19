/// @description Keep the carried bug animated and tween it onto its back.

// Preserve the inherited enemy and physics update.
event_inherited();

if (is_throw_stunned)
{
	// Keep the bug harmless and still while it recovers from the landing.
	movement_enabled = false;
	apply_gravity_force = false;
	velocity[0] = 0;
	velocity[1] = 0;
	damage = 0;
	image_angle_matching_visual = false;
	// Keep the feet-origin collision point on the ground while the upside-down
	// sprite is drawn upward, matching the carried pose.
	shake[1] = -sprite_get_height(sprite_index);

	if (throw_stun_timer > 0)
	{
		throw_stun_timer = max(0, throw_stun_timer - scr_get_tick_length());
		anim_angle = 180;
		return;
	}

	// Quickly flip upright before returning to the normal shuffle behavior.
	anim_angle = lerp(anim_angle, 0, 0.25);
	if (abs(anim_angle) < 1)
	{
		anim_angle = 0;
		image_angle_matching_visual = true;
		is_throw_stunned = false;
		movement_enabled = true;
		apply_gravity_force = true;
		damage = normal_damage;
		shake[1] = 0;
		force_gravity = 30;
		axis_max_speed[0] = 120;
		axis_max_speed[1] = 1200;
		axis_max_speed[2] = 120;
		dont_walk_off_cliffs = true;
		walk_from_walls_multiplier = r3(-1,0,0);
		slide_slopes_up = true;
		slide_slopes_down = true;
		slide_around_blocks = false;
		velocity[0] = -50;
	}
	return;
}

var _is_carried = (dom_id != id);
var _target_angle = _is_carried ? 180 : 0;

carry_visual_angle = lerp(carry_visual_angle, _target_angle, carry_visual_angle_lerp);

if (is_thrown)
{
	// Keep the bug upside down throughout the throw. Its feet-origin means
	// spinning would make the artwork dip through the ground.
	image_angle_matching_visual = false;
	anim_angle = 180;
}
else if (_is_carried)
{
	// Movement is paused while carried, but animation should continue.
	anim_speed = 0.15;
	image_angle_matching_visual = false;
	anim_angle = carry_visual_angle;
}
else if (!image_angle_matching_visual)
{
	// Ease back upright after the bug is released.
	anim_angle = carry_visual_angle;
	if (abs(carry_visual_angle) < 1)
	{
		carry_visual_angle = 0;
		anim_angle = image_angle;
		image_angle_matching_visual = true;
	}
}
