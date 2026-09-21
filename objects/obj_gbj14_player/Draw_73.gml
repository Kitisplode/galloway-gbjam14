/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (paused) exit;

// Flip the sprites if we're facing west.
{
	if (direction_facing == 180) image_xscale = -1;
	else image_xscale = 1;
}

if (hurt_timer > 0)
{
	scr_change_sprite(spr_gbj14_player_hurt);
	anim_speed = 0;
}
else
{
	if (action == -1)
	{
		image_xscale = 1;
		scr_change_sprite(spr_gbj14_player_climb);
		if (abs(velocity[1]) > 10) anim_speed = 0.15;
		else anim_speed = 0;
	}
	else if (action == 0)
	{
		if (carry_id == id)
		{
			if (is_on_ground)
			{
				if (abs(velocity[0]) > 10)
				{
					scr_change_sprite(spr_gbj14_player_walk);
					anim_speed = 0.15;
				}
				else
				{
					if (idle_animation_timer >= idle_animation_time)
					{
						scr_change_sprite(spr_gbj14_player_idle_play);
						anim_speed = 0.15;
					}
					else
					{
						scr_change_sprite(spr_gbj14_player_idle);
						anim_speed = 0;
					}
				}
			}
			else
			{
				scr_change_sprite(spr_gbj14_player_jump);
				anim_speed = 0;
				if (velocity[1] < 10) anim_frame = 0;
				else anim_frame = 1;
			}
		}
		else
		{
			if (is_on_ground)
			{
				if (abs(velocity[0]) > 10)
				{
					scr_change_sprite(spr_gbj14_player_lift_walk);
					anim_speed = 0.15;
				}
				else
				{
					scr_change_sprite(spr_gbj14_player_lift_idle);
					anim_speed = 0.15;
				}
			}
			else
			{
				scr_change_sprite(spr_gbj14_player_lift_walk);
				anim_frame = 1;
				anim_speed = 0;
			}
		}
	}
	else if (action == 1)
	{
		scr_change_sprite(spr_gbj14_player_lift);
		anim_speed = 0.25;
		if (anim_looped != 0)
		{
			action = 0;
			scr_change_sprite(spr_gbj14_player_lift_idle);
		}
	}
	else if (action == 2)
	{
		scr_change_sprite(spr_gbj14_player_sword);
		anim_speed = 0.6;
		if (anim_looped != 0)
		{
			action = 0;
			scr_change_sprite(spr_gbj14_player_idle);
		}
	}
	else if (action == 3)
	{
		scr_change_sprite(spr_gbj14_player_ending);
		if (anim_looped != 0)
		{
			// Hold on the final frame until the fade out.
			anim_speed = 0;
			anim_frame = sprite_get_number(spr_gbj14_player_ending) - 1;
			ending_anim_done = true;
		}
	}
	else if (action == 4)
	{
		scr_change_sprite(spr_gbj14_player_throw);
		anim_speed = 0.1;
		if (anim_looped != 0)
		{
			action = 0;
			scr_change_sprite(spr_gbj14_player_idle);
		}
	}
}