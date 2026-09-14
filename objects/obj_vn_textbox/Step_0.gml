/// @description Insert description here
// You can write your code in this editor

if (string_length(text) > 0 && !text_done)
{
	event_user(0);
	text = "";
}

if (!paused)
{
	if (!text_done)
	{
		if (phase == 0)
		{
			if (image_alpha < 1)
			{
				image_alpha += scr_get_tick_as_percent(fade_in_time);
				if (image_alpha >= 1)
				{
					image_alpha = 1;
					phase = 1;
				}
			}
		}
		else if (phase == 1)
		{
			if (paragraph_id == id || !instance_exists(paragraph_id))
			{
				if (ds_list_size(string_list) > 0)
				{
					var _text = ds_list_find_value(string_list, 0);
					paragraph_id = scr_create_text_paragraph_ext(text_x,text_y, depth - 1,
											_text,
											text_type_rate,
											global.font_02,
											fa_left, fa_top,
											1, c_white, -1);
					paragraph_id.fade_rate = text_fade_rate;
					paragraph_id.text_type_sound_ID = text_type_sound_ID;
					paragraph_id.text_height = 10;
					ds_list_delete(string_list, 0);
				}
				else
				{
					phase = 2;
				}
			}
			else
			{
				if (input_check_pressed(["a","b"]))
				{
					if (!paragraph_id.done_typing)
					{
						paragraph_id.text_type_rate = -1;
						paragraph_id.update_strings = true;
					}
					else
					{
						paragraph_id.destroy_timer = 0;
					}
				}
			}
		}
		else if (phase == 2)
		{
			image_alpha -= scr_get_tick_as_percent(fade_in_time);
			if (image_alpha <= 0)
			{
				image_alpha = 0;
				text_done = true;
				instance_destroy();
				exit;
			}
		}
	}
}

// Inherit the parent event
event_inherited();

