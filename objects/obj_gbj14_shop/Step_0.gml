
if (input_check_pressed("up" ))   selected_item -= shop_row_size;
if (input_check_pressed("down"))  selected_item += shop_row_size;
if (input_check_pressed("left" )) selected_item -= 1;
if (input_check_pressed("right")) selected_item += 1;
if (selected_item < 0)
	selected_item += array_length(shop_items);
selected_item %= array_length(shop_items);
