function Instakill()
{
	var hx = other.baddieID.x;
	var hy = other.baddieID.y;
	if (other.baddieID.state == states.hit)
	{
		hx = other.baddieID.hitX;
		hy = other.baddieID.hitY;
	}
	other.baddieID.grabbedby = 1;
	if (object_index == obj_player2)
		other.baddieID.grabbedby = 2;
	if (state == states.firemouth)
	{
		repeat (8)
		{
			with (instance_create(other.baddieID.x, other.baddieID.y, obj_firemouthflame))
			{
				hsp = random_range(5, 10);
				vsp = random_range(5, 10);
			}
		}
	}
	if (state == states.mach3 && character != "SP" && sprite_index != spr_Sjumpcancel && sprite_index != spr_mach3hit && sprite_index != spr_playerN_jetpackboost && sprite_index != spr_playerN_jetpackslide)
	{
		if (fightball == 0)
			sprite_index = spr_mach3hit;
		image_index = 0;
	}
	if (state == states.chainsawbump && sprite_index != spr_player_chainsawhit)
	{
		image_index = 0;
		sprite_index = spr_player_chainsawhit;
	}
	other.baddieID.invtime = 25;
	suplexmove = true;
	if (object_index == obj_player1)
		other.baddieID.grabbedby = 1;
	else
		other.baddieID.grabbedby = 2;
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (other.baddieID.elite && other.baddieID.object_index != obj_pepperman && other.baddieID.object_index != obj_pizzafaceboss && other.baddieID.object_index != obj_vigilanteboss && other.baddieID.object_index != obj_noiseboss && other.baddieID.object_index != obj_fakepepboss && other.baddieID.object_index != obj_pf_fakepep && other.baddieID.object_index != obj_pizzafaceboss_p3)
		other.baddieID.elitehit = 0;
	other.baddieID.player_instakillmove = true;
	if (!other.baddieID.important)
		global.style += (3 + floor(global.combo / heat_nerf));
	if (!other.baddieID.elite or other.baddieID.elitehit <= 0)
		other.baddieID.mach3destroy = true;
	if (!other.baddieID.killprotection && !global.kungfu && (!other.baddieID.elite or other.baddieID.elitehit <= 0))
		other.baddieID.instakilled = true;
	if (!other.baddieID.important)
	{
		global.combotime = 60;
		global.heattime = 60;
	}
	global.hit += 1;
	if (!grounded && state != states.ratmountgroundpound && state != states.ratmountpunch && state != states.ratmountpunch && state != states.boxxedpepspin && state != states.freefall && (key_jump2 or input_buffer_jump > 0 or state == states.jetpackjump))
	{
		input_buffer_jump = 0;
		suplexmove = false;
		vsp = -11;
	}
	if (state == states.boxxedpepspin)
	{
		if (key_jump2)
			vsp = -10;
		boxxedpepjump = 10;
	}
	if (character == "M" && state == states.freefall)
	{
		vsp = -11;
		state = states.jump;
		sprite_index = spr_jump;
	}
	if (state != states.chainsaw)
	{
		tauntstoredmovespeed = movespeed;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		tauntstoredvsp = vsp;
	}
	if (state == states.handstandjump && !key_slap)
	{
		image_index = random_range(0, image_number - 1);
		if (grounded)
			sprite_index = spr_player_groundedattack;
		else
			sprite_index = spr_player_ungroundedattack;
	}
	if (state == states.chainsawbump && !global.kungfu)
	{
		sprite_index = spr_player_chainsawhit;
		image_index = 0;
	}
	
	var lag = 5;
	if (other.baddieID.heavy == 1 or (state == states.punch && global.attackstyle == 1))
		lag = 15;
	if state == states.handstandjump
		lag = 10;
	
	other.baddieID.hitLag = lag;
	other.baddieID.hitX = hx;
	other.baddieID.hitY = hy;
	other.baddieID.hp -= 1;
	hitLag = lag;
	hitX = x;
	hitY = y;
	instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect);
	other.baddieID.alarm[3] = 3;
	other.baddieID.state = states.hit;
	other.baddieID.image_xscale = -xscale;
	repeat 3
	{
		create_slapstar(x, y);
		create_baddiegibs(x, y);
	}
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	if (state != states.mach2 && state != states.tumble)
	{
		with (instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect))
			sprite_index = spr_kungfueffect;
	}
	if state == states.handstandjump && !check_boss(other.baddieID.object_index)
	{
		if key_up
        {
            other.baddieID.hitvsp = -11;
            other.baddieID.hithsp = 0;
        }
        else if key_down
        {
            other.baddieID.hitvsp = 11;
            other.baddieID.hithsp = 0;
        }
        else
        {
            other.baddieID.hitvsp = -8;
            other.baddieID.hithsp = -other.baddieID.image_xscale * 8;
        }
		other.baddieID.shoulderbashed = true; // reduces hp minimum to die to -6
		suplexmove = false;
	}
	else
	{
		other.baddieID.hithsp = xscale * (movespeed + 2);
		if (abs(other.baddieID.hithsp) < 10)
			other.baddieID.hithsp = xscale * 10;
		other.baddieID.hitvsp = -5;
	}
	state = states.chainsaw;
}
