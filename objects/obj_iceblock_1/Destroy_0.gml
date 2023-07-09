if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (7)
    {
        with (instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_metaldebrishard
    }
    scr_sound(150)
    if (content != noone)
        instance_create(x, y, content)
    ds_list_add(global.saveroom, id)
}
