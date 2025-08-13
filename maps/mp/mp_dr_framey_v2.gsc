main()
{
	maps\mp\_load::main();
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );
    setdvar( "r_glowbloomintensity0", ".25" );
    setdvar( "r_glowbloomintensity1", ".25" );
    setdvar( "r_glowskybleedintensity0", ".3" );
	
    setdvar( "compassmaxrange", "1800" );
	
	setDvar("bg_falldamagemaxheight", 1500 );
	setDvar("bg_falldamageminheight", 1000 );
	
	precacheitem("deserteaglegold_mp");
	
	level.fx_blood = LoadFX("custom/blood_pool");
	level.fx_light = LoadFX("custom/neon/light_blue");
	level.fx_power = LoadFX("custom/framey/power_bullet");
	level.fx_power_body = LoadFX("custom/framey/power");
	level.fx_ash = LoadFX("custom/framey/ash");
	level.fx_bugs = LoadFX("custom/framey/bugs");
	level.fx_war = LoadFX("custom/framey/war");
	level.fx_portal = LoadFX("custom/framey/portal");
	level.fx_wingzor = LoadFX("custom/framey/wingzor");
	
	SetExpFog(3000, 5000, 0, .69, .88, 10);
	
	level.trap8_activated = false;
	
	addTriggerToList( "trigger_trap1" );
    addTriggerToList( "trigger_trap2" );
    addTriggerToList( "trigger_trap3" );
    addTriggerToList( "trigger_trap4" );
    addTriggerToList( "trigger_trap5" );
    addTriggerToList( "trigger_trap6" );
	addTriggerToList( "trigger_trap7" );
	addTriggerToList( "trigger_trap8" );
	
	thread addTestClients();
	
	thread on_start();
	thread on_endroom();
	
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	
	thread shaft();
	thread hallway();
	thread platform_rotate();
	thread shortcut();
	thread ammo();
	thread war();
	thread tube();
}

on_start()
{
	door = getEnt("startdoor", "targetname");
	platform = getEnt("platform", "targetname");
	
	death1 = getEnt("death_trigger1", "targetname");
	death2 = getEnt("death_trigger2", "targetname");
	death3 = getEnt("death_trigger3", "targetname");
	death4 = getEnt("death_trigger4", "targetname");
	death5 = getEnt("death_trigger5", "targetname");
	death6 = getEnt("death_trigger6", "targetname");
	death7 = getEnt("death_trigger7", "targetname");
	death8 = getEnt("death_trigger8", "targetname");
	
	level waittill("round_started");
	ambientPlay ("paradise");
	
	playFx(level.fx_ash, (336, 160, -584));
	playFx(level.fx_ash, (336, -1872, -584));
	playFx(level.fx_ash, (2032, 144, -584));
	playFx(level.fx_ash, (2032, -1872, -584));
	playFx(level.fx_ash, (1648, 1200, -584));
	playFx(level.fx_ash, (272, 1200, -584));
	playFx(level.fx_ash, (-16, 3216, -584));
	playFx(level.fx_ash, (-16, 5168, -584));
	playFx(level.fx_ash, (2768, -7152, 184));
	playFx(level.fx_ash, (816, -7152, 184));
	playFx(level.fx_ash, (368, -5360, 184));
	
	playFx(level.fx_wingzor, (-639, 1728, -160));
	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < players.size; i++)
	{
		players[i].usedVendor = false;		// got gold deagle
		players[i].gotEndroomGun = false;	// got endroom gun
		players[i].gotAmmo = false;			// got special ammo
		players[i].gotHallwayXP = false;	// got XP for finishing hallway
	}
	
	thread death_trigger(death1);
	thread death_trigger(death2);
	thread death_trigger(death3);
	thread death_trigger(death4);
	thread death_trigger(death5);
	thread death_trigger(death6);
	thread death_trigger(death7);
	thread death_trigger(death8);
	
	thread enter_scr();
	thread scr1();
	thread scr2();
	thread scr3();
	thread scr4();
	
	wait 9;
	
	iPrintLnBold("^2The door is opening!");
	
	door moveZ(-320, 13, 2, 8);
	wait 13;
	
	for(;;)
	{
		platform moveX(-848, 5, 2, 3);
		platform waittill("movedone");
		wait 2;
		
		platform moveX(848, 5, 2, 3);
		platform waittill("movedone");
	}
}

on_endroom()
{
	level.trigger_jump = getEnt("endroom_jump_trigger", "targetname");
	level.trigger_old = getEnt("endroom_old_trigger", "targetname");
	level.trigger_sniper = getEnt("endroom_sniper_trigger", "targetname");
	
	level.door_jump = getEnt("endroom_jump_door", "targetname");
	level.door_old = getEnt("endroom_old_door", "targetname");
	level.door_sniper = getEnt("endroom_sniper_door", "targetname");
	
	level.cover1 = getEnt("endroom_cover", "targetname");
	level.cover2 = getEnt("endroom_cover2", "targetname");
	level.jump_wall = getEnt("endroom_jump_wall", "targetname");
	level.sniper_wall = getEnt("endroom_sniper_wall", "targetname");
	level.sniper_wall2 = getEnt("endroom_sniper_wall2", "targetname");
	
	block_j = getEnt("endroom_jump_block1", "targetname");
	block_a = getEnt("endroom_jump_block2", "targetname");
	
	level.cover1 moveZ(-112, .1);
	level.cover2 moveZ(-192, .1);
	
	thread on_sniper();
	thread on_old();
	thread on_jump();
	
	thread on_respawn();
	
	for(;;)
	{
		block_j moveX(368, 4, 2, 2);
		block_a moveX(-368, 4, 2, 2);
		block_a waittill("movedone");
		
		block_j moveX(-368, 4, 2, 2);
		block_a moveX(368, 4, 2, 2);
		block_a waittill("movedone");
	}
}

on_respawn()
{
	trigger = getEnt("endroom_jump_respawn_trigger", "targetname");
	j_respawn = getEnt("endroom_jump_respawn_j", "targetname");
	a_respawn = getEnt("endroom_jump_respawn_a", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(level.activ) && player == level.activ)
		{
			player setOrigin(a_respawn.origin);
			player setPlayerAngles(a_respawn.angles);
		}
		else
		{
			player setOrigin(j_respawn.origin);
			player setPlayerAngles(j_respawn.angles);
		}
	}
}

on_sniper()
{
	level.trigger_sniper waittill("trigger", player);
	
	player takeAllWeapons();
	player giveWeapon("knife_mp");
	player giveWeapon("m40a3_mp");
	player giveMaxAmmo("m40a3_mp");
	player switchToWeapon("m40a3_mp");
	
	if(isDefined(level.activ))
	{
		level.activ takeAllWeapons();
		level.activ giveWeapon("knife_mp");
		level.activ giveWeapon("m40a3_mp");
		level.activ giveMaxAmmo("m40a3_mp");
		level.activ switchToWeapon("m40a3_mp");
	}
	
	iPrintLnBold("^1" + player.name + " ^7 has picked ^2Sniper Game!");
	
	if(isDefined(player.gotEndroomGun))
		player.gotEndroomGun = true;
	
	thread endroom_sniper_weapon();
	
	if(!isDefined(level.trigger_jump) && !isDefined(level.trigger_old) && !isDefined(level.trigger_sniper))
		return;
	
	level.trigger_jump delete();
	level.trigger_old delete();
	level.trigger_sniper delete();
	
	level.sniper_wall moveZ(-560, 1);
	level.sniper_wall2 moveZ(-560, 1, .5, .5);
	
	level.cover1 moveZ(112, 1);
	level.cover2 moveZ(192, 1);
	
	level.door_sniper moveZ(-160, 2, 1, 1);
	level.door_sniper waittill("movedone");
	
	level.sniper_wall delete();
	level.sniper_wall2 delete();
}

on_old()
{
	level.trigger_old waittill("trigger", player);
	
	iPrintLnBold("^1" + player.name + " ^7 has picked ^2Classic!");
	
	if(!isDefined(level.trigger_jump) && !isDefined(level.trigger_old) && !isDefined(level.trigger_sniper))
		return;
	
	level.trigger_jump delete();
	level.trigger_sniper delete();
	level.trigger_old delete();
	
	level.cover2 moveZ(192, 1);
	
	level.sniper_wall moveZ(-560, 1);
	level.sniper_wall2 moveZ(-560, 1, .5, .5);
	
	level.door_old moveZ(-160, 2, 1, 1);
	level.door_old waittill("movedone");
	
	level.sniper_wall delete();
	level.sniper_wall2 delete();
}

on_jump()
{
	level.trigger_jump waittill("trigger", player);
	
	iPrintLnBold("^1" + player.name + " ^7 has picked ^2Jumper Game!");
	
	player takeAllWeapons();
	player giveWeapon("knife_mp");
	player switchToWeapon("knife_mp");
	
	if(isDefined(player.gotEndroomGun))
		player.gotEndroomGun = true;
	
	thread endroom_jump_weapon();
	
	if(isDefined(level.activ))
	{
		level.activ takeAllWeapons();
		level.activ giveWeapon("knife_mp");
		level.activ switchToWeapon("knife_mp");
	}
	
	if(!isDefined(level.trigger_jump) && !isDefined(level.trigger_old) && !isDefined(level.trigger_sniper))
		return;
	
	level.trigger_jump delete();
	level.trigger_sniper delete();
	level.trigger_old delete();
	
	level.jump_wall moveZ(-544, 1);
	
	level.sniper_wall2 moveZ(-560, 1, .5, .5);
	level.door_jump moveZ(-160, 2, 1, 1);
	level.door_jump waittill("movedone");
	
	thread endroom_jump_finish_weapon();
	
	level.sniper_wall2 delete();
	level.jump_wall delete();
}

endroom_sniper_weapon()
{		
	trigger = getEnt("trigger_end", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(player.gotEndroomGun) && !player.gotEndroomGun)
		{
			player takeAllWeapons();
			player giveWeapon("knife_mp");
			player giveWeapon("m40a3_mp");
			player giveMaxAmmo("m40a3_mp");
			player switchToWeapon("m40a3_mp");
			
			player braxi\_rank::giveRankXp("trap_activation");
			
			player.gotEndroomGun = true;
		}
		
		wait .05;
	}
}

endroom_jump_weapon()
{
	trigger = getEnt("trigger_end", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(player.gotEndroomGun) && !player.gotEndroomGun)
		{
			player takeAllWeapons();
			player giveWeapon("knife_mp");
			player switchToWeapon("knife_mp");
			
			player braxi\_rank::giveRankXp("trap_activation");
			
			player.gotEndroomGun = true;
		}
		
		wait .05;
	}
}

endroom_jump_finish_weapon()
{
	trigger = getEnt("trigger_endroom_jump_weapon", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(!isDefined(player.getJumpWeapon))
		{
			player giveWeapon("m40a3_mp");
			player giveMaxAmmo("m40a3_mp");
			player switchToWeapon("m40a3_mp");
			
			player.getJumpWeapon = true;
		}
		
		wait .5;
	}
}

addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers))
        level.trapTriggers = [];
	
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()
{
	block1 = getEnt("trap1_target1", "targetname");
	block2 = getEnt("trap1_target2", "targetname");
	block3 = getEnt("trap1_target3", "targetname");
	
	level.trapTriggers[0] waittill("trigger", player);
	
	playFx(level.fx_bugs, (1952, 672, -192));
	
	for(;;)
	{
		block1 moveZ(48, 1, .5, .5);
		block1 waittill("movedone");
		
		block1 moveZ(-48, 1, .5, .5);
		block2 moveZ(48, 1, .5, .5);
		block2 waittill("movedone");
		
		block2 moveZ(-48, 1, .5, .5);
		block3 moveZ(48, 1, .5, .5);
		block3 waittill("movedone");
		
		block3 moveZ(-48, 1, .5, .5);
	}
}

trap2()
{
	spikes = getEnt("trap2_target", "targetname");
	hurt = getEnt("trap2_hurt_trigger", "targetname");
	
	hurt enableLinkTo();
	hurt linkTo(spikes);
	spikes notSolid();
	
	thread death_trigger(hurt);
	
	spikes moveZ(-128, .1);
	wait .1;
	
	level.trapTriggers[1] waittill("trigger", player);
	
	playFx(level.fx_bugs, (1952, 416, -192));
	
	spikes moveZ(128, .1);
	wait 5;
	
	spikes moveZ(-128, 2, 1, 1);
	spikes waittill("movedone");
}

trap3()
{
	pusher = getEnt("trap3_target", "targetname");
	
	level.trapTriggers[2] waittill("trigger", player);
	
	playFx(level.fx_bugs, (1760, -1312, -192));
	
	pusher moveY(-304, 1, .5, .5);
	pusher waittill("movedone");
	
	pusher moveZ(-160, 2, 1, 1);
	pusher waittill("movedone");
	wait 5;
	
	pusher moveZ(-1152, 5, 4.5, .5);
	pusher waittill("movedone");
	pusher hide();
}

trap4()
{
	floor = getEnt("trap4_target", "targetname");
	
	level.trapTriggers[3] waittill("trigger", player);
	
	playFx(level.fx_bugs, (992, -1376, -192));
	
	for(;;)
	{
		floor rotateRoll(360, 5);
		wait 5;
	}
}

trap5()
{
	mixer = getEnt("trap5_target1", "targetname");
	blocks1 = getEnt("trap5_target2", "targetname");
	blocks2 = getEnt("trap5_target3", "targetname");
	
	level.trapTriggers[4] waittill("trigger", player);
	
	playFx(level.fx_bugs, (1952, -1728, -192));
	
	for(;;)
	{
		mixer rotateYaw(360, 5);
		blocks1 rotateYaw(180, 5);
		blocks2 rotateYaw(180, 5);
		wait 5;
	}
}

trap6()
{
	twister = getEnt("trap6_target", "targetname");
	
	level.trapTriggers[5] waittill("trigger", player);
	
	playFx(level.fx_bugs, (2048, -2320, -192));
	
	for(;;)
	{
		twister moveZ(-432, 5, 3, 2);
		twister waittill("movedone");
		
		twister rotateYaw(360, 3, 1, 2);
		wait 3;
		
		twister moveZ(432, 5, 3, 2);
		twister waittill("movedone");
	}
}

trap7()
{
	platform1 = getEnt("trap7_target1", "targetname");
	platform2 = getEnt("trap7_target2", "targetname");
	
	level.trapTriggers[6] waittill("trigger", player);
	
	playFx(level.fx_bugs, (2128, -1216, -192));
	
	platform1 moveZ(240, 1, .5, .5);
	platform1 waittill("movedone");
	
	platform2 moveZ(240, 1, .5, .5);
	platform2 waittill("movedone");
}

trap8()
{
	platform1 = getEnt("trap8_target1", "targetname");
	platform2 = getEnt("trap8_target2", "targetname");
	
	thread trap8_exec(platform1, platform2);
	
	level.trapTriggers[7] waittill("trigger", player);
	
	playFx(level.fx_bugs, (2128, -224, -192));
	
	level.trap8_activated = true;
}

trap8_exec(object1, object2)
{
	for(;;)
	{
		if(level.trap8_activated)
			object2 moveZ(64, 1, .5, .5);
		
		object1 moveZ(-64, 1, .5, .5);
		object1 waittill("movedone");
		wait 1;
		
		if(level.trap8_activated)
			object2 moveZ(-64, 1, .5, .5);
		
		object1 moveZ(64, 1, .5, .5);
		object1 waittill("movedone");
	}
}

platform_rotate()
{
	platform = getEnt("platform_rotate", "targetname");
	
	for(;;)
	{
		platform rotateRoll(360, 5);
		wait 5;
	}
}

shaft()
{
	trigger = getEnt("valve_trigger", "targetname");
	valve = getEnt("valve", "targetname");
	shaft = getEnt("shaft", "targetname");
	
	trigger waittill("trigger", player);
	
	iPrintLnBold(player.name + " ^3opened the shaft!");
	
	thread vendor();
	
	valve rotateYaw(720, 6, 5.5, .5);
	shaft moveZ(-144, 6, 1, 5);
	shaft waittill("movedone");
	wait .05;
	
	shaft delete();
}

vendor()
{
	trigger = getEnt("vendor_trigger", "targetname");
	vendor = getEnt("vendor", "targetname");
	
	thread perfect_headshot();
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(level.trapsDisabled) && level.trapsDisabled)
			continue;
		
		if(isDefined(player.usedVendor) && !player.usedVendor)
		{
			vendor moveY(1, .05);
			vendor rotatePitch(2, .05);
			vendor waittill("movedone");
		
			vendor moveY(-2, .05);
			vendor rotatePitch(-4, .05);
			vendor waittill("movedone");
		
			player giveWeapon("deserteaglegold_mp");
			player giveMaxAmmo("deserteaglegold_mp");
			player switchToWeapon("deserteaglegold_mp");
		
			vendor moveY(1, .05);
			vendor rotatePitch(2, .05);
			vendor waittill("movedone");
			
			player.usedVendor = true;
		}
		else
			player iPrintLnBold("^1SOLD OUT");
	}
}

perfect_headshot()
{
	trigger = getEnt("trigger_perfect_hs", "targetname");
	wall = getEnt("wall_entity", "targetname");
	
	trigger waittill("trigger", player);
	
	iPrintLnBold(player.name + " ^3has made ^1THE PERFECT HEADSHOT!");
	player braxi\_rank::giveRankXp("trap_activation");
	play_sound("headshot", player.origin);
	wait 1;
	
	trigger delete();
	wall delete();
	iPrintLnBold("A wall has moved?");
}

hallway()
{
	trigger = getEnt("trigger_hallway", "targetname");
	trigger2 = getEnt("trigger_hallway2", "targetname");
	door1 = getEnt("hallway_door1", "targetname");
	door2 = getEnt("hallway_door2", "targetname");
	door3 = getEnt("hallway_door3", "targetname");
	
	trigger waittill("trigger", player);
	
	iPrintLnBold(player.name + " ^2 has entered the hallway!");
	play_sound("impact", player.origin);
		
	door1 moveZ(-256, 1, .5, .5);
	door1 waittill("movedone");
	trigger delete();
	
	thread setup_neon_light("hallway_light1_on", "hallway_light1_off", "hallway_light_pos1", 15);
	wait .2;
	
	thread setup_neon_light("hallway_light2_on", "hallway_light2_off", "hallway_light_pos2", 15);
	wait .2;
	
	thread setup_neon_light("hallway_light3_on", "hallway_light3_off", "hallway_light_pos3", 15);
	wait .2;
	
	thread setup_neon_light("hallway_light4_on", "hallway_light4_off", "hallway_light_pos4", 15);
	wait .2;
	
	thread setup_neon_light("hallway_light5_on", "hallway_light5_off", "hallway_light_pos5", 15);
	wait .2;
	
	thread setup_neon_light("hallway_light6_on", "hallway_light6_off", "hallway_light_pos6", 15);
	wait .2;
	
	thread setup_neon_light("hallway_light7_on", "hallway_light7_off", "hallway_light_pos7", 15);
	wait .2;
	
	thread setup_neon_light("hallway_light8_on", "hallway_light8_off", "hallway_light_pos8", 15);
	
	trigger2 waittill("trigger", player);
	
	player braxi\_rank::giveRankXp("trap_activation");
	player.gotHallwayXP = true;
	
	door2 moveY(288, 1, .5, .5);
	door3 moveY(288, 1, .5, .5);
	door3 waittill("movedone");
	
	door1 delete();
	door2 delete();
	door3 delete();
	
	for(;;)
	{
		trigger2 waittill("trigger", player);
		
		if(!player.gotHallwayXP)
		{
			player braxi\_rank::giveRankXp("trap_activation");
			player.gotHallwayXP = true;
		}
		
		wait .05;
	}
}

shortcut()
{
	trigger = getEnt("trigger_shortcut", "targetname");
	shortcut = getEnt("shortcut_object", "targetname");
	
	trigger waittill("trigger", player);
	
	iPrintLnBold(player.name + " ^3has found a shortcut");
	
	wait 1;
	shortcut moveZ(672, 3, 1.5, 1.5);
	shortcut waittill("movedone");
	
	trigger delete();
}

setup_neon_light(entity_light_on, entity_light_off, origin, time)
{
	light_on = getEnt(entity_light_on, "targetname");
	light_off = getEnt(entity_light_off, "targetname");
	pos = getEnt(origin, "targetname");
	
	light_on hide();
	wait .05;
	
	while(1)
	{
		light_on show();
		light_off hide();
		
		light = spawnFx(level.fx_light, pos.origin);
		triggerFx(light);
		wait time;
		
		light_on hide();
		light_off show();
		light delete();
		wait .1;
	}
}

death_trigger(trigger)
{
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(level.activ) && player != level.activ)
			death(player);
		else if(level.freeRun)
			death(player);
		else
			scr_respawn(player, "activator_spawn_origin");
		
		wait .05;
	}
}

death(player)
{
	if(isDefined(player) && isAlive(player))
	{
		wait .1;
		
		if(player IsOnGround())
			playFx(level.fx_blood, player.origin);
	
		player suicide();
	}
	
	wait .05;
}

enter_scr()
{
	trigger = getEnt("trigger_scr_enter", "targetname");
	
	playFx(level.fx_portal, (1760, -1904, -63));
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		scr_respawn(player, "origin_scr_respawn1");
		wait .05;
	}
}

scr1()
{
	trigger = getEnt("trigger_scr_respawn1", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		scr_respawn(player, "origin_scr_respawn1");
		wait .05;
	}
}

scr2()
{
	trigger = getEnt("trigger_scr_respawn2", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		scr_respawn(player, "origin_scr_respawn2");
		wait .05;
	}
}

scr3()
{
	trigger = getEnt("trigger_scr_respawn3", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		scr_respawn(player, "origin_scr_respawn3");
		wait .05;
	}
}

scr4()
{
	trigger = getEnt("trigger_scr_respawn4", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		scr_respawn(player, "origin_scr_respawn4");
		wait .05;
	}
}

ammo()
{
	trigger = getEnt("trigger_special_ammo","targetname");
	
	stock = (randomInt(4) + 2);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(stock > 0)
		{
			if(isDefined(player.gotAmmo) && !player.gotAmmo)
			{		
				iPrintLnBold (player.name + " ^3has found some ammo!");
		
				thread give_bullets(player);
				wait .2;
		
				stock--;
			
				player.gotAmmo = true;
			}
			else
				player iPrintLnBold ("^1NOT FOR YOU!");
		}
		else
			player iPrintLnBold("^1SOLD OUT");
	}
	
	iPrintLnBold ("Where is the ammo");
}

give_bullets(player)
{
	player endon("disconnect");
	player endon("death");
	
	PlayFXOnTag( level.fx_power_body, player, "j_pinky_ri_3" );
	
	for(;;)
	{		
		player waittill("weapon_fired");
		
		head_origin = player gettagorigin("j_head");
		trace = bullettrace(head_origin, head_origin + AnglesToForward(player getplayerangles()) * 100000, true, player)["position"];
		
		play_sound("bang", trace);
		
		PlayFX(level.fx_power, trace);
		RadiusDamage(trace, 50, 100, 10, player);
	}
}

war()
{
	war = getEnt("war_origin", "targetname");
	trigger = getEnt("trigger_war", "targetname");
	
	trigger waittill("trigger", player);
	
	playFx(level.fx_war, war.origin);
}

scr_respawn(player, entity)
{
	pos = getEnt(entity, "targetname");
	
	player setOrigin(pos.origin);
	player setPlayerAngles(pos.angles);
}

tube()
{
	trigger = getEnt("trigger_tube_entry", "targetname");
	tube = getEnt("tube_entry", "targetname");
	exit = getEnt("tube_exit", "targetname");
	trigger_port = getEnt("trigger_tube", "targetname");
	port = getEnt("tube_origin", "targetname");
	trigger_heart = getEnt("trigger_heart", "targetname");
	
	trigger_port enableLinkTo();
	trigger_port linkTo(tube);
	
	tube hide();
	tube moveZ(-66, .05);
	
	trigger waittill("trigger", player);
	
	trigger delete();
	
	tube show();
	tube moveZ(66, .5, .3, .2);
	
	trigger_port waittill("trigger", player);
	
	musicPlay("sm_pipe");
	wait .1;
	
	player setOrigin(port.origin);
	player setPlayerAngles(port.angles);
	
	exit moveZ(66, .05);
	exit delete();
	tube moveZ(-66, .05);
	tube hide();
	
	trigger_heart waittill("trigger", player);
	iPrintLnBold(player.name + " ^2has found an extra life!");
	player braxi\_mod::giveLife();
}

play_sound(sound, location)
{
    origin = spawn("script_model", location);
    origin playSound(sound);
    origin delete();
	
    return;
}

addTestClients()
{
	setDvar("scr_testclients", "");
	wait 1;
	
	for(;;)
	{
		if(getDvarInt("scr_testclients") > 0)
			break;
		
		wait 1;
	}
	
	testClients = getdvarInt("scr_testclients");
	setDvar("scr_testclients", 0);
	
	for(i=0; i<testClients; i++)
	{
		ent[i] = addTestClient();

		if (!isdefined(ent[i]))
		{
			println("Could not add test client");
			wait 1;
			
			continue;
		}
		
		ent[i].pers["isBot"] = true;
		ent[i] thread testClient("autoassign");
	}
	
	thread addTestClients();
}

testClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
		wait .05;
		
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
}