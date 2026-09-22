// Inherit the parent event
event_inherited();

if (show_flashing)
{
    gpu_set_fog(true, c_white, 0, 1000);
    draw_self();
    gpu_set_fog(false, c_white, 0, 1000);
}
