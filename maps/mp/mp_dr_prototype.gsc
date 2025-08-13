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
	
	precacheShader("mtl_plr_tommy_vercetti");
	precacheModel("plr_tommy_vercetti");
	
	level.fx_weather = LoadFX("custom/prototype/weather");
	level.fx_death = LoadFX("custom/prototype/death");
	level.fx_bounce = LoadFX("custom/prototype/bounce");
	level.fx_magic = LoadFX("custom/prototype/magic");
	level.fx_sniper = LoadFX("custom/prototype/sniper_entry");
	level.fx_knife = LoadFX("custom/prototype/knife_entry");
	level.fx_acti_kill = LoadFX("custom/prototype/acti_explosion");
	
	thread addTriggerToList("trap_1_trigger");
	thread addTriggerToList("trap_2_trigger");
	thread addTriggerToList("trap_3_trigger");
	thread addTriggerToList("trap_4_trigger");
	thread addTriggerToList("trap_5_trigger");
	thread addTriggerToList("trap_6_trigger");
	
	level.sniper_entry = getEnt("endroom_sniper_entry", "targetname");
	level.knife_entry = getEnt("endroom_knife_entry", "targetname");
	level.sniper_jumper_spawn = getEnt("endroom_weap_jumper", "targetname");
	level.sniper_activator_spawn = getEnt("endroom_weap_acti", "targetname");
	level.knife_jumper_spawn = getEnt("endroom_knife_jumper", "targetname");
	level.knife_activator_spawn = getEnt("endroom_knife_acti", "targetname");
	
	thread on_start();
	
	thread addTestClients();
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
	
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
	level.trapTriggers[level.trapTriggers.size - 1] setHintstring("Press ^5&&1 ^7to activate");
}

on_start()
{	
	level waittill("round_started");
	
	ambientPlay("ember");
	
	playFx(level.fx_weather, (-96, 0, -176));
	playFx(level.fx_weather, (800, 0, -176));
	playFx(level.fx_weather, (1696, 0, -176));
	playFx(level.fx_weather, (2592, 0, -176));
	playFx(level.fx_weather, (3488, 0, -176));
	playFx(level.fx_weather, (3632, -960, -176));
	playFx(level.fx_weather, (2736, -1600, -176));
	playFx(level.fx_weather, (1840, -1600, -176));
	playFx(level.fx_weather, (944, -1600, -176));
	playFx(level.fx_weather, (48, -1600, -176));
	playFx(level.fx_weather, (-64, -800, -176));
	
	playFx(level.fx_magic, (488, -13832, 40));
	
	playFx(level.fx_sniper, (-240, -658, -144), anglesToForward((180, 90, 0)));
	playFx(level.fx_knife, (-80, -658, -144), anglesToForward((180, 90, 0)));
	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < players.size; i++)
	{
		players[i].isBouncing = false;
		players[i].isDead = false;
	}
	
	level.isSniper = false;
	level.isKnife = false;
	level.isEndroomChosen = false;
	
	thread platform("rotating_platform");
	thread bounce_pad("bounce_trigger");
	thread death("trigger_death");
	thread end_door("door_trigger", "end_door");
	thread acti_porter("acti_port_trigger");
	
	thread trap_1("trap_1_object");
	thread trap_2("trap_2_object");
	thread trap_3("trap_3_object_1", "trap_3_object_2");
	thread trap_4("trap_4_object");
	thread trap_5("trap_5_object");
	thread trap_6("trap_6_object_1", "trap_6_object_2", "trap_6_object_3", "trap_6_object_4", "trap_6_object_5");
	
	thread open("startdoor");
	wait .8;
	
	thread on_sniper();
	thread on_knife();
	thread on_respawn("endroom_respawn_trigger");
	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < players.size; i++)
		if(isDefined(level.activ) && players[i] == level.activ)
			players[i] setModel("plr_tommy_vercetti");
		
	thread acti_earthquake();
}

on_sniper()
{
	level.sniper_entry setHintstring("^5Press ^7&&1 ^5to enter ^7Sniper");
	
	for(;;)
	{
		level.sniper_entry waittill("trigger", player);
		
		if(!isDefined(level.activ))
			continue;
		
		if(!level.isEndroomChosen)
			level.isEndroomChosen = true;
		
		if(level.isSniper)
			continue;
		
		if(level.isKnife)
			continue;

		level.isSniper = true;
		
		level.sniper_entry setHintstring("^5Waiting...");
		level.knife_entry setHintstring("^5Waiting...");
		
		iPrintLnBold("^5" + player.name + " ^7has chosen ^5Sniper");
		wait .5;
		
		player takeallweapons();
		thread do_teleport(player, level.sniper_jumper_spawn, 1);
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			thread do_teleport(level.activ, level.sniper_activator_spawn, 1);
		}
		
		player GiveWeapon("knife_mp");
		player GiveWeapon("m40a3_mp");
		player GiveMaxAmmo("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		
		if(isDefined(level.activ))
		{
			level.activ GiveWeapon("knife_mp");
			level.activ GiveWeapon("m40a3_mp");
			level.activ GiveMaxAmmo("m40a3_mp");
			level.activ switchToWeapon("m40a3_mp");
		}
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^5" + player.name + " ^7died");
		wait 1;
		
		level.isSniper = false;
		level.sniper_entry setHintstring("^5Press ^7&&1 ^5to enter ^7Sniper");
		level.knife_entry setHintstring("^5Press ^7&&1 ^5to enter ^7Knife");
	}
}

on_knife()
{
	level.knife_entry setHintstring("^5Press ^7&&1 ^5to enter ^7Knife");
	
	for(;;)
	{
		level.knife_entry waittill("trigger", player);
		
		if(!isDefined(level.activ))
			continue;
		
		if(!level.isEndroomChosen)
			level.isEndroomChosen = true;
		
		if(level.isSniper)
			continue;
		
		if(level.isKnife)
			continue;

		level.isKnife = true;
		
		level.sniper_entry setHintstring("^5Waiting...");
		level.knife_entry setHintstring("^5Waiting...");
		
		iPrintLnBold("^5" + player.name + " ^7has chosen ^5Knife");
		wait .5;
		
		player takeallweapons();
		thread do_teleport(player, level.knife_jumper_spawn, 1);
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			thread do_teleport(level.activ, level.knife_activator_spawn, 1);
		}
		
		player GiveWeapon("knife_mp");
		player switchToWeapon("knife_mp");
		
		if(isDefined(level.activ))
		{
			level.activ GiveWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
		}
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^5" + player.name + " ^7died");
		wait 1;
		
		level.isKnife = false;
		level.sniper_entry setHintstring("^5Press ^7&&1 ^5to enter ^7Sniper");
		level.knife_entry setHintstring("^5Press ^7&&1 ^5to enter ^7Knife");
	}
}

acti_earthquake()
{
	wait 3;
	last_pos = (0, 0, 0);
	
	while(isDefined(level.activ) && isAlive(level.activ))
	{
		last_pos = level.activ.origin;
		wait .1;
	}
	
	if(!level.freeRun)
	{
		playFx(level.fx_acti_kill, last_pos);
		Earthquake(.8, 1, last_pos, 5000);
	}
}

on_respawn(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(level.activ) && player == level.activ)
			thread do_teleport(level.activ, level.sniper_activator_spawn, 1);
		else
			thread do_teleport(player, level.sniper_jumper_spawn, 1);
		
		player.health = 1;
	}
}

open(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	wait 3;
	
	object moveZ(-64, 3, 1.5, 1.5);
	wait 4;
	
	iPrintLn("^5> ^7Map by Icomar");
}

trap_1(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[0] waittill("trigger", player);
	
	level.trapTriggers[0] setHintstring("^5Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	
	for(;;)
	{
		object rotateRoll(180, 1.1);
		wait 1.1;
	}
}

trap_2(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[1] waittill("trigger", player);
	
	level.trapTriggers[1] setHintstring("^5Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	
	for(;;)
	{
		object rotateRoll(-180, 1.1);
		wait 1.1;
	}
}

trap_3(object_entity_1, object_entity_2)
{
	object_1 = getEnt(object_entity_1, "targetname");
	object_2 = getEnt(object_entity_2, "targetname");
	
	level.trapTriggers[2] waittill("trigger", player);
	
	level.trapTriggers[2] setHintstring("^5Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	
	for(;;)
	{		
		object_1 moveY(128, 1.6);
		object_2 moveY(-128, 1.6);
		object_1 waittill("movedone");
		
		object_1 moveZ(-128, 1.6);
		object_2 moveZ(128, 1.6);
		object_1 waittill("movedone");
		
		object_1 moveY(-128, 1.6);
		object_2 moveY(128, 1.6);
		object_1 waittill("movedone");
		
		object_1 moveZ(128, 1.6);
		object_2 moveZ(-128, 1.6);
		object_1 waittill("movedone");
	}
}

trap_4(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[3] waittill("trigger", player);
	
	level.trapTriggers[3] setHintstring("^5Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	
	for(;;)
	{
		object rotateRoll(-180, 2);
		wait 2;
	}
}

trap_5(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[4] waittill("trigger", player);
	
	level.trapTriggers[4] setHintstring("^5Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	
	object rotatePitch(90, 4, 2, 2);
	wait 4;
}

trap_6(object_entity_1, object_entity_2, object_entity_3, object_entity_4, object_entity_5)
{
	object_1 = getEnt(object_entity_1, "targetname");
	object_2 = getEnt(object_entity_2, "targetname");
	object_3 = getEnt(object_entity_3, "targetname");
	object_4 = getEnt(object_entity_4, "targetname");
	object_5 = getEnt(object_entity_5, "targetname");
	
	object_1 rotateRoll(30, .05);
	object_2 rotateRoll(30, .05);
	object_3 rotateRoll(30, .05);
	object_4 rotateRoll(30, .05);
	object_5 rotateRoll(30, .05);
	
	level.trapTriggers[5] waittill("trigger", player);
	
	level.trapTriggers[5] setHintstring("^5Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	
	thread trap_6_rotate(object_1, 60);
	wait .5;
	
	thread trap_6_rotate(object_2, 60);
	wait .5;
	
	thread trap_6_rotate(object_3, 60);
	wait .5;
	
	thread trap_6_rotate(object_4, 60);
	wait .5;
	
	thread trap_6_rotate(object_5, 60);
}

trap_6_rotate(object, value)
{
	for(;;)
	{
		object rotateRoll(0 - value, 3, 1.5, 1.5);
		wait 3;
		
		object rotateRoll(value, 3, 1.5, 1.5);
		wait 3;
	}
}

end_door(trigger_entity, object_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	object = getEnt(object_entity, "targetname");
	
	trigger setHintstring("^5Press ^7&&1 ^5to open ^7the door");
	
	trigger waittill("trigger", player);
	
	if(!level.isEndroomChosen)
	{
		level.sniper_entry delete();
		level.knife_entry delete();
	
		object moveZ(-112, 1, .8, .2);
		iPrintLnBold("^5" + player.name + " ^7opened the end door!");
		wait 2;
	
		object delete();
	}
}

acti_porter(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(level.activ) && player == level.activ)
			player setOrigin((440, player.origin[1], -191));

		wait .05;
	}
}

death(trigger_entity)
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

on_death(player)
{
	while(isDefined(player) && isAlive(player))
	{
		wait .05;
		
		if(player IsOnGround())
			break;
	}
	
	player.isDead = false;
	playFx(level.fx_death, player.origin);
	
	if(isDefined(player) && isAlive(player))
		player suicide();
}

platform(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	for(;;)
	{
		object rotateYaw(90, 1.6);
		wait 1.6;
	}
}

bounce_pad(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(player) && isAlive(player) && !player.isBouncing)
		{
			player.isBouncing = true;
			thread do_bounce(player, 180, 4, (-50, -180, 0), "none");
		}
		
		wait .05;
	}
}

do_bounce(player, strength, multiplyer, angle, pos)
{
	while(isDefined(player) && isAlive(player))
	{	
		if(player isOnGround())
		{			
			for(i = 0; i < multiplyer; i++)
			{
				player.health += strength;
				player finishPlayerDamage(player, level.jumpattacker, strength, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward(angle), pos, 0);
			}
			
			player.isBouncing = false;
			wait .05;
			
			while(isDefined(player) && isAlive(player))
			{
				if(player isOnGround())
					break;
				
				playFx(level.fx_bounce, player.origin);
				wait .05;
			}

			break;
		}

		wait .05;
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