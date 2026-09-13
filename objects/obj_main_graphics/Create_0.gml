// ============================================================================
// This object represents the top level graphics controller.
// It's responsible for keeping track of any global graphics-related details.
// ============================================================================
if (instance_number(obj_main_graphics) > 1)
{
    instance_destroy(id, false);
    exit;
}

shaders_on = true;

view_width = 160;
view_height = 144;
view_ratio = 1;
display_set_gui_size(view_width, view_height);

palette_count = 0;
previous_palette = 0;
current_palette = 0;
palette_lerp = 0;
palette_lerp_time = 0.5;

// GBJAM14 Default palette
scr_Main_Graphics_add_palette(#DAC888, #957C6C, #4C3E49, #1E1B1D);

// Gray
// 0 2bit Demichrome = https://lospec.com/palette-list/2bit-demichrome
scr_Main_Graphics_add_palette(#e9efec, #a0a08b, #555568, #211e20);
// 1 Metallic GB = https://lospec.com/palette-list/metallic-gb
scr_Main_Graphics_add_palette(#c5dbd4, #778e98, #41485d, #221e31);
// 2 Lospec GB = https://lospec.com/palette-list/lospec-gb
scr_Main_Graphics_add_palette(#c7c6c6, #7c6d80, #382843, #000000);
// 3 The Internet Raised You = https://lospec.com/palette-list/the-internet-raised-you
scr_Main_Graphics_add_palette(#e4d6cf, #9b9880, #7b505c, #322623);
// 4 Weekly Release! = https://lospec.com/palette-list/weekly-release
scr_Main_Graphics_add_palette(#cccec7, #a09f97, #77746f, #2e2622);

// Green
// 5 Muddysand GB = https://lospec.com/palette-list/muddysand
scr_Main_Graphics_add_palette(#e6d69c, #b4a56a, #7b7162, #393829);
// 6 Nostalgia GB = https://lospec.com/palette-list/nostalgia
scr_Main_Graphics_add_palette(#d0d058, #a0a840, #708028, #405010);
// 7 MIST GB = https://lospec.com/palette-list/mist-gb
scr_Main_Graphics_add_palette(#c4f0c2, #5ab9a8, #1e606e, #2d1b00);
// 8 Moonlight GB = https://lospec.com/palette-list/moonlight-gb
scr_Main_Graphics_add_palette(#5fc75d, #36868f, #203671, #0f052d);
// 9 Nymph GB
scr_Main_Graphics_add_palette(#a1ef8c, #3fac95, #446176, #2c2137);
// 10 CRTGB = https://lospec.com/palette-list/crtgb
scr_Main_Graphics_add_palette(#daf222, #489a0d, #0b3e08, #060601);

// Red
// 11 Red is dead = https://lospec.com/palette-list/red-is-dead
scr_Main_Graphics_add_palette(#fffcfe, #ff0015, #860020, #11070a);
// 12 Red-blood Pain = https://lospec.com/palette-list/red-blood-pain
scr_Main_Graphics_add_palette(#c4181f, #7e1f23, #5e4069, #120a19);


// Other
// 13 Bittersweet = https://lospec.com/palette-list/bittersweet
scr_Main_Graphics_add_palette(#a3a29a, #c56981, #545c7e, #282328);
// 14 T-Lollipop = https://lospec.com/palette-list/t-lollipop
scr_Main_Graphics_add_palette(#e6f2ef, #f783b0, #3f6d9e, #151640);
// 15 PONG4 = https://lospec.com/palette-list/pong4
scr_Main_Graphics_add_palette(#fdfff2, #14e1ff, #ff7ad6, #5c4bff);
// 16 Amber CRTGB
scr_Main_Graphics_add_palette(#fed018, #d35600, #5e1210, #0d0405);
// 17 Hallowpumpkin = https://lospec.com/palette-list/hallowpumpkin
scr_Main_Graphics_add_palette(#f8f088, #f89020, #602878, #300030);
// 18 Yana's Modernized Pokemon SGB
scr_Main_Graphics_add_palette(#ffefff, #f7b58c, #876bb2, #471e4c);
// 19 B4sement = https://lospec.com/palette-list/b4sement
scr_Main_Graphics_add_palette(#f0f6f0, #3dff98, #ff4adc, #222323);


// Set up the initial gameboy shader colors.
scr_set_gb_shader_colors(palette[current_palette].c1,
						 palette[current_palette].c2,
						 palette[current_palette].c3,
						 palette[current_palette].c4);



//gpu_set_ztestenable(true);
//gpu_set_alphatestenable(true);
//gpu_set_zfunc(cmpfunc_greaterequal);