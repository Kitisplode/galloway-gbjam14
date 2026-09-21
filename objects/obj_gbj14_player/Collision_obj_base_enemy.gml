/// @description Insert description here
// You can write your code in this editor

// No damage during the ending sequence.
if (action == 3) exit;

var _invuln_timer_previous = invuln_timer;

// Inherit the parent event
event_inherited();

if (_invuln_timer_previous != invuln_timer)
{
	var _dir = point_direction(other.position[0],other.position[1], position[0],position[1]);
	action = 0;
	hurt_timer = hurt_time;
	velocity[0] = cos(degtorad(_dir)) * run_speed;
	velocity[1] = -abs(sin(degtorad(_dir)) * run_speed);
	play_sound(snd_gbj14_player_hurt, 1, 0, 2,1,0.5);
	play_sound(snd_gbj14_knock, 1, 0, 1,1,0);
	
	if (carry_id != id)
	{
		_scr_gbj14_player_Use_Item_Throw(r3_zero());
		// Delete the throw item.
		if (ds_list_size(list_items) > 0)
		{
			var _item = ds_list_find_value(list_items, 0);
			if (_item.name == "Throw")
			{
				ds_list_delete(list_items, 0);
			}
		}
	}
}
