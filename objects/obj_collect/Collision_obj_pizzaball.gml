if (room == rm_editor)
	exit;
if (object_index != obj_escapecollect)
{
	if obj_player1.character == "SP"
		scr_sound_multiple("event:/sfx/misc/collectSP", x, y);
	else
		scr_sound_multiple("event:/sfx/misc/collect", x, y);
}
else
	scr_sound_multiple("event:/sfx/misc/bellcollect", x, y);
if (obj_player1.character == "V")
	global.playerhealth = clamp(global.playerhealth + 1, 0, 100);
global.heattime = min(global.heattime + 10, 60);
global.combotime = min(global.combotime + 10, 60);
with (obj_camera)
	healthshaketime = 30;
var val = heat_calculate(10);
global.collect += val;
create_collect(x, y, sprite_index, val, spr_palette, paletteselect);
with (instance_create(x + 16, y, obj_smallnumber))
	number = string(val);
instance_destroy();
