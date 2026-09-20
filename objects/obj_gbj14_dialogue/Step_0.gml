
if (!initialized)
{
	if (array_length(pages) == 0) exit;
	load_page();
	initialized = true;
}

if (input_delay > 0)
{
	input_delay -= scr_get_tick_length();
}

// Total characters in the current chunk.
var _total = 0;
for (var i = 0; i < array_length(lines); ++i)
	_total += string_length(lines[i]);

if (!page_done)
{
	var _prev = floor(chars_visible);
	chars_visible += chars_per_second * scr_get_tick_length();

	if (blip_sound != -1 && floor(chars_visible) > _prev)
	{
		blip_counter += floor(chars_visible) - _prev;
		if (blip_counter >= blip_every)
		{
			blip_counter = 0;
			play_sound(blip_sound, 0.5, 0, 1, 1, 0.1);
		}
	}

	if (chars_visible >= _total)
	{
		chars_visible = _total;
		page_done = true;
	}
	// A while typing = reveal the whole chunk instantly.
	else if (input_delay <= 0 && input_check_pressed("a"))
	{
		chars_visible = _total;
		page_done = true;
	}
}
else
{
	arrow_blink += scr_get_tick_length();

	if (input_delay <= 0 && input_check_pressed("a"))
	{
		if (chunk_index + 1 < array_length(chunks))
		{
			chunk_index += 1;
			lines = chunks[chunk_index];
			chars_visible = 0;
			page_done = false;
			arrow_blink = 0;
			input_delay = 0.1;
		}
		else
		{
			page_index += 1;

			if (page_index >= array_length(pages))
			{
				global.paused = false;
				global.cutscene_playing = false;
				if (on_finish != undefined) on_finish();
				instance_destroy();
				exit;
			}

			load_page();
		}
	}
}
