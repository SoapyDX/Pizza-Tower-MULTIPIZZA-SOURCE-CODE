if (sprite_index != spr_confectiboxopen)
{
    with (obj_creamThief)
    {
        hsp = 0
        vsp = 0
        state = (0 << 0)
        sprite_index = spr_creamthief_lose
    }
    var _content = instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), BoxContent)
    if (object_get_parent(_content.object_index) == 296)
    {
        with (instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_explosioneffect))
        {
            sprite_index = spr_taunteffect
            depth = -2
        }
        scr_sound(123)
        if (global.toppintotal < 5)
            obj_tv.message = (("YOU ARE ONLY MISSING " + string((5 - global.toppintotal))) + " CONFECTI!")
        if (global.toppintotal == 5)
            obj_tv.message = "YOU GOT ALL CONFECTI!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 200
        global.toppintotal += 1
        global.collect += 1000
        global.combofreeze = 30
        global.combotime = 60
    }
    sprite_index = spr_confectiboxopen
    image_index = 0
    ds_list_add(global.saveroom, id)
}
