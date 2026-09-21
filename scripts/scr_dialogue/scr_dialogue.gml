
enum Characters
{
	DON_BRUTO,
	AVARICCIO,
	SHOPKEEPER,
	CONQUISTADOR,
}

/// @desc Small constructor for one line of dialogue.
function scr_line(_who, _text)
{
	return { who: _who, text: _text };
}

/// @desc Registry mapping a Characters enum value to display info.
///       side: 0 = portrait on the left of the box, 1 = on the right.
function scr_character_info(_char)
{
	static _db = undefined;
	if (_db == undefined)
	{
		_db = [];
		_db[Characters.DON_BRUTO] = {
			name: "DON BRUTO",
			portrait: asset_get_index("spr_gbj14_portrait_donbruto"),
			side: 0,
		};
		_db[Characters.AVARICCIO] = {
			name: "AVARICCIO",
			portrait: asset_get_index("spr_gbj14_portrait_avariccio"),
			side: 1,
		};
		_db[Characters.SHOPKEEPER] = {
			name: "SHOPKEEPER",
			portrait: asset_get_index("spr_gbj14_portrait_shopkeep"),
			side: 1,
		};
		_db[Characters.CONQUISTADOR] = {
			name: "CONQUISTADOR",
			portrait: asset_get_index("spr_gbj14_portrait_conquistador"),
			side: 1,
		};
	}
	if (_char < 0 || _char >= array_length(_db)) return undefined;
	return _db[_char];
}

global.cutscene_playing = false;

global.cutscene_played = [
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
];

global.cutscenes[0] = [ // At camp
	scr_line(Characters.SHOPKEEPER, "Don Bruto, you're in luck! Now that the chaos has settled down, we've set up shop here in the shipwreck camp!"),
	scr_line(Characters.DON_BRUTO,  "A shop? But what are you selling? Don't tell me that you're selling our old ship's equipment back to us!"),
	scr_line(Characters.SHOPKEEPER, "We all must make a living...\n" + "And not all of us can go risk our lives in that fearsome pyramid."),
	scr_line(Characters.DON_BRUTO,  "You'd better not swindle me!\n" + "That certainly wouldn't befit a woman of the cloth!"),
];
global.cutscenes[1] = [ // At camp
	scr_line(Characters.AVARICCIO,  "Don Bruto! The ship's finished, but it's no excuse for lazing about! Get to the tomb, find us the gold!"),
	scr_line(Characters.DON_BRUTO,  "Avariccio! Too tired to plunder yourself, of course!\n" + "You'd have me find it for you, cabron, and so I will!"),
	scr_line(Characters.AVARICCIO,  "Ni en tus suenos, conquistador!, it's simply I can't stand to look at you lazing about here! Begone!"),
];
global.cutscenes[2] = [ // At pyramid entrance
	scr_line(Characters.AVARICCIO,  "So you've made it to the pyramid, Don Bruto.\n" + "Quicker than I expected from a fat oaf like yourself!"),
	scr_line(Characters.DON_BRUTO,  "The treasure is mine, Avariccio!\n" + "You will never get your hands on it, clumsy tonto!"),
	scr_line(Characters.AVARICCIO,  "Think again! Even the walls are made of gold! I'll take all of it!"),
	scr_line(Characters.DON_BRUTO,  "Whatever you take, I'll carry it back! Como te parece, cabron?"),
];
global.cutscenes[3] = [ // In the dungeon
	scr_line(Characters.AVARICCIO,  "Don Bruto! I'm surprised you made it this far!\n" + "This tomb is not as the maps told!"),
	scr_line(Characters.DON_BRUTO,  "A challenge for you, Avariccio?!\n" + "Perhaps you'd better go and drink with the others, back at the shipwreck!"),
	scr_line(Characters.AVARICCIO,  "And leave the gold all to you? Hoh!\n" + "These beetles and phantoms would kill you long before they'd scratch me!"),
	scr_line(Characters.DON_BRUTO,  "If that were true, we'll be meeting again, I'm sure, pendejo!"),
	scr_line(Characters.AVARICCIO,  "I sense there are greater foes yet! You had best be careful!"),
];
global.cutscenes[4] = [ // In the dungeon, deeper
	scr_line(Characters.AVARICCIO,  "Ah! Don Bruto, you scared me!"),
	scr_line(Characters.DON_BRUTO,  "This tomb is quite the terrifying prospect, isn't it!\n" + "There is still a path to the surface, Avariccio!"),
	scr_line(Characters.AVARICCIO,  "No me jodas! The treasure that lay below is grander than we thought!"),
	scr_line(Characters.DON_BRUTO,  "What do you speak of, Avariccio?"),
	scr_line(Characters.AVARICCIO,  "The walls whisper of men so rich they were said to be MADE of gold! Can you imagine?"),
	scr_line(Characters.DON_BRUTO,  "Hah! The siren has called you! Ten cuidado. This tomb may claim you yet!"),
	scr_line(Characters.AVARICCIO,  "Not before I see the treasure!\n" + "And in fact, I believe this impressive statue here may be the key..."),
];
global.cutscenes[5] = [ // Near the end
	scr_line(Characters.DON_BRUTO,  "Dios mio! Increible!\n" + "Was Avariccio telling the truth?!"),
	scr_line(Characters.DON_BRUTO,  "Men made of pure gold!\n" + "Such artistry, they seem almost lifelike!"),
	scr_line(Characters.DON_BRUTO,  "Maravilloso!\n" + "I'll be rich, filthy rich!\n" + "If only Avariccio were here to see my fortune!"),
	scr_line(Characters.DON_BRUTO,  "Avariccio, there you are! Ah!- Avariccio?\n" + "...Is that you?"),
	scr_line(Characters.DON_BRUTO,  "..."),
];



function scr_cutscene_play(_index, _on_finish = undefined)
{
	if (_index < array_length(global.cutscene_played) && global.cutscene_played[_index])
		return noone;

	var _box = scr_dialogue_start(global.cutscenes[_index], _on_finish);
	if (_box != noone) global.cutscene_played[_index] = true;
	return _box;
}

/// @desc Opens a dialogue box and pauses the game
function scr_dialogue_start(_pages, _on_finish = undefined)
{
	if (instance_exists(obj_gbj14_dialogue))
		return noone;
	// Normalize: strings become speakerless lines.
	var _norm = [];
	for (var i = 0; i < array_length(_pages); ++i)
	{
		var _p = _pages[i];
		array_push(_norm, is_string(_p) ? { who: -1, text: _p } : _p);
	}

	var _box = instance_create_depth(0, 0, OBJECT_DEPTHS.HUD - 1, obj_gbj14_dialogue);
	_box.pages = _norm;
	_box.on_finish = _on_finish;

	global.paused = true;
	global.cutscene_playing = true;

	return _box;
}

/// @desc Pre-wraps text into an array of lines, for typewriter display.
function scr_bitmap_wrap(_text, _width)
{
	var _lines = [];
	var _manual = string_split(_text, "\n");

	for (var m = 0; m < array_length(_manual); ++m)
	{
		var _words = string_split(_manual[m], " ");
		var _line = "";
		for (var i = 0; i < array_length(_words); ++i)
		{
			var _word = _words[i];
			var _test = (_line == "") ? _word : _line + " " + _word;

			if (string_length(_test) * 8 > _width && _line != "")
			{
				array_push(_lines, _line);
				_line = _word;
			}
			else
			{
				_line = _test;
			}
		}
		if (_line != "") array_push(_lines, _line);
	}
	return _lines;
}
