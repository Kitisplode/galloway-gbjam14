if (global.debug_global) global.in_shop = global.paused; // TODO remove this in release build

if (global.in_shop && !global.cutscene_playing)
{
	if (input_check_pressed("up" ))   selected_item -= shop_row_size;
	if (input_check_pressed("down"))  selected_item += shop_row_size;
	if (input_check_pressed("left" )) selected_item -= 1;
	if (input_check_pressed("right")) selected_item += 1;
	if (selected_item < 0)
		selected_item += array_length(shop_items);
	selected_item %= array_length(shop_items);
	
	if (input_check_pressed("b"))
	{
		global.in_shop = false;
		if (global.debug_global) global.paused = false; // TODO remove this in release build
	}
	if (input_check_pressed("a"))
	{
		var _player = obj_gbj14_player;
		var _item = shop_items[selected_item];
		if (global.player_score >= _item.price)
		{
			global.player_score -= _item.price;
			scr_gbj14_player_Add_Item(_player, _item);
			play_sound(snd_gbj14_coin_small, 1, 0, 1, 1, 0);
		}
		else
		{
			play_sound(snd_gbj14_player_hurt, 1, 0, 1, 1, 0);
		}
	}
}
