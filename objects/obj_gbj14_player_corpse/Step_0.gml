/// @description Insert description here
// You can write your code in this editor


if (phase == 0)
{
	if (text_timer > 0)
	{
		text_timer -= scr_get_tick_length();
		if (text_timer <= 0)
		{
			text_id = scr_create_text_paragraph_ext(position[0], position[1] - 64, depth - 1, "Get up\nDon Bruto!",
									1/10, global.font_lexou, fa_center, fa_middle,
									1, c_white, 3,false);
			text_id.text_height = 16;
			text_id.fade_rate = 0.5;
			phase = 1;
			text_timer = 5;
		}
	}
}
else if (phase == 1)
{
	if (!instance_exists(text_id))
	{
		text_id_2 = scr_create_text_paragraph_ext(position[0], position[1] - 64, depth - 1, "You may not\nsleep on\nthe job!",
								1/10, global.font_lexou, fa_center, fa_middle,
								1, c_white, 3,false);
		text_id_2.text_height = 16;
		text_id_2.fade_rate = 0.5;
		phase = 2;
	}
}
else if (phase == 2)
{
	if (!instance_exists(text_id_2))
	{
		text_id_3 = scr_create_text_paragraph_ext(position[0], position[1] - 64, depth - 1, "GET BACK\nTO WORK!",
								1/10, global.font_lexou, fa_center, fa_middle,
								1, c_white, 3,false);
		text_id_3.text_height = 16;
		text_id_3.fade_rate = 0.5;
		phase = 3;
	}
}

if (phase > 1)
{
	if (text_2_id == id)
	{
		text_2_id = scr_create_text_string_ext(position[0], position[1] + 16, depth - 1, "Press @!",
							-1, global.font_lexou, fa_center, fa_middle,
							1, c_white, -1, false);
	}
	if (input_check_pressed(["a", "b", "start"]))
	{
		depth = OBJECT_DEPTHS.TRANSITION + 10;
		if (instance_exists(text_id))
		{
			text_id.fade_rate = 0;
			instance_destroy(text_id);
		}
		if (instance_exists(text_id_2))
		{
			text_id_2.fade_rate = 0;
			instance_destroy(text_id_2);
		}
		if (instance_exists(text_id_3))
		{
			text_id_3.fade_rate = 0;
			instance_destroy(text_id_3);
		}
		if (instance_exists(text_2_id)) instance_destroy(text_2_id);
		scr_transition_respawn(288,1350, c_white);
	}
}

// Inherit the parent event
event_inherited();
