if (other.hits_only_once)
{
	if (ds_list_find_index(other.list_hits, id) > -1)
	{
		exit;
	}
	ds_list_add(other.list_hits, id);
}

obj_enemy_takedamage(other.damage, other.x, other.y);

if (block_shots && !other.piercing)
{
	other.hp = 0;
	other.dying = true;
}