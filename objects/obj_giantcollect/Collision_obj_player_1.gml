audio_stop_sound(sound_points)
audio_stop_sound(sound_pizzagot)
scr_sound(104)
scr_sound(105)
scr_ghostcollectible()
global.collectsound = 0
scr_queue_tvanim(obj_tv.happytvspr, 200)
global.collect += 1000
global.pizzameter += 5
create_small_number(x, y, "1000")
global.combofreeze = 30
global.combotime = 60
repeat (15)
    instance_create(((x + random_range(-60, 60)) - 16), ((y + random_range(-60, 60)) - 16), obj_collecteffect)
instance_destroy()
