/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

invulnerable = true;
damage = 1;
hp_max = 1000000;
hp = hp_max;

sound_dead = asset_get_index("snd_gbj14_rock_break_0" + string(round(random_range(1,5))));
sound_damage_dead = sound_dead;