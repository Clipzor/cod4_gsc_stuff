//Map and Script by Seven
//Nothing that great in here, i found everything online tbh
//Death check the bottom - I knew you would be here :)


main()
{
	maps\mp\_load::main();
 
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
 
	setdvar("bg_falldamageminheight" , "99990");
	setdvar("bg_falldamagemaxheight" , "99999");
	setdvar("g_speed" ,"210");
    setdvar("dr_jumpers_speed" ,"1.12");
	setdvar("r_specular", "0");
	setdvar("r_specularcolorscale", "1");

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	
	thread onPlayerSpawned();
    thread end();
    
	thread startdoor1();
	thread startdoor2();
	thread teleport_jump1();
	thread teleport_jump2();
	thread teleport_jump3();
	thread teleport_jump4();
	thread teleport_actijump1();
	thread teleport_actijump2();
	thread teleport_actijump3();
	thread teleport_actijump4();
	thread sniperroom();
	thread sniperfail1();
	thread sniperfail2();
}

onPlayerSpawned() 
{
    self endon("disconnect");

    self waittill("player_spawned");
    self setClientDvar("r_filmTweakContrast", "2");
	self setClientDvar("r_filmTweakBrightness", "0.05");
}

end()
{
	trig = getEnt("trig_winner", "targetname");
	trig waittill("trigger", player);
	trig delete();
	jumpers = getEntArray("player", "classname");
	if(player.pers["team"] == "axis")
	{
		iPrintLnBold("^5Activator won!");
		for(z = 0; z < jumpers.size; z++)
		{
			jumpers[z] freezeControls(1);
		}
		wait 2;		
		for(i = 0; i < jumpers.size; i++)
		{
			if(jumpers[i].pers["team"] == "allies")
			{
				jumpers[i] freezeControls(0);
				jumpers[i] finishPlayerDamage( player, player, 1000, 0, "MOD_PROJECTILE_SPLASH", "none", self.origin, self.origin, "none", 0 );				
			}
		}
	}
	else {
		iPrintLnBold("^5Jumpers won!");
		for(i = 0; i < jumpers.size; i++)
		{
			jumpers[i] braxi\_rank::giveRankXP("", 1000);
		}
	}
}

startdoor1()
{
   door = getent("startdoor1","targetname");
   wait 10;
   iPrintLnBold("^5GO! GO! GO!");
   door delete();
}
startdoor2()
{
   door = getent("startdoor2","targetname");
   wait 10;
   door delete();
}
teleport_jump1()
{
   trig = getent("jumperfail1", "targetname");
   tele1 = getEnt("jumprespawn1", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}
teleport_jump2()
{
   trig = getent("jumperfail2", "targetname");
   tele1 = getEnt("jumprespawn2", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}
teleport_jump3()
{
   trig = getent("jumperfail3", "targetname");
   tele1 = getEnt("jumprespawn2", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}
teleport_jump4()
{
   trig = getent("jumperfail4", "targetname");
   tele1 = getEnt("jumprespawn2", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}
teleport_actijump1()
{
   trig = getent("actifail1", "targetname");
   tele1 = getEnt("actirespawn1", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}
teleport_actijump2()
{
   trig = getent("actifail2", "targetname");
   tele1 = getEnt("actirespawn2", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}
teleport_actijump3()
{
   trig = getent("actifail3", "targetname");
   tele1 = getEnt("actirespawn2", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}
teleport_actijump4()
{
   trig = getent("actifail4", "targetname");
   tele1 = getEnt("actirespawn2", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}
waitdead()
{
    activator = GetActivator();
    level.trigger_scope = getent("sniper_trig","targetname");
    level.trigger_scope thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    level.trigger_scope thread maps\mp\_utility::triggerOn();
}
GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return "Noactivator";
}
createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    hud = NewHudElem();
    hud.x = x;
    hud.y = y;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzalign = alignX;
    hud.vertalign = alignY;
    hud.alpha = alpha;
    hud.font = font;
    hud.fontscale = fontScale;
    hud.glowalpha = 1;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
}
fightHUD(room, jumper, activ)
{
    self notify("newFhud");
    self endon("newFhud");

    if (!isDefined(room))
        room = "undefined";
    if (!isDefined(jumper))
        jumper = "undefined";
    else
        jumper = jumper.name;
    if (!isDefined(activ))
        activ = "undefined";
    else
        activ = activ.name;

    waitTime = 3; //s
    offset = 200; //ms

    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

    level.hud_fight = createHUD( 0, 85, "center", "top", 1, "objective", 1.5 );
    level.hud_fight setText("^3" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^3" + jumper + " ^0VS^0 " + "^3" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}
endTimerPure(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.endTimerHUD setText("^3" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
		//self iPrintLnBold(text);
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}
RoomCountDown(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        self.endTimerHUD setText("^0" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}
sniperroom()
{
    level.trigger_scope = getEnt ("sniper_trig", "targetname");

    jumpersc = getEnt ("sniperjumper_origin", "targetname");
    actisc = getEnt ("sniperacti_origin", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("^5Press ^0[&&1]^5 to enter Sniper Room");
        level.trigger_scope waittill ("trigger", player);

		activator = GetActivator();
        player thread waitdead();
        thread fightHUD("Sniper Room", player, activator);
		player thread RoomCountDown("^5Kill each other !", 3, 0);
		player thread endTimerPure("^0Go Go Go !", 3, 0);
        activator thread endTimerPure("^0Go Go Go !", 3, 0);
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);    
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("remington700_mp");
        activator giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        activator giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        activator giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        activator giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        activator switchToWeapon("m40a3_mp");   
        player.maxhealth = 100;
        player.health = player.maxhealth;
        

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^0" + player.name + " ^5has died in Sniper Room!");
    }
}
sniperfail1()
{
   trigb = getent("sniperactifail", "targetname");
   teleb = getent ("sniperactifail_origin", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

sniperfail2()
{
   triga = getent("sniperjumperfail", "targetname");
   telea = getent ("sniperjumperfail_origin", "targetname");

   for(;;)
    {   
      triga waittill("trigger", player);
	  player setOrigin(telea.origin);
	  player setPlayerAngles (telea.angles);
    }
}