///Mapped by CM'Compy ; re-designed and scripted by CM'death
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
main()
{
    maps\mp\_load::main();
    

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

   setdvar("g_speed" ,"210"); 
   setdvar( "r_specularcolorscale", "1" );
   setdvar("r_glowbloomintensity0",".1");
   setdvar("r_glowbloomintensity1",".1");
   setdvar("r_glowskybleedintensity0",".1");

   addTriggerToList("trig_trap1");
   addTriggerToList("trig_trap2");
   addTriggerToList("trig_trap3");
   addTriggerToList("trig_trap4");
   addTriggerToList("trig_trap5");

   precacheItem("deserteagle_mp");
   precacheItem("remington700_mp");
   precacheItem("m40a3_mp");
   precacheItem("knife_mp");
   precacheModel("plr_mrh_djskully");
   precacheShader("mtl_mrh_skully");

    thread messages();
    thread startdoor();
    thread vipstuff();
    thread sniperroom();
    thread kniferoom();
    thread oldroom();
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

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
    hud.glowalpha = 0;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
}

removeTextActivator()
{
    if( isDefined( self.hud_textacti) )
    {
        self.hud_textacti destroy();
    }
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
        activ = getactivator();
    else
        activ = level.activ.name;

    waitTime = 3; //s
    offset = 200; //ms

    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

    level.hud_fight = createHUD( 0, 85, "center", "top", 1, "objective", 1.5 );
    level.hud_fight setText("^5" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^0" + jumper + " ^5VS^3 ^0" + activ);
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
        self.endTimerHUD setText("^5" + duration);
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

messages()
{
   wait 1;
    AmbientPlay ("katatonia");
   wait 5;
   iprintlnBold("^0Map Dedicated to ^5CheckMate");
   for(;;)
{  
   wait 7;
 x = randomintrange(0,5);
   if (x==0)
{
   iPrintln("^0Map by ^5CM'CoMpy ^0; improved and fixed by ^5CM'death");
}

   if (x==1)
{
   iPrintln("^0Visit: ^5teamcmdr^0.^5clanwebsite");
}

   if (x==2)
{
   iPrintln("^5CM'Deathrun ^0IP: ^5cm-clan.com:^028960");
}

if (x==3)
{
   iPrintln("^0Feel free to report any ^5bugs^0.");
}

if (x==4)
{
   iPrintln("^0Discord: ^5Death#7416 ^0; ^5CoMpy#1823");
}

if (x==5)
{
   iPrintLn("^0Map speed: ^5[^0"+getDvar("g_speed")+"^5]");
}

}
}

startdoor()
{
    startdoor = getent("startdoor", "targetname");
    if(isdefined(level.auto_open_door) && level.auto_open_door) {
        startdoor delete();
    } else {
        wait 10;
        startdoor moveZ(-350, 5);
    }
}

vipstuff()
{
	trigger = getEnt ("vipstuff", "targetname");
	trigger setHintString ("^5VIP ^0Area!");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( (isSubStr( toLower(gametag), toLower("CM'")) && !isSubStr( toLower(gametag), toLower("CM'") ) )  || gametag == "DC | death" || gametag == "CoMpy"  || gametag == "CM'Death" || gametag == "CM'death" || gametag == "CM'CoMpy" || gametag == "death")  
	                   
		{     
        player setmodel("plr_mrh_djskully");
        player braxi\_rank::giveRankXP("", 500);

        trigger delete();
       
	   }
 
		else
		{
			player iPrintLnBold("^0 You are not ^5VIP");
		}
	}
}

waitdead()
{
    activator = GetActivator();
    knife = getent("trig_knife","targetname");
    sniper = getent("trig_scope","targetname");
    old = getent("trig_old","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    old thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    old thread maps\mp\_utility::triggerOn();
}

sniperroom()
{
    level.trigger_scope = getEnt ("trig_scope", "targetname");

    jumpersc = getEnt ("orig_sniperjumper", "targetname");
    actisc = getEnt ("orig_sniperacti", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("^0Press ^5[&&1]^0 to enter ^5Sniper Room");
        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Sniper Room", player, activator);
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
        

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLn ("^5" + player.name + " ^0has died in ^5Sniper Room!");
    }
}

kniferoom()
{
   level.trigger_knife = getEnt ("trig_knife", "targetname");

    jumperk = getEnt ("orig_knifejumper", "targetname");
    actik = getEnt ("orig_knifeacti", "targetname");

   for(;;)
    {
        level.trigger_knife setHintString ("^0Press ^5[&&1]^0 to enter ^5Knife Room");
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Knife Room", player, activator);
        activator thread endTimerPure("^0Go Go Go !", 3, 0);
        player thread endTimerPure("^0Go Go Go !", 3, 0);
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
        
        iPrintLn ("^5" + player.name + " ^0has died in ^5Knife Room!");
    }
}

oldroom()
{
    platform = getent("olddoor", "targetname");
    level.trigger_old = getent("trig_old", "targetname");

	
    while(1)
    {
        level.trigger_old setHintString ("^0Press ^5[&&1]^0 to enter ^5Old Room");
        level.trigger_old waittill ("trigger", player);

        level.trigger_old delete();
        
        platform moveZ(-350, 5);

        activator = getactivator();
        player thread waitdead();
        activator takeAllWeapons();
        activator giveWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
        
        iPrintLn ("^5" + player.name + " ^0has died in ^5Old Room!");
    }
}

trap1()
{

   cylindera = getent("trap1a", "targetname");
   cylinderb = getent("trap1b", "targetname");
   cylinderc = getent("trap1c", "targetname");
   cylinderd = getent("trap1d", "targetname");
   cylindere = getent("trap1e", "targetname");
   cylinderf = getent("trap1f", "targetname");

   trig = getent("trig_trap1", "targetname");

   trig setHintString("^0Press ^5[&&1] ^0to activate a ^5trap^0!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");
   
   while(1)
  { 
    wait 0.1;
   cylindera rotateYaw (360,2);
   cylinderb rotateYaw (360,2);
   cylinderc rotateYaw (360,2);
   cylinderd rotateYaw (-360,2);
   cylindere rotateYaw (-360,2);
   cylinderf rotateYaw (-360,2);
   }
}   

trap2()
{
   plata = getent("trap2", "targetname");
   trig = getent("trig_trap2", "targetname");

   trig setHintString("^0Press ^5[&&1] ^0to activate a ^5trap^0!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");
   
   for(;;)
	{
	plata notsolid();
    plata hide();
	wait 3;
	plata solid();
    plata show();
	wait 5;
    plata notsolid();
    plata hide();
    wait 3;
    plata solid();
    plata show();
	wait 5;
	}
}

trap3()
{
   plata = getent("trap3a", "targetname");
   platb = getent("trap3b", "targetname");
   trig = getent("trig_trap3", "targetname");

   trig setHintString("^0Press ^5[&&1] ^0to activate a ^5trap^0!");
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
	wait 1.5;
    plata solid();
    plata show();
    platb notsolid();
    platb hide();
    wait 3;
    plata solid();
    plata show();
    platb solid();
    platb show();
	wait 1.5;
	}
}

trap4()
{
trig = getEnt ("trig_trap4", "targetname");
trig setHintString("^0Press ^5[&&1] ^0to activate a ^5trap^0!");
plata = getent ("trap4a", "targetname");
platb = getent ("trap4b", "targetname");

while(1)
{
    trig waittill ("trigger", player);
    trig setHintString("^1Activated");

    randomplat = randomint(2);

    if (randomplat == 0 )
    {
    plata notsolid();
    plata hide();
    platb solid();
    platb show();
    }
    if (randomplat == 1)
    {
    plata solid();
    plata show();
    platb notsolid();
    platb hide();
    }
    
    trig delete();
}

}

trap5()
{
   plata = getent("trap5a", "targetname");
   platb = getent("trap5b", "targetname");

   trig = getent("trig_trap5", "targetname");

   trig setHintString("^0Press ^5[&&1] ^0to activate a ^5trap^0!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");

  for(;;)
	{
	plata moveZ (-100,0.5);
    platb moveZ (100,0.5);
    wait 0.5;
    plata moveZ (100,0.5);
    platb moveZ (-100,0.5);
    wait 0.5;
	}
}