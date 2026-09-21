
if (cutscene_id < array_length(global.cutscene_played) &&
	global.cutscene_played[cutscene_id])
{
	instance_destroy();
	exit;
}

face_player = true;
vanishing = false;
vanish_fade_time = 0.4;
vanish_effect = spr_effect_ring_large;
vanish_sound = snd_gbjam9_teleport;
affected_by_pause = false;