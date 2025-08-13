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
	
	setDvar("bg_falldamagemaxheight", 15000 );
	setDvar("bg_falldamageminheight", 10000 );
	
	precacheitem("deserteaglegold_mp");
	precacheItem ("winchester1200_mp");
	
	level.fx_river = LoadFX("custom/creek/gold_river");
	level.fx_river_src = LoadFX("custom/creek/gold_river_source");
	level.fx_river_end = LoadFX("custom/creek/gold_river_end");
	level.fx_gold_src = LoadFX("custom/creek/gold_source");
	level.fx_gold_lake = LoadFX("custom/creek/gold_lake");
	level.fx_river_splash = LoadFX("custom/creek/gold_river_splash");
	level.fx_slot_win = LoadFX("custom/creek/slot_machine_win");
	level.fx_trap2_gold = LoadFX("custom/creek/trap_2_gold");
	level.fx_sniper_entry = LoadFX("custom/creek/sniper_entry");
	level.fx_aim_entry = LoadFX("custom/creek/aim_entry");
	level.fx_knife_entry = LoadFX("custom/creek/knife_entry");
	level.fx_jump_entry = LoadFX("custom/creek/jump_entry");
	level.fx_vistic = LoadFX("custom/creek/vistic");
	level.fx_teleport = LoadFX("custom/creek/teleport");
	
	thread on_start();
	
	thread addTriggerToList("trigger_trap_1");
	thread addTriggerToList("trigger_trap_2");
	thread addTriggerToList("trigger_trap_3");
	thread addTriggerToList("trigger_trap_4");
	thread addTriggerToList("trigger_trap_5");
	thread addTriggerToList("trigger_trap_6");
	thread addTriggerToList("trigger_trap_7");
	
	thread trap_1("trap_1_object_1", "trap_1_object_2");
	thread trap_2("trap_2_object");
	thread trap_3("trap_3_spikes_1", "trap_3_spikes_2", "trap_3_spikes_3", "trap_3_hurt_1", "trap_3_hurt_2", "trap_3_hurt_3");
	thread trap_4("trap_4_object");
	thread trap_5("trap_5_object");
	thread trap_6("trap_6_object");
	thread trap_7("trap_7_object");
	
	thread addTestClients();
}

on_start()
{	
	level waittill("round_started");
	SetExpFog(5000, 7000, 0, 0, 0, 10);
	playFx(level.fx_vistic, (-559, 0, -320), anglesToForward((0, 0, 0)));
	ambientPlay("colours");
	
	thread startdoor("startdoor");
	
	open_slot = randomInt(4);
	
	if(open_slot != 0 && !level.freerun) // 75% chance to open the doors
		open_slotmachine("slotmachine_entry");
		
	thread illusion_secret("trigger_illusion_1", "trigger_illusion_2", "trigger_illusion_3", "spawn_illusion_1", "spawn_illusion_2", "spawn_illusion_end", "trigger_illusion_exit");
	
	// setup death triggers (a lot cuz many different heights)
	thread do_trigger_death("trigger_death_01");
	thread do_trigger_death("trigger_death_02");
	thread do_trigger_death("trigger_death_03");
	thread do_trigger_death("trigger_death_04");
	thread do_trigger_death("trigger_death_05");
	thread do_trigger_death("trigger_death_06");
	thread do_trigger_death("trigger_death_07");
	thread do_trigger_death("trigger_death_08");
	thread do_trigger_death("trigger_death_09");
	thread do_trigger_death("trigger_death_10");
	thread do_trigger_death("trigger_death_11");
	thread do_trigger_death("trigger_death_12");
	thread do_trigger_death("trigger_death_13");
	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < players.size; i++)
	{
		players[i].isDead = false;
		players[i].isOnRope = false;
		players[i].usedSlotMachine = false;
		players[i].isRespawning = false;
		players[i].hasJumpGun = false;
		players[i].illusionFactor = randomIntRange(5, 20);
	}
	
	thread on_river();
	thread on_slotmachine("trigger_slot", "slot_1", "slot_2", "slot_3");
	thread on_rope("trigger_rope_1", "rope_origin_1_1", "rope_origin_1_2");
	thread on_rope("trigger_rope_2", "rope_origin_2_1", "rope_origin_2_2");
	thread rotating_platform("rotating_object");
	thread on_secret("trigger_secret_teleport", "secret_origin");
	
	thread on_endrooms();
}

startdoor(object_entity)
{
	door = getEnt(object_entity, "targetname");
	
	wait 10;
	
	iPrintLn("> Map by ^3Icomar");
	door moveZ(-192, 6, 5, 1);
	wait 6;
	
	iPrintLn("> Special thanks to ^3Arfy");
	wait 6;
	
	iPrintLn("> Big thanks to ^3Blade ^7for the sick teleport FX");
}

open_slotmachine(object_entity)
{
	doors = getEnt(object_entity, "targetname");
	
	doors delete();
}

illusion_secret(start_entity_trigger, mid_1_entity_trigger, mid_2_entity_trigger, spawn_1_entity, spawn_2_entity, spawn_end_entity, exit_entity)
{
	trigger_start = getEnt(start_entity_trigger, "targetname");
	trigger_1 = getEnt(mid_1_entity_trigger, "targetname");
	trigger_2 = getEnt(mid_2_entity_trigger, "targetname");
	trigger_exit = getEnt(exit_entity, "targetname");
	spawn_1 = getEnt(spawn_1_entity, "targetname");
	spawn_2 = getEnt(spawn_2_entity, "targetname");
	spawn_end = getEnt(spawn_end_entity, "targetname");
	
	playFx(level.fx_teleport, (1919, -672, -352), anglesToForward((0, 180, 0)));
	playFx(level.fx_teleport, (1937, -672, -352), anglesToForward((0, 0, 0)));
	playFx(level.fx_teleport, (1937, -672, -560), anglesToForward((0, 0, 0)));
	playFx(level.fx_teleport, (2687, -672, -352), anglesToForward((0, 180, 0)));
	
	thread illusion_teleport(trigger_start, spawn_1, spawn_2, spawn_end);
	thread illusion_teleport(trigger_1, spawn_1, spawn_2, spawn_end);
	thread illusion_teleport(trigger_2, spawn_1, spawn_2, spawn_end);
	thread illusion_exit(trigger_exit);
}

illusion_exit(trigger)
{
	for(;;)
	{
		trigger waittill("trigger", player);
		player setOrigin((2112, 2080, -110));
		wait .05;
	}
}

illusion_teleport(trigger, spawn_1, spawn_2, spawn_3)
{
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(player.illusionFactor <= 0)
			do_teleport(player, spawn_3, .05);
		else
		{
			x = randomInt(2);
			
			if(x == 0)
				do_teleport(player, spawn_1, .05);
			
			if(x == 1)
				do_teleport(player, spawn_2, .05);
		}
		
		player.illusionFactor--;
	}
}

on_endrooms()
{
	playFx(level.fx_sniper_entry, (-608, 337, -544), anglesToForward((0, 90, 0)));
	playFx(level.fx_knife_entry, (-416, 337, -544), anglesToForward((0, 90, 0))); // (-480, 337, -544)
	playFx(level.fx_jump_entry, (-224, 337, -544), anglesToForward((0, 90, 0)));
	//playFx(level.fx_aim_entry, (-352, 337, -544), anglesToForward((0, 90, 0)));
	
	// setup sniper ropes
	thread on_rope("trigger_rope_sniper_1", "rope_sniper_origin_1_1", "rope_sniper_origin_1_2");
	thread on_rope("trigger_rope_sniper_2", "rope_sniper_origin_2_1", "rope_sniper_origin_2_2");
	thread on_rope("trigger_rope_sniper_3", "rope_sniper_origin_3_1", "rope_sniper_origin_3_2");
	thread on_rope("trigger_rope_sniper_4", "rope_sniper_origin_4_1", "rope_sniper_origin_4_2");
	
	// setup spawns
	level.sniper_jumper_spawn = getEnt("sniper_spawn_jumper", "targetname");
	level.sniper_activator_spawn = getEnt("sniper_spawn_activator", "targetname");
	
	level.jump_jumper_spawn = getEnt("jump_spawn_jumper", "targetname");
	level.jump_activator_spawn = getEnt("jump_spawn_activator", "targetname");
	
	level.knife_jumper_spawn = getEnt("knife_spawn_jumper", "targetname");
	level.knife_activator_spawn = getEnt("knife_spawn_activator", "targetname");
	
	// will be added soon
	// level.aim_jumper_spawn = getEnt("aim_spawn_jumper", "targetname");
	// level.aim_activator_spawn = getEnt("aim_spawn_activator", "targetname");
	
	level.isSniper = false;
	level.isKnife = false;
	level.isJump = false;
	
	// setup endroom triggers
	level.sniper_entry = getEnt("trigger_entry_sniper", "targetname");
	level.knife_entry = getEnt("trigger_entry_knife", "targetname");
	level.jump_entry = getEnt("trigger_entry_jump", "targetname");
	
	// setup sniper respawn
	thread endroom_respawn("trigger_sniper_respawn_1", level.sniper_activator_spawn, level.sniper_jumper_spawn);
	thread endroom_respawn("trigger_sniper_respawn_2", level.sniper_activator_spawn, level.sniper_jumper_spawn);
	thread endroom_respawn("trigger_sniper_respawn_3", level.sniper_activator_spawn, level.sniper_jumper_spawn);
	thread endroom_respawn("trigger_sniper_respawn_4", level.sniper_activator_spawn, level.sniper_jumper_spawn);
	thread endroom_respawn("trigger_sniper_respawn_5", level.sniper_activator_spawn, level.sniper_jumper_spawn);
	
	// setup jump fx
	playFx(level.fx_gold_lake, (-12992, -12800, -2175));
	
	// setup jump respawn
	thread endroom_respawn("trigger_jump_respawn", level.jump_activator_spawn, level.jump_jumper_spawn);
	
	thread on_sniper();
	thread on_knife();
	thread on_jump();
}

on_sniper()
{
	level.sniper_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Sniper");
	
	for(;;)
	{
		level.sniper_entry waittill("trigger", player);
		
		if(level.isSniper)
			continue;
		
		if(level.isKnife)
			continue;
		
		if(level.isJump)
			continue;

		level.isSniper = true;
		
		level.sniper_entry setHintstring("^3Waiting...");
		level.knife_entry setHintstring("^3Waiting...");
		level.jump_entry setHintstring("^3Waiting...");
		
		iPrintLnBold("^3" + player.name + " ^7has chosen ^3Sniper");
		wait .5;
		
		player takeallweapons();
		thread do_teleport(player, level.sniper_jumper_spawn, 5);
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			thread do_teleport(level.activ, level.sniper_activator_spawn, 5);
		}
		
		wait 2;
		iPrintLnBold("^33");
		wait 1;
		iPrintLnBold("^32");
		wait 1;
		iPrintLnBold("^31");
		wait 1;
		iPrintLnBold("^3FIGHT!");
		
		player GiveWeapon( "knife_mp");
		player GiveWeapon( "remington700_mp");
		player GiveMaxAmmo( "remington700_mp");
		player switchToWeapon( "remington700_mp");
		
		if(isDefined(level.activ))
		{
			level.activ GiveWeapon( "knife_mp");
			level.activ GiveWeapon("remington700_mp");
			level.activ GiveMaxAmmo("remington700_mp");
			level.activ switchToWeapon("remington700_mp");
		}
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^3" + player.name + " ^7died");
		wait 1;
		
		level.isSniper = false;
		level.sniper_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Sniper");
		level.knife_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Knife");
		level.jump_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Jump");
	}
}

on_knife()
{
	level.knife_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Knife");
	
	for(;;)
	{
		level.knife_entry waittill("trigger", player);
		
		if(level.isSniper)
			continue;
		
		if(level.isKnife)
			continue;
		
		if(level.isJump)
			continue;

		level.isKnife = true;
		
		level.sniper_entry setHintstring("^3Waiting...");
		level.knife_entry setHintstring("^3Waiting...");
		level.jump_entry setHintstring("^3Waiting...");
		
		iPrintLnBold("^3" + player.name + " ^7has chosen ^3Knife");
		wait .5;
		
		player takeallweapons();
		thread do_teleport(player, level.knife_jumper_spawn, 5);
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			thread do_teleport(level.activ, level.knife_activator_spawn, 5);
		}
		
		wait 2;
		iPrintLnBold("^33");
		wait 1;
		iPrintLnBold("^32");
		wait 1;
		iPrintLnBold("^31");
		wait 1;
		iPrintLnBold("^3FIGHT!");
		
		player GiveWeapon( "knife_mp");
		player switchToWeapon( "knife_mp");
		
		if(isDefined(level.activ))
		{
			level.activ GiveWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
		}
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^3" + player.name + " ^7died");
		wait 1;
		
		level.isKnife = false;
		level.sniper_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Sniper");
		level.knife_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Knife");
		level.jump_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Jump");
	}
}

on_jump()
{
	thread jump_get_gun("trigger_jump_gun");
	level.jump_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Jump");
	
	for(;;)
	{
		level.jump_entry waittill("trigger", player);
		
		if(level.isSniper)
			continue;
		
		if(level.isKnife)
			continue;
		
		if(level.isJump)
			continue;

		level.isJump = true;
		
		level.sniper_entry setHintstring("^3Waiting...");
		level.knife_entry setHintstring("^3Waiting...");
		level.jump_entry setHintstring("^3Waiting...");
		
		iPrintLnBold("^3" + player.name + " ^7has chosen ^3Jump");
		wait .5;
		
		player takeallweapons();
		thread do_teleport(player, level.jump_jumper_spawn, 5);
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			thread do_teleport(level.activ, level.jump_activator_spawn, 5);
		}
		
		wait 2;
		iPrintLnBold("^33");
		wait 1;
		iPrintLnBold("^32");
		wait 1;
		iPrintLnBold("^31");
		wait 1;
		iPrintLnBold("^3FIGHT!");
		
		player GiveWeapon( "knife_mp");
		player switchToWeapon( "knife_mp");
		
		if(isDefined(level.activ))
		{
			level.activ GiveWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
		}
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^3" + player.name + " ^7died");
		wait 1;
		
		level.isJump = false;
		level.sniper_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Sniper");
		level.knife_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Knife");
		level.jump_entry setHintstring("^3Press ^7&&1 ^3to enter ^7Jump");
	}
}

jump_get_gun(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(player) && isAlive(player) && !player.hasJumpGun)
		{
			player GiveWeapon( "remington700_mp");
			player GiveMaxAmmo( "remington700_mp");
			player switchToWeapon( "remington700_mp");
			player.hasJumpGun = true;
		}
		
		wait .5;
	}
}

endroom_respawn(trigger_entity, activator_spawn, jumper_spawn)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(player.isRespawning)
			continue;
		
		player.isRespawning = true;
		
		while(isDefined(player) && isAlive(player))
		{			
			wait .05;
		
			if(player IsOnGround())
				break;
		}
		
		if(isDefined(level.activ) && player == level.activ)
			thread do_teleport(player, activator_spawn, .1);
		else
			thread do_teleport(player, jumper_spawn, .1);
		wait .1;
		
		player.isRespawning = false;
	}
}

addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers))
        level.trapTriggers = [];
	
    level.trapTriggers[level.trapTriggers.size] = getEnt(name, "targetname");
	level.trapTriggers[level.trapTriggers.size - 1] setHintstring("Press ^3&&1 ^7to activate");
}

trap_1(object_1_entity, object_2_entity)
{
	object_1 = getEnt(object_1_entity, "targetname");
	object_2 = getEnt(object_2_entity, "targetname");
	
	level.trapTriggers[0] waittill("trigger", player);
	
	level.trapTriggers[0] setHintstring("^3Activated");
	
	object_1 delete();
	
	for(;;)
	{
		object_2 moveY(640, 3, 1.5, 1.5);
		object_2 waittill("movedone");
		
		object_2 moveY(-640, 3, 1.5, 1.5);
		object_2 waittill("movedone");
	}
}

trap_2(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[1] waittill("trigger", player);
	
	level.trapTriggers[1] setHintstring("^3Activated");
	
	playFx(level.fx_trap2_gold, (2176, 552, -255), anglesToForward((-90, 90, 0)));
	object delete();
}

trap_3(spikes_1_entity, spikes_2_entity, spikes_3_entity, hurt_1_entity, hurt_2_entity, hurt_3_entity)
{
	spikes_1 = getEnt(spikes_1_entity, "targetname");
	spikes_2 = getEnt(spikes_2_entity, "targetname");
	spikes_3 = getEnt(spikes_3_entity, "targetname");
	hurt_1 = getEnt(hurt_1_entity, "targetname");
	hurt_2 = getEnt(hurt_2_entity, "targetname");
	hurt_3 = getEnt(hurt_3_entity, "targetname");
	
	hurt_1 enableLinkTo();
	hurt_1 linkTo(spikes_1);
	
	hurt_2 enableLinkTo();
	hurt_2 linkTo(spikes_2);
	
	hurt_3 enableLinkTo();
	hurt_3 linkTo(spikes_3);
	
	spikes_1 notSolid();
	spikes_2 notSolid();
	spikes_3 notSolid();
	
	spikes_1 moveZ(-92, .1);
	spikes_2 moveZ(-92, .1);
	spikes_3 moveZ(-92, .1);
	wait .2;
	
	level.trapTriggers[2] waittill("trigger", player);
	
	level.trapTriggers[2] setHintstring("^3Activated");
	
	for(;;)
	{
		spikes_1 moveZ(92, .05);
		wait 1;
		
		spikes_2 moveZ(92, .05);
		spikes_1 moveZ(-92, 2, 1, 1);
		wait 1;
		
		spikes_3 moveZ(92, .05);
		spikes_2 moveZ(-92, 2, 1, 1);
		wait 1;
		
		spikes_3 moveZ(-92, 2, 1, 1);
		wait 4;
	}
}

trap_4(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[3] waittill("trigger", player);
	
	level.trapTriggers[3] setHintstring("^3Activated");
	
	object delete();
}

trap_5(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[4] waittill("trigger", player);
	
	level.trapTriggers[4] setHintstring("^3Activated");
	
	object delete();
}

trap_6(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	object moveY(24, .1);
	wait .2;
	
	level.trapTriggers[5] waittill("trigger", player);
	
	level.trapTriggers[5] setHintstring("^3Activated");
	
	for(;;)
	{
		object moveY(-24, 2, 1, 1);
		object waittill("movedone");
		
		object moveY(24, 2, 1, 1);
		object waittill("movedone");
	}
}

trap_7(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[6] waittill("trigger", player);
	
	level.trapTriggers[6] setHintstring("^3Activated");
	
	for(;;)
	{
		object rotatePitch(-90, 4);
		wait 4;
	}
}

on_secret(trigger_entity, spawn_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	spawn = getEnt(spawn_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		thread do_teleport(player, spawn, .1);
		wait .1;
	}
}

on_rope(trigger_entity, origin_1_entity, origin_2_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	start = getEnt(origin_1_entity, "targetname");
	end = getEnt(origin_2_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if (isalive(player) && isdefined(player) && !player.isOnRope)
		{	
			player disableWeapons();
			player.isOnRope = true;
			thread do_rope(player, start, end);
		}
		
		wait .05;
	}
}

do_rope(player, start, end)
{
	src_model = spawn ( "script_model", (5, 7, 1));
	src_model.origin = player.origin;
	
	player LinkTo(src_model);
	src_model moveTo(start.origin, 2, 1, 1);
	wait 2;
	
	player enableWeapons();
	src_model moveTo(end.origin, .5, .25, .25);
	wait .5;
	
	player UnLink();
	src_model delete();
	player.isOnRope = false;
}

rotating_platform(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	for(;;)
	{
		object rotateYaw(90, 2.5);
		wait 2.5;
	}
}

on_slotmachine(trigger_entity, slot_1_entity, slot_2_entity, slot_3_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	slot_1 = getEnt(slot_1_entity, "targetname");
	slot_2 = getEnt(slot_2_entity, "targetname");
	slot_3 = getEnt(slot_3_entity, "targetname");
		
	for(;;)
	{
		trigger setHintstring("Try your ^3luck^7...");
		
		trigger waittill("trigger", player);
		
		if(player.usedSlotMachine)
			return;
		
		trigger setHintstring("^3...");
		
		/*
		1 = life
		2 = xp
		3 = dead
		*/
		
		player.usedSlotMachine = true;
		
		slot_1_rotation = randomIntRange(1, 4);
		slot_2_rotation = randomIntRange(1, 4);
		slot_3_rotation = randomIntRange(1, 4);
		
		thread on_rotation(slot_1, 90 * (slot_1_rotation + 8), 3, 6.5);
		thread on_rotation(slot_2, 90 * (slot_2_rotation + 12), 4, 6.5);
		thread on_rotation(slot_3, 90 * (slot_3_rotation + 16), 6, 6.5);
		wait 6.2;
		
		if(slot_1_rotation == slot_2_rotation &&
		slot_1_rotation == slot_3_rotation &&
		slot_2_rotation == slot_3_rotation)
		{
			playFx(level.fx_slot_win, (-640, 64, -256));
			playFx(level.fx_slot_win, (-640, 0, -256));
			playFx(level.fx_slot_win, (-640, -64, -256));
			
			if(slot_1_rotation == 1)
			{
				iPrintlnBold("^3" + player.name + " ^7won an extra life!");
				
				player braxi\_mod::giveLife();
			}
			if(slot_1_rotation == 2)
			{
				iPrintlnBold("^3" + player.name + " ^7won extra XP!");
				
				for(i = 0; i < 4; i++)
					player braxi\_rank::giveRankXp("trap_activation");
			}
			if(slot_1_rotation == 3)
			{
				iPrintlnBold("^3" + player.name + " ^7lost his ^1life^7!");
				
				if(isDefined(level.activ))
					thread on_dmg(player, level.activ, player.health);
				else
					player suicide();
			}
		}
		else if(slot_1_rotation == slot_2_rotation)
		{
			playFx(level.fx_slot_win, (-640, 64, -256));
			playFx(level.fx_slot_win, (-640, 0, -256));
			
			if(slot_1_rotation == 1)
			{
				player iPrintlnBold("You won some extra hp!");
				
				player.health = player.health + 50;
			}
			if(slot_1_rotation == 2)
			{
				player iPrintlnBold("You won some XP!");
				
				player braxi\_rank::giveRankXp("trap_activation");
			}
			if(slot_1_rotation == 3)
			{
				player iPrintlnBold("You have lost some hp!");
				
				dmg = player.health - 1;
				
				if(isDefined(level.activ))
					thread on_dmg(player, level.activ, dmg);
				else
					player.health = 1;
			}
		}
		else
			player iPrintlnBold("^1FAIL!");
		wait 1.4;
	}
}

on_rotation(target, angle, time, max_time)
{
	target rotatePitch(0 - angle, time, time / 2, time / 2);
	wait max_time;
	
	target rotatePitch(angle, 1, .5, .5);
	wait 1;
}

on_river()
{	
	playFx(level.fx_river_src, (6004, -1663, -959)); // source of the river
	playFx(level.fx_gold_src, (6020, -2039, -927), anglesToForward((0, 90, 0)));
	
	playFx(level.fx_river_end, (-461, 2082, -959)); // end of the river
	
	// playFx(level.fx_river_splash, (3216, 59, -959)); // river splash

	playFx(level.fx_river, (707, 1922, -959), anglesToForward((-90, 170, 0)));
	playFx(level.fx_river, (1655, 1270, -959), anglesToForward((-90, 140, 0)));
	playFx(level.fx_river, (2530, 407, -959), anglesToForward((-90, 150, 0)));
	playFx(level.fx_river, (3264, -189, -959), anglesToForward((-90, 120, 0)));
	playFx(level.fx_river, (4123, -176, -959), anglesToForward((-90, 150, 0)));
	playFx(level.fx_river, (5082, -415, -959), anglesToForward((-90, 180, 0)));
	playFx(level.fx_river, (5956, -1007, -959), anglesToForward((-90, 110, 0)));
}

do_trigger_death(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(player) && isAlive(player) && !player.isDead)
		{
			player.isDead = true;
			thread on_death(player);
		}
	}
}

do_teleport(player, teleport, delay)
{	
	if(isDefined(player) && isAlive(player))
	{
		player setOrigin(teleport.origin);
		player setPlayerAngles(teleport.angles);
	
		player LinkTo(teleport);
		wait delay;
	
		player UnLink();
	}
}

on_death(player)
{
	while(isDefined(player) && isAlive(player))
	{
		wait .05;
		
		if(player IsOnGround())
			break;
	}
	
	player.isDead = false;
	// playFx(level.fx_death, player.origin);
	
	if(isAlive(player))
		player suicide();
}


on_dmg(player, attacker, dmg)
{
	player finishPlayerDamage(player, attacker, dmg, 0, "MOD_PROJECTILE", "m40a3_mp", player.origin, attacker.angles, "none", 0);
	
	wait .05;
}

/*
on_sound(sound, location)
{
    origin = spawn("script_model", location);
    origin playSound(sound);
    origin delete();
	
    return;
} */

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