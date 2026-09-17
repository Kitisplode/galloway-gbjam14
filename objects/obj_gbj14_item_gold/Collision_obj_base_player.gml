/// @description Insert description here
// You can write your code in this editor
if (collection_timer > 0) return;
if (audio_exists(collection_sound)) play_sound(collection_sound, 1, 0, 1, collection_sound_pitch, 0.5);
global.player_score += worth;
instance_destroy();