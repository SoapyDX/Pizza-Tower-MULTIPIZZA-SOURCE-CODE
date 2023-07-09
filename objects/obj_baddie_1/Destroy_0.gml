if ((ds_list_find_index(global.baddieroom, id) == -1 && inhaleddestroyvar == 0) || (important && inhaleddestroyvar == 0))
{
    repeat (3)
    {
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
    }
    instance_create(x, (y + 30), obj_bangeffect)
    camera_shake(3, 3)
    if debris
    {
        with (instance_create(x, y, obj_baddieDead))
        {
            canrotate = 1
            image_xscale = other.image_xscale
            sprite_index = other.deadspr
            hsp = other.initialhsp
            vsp = other.initialvsp
            spr_palette = other.spr_palette
            paletteselect = other.paletteselect
        }
    }
    if chance(0.05)
        scr_sound(191, 66, 21, 28, 183, 176)
    var combob = clamp(global.combo, 1, 4)
    var combobsnd = asset_get_index(("sound_combo" + string(combob)))
    scr_sound(combobsnd)
    if (!important)
    {
        global.combo++
        var _score = (10 + floor((global.combo * 0.5)))
        create_small_number(x, y, string(_score))
        global.collect += _score
        global.combotime = 60
        global.style += 4
        global.combofreeze = 30
        if (obj_tv.sucroseTimer && global.fill != 0)
            global.fill += time_in_frames(0, 2.5)
    }
    ds_list_add(global.baddieroom, id)
    if panicEscape
        ds_list_add(global.escaperoom, id)
}
if (inhaleddestroyvar == 1)
{
    with (obj_player)
    {
        inhalingenemy = 1
        storedinhalebaddie = object_get_name(other.object_index)
    }
}
