var _hrw = room_width / 2;
var _hrh = room_height / 2;
var _rw = room_width;
var _rh = room_height;

// Show gbjam 14 logo
scr_scene_Add_Step_Play_Music(queue_steps, -1, 0);
scr_scene_Add_Step(queue_steps, 1);
scr_scene_Add_Step_Sprite_Add(queue_steps, "bg_gbjam14", spr_gbj14_splash_gbjam14, 0,0.25, 100, 0,0,
								0, 2);
scr_scene_Add_Step(queue_steps, 0.38);
scr_scene_Add_Step_Play_Sound(queue_steps, snd_gbj14_keyslam_drop);
scr_scene_Add_Step(queue_steps, 0.7);
scr_scene_Add_Step_Play_Sound(queue_steps, snd_gbj14_keyslam_shine);
scr_scene_Add_Step(queue_steps, 2.5);
scr_scene_Add_Step_Sprite_Remove(queue_steps, "bg_gbjam14", 1);
scr_scene_Add_Step(queue_steps, 0.5);
scr_scene_Add_Step_Sprite_Add(queue_steps, "bg_galloway", spr_gbj14_splash_galloway, 0,0, 101, 0,0,
								1);
scr_scene_Add_Step(queue_steps, 3.5);
scr_scene_Add_Step_Sprite_Remove(queue_steps, "bg_galloway", 1);


scr_scene_Add_Step_Sprite_Add(queue_steps, "bg_title", spr_gbj14_splash_title, 0,0, 102, 0,0,
								0);
								
scr_scene_Add_Step_Pause_For_Input(queue_steps, ["a", "b", "start"]);
scr_scene_Add_Step_Play_Music(queue_steps, -1, 1);
scr_scene_Add_Step_RoomFade(queue_steps, rm_gbj14_blah, 1, c_white);

skip_to = 12;

if (instance_exists(obj_camera))
{
	obj_camera.follow = id;
}