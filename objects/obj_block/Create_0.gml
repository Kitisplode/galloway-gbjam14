event_inherited();

//image_blend = c_gray;

z = 0;
z_height = 32;

solid = true;
pushes_others = true;
position = r3(x,y,z);
normal_vector = r3(0,-1,0);

ds_list_add(global.list_solids, id);

depth = OBJECT_DEPTHS.LEVEL;

//draw_2d_z = true;

visible = global.debug_show_level_blocks;