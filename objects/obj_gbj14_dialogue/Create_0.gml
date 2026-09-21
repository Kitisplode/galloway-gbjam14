
pages = [];
page_index = 0;
speaker = -1;

chunks = [];
chunk_index = 0;
lines = []; // lines of text of the current chunk

chars_visible = 0;
chars_per_second = 30;
page_done = false;
initialized = false;
on_finish = undefined;
input_delay = 0.1;
arrow_blink = 0;

box_x = -14;
box_y = 98;
box_w = 156;
box_h = 44;
text_pad = 4;
portrait_size = 64; // portraits sit just above the box, on the speaker's side

font = spr_font_lexou;

blip_sound = snd_gbjam9_Land_From_Jump; // set to a sound asset to enable typewriter noise
blip_every = 2;
blip_counter = 0;

load_page = function()
{
	var _page = pages[page_index];
	speaker = _page.who;

	var _all = scr_bitmap_wrap(_page.text, box_w - text_pad * 2);
	var _max = max(1, floor((box_h - text_pad * 2) / 8));

	chunks = [];
	var _chunk = [];
	for (var i = 0; i < array_length(_all); ++i)
	{
		array_push(_chunk, _all[i]);
		if (array_length(_chunk) >= _max)
		{
			array_push(chunks, _chunk);
			_chunk = [];
		}
	}
	if (array_length(_chunk) > 0) array_push(chunks, _chunk);
	if (array_length(chunks) == 0) chunks = [[""]];

	chunk_index = 0;
	lines = chunks[0];
	chars_visible = 0;
	page_done = false;
	arrow_blink = 0;
	input_delay = 0.1;
}
