if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create((x + 32), (y + 32), obj_cloudeffect))
    {
        image_speed = 0.35
        sprite_index = spr_smallbreak2_dead
    }
    instance_create(x, y, obj_collect)
    audio_stop_sound(sound_destroyblock1)
    audio_stop_sound(sound_destroyblock2)
    scr_sound(choose(82, 83))
    ds_list_add(global.saveroom, id)
}
