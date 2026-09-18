// ============================================================================
// This object represents the top level audio controller.
// It's responsible for playing music and keeping track of the global audio
// variables.
// ============================================================================
if (instance_number(obj_main_audio) > 1)
{
    instance_destroy(id, false);
    exit;
}

global.volume_main = 0.75;
global.volume_music = 0.75;
global.volume_sounds = 1;

music_looped_times = 0;
global.music_current_instance = -1;
global.music_current_id = -1;
global.music_target_id = -1;

global.music_fade_enabled = false;
global.music_fade_time = 2;
global.music_fade_cutoff = 0.05;
global.music_loop = true;

global.music_priority = 30;

global.player_sound_priority = 10;

list_audio_instances = ds_list_create();

list_music_intros = ds_list_create();
list_music_loops = ds_list_create();

//scr_audio_add_song(mus_nm_title_intro, mus_nm_title_loop);
//scr_audio_add_song(mus_nm_play_intro, mus_nm_play_loop);
//scr_audio_add_song(mus_nm_boss_intro, mus_nm_boss_loop);
//scr_audio_add_song(mus_nm_cirno_intro, mus_nm_cirno_loop);

scr_audio_add_song(mus_gbjam12_escape_intro, mus_gbjam12_escape_loop);
scr_audio_add_song(mus_gbj14_lexou_conquistador_intro, mus_gbj14_lexou_conquistador_loop);
scr_audio_add_song(mus_gbj14_lexou_pyramid_intro, mus_gbj14_lexou_pyramid_loop);