
//Map by CM'Death
//Discord:Death#7416
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include braxi\_rank;
main()
{
 maps\mp\_load::main();
 
 game["allies"] = "marines";

 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"]= "desert";
 
	setdvar("g_speed" ,"210");
	setdvar("dr_jumpers_speed" ,"1.12");
	setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998);

    addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
    addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
    addTriggerToList("trig_trap6");

    precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("knife_mp");
    precacheItem("deserteagle_mp");
	
    thread messages();
    thread startdoor();
    thread music();
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread sniperroom();
    thread kniferoom();
    thread jumproom();
    thread jumpweapon();
    thread jumproomjumperfail();
    thread jumproomactifail();
    thread labirintroom();
	
}	
	
addTextHud( who, x, y, alpha, alignX, alignY, fontScale )
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	return hud;
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

removeTextActivator()
{
    if( isDefined( self.hud_textacti) )
    {
        self.hud_textacti destroy();
    }
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
	
	return undefined;
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
    level.hud_fight setText("^1" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^1" + jumper + " ^0VS^0 " + "^1" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

///MESSAGES POPING OUT 
messages()
{
   wait 5;
   for(;;)
{  
   wait 5;
 x = randomint(6);
   if (x==0)
{
   iPrintln("^0Mapped and scripted by ^1CM'Death");
}

   if (x==1)
{
   iPrintln("^0Visit: ^1teamcmdr^0.^1clanwebsite");
}

   if (x==2)
{
   iPrintln("^1CM'^0Deathrun ^1IP^0: ^1cm^7-^1clan^7.^1com^7:^128960");
}

if (x==3)
{
   iPrintln("^0Feel free to report any ^1bugs.");
}

if (x==4)
{
   iPrintln("^0Discord: ^1Death#7416");
}

if (x==5)
{
   iPrintLn("^1Map speed: ^0[^1"+getDvar("g_speed")+"^0]");
}

}
}

//DOOR AT START
startdoor()
{
    fences = getent("startdoor","targetname");

    if(isdefined(level.auto_open_door) && level.auto_open_door) {
		fences delete();
	} else {
        fences show();
        fences solid();

        wait(6);
        iPrintln( "^1Door ^0is removing in..." );
        iPrintln( "^13" );
        wait(1);
        iPrintln( "^12" );
        wait(1);
        iPrintln( "^11" );
        wait(1);
        fences hide();
        fences notsolid();
	}
}  

///RANDOM MUSIC
music()
{
	wait 0.5;
	songs = randomint (4);
	switch (songs) 
    {
		case 0:
		{
            thread musicandhud("sound1","Masked Wolf - Astronaut In The Ocean");
			break;
		}
		case 1: 
		{
            thread musicandhud("sound2","The Weeknd - Blinding Lights");
			break;
		}
		case 2: 
		{
            thread musicandhud("sound4","Foster the People - Pumped up Kicks (Bridge and Law Remix)");
			break;
		}
        case 3:
		{
            thread musicandhud("sound3","VOYAGE x J FADO - PLESI");
			break;
		}
	}
}

musicandhud(song,text)
{
	if(!isdefined(song) || !isdefined(text))
		return;

	ambientstop();
	ambientplay(song);

	level.musichud=newhudelem();
	level.musichud.alignx="left";
	level.musichud.aligny="center";
	level.musichud.horzalign="left";
	level.musichud.vertalign="center";
	level.musichud.alpha=1;
	level.musichud.x=-400;
	level.musichud.y=300;
	level.musichud.font = "default";
	level.musichud.fontscale=1.5;	
	level.musichud.glowalpha=1;
	if(isdefined(level.randomcolor))
		level.musichud.glowcolor=level.randomcolor;
	else 
		level.musichud.glowcolor=(0,0,0);
	
	level.musichud settext("^1Music: ^0"+text);
	wait .1;
	level.musichud moveovertime(1);
	level.musichud.x=7;
}

//TRAPS
trap1()
{
   plata = getent("trap1a", "targetname");
   platb = getent("trap1b", "targetname");
   trig = getent("trig_trap1", "targetname");
   trig setHintString("^0Press ^1[&&1] ^0to activate a ^1trap!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");
   
   for(;;)
	{
	plata notsolid();
    plata hide();
    platb solid();
    platb show();
	wait 3;
	plata solid();
    plata show();
    platb solid();
    platb show();
	wait 1;
    plata solid();
    plata show();
    platb notsolid();
    platb hide();
    wait 3;
    plata solid();
    plata show();
    platb solid();
    platb show();
	wait 1;
	}
}

trap2()
{
   plat = getent("trap2", "targetname");
   trig = getent("trig_trap2", "targetname");
   trig setHintString("^0Press ^1[&&1] ^0to activate a ^1trap!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");

   for(;;)
	{
	plat rotatepitch (360,3);
	wait 0.1;
	plat rotatepitch (360,3);
	wait 0.1;
	}
 
}

trap3()
{
   cylinder = getent("trap3", "targetname");
   trig = getent("trig_trap3", "targetname");
   trig setHintString("^0Press ^1[&&1] ^0to activate a ^1trap!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");

   
   for(;;)
	{
	cylinder rotateYaw (360,1);
	wait 0.1;
	cylinder rotateYaw (360,1);
	wait 0.1;
	}
}

trap4()
{
   cylinder = getent("trap4", "targetname");
   trig = getent("trig_trap4", "targetname");
   trig setHintString("^0Press ^1[&&1] ^0to activate a ^1trap!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");

   for(;;)
	{
	cylinder rotatepitch(720, 2);
	wait 4;
	cylinder  rotatepitch(-720, 2);
	wait 4;
	}
}

trap5()
{
   bounces = getent("trap5", "targetname");
   trig = getent("trig_trap5", "targetname");
   trig setHintString("^0Press ^1[&&1] ^0to activate a ^1trap!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");

   bounces notsolid();
   bounces hide();
}

trap6()
{
   plata = getent("trap6a", "targetname");
   platb = getent("trap6b", "targetname");
   trig = getent("trig_trap6", "targetname");
   trig setHintString("^0Press ^1[&&1] ^0to activate a ^1trap!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");
   
   for(;;)
	{
	plata notsolid();
    plata hide();
    platb solid();
    platb show();
	wait 2;
	plata solid();
    plata show();
    platb solid();
    platb show();
	wait 1.5;
    plata solid();
    plata show();
    platb notsolid();
    platb hide();
    wait 2;
    plata solid();
    plata show();
    platb solid();
    platb show();
	wait 1.5;
	}
}

//ROOMS
sniperroom()
{
    level.trigger_scope = getEnt ("trig_scope", "targetname");

    jumpersc = getEnt ("orig_sniperjumper", "targetname");
    actisc = getEnt ("orig_sniperacti", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("^0Press ^1[&&1]^0 to enter ^1Sniper Room");
        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Sniper Room", player, activator);
        player thread endTimerPure("^1Go Go Go !", 3, 0);
        activator thread endTimerPure("^1Go Go Go !", 3, 0);
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
        

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^1" + player.name + " ^0has died in ^1Sniper Room!");
    }
}

kniferoom()
{
   level.trigger_knife = getEnt ("trig_knife", "targetname");

    jumperk = getEnt ("orig_knifejumper", "targetname");
    actik = getEnt ("orig_knifeacti", "targetname");

   for(;;)
    {
        level.trigger_knife setHintString ("^0Press ^1[&&1]^0 to enter ^1Knife Room");
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Knife Room", player, activator);
        activator thread endTimerPure("^1Go Go Go !", 3, 0);
        player thread endTimerPure("^1Go Go Go !", 3, 0);
	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
        
        iPrintLnBold ("^1" + player.name + " ^0has died in ^1Knife Room!");
    }
}

jumproom()
{
    level.trigger_jump = getEnt ("trig_jump", "targetname");

    jumperb = getEnt ("orig_bouncejumper", "targetname");
    actib = getEnt ("orig_bounceacti", "targetname");

    for(;;)
    {
        level.trigger_jump setHintString ("^0Press ^1[&&1]^0 to enter ^1Bounce Room");
        level.trigger_jump waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Jump Room", player, activator);
        activator thread endTimerPure("^1Go Go Go !", 3, 0);
        player thread endTimerPure("^1Go Go Go !", 3, 0);
		player setOrigin (jumperb.origin);
        player setPlayerAngles (jumperb.angles);
        activator setOrigin (actib.origin);
        activator setPlayerAngles (actib.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
        
        iPrintLnBold ("^1" + player.name + " ^0has died in ^1Jump Room!");
    }
}

jumpweapon()
{
    trig = getEnt ("trig_jumpsniper", "targetname");
    trig setHintString ("^0Press ^1[&&1]^0 to get a ^1Sniper");
    while (1)
    {
        trig waittill ("trigger", player);
        player takeAllWeapons();
        player giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
		player giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        player switchToWeapon("m40a3_mp");
    }
}

jumproomactifail()
{
   trigb = getent("trig_bouncefailacti", "targetname");
   teleb = getent ("orig_bounceacti", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

jumproomjumperfail()
{
   triga = getent("trig_bouncefailjumper", "targetname");
   telea = getent ("orig_bouncejumper", "targetname");

   for(;;)
    {   
      triga waittill("trigger", player);
	  player setOrigin(telea.origin);
	  player setPlayerAngles (telea.angles);
    }
}

labirintroom()
{
   trigger_strafe = getEnt ("trig_labirintescape", "targetname");

    orig_jumper = getEnt ("orig_labjumper", "targetname");
    orig_acti = getEnt ("orig_labeacti", "targetname");

    for(;;)
    {
	    trigger_strafe setHintString ("^0Press ^1[&&1]^0 to enter ^1Labirint Room");
        trigger_strafe waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        
        thread fightHUD("Labirint Room", player, activator);
        player thread endTimerPure("^1Go Go Go !", 3, 0);
        activator thread endTimerPure("^1Go Go Go !", 3, 0);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon ("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
		thread labend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^1" + player.name + " ^0has died in ^1Labirint Room!");
    }
}

labend(who, who2)
{
	trig = getEnt ("trig_labfinish", "targetname");
	origWin = getEnt ("orig_labwinner", "targetname");
	origLose = getEnt ("orig_lablooser", "targetname");
	
	while(1)
	{
		trig waittill("trigger", winner);
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
		
		if (winner == who)
			loser = who2;
		else
			loser = who;
		
		if (isDefined(loser))
		{
			loser setOrigin (origLose.origin);
			loser setPlayerAngles (origLose.angles);
			loser freezeControls (1);
			loser takeAllWeapons();
		}
	}
}

///END QUEUE
waitdead()
{
    activator = GetActivator();
    knife = getent("trig_knife","targetname");
    sniper = getent("trig_scope","targetname");
    bounce = getent("trig_jump","targetname");
    labirint = getent("trig_labirintescape","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    bounce thread maps\mp\_utility::triggerOff();
    labirint thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    bounce thread maps\mp\_utility::triggerOn();
    labirint thread maps\mp\_utility::triggerOn();
}

///ROOM COUNTDOWN
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
        self.endTimerHUD setText("^0" + duration);
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