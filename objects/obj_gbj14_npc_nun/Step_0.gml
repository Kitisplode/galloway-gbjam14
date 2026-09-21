if (face_player && instance_exists(obj_gbj14_player))
{
	var _player = instance_find(obj_gbj14_player, 0);
	image_xscale = (_player.x < x) ? -1 : 1;
}
