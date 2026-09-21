/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_type = -1;

creator_ID = -1;
creator_id = -1;

is_boss = false;
hp_max = 1;
hp = hp_max;

damage = 1;

damage_color = c_red;
damage_time = 0.1;
damage_timer = 0;

death_effect_index = -1;
// Gold spawned when this enemy is killed (0 = none).
gold_drop = 0;
death_effect_size = 1;
delayed_death_effect = false;

death_next_enemy_index = -1;
death_next_enemy_sprite = -2;
death_next_phase = -1;

block_shots = true;
invulnerable = false;

spiky = false;

sound_damage_crit = snd_gbjam12_enemy_hurt;
sound_damage_boss = snd_gbjam12_player_uncap;
sound_damage = snd_gbjam12_enemy_hurt;
sound_damage_dead = snd_gbjam12_enemy_dead;
sound_armor = snd_gbjam12_player_sword_hit_armor;
sound_dead = -1;
sound_pitch = 1;
sound_volume = 0.75;

if (depth == 0) depth = OBJECT_DEPTHS.ENEMY;

ds_list_add(global.list_enemies, id);

debug_killed = false;
stunned = false;

switch_name = "";

active_room = id;
obeys_room = true;

inactive_when_far_away = true;
despawn_when_far_away = false;
distance_far_away = 320;
respawn_when_far_away = false;