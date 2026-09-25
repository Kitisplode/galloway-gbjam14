// warm up all shaders during the title, to avoid them compiling mid-game
if (!variable_instance_exists(id, "shaders_warmed"))
{
    shaders_warmed = true;
    var _shaders = [sh_outline, sh_aliustaoglu_outline, sh_gameboy];
    for (var i = 0; i < array_length(_shaders); i++)
    {
        shader_set(_shaders[i]);
        draw_sprite_ext(spr_block_16, 0, 0, 0, 1, 1, 0, c_white, 0.01);
        shader_reset();
    }
}