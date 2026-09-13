

function scr_setup_spawnlists()
{
	global.enemy_current_type = 4;
	global.enemy_previous = -1;
	
	// Splits (Rocks)
	var _i = 1;
	global.enemy_types[_i,0] = obj_nm_en_split_a_01;
	global.enemy_types[_i,1] = obj_nm_en_split_b_01;
	global.enemy_types[_i,2] = obj_nm_en_split_c_01;
	global.enemy_types[_i,3] = obj_nm_en_split_a_01;
	global.enemy_boss[_i] = obj_nm_en_split__boss_01_spawn;
	global.enemy_waves[_i,0] = 10;
	global.enemy_waves[_i,1] = 13;
	global.enemy_music[_i,0] = mus_nm_play_intro;
	global.enemy_music[_i,1] = mus_nm_boss_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.weapon_equipped[_i] = false;
	global.enemy_palette[_i] = 0;
	
	// Armors (Bugs)
	_i = 2;
	global.enemy_types[_i,0] = obj_nm_en_armor_a_01;
	global.enemy_types[_i,1] = obj_nm_en_armor_b_01;
	global.enemy_types[_i,2] = obj_nm_en_armor_c_01;
	global.enemy_types[_i,3] = obj_nm_en_armor_a_01;
	global.enemy_boss[_i] = obj_nm_en_armor__boss_01_spawn;
	global.enemy_waves[_i,0] = 10;
	global.enemy_waves[_i,1] = 13;
	global.enemy_music[_i,0] = mus_nm_play_intro;
	global.enemy_music[_i,1] = mus_nm_boss_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.weapon_equipped[_i] = false;
	global.enemy_palette[_i] = 10;
	
	// Gravity (worms)
	_i = 3;
	global.enemy_types[_i,0] = obj_nm_en_gravity_a_02;
	global.enemy_types[_i,1] = obj_nm_en_gravity_b_01;
	global.enemy_types[_i,2] = obj_nm_en_gravity_c_01;
	global.enemy_types[_i,3] = obj_nm_en_gravity_a_01;
	global.enemy_boss[_i] = obj_nm_en_armor__boss_01_spawn;
	global.enemy_waves[_i,0] = 10;
	global.enemy_waves[_i,1] = 13;
	global.enemy_music[_i,0] = mus_nm_play_intro;
	global.enemy_music[_i,1] = mus_nm_boss_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.enemy_done[_i] = true;
	global.enemy_palette[_i] = 11;
	
	// Ranged attacks
	_i = 4;
	global.enemy_types[_i,0] = obj_nm_en_aim_a_01;
	global.enemy_types[_i,1] = obj_nm_en_aim_b_01;
	global.enemy_types[_i,2] = obj_nm_en_aim_c_02;
	global.enemy_types[_i,3] = obj_nm_en_aim_a_01;
	global.enemy_boss[_i] = obj_nm_en_aim__boss_01_spawn;
	global.enemy_waves[_i,0] = 10;
	global.enemy_waves[_i,1] = 13;
	global.enemy_music[_i,0] = mus_nm_play_intro;
	global.enemy_music[_i,1] = mus_nm_boss_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.enemy_done[_i] = false;
	global.enemy_palette[_i] = 18;
	
	// idk
	_i = 5;
	global.enemy_types[_i,0] = obj_nm_en_idk_a_01;
	global.enemy_types[_i,1] = obj_nm_en_aim_b_01;
	global.enemy_types[_i,2] = obj_nm_en_aim_c_01;
	global.enemy_types[_i,3] = obj_nm_en_aim_a_01;
	global.enemy_boss[_i] = obj_nm_en_armor__boss_01_spawn;
	global.enemy_waves[_i,0] = 10;
	global.enemy_waves[_i,1] = 13;
	global.enemy_music[_i,0] = mus_nm_play_intro;
	global.enemy_music[_i,1] = mus_nm_boss_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.enemy_done[_i] = true;
	global.enemy_palette[_i] = 0;
	
	// Bombs
	_i = 6;
	global.enemy_done[_i] = true;
	
	// Formations
	_i = 7;
	global.enemy_done[_i] = true;
	
	// Trails
	_i = 8;
	global.enemy_done[_i] = true;
	
	// Extra enemy types:
	
	// Cirno secret boss
	_i = 9999;
	global.enemy_types[_i,0] = obj_nm_en_cirno_01_spawn;
	global.enemy_types[_i,1] = obj_nm_en_cirno_01_spawn;
	global.enemy_types[_i,2] = obj_nm_en_cirno_01_spawn;
	global.enemy_types[_i,3] = obj_nm_en_cirno_01_spawn;
	global.enemy_boss[_i] = obj_nm_en_cirno_01_spawn;
	global.enemy_waves[_i,0] = 0; // No waves, meaning we just skip to the boss.
	global.enemy_waves[_i,1] = 0;
	global.enemy_music[_i,0] = mus_nm_cirno_intro;
	global.enemy_music[_i,1] = mus_nm_cirno_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.weapon_equipped[_i] = false;
	global.enemy_palette[_i] = 0;
	
	// Tutorial
	_i = 999;
	global.enemy_types[_i,0] = obj_nm_en_target_a_01;
	global.enemy_types[_i,1] = obj_nm_en_target_b_01;
	global.enemy_types[_i,2] = obj_nm_en_target_c_02;
	global.enemy_types[_i,3] = obj_nm_en_target_b_01;
	global.enemy_boss[_i] = obj_nm_en_target__boss_01_spawn;
	global.enemy_waves[_i,0] = 10;
	global.enemy_waves[_i,1] = 13;
	global.enemy_music[_i,0] = mus_nm_play_intro;
	global.enemy_music[_i,1] = mus_nm_boss_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_grey;
	global.weapon_equipped[_i] = false;
	global.enemy_palette[_i] = 4;
}

function scr_setup_difficulties()
{
	global.difficulty_max_cost[0] = 3;
	global.difficulty_cost_increment[0] = 0.35;
	
	global.difficulty_max_cost[1] = 4;
	global.difficulty_cost_increment[1] = 0.35;
}