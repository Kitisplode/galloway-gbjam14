
depth = OBJECT_DEPTHS.HUD;

global.in_shop = false;
if (global.debug_global) global.player_score = 1000; // TODO remove this in release build

shop_items = [
//  { name: "Lift",    price:   0, uses: -1, sprite: spr_gbj14_hud_item_lift   , sound: snd_gbj14_player_attack, script: "scr_gbj14_player_Use_Item_Lift"   , show_cursor: ""                               , description: "Lift and carry objects." },
    { name: "Shovel",  price: 100, uses: 10, sprite: spr_gbj14_hud_item_shovel , sound: snd_gbj14_player_attack, script: "scr_gbj14_player_Use_Item_Shovel" , show_cursor: "scr_gbj14_player_Cursor_Tool"   , description: "Can dig through sand and rocks." },
    { name: "Pickaxe", price: 200, uses: 10, sprite: spr_gbj14_hud_item_pick   , sound: snd_gbj14_player_attack, script: "scr_gbj14_player_Use_Item_Pick"   , show_cursor: "scr_gbj14_player_Cursor_Tool"   , description: "Can dig through bricks and stone." },
    { name: "Bomb",    price:  50, uses:  1, sprite: spr_gbj14_hud_item_bomb   , sound: snd_gbj14_player_attack, script: "scr_gbj14_player_Use_Item_Bomb"   , show_cursor: ""                               , description: "Blasts through almost anything." },
    { name: "Ladder",  price:  50, uses:  1, sprite: spr_gbj14_hud_item_ladder , sound: snd_gbj14_player_attack, script: "scr_gbj14_player_Use_Item_Ladder" , show_cursor: "scr_gbj14_player_Cursor_Ladder" , description: "Put this down to climb upwards." },
//  { name: "Springs", price: 500, uses: -1, sprite: spr_gbj14_hud_item_shoes  , sound: snd_gbj14_player_attack, script: ""                                 , show_cursor: ""                               , description: "Allows you to jump higher." },
    { name: "Box",	   price:  50, uses:  1, sprite: spr_gbj14_hud_item_box    , sound: snd_gbj14_player_attack, script: "scr_gbj14_player_Use_Item_Box"    , show_cursor: ""                               , description: "Lift and throw them." },
//  { name: "Coffee",  price: 500, uses: -1, sprite: spr_gbj14_hud_item_coffee , sound: snd_gbj14_player_attack, script: ""                                 , show_cursor: ""                               , description: "Allows you to move faster." },
//  { name: "Musket",  price: 500, uses: 10, sprite: spr_gbj14_hud_item_musket , sound: snd_gbj14_player_attack, script: "scr_gbj14_player_Use_Item_Musket" , show_cursor: ""                               , description: "Can shoot at foes from afar." },
    { name: "Ankh",    price: 300, uses:  1, sprite: spr_gbj14_hud_item_ankh   , sound: snd_gbj14_player_attack, script: ""                                 , show_cursor: ""                               , description: "Revive after death once." },
];
shop_row_size = 3;
selected_item = 0;