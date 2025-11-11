#include maps\mp\_utility;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	//thread maps\saveload::main();
    SetDvar("bg_falldamagemaxheight", 99999);
    SetDvar("bg_falldamageminheight", 99998);
    SetDvar("g_speed", 210);
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	SetDvar("bg_bobmax" , "0");
	SetDvar("jump_slowdownenable" , "0");
	SetDvar("r_specular" , "1");
	SetDvar("r_drawDecals" , "1");
	SetDvar("dr_jumpers_speed" , "1.12");


	thread antiglitcher();
    thread music();
    thread startdoor();
    thread creditsall();
    thread credits();
    thread velocity();

	thread endmap();
	thread select();
    thread sniper();
    thread knife();
    thread teleport_sniper_jumper();
    thread teleport_sniper_acti();

    thread secret_check_1();
	thread secret_check_2();
	thread secret_check_3();
	thread secret_check_4();
    thread secret_fail();
    thread secret_end();
    thread secret();
    
    thread teleport12();
	thread teleport23();
	thread teleport34();
    thread teleport12_acti();
	thread teleport23_acti();
	thread teleport34_acti();
	thread teleportend();
	thread teleportendlogo();

    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread trap7();
    thread trap8();

    addTriggerToList("trap1");
	addTriggerToList("trap2");
	addTriggerToList("trap3");
    addTriggerToList("trap4");
	addTriggerToList("trap5");
	addTriggerToList("trap6");
    addTriggerToList("trap7");
	addTriggerToList("trap8");

    precacheitem("h1_karambit_mp");
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
	
	return "Noactivator";
}
antiglitcher() 
{
level.activator1 = GetActivator();
level.activ = GetActivator();  
self common_scripts\utility::waittill_any("death","disconnect");
	if(isDefined(self))
	{
		self notify("matchend");
	}
	else
	{
		level waittill("actiKill");
		self notify("matchend");
	}
self freezeControls(0);
level.activ notify("matchend");

	iPrintln("^5"+self.name+" ^7died^5!"); 
	wait 0.2; 
	iPrintlnBold("^5Room selection opened^7!");
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
    level.hud_fight setText("^5" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^5" + jumper + " ^0VS^0 " + "^5" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}
select() 
{
level.room_trig = getEnt( "trigger_select_room", "targetname");
room = getEnt( "origin_select_room", "targetname" );
level.room_trig setHintString ("Press ^5[&&1]^7 to enter room selection");

for(;;)
{
level.room_trig waittill( "trigger", player );
if( !isDefined( level.room_trig ) )
return;

acti = GetActivator();
if(level.firstenter == true)
{
	acti freezeControls(1);
	acti iPrintLnBold("^5Jumper ^7is picking a ^5room ^7so don't ^5move^7!");
	level notify("acti_antiglitch");
	level.firstenter = false;
}
player SetPlayerAngles( room.angles );
player setOrigin( room.origin );
player TakeAllWeapons();
player antiglitcher();
}
}
endmap()
{ 
    trig = getEnt("endmap_trig", "targetname");     
    trig waittill ("trigger" , player );
    firstPlace = newHudElem();
    firstPlace.foreground = true;
    firstPlace.alpha = 1;
    firstPlace.alignX = "left";
    firstPlace.alignY = "middle";
    firstPlace.horzAlign = "left";
    firstPlace.vertAlign = "middle"; 
    firstPlace.x = -400;
    firstPlace.y = 0;
    firstPlace.sort = 0;
    firstPlace.font = "default";
    firstPlace.fontScale = 1.4;
    firstplace.hidewheninmenu = false;
    firstPlace.glowAlpha = 1;
    firstPlace.glowColor = (.3,.0,3);
    firstPlace settext("^5" + player.name + " ^7has finished ^5FIRST^7");
    firstPlace moveOverTime(2); 
    firstPlace.x = 5;
    wait 5;
    firstPlace moveOverTime(2); 
    firstPlace.x = -500;
    wait 7;
    firstPlace destroy(); 
}
waitdead()
{
    activator = GetActivator();
    level.trigger_scope = getent("trigger_sniper","targetname");
    level.trigger_knife = getent("trigger_knife","targetname");
    level.trigger_scope thread maps\mp\_utility::triggerOff();
    level.trigger_knife thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    level.trigger_scope thread maps\mp\_utility::triggerOn();
    level.trigger_knife thread maps\mp\_utility::triggerOn();
}
creditsall()
{
        trig = getEnt("credits", "targetname");
        trig setHintstring("Press ^5[&&1]^7 to show credits");
        for(;;)
        {
        trig waittill("trigger", player);
        iPrintLnBold("Map made by ^5LEGz criz");
	    wait 1;
	    iPrintLnBold("Join ^5Velocity ^7Discord server: ^5https://discord.gg/7fWhErrSEa");
        trig delete();
        }
    }
credits()
{
  while(1) 
	{
        wait 10;
        iPrintln("^5M^7ap created by ^5LEGz criz");
		wait 1;
		iPrintln("Join ^5Velocity ^7Discord server: https://discord.gg/7fWhErrSEa");
        wait 10;
		iPrintln("You^1Tube^7 channel: www.youtube.com/@crizbye");
		wait 5;
		iPrintln("Thanks to:");
		wait 0.5;
		iPrintln("^5F^7lub, ^5E^7ryk, ^5D^7eath, ^5R^7exy and ^5S^7even for help");
		wait 0.5;
		iPrintln("^5S^7loth for karambit model");
		wait 0.5;
		iPrintln("Map made for ^5Velocity ^7Deathrun: 162.19.241.204:28960");
		wait 30;
        iPrintln("^5M^7ap created by ^5LEGz criz");
		wait 1;
		iPrintln("Join ^5Velocity ^7Discord server: https://discord.gg/7fWhErrSEa");
        wait 30;
        }
}
music()
{
    level.music = randomint(4);

    level waittill("round_started");
    switch(level.music)
   {
    case 0:
	    AmbientStop(2);
        AmbientPlay( "song1" );
        break;
    case 1:
	    AmbientStop(2);
        AmbientPlay( "song2" );
        break;
    case 2:
	    AmbientStop(2);
        AmbientPlay( "song3" );
        break;
    case 3:
        AmbientStop(2);
        AmbientPlay( "song4" );
        break;
	}
}
velocity()
{
    boat1 = getent("logo_velocity" , "targetname");
    boat2 = getent("logo_velocity2" , "targetname");
    boat3 = getent("logo_velocity3" , "targetname");
    boat4 = getent("logo_velocity4" , "targetname");
    while(1)
    
    {
    boat1 moveZ (-300, 3, 0.5, 0.5);
    boat2 moveZ (-300, 3, 0.5, 0.5);
    boat3 moveZ (-300, 3, 0.5, 0.5);
    boat4 moveZ (-100, 3, 0.5, 0.5);
    wait 3.05;
    boat1 moveZ (300, 3, 0.5, 0.5);
    boat2 moveZ (300, 3, 0.5, 0.5);
    boat3 moveZ (300, 3, 0.5, 0.5);
    boat4 moveZ (100, 3, 0.5, 0.5);
    wait 3.05;
    }
}
startdoor()
{
    door1 = getEnt("door", "targetname");
    door2 = getEnt("door_2","targetname");
    //level waittill("round_started");
    //wait 2;
    wait 10;
    iprintlnbold("Door opening in");
    iprintlnbold("^5 3");
    wait 1;
    iprintlnbold("^5 2");
    wait 1;
    iprintlnbold("^5 1");
    wait 1;
    door1 moveZ(-50, 3);
    door2 notsolid();
    wait 3;
    door1 delete();
}
//secret
secret()
    {
        trig = getEnt("secret", "targetname");
        tele = getEnt("secret_origin", "targetname");
        trig sethintstring("Press ^5[&&1]^7 to enter ^1HARD^7 secret");
        for(;;)
        {
            trig waittill("trigger", player);
            player freezecontrols(1);
            player setOrigin(tele.origin);
            player setPlayerAngles(tele.angles);
            player iprintlnbold("Welcome to ^1HARD ^7secret...");
            player.checkpointid = 0;
            player thread startDeathTimer(120);
            wait 1;
            player freezecontrols(0);
            player iprintlnbold("^5GOOD LUCK^7!");
        }
    }
    startDeathTimer(duration)
{
    if (!isDefined(self) || !isPlayer(self))
        return;

    player = self;
    player.deathTimerCancelled = false;

    // HUD z samą liczbą
    hudTimer = newClientHudElem(player);
    hudTimer.alignX = "center";
    hudTimer.alignY = "bottom";
    hudTimer.horzAlign = "center";
    hudTimer.vertAlign = "bottom";
    hudTimer.y = -10; // pozycja pionowa
    hudTimer.fontScale = 2;
    hudTimer.alpha = 1;
    hudTimer.color = (0.26, 0.95, 0.96);
    hudTimer.glowalpha = 1;
    hudTimer.glowcolor = (0.26, 0.95, 0.96);
    hudTimer setValue(duration);

    player.deathTimerHud = hudTimer;

    for (i = duration; i >= 0; i--)
    {
        if (!isDefined(player) || !isAlive(player) || player.deathTimerCancelled)
        {
            if (isDefined(hudTimer))
                hudTimer destroy();
            return;
        }

        hudTimer setValue(i);
        wait 1;
    }

    if (isDefined(player) && isAlive(player) && !player.deathTimerCancelled)
    {
        if (isDefined(hudTimer))
            hudTimer destroy();
        player suicide();
    }
}
secret_check_1()
{
	trig = getEnt("secret_check_1","targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		if (player.checkpointid < 1)
		{
			player.checkpointid = 1;
			player iPrintln( "^3 Checkpoint reached" );
		}
	}
}

secret_check_2()
{
	trig = getEnt("secret_check_2","targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		if (player.checkpointid < 2)
		{
			player.checkpointid = 2;
			player iPrintln( "^3 Checkpoint reached" );
		}
	}
}

secret_check_3()
{
	trig = getEnt("secret_check_3","targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		if (player.checkpointid < 3)
		{
			player.checkpointid = 3;
			player iPrintln( "^3 Checkpoint reached" );
		}
	}
}

secret_check_4()
{
	trig = getEnt("secret_check_4","targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		if (player.checkpointid < 4)
		{
			player.checkpointid = 4;
			player iPrintln( "^3 Checkpoint reached" );
		}
	}
}
secret_fail()
{
	trig = getEnt( "secret_fail", "targetname" );
	dest = getEnt( "secret_teleport", "targetname" );
	check1 = getEnt( "secret_check_1_tp", "targetname" );
	check2 = getEnt( "secret_check_2_tp", "targetname" );
	check3 = getEnt( "secret_check_3_tp", "targetname" );
	check4 = getEnt( "secret_check_4_tp", "targetname" );
    while(1)
	{
		trig waittill ( "trigger", player );
		if (isDefined(player.checkpointid))
		{
			if (player.checkpointid == 0)
			{
				player setOrigin( dest.origin );
				player setplayerangles( dest.angles );
                player freezecontrols(1);
                wait 0.5;
                player freezecontrols(0);
			}
			if (player.checkpointid == 1)
			{
				player setOrigin( check1.origin );
				player setplayerangles( check1.angles );
                player freezecontrols(1);
                wait 0.5;
                player freezecontrols(0);
			}
			if (player.checkpointid == 2)
			{
				player setOrigin( check2.origin );
				player setplayerangles( check2.angles );
                player freezecontrols(1);
                wait 0.5;
                player freezecontrols(0);
			}
			if (player.checkpointid == 3)
			{
				player setOrigin( check3.origin );
				player setplayerangles( check3.angles );
                player freezecontrols(1);
                wait 0.5;
                player freezecontrols(0);
			}
			if (player.checkpointid == 4)
			{
				player setOrigin( check4.origin );
				player setplayerangles( check4.angles );
                player freezecontrols(1);
                wait 0.5;
                player freezecontrols(0);
			}
        }
    }
}
    secret_end()
    {
        trig = getEnt("secret_end", "targetname");
        tele = getEnt("secret_end_origin", "targetname");
        
        for(;;)
        {
            trig waittill("trigger", player);
            player setOrigin(tele.origin);
            player setPlayerAngles(tele.angles);
            player freezecontrols(1);
            iprintlnBold("^5 " + player.name + "^7 is ^5pretty good^7!");
            //players3 = getEntArray("player", "classname");
            //for (i = 0; i < players3.size; i++) 
               // {
               // if (isDefined(players3[i])) 
                 //   {
			     //   players3[i] playLocalSound("sound1"); 	
                 //   }
              //  }
                 if (isDefined(player.deathTimerHud))
        {
            player.deathTimerHud destroy();
        }

        player.deathTimerCancelled = true;
            wait 1;
            player freezecontrols(0);
            player giveweapon("h1_karambit_mp");
            player switchtoweapon("h1_karambit_mp");
            //player braxi_rank::giveRankXP("", 10000);
        }
    }
//rooms
 sniper()
{
    level.trigger_scope = getEnt ("trigger_sniper", "targetname");
	level.trigger_scope setHintString("Press ^5[&&1]^7 to enter scope room");
    jumpersc = getEnt ("origin_jumper_sniper", "targetname");
    actisc = getEnt ("origin_acti_sniper", "targetname");

    for(;;)
    {
        level.trigger_scope waittill ("trigger", player, activator);
        iPrintLnBold("^5 " + player.name + " ^7Entered The ^5Sniper ^7Room^5!");
		activator = GetActivator();
        player thread waitdead();
        thread fightHUD("Sniper Room", player, activator);
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
        //wait 1;
        player thread RoomCountDown("^5Kill each other !", 3, 0);
        activator thread RoomCountDown("^5Kill each other !", 3, 0);
        while(isDefined(player) && isAlive(player))
        wait .05;
    }
}
 knife()
{
    level.trigger_knife = getEnt ("trigger_knife", "targetname");
	level.trigger_knife setHintString("Press ^5[&&1]^7 to enter knife room");
    jumper = getEnt ("origin_jumper_knife", "targetname");
    acti = getEnt ("origin_acti_knife", "targetname");

    for(;;)
{
        level.trigger_knife waittill ("trigger", player, activator);
        iPrintLnBold("^5 " + player.name + " ^7Entered The ^5Knife ^7Room^5!");
		activator = GetActivator();
        player thread waitdead();
        thread fightHUD("Knife Room", player, activator);
        player setOrigin (jumper.origin);
        player setPlayerAngles (jumper.angles);    
        activator setOrigin (acti.origin);
        activator setPlayerAngles (acti.angles);
        player takeAllWeapons();
        activator takeAllWeapons();  
        player giveWeapon("h1_karambit_mp");
        activator giveWeapon("h1_karambit_mp");
        player switchtoweapon("h1_karambit_mp");
        activator switchtoweapon("h1_karambit_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        //wait 1;
        player thread RoomCountDown("^5Kill each other !", 3, 0);
        activator thread RoomCountDown("^5Kill each other !", 3, 0);
        while(isDefined(player) && isAlive(player))
        wait .05;
}
    
}
teleport_sniper_jumper()
    {
        trig = getEnt("jumper_sniper_fail", "targetname");
        tele = getEnt("jumper_sniper_fail_origin", "targetname");

        for(;;)
        {
            trig waittill("trigger", player);
            player setOrigin(tele.origin);
            player setPlayerAngles(tele.angles);
        }
    }
     teleport_sniper_acti()
    {
        trig = getEnt("acti_sniper_fail", "targetname");
        tele = getEnt("acti_sniper_fail_origin", "targetname");

        for(;;)
        {
            trig waittill("trigger", player);
            player setOrigin(tele.origin);
            player setPlayerAngles(tele.angles);
        }
    }
//teleports
teleport12()
{
	trig = getEnt("teleport12", "targetname");
    tele = getEnt("teleport12_origin", "targetname");
    
    for(;;)
    {
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
        player iprintlnbold("^5Stage 2");
    }
}
teleport23()
{
	trig = getEnt("teleport23", "targetname");
    tele = getEnt("teleport23_origin", "targetname");
    
    for(;;)
    {
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
        player iprintlnbold("^5Stage 3");
    }
}
teleport34()
{
	trig = getEnt("teleport34", "targetname");
    tele = getEnt("teleport34_origin", "targetname");
    
    for(;;)
    {
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
        player iprintlnbold("^5Final stage");
    }
}
teleport12_acti()
{
	trig = getEnt("teleport12_acti", "targetname");
    tele = getEnt("teleport12_acti_origin", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to enter ^5Stage 2");
    for(;;)
    {
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
        player iprintlnbold("^5Stage 2");
    }
}
teleport23_acti()
{
	trig = getEnt("teleport23_acti", "targetname");
    tele = getEnt("teleport23_acti_origin", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to enter ^5Stage 3");
    for(;;)
    {
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
        player iprintlnbold("^5Stage 3");
    }
}
teleport34_acti()
{
	trig = getEnt("teleport34_acti", "targetname");
    tele = getEnt("teleport34_acti_origin", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to enter ^5Stage 4");
    for(;;)
    {
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
        player iprintlnbold("^5Final stage");
    }
}
teleportend()
{
	trig = getEnt("teleport_end", "targetname");
    tele = getEnt("teleport_end_origin", "targetname");
    
    for(;;)
    {
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
    }
}
teleportendlogo()
{
	trig = getEnt("teleport_end_logo", "targetname");
    tele = getEnt("teleport_end_logo_origin", "targetname");
    
    for(;;)
    {
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
		iprintlnbold("^5"+player.name+" ^7landed on the ^5Velocity ^7logo!");
        //player braxi_rank::giveRankXP("", 2000);
    }
}
//random

trap1()
{
    trig = getEnt("trap1", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to activate trap 1!");
    trig waittill("trigger", player);
    bounce1 = getEnt("trap1_1", "targetname");
    while(true)
    {
        bounce1 rotateyaw(360,2);
        wait 5;
    }
    trig delete();
}
trap2()
{
    trig = getEnt("trap2", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to activate trap 2!");
    trig waittill("trigger", player);
    bounce2 = getEnt("trap2_1", "targetname");
    while(true)
    {
        bounce2 rotateyaw(360,2);
        wait 5;
    }
    trig delete();
}
trap3()
{
    trig = getEnt("trap3", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to activate trap 3!");
    trig waittill("trigger", player);
    bounce3 = getEnt("trap3_1", "targetname");
    while(true)
    {
        bounce3 rotateyaw(360,2);
        wait 5;
    }
    trig delete();
}
trap4()
{
    trig = getEnt("trap4", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to activate trap 4!");
    trig waittill("trigger", player);
    bounce4 = getEnt("trap4_1", "targetname");
    while(true)
    {
        bounce4 rotateyaw(360,2);
        wait 5;
    }
    trig delete();
}
trap5()
{
    trig = getEnt("trap5", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to activate trap 5!");
    trig waittill("trigger", player);
    bounce5 = getEnt("trap5_1", "targetname");
    while(true)
    {
        bounce5 rotateyaw(360,2);
        wait 5;
    }
    trig delete();
}
trap6()
{
    trig = getEnt("trap6", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to activate trap 6!");
    trig waittill("trigger", player);

    trap6_dis = [];
    island6 = getEntArray("trap6_1", "targetname");
    bush6 = getEntArray("trap6_model", "targetname");

    for (i = 0; i < island6.size; i++)
        trap6_dis[trap6_dis.size] = island6[i];

    for (i = 0; i < bush6.size; i++)
        trap6_dis[trap6_dis.size] = bush6[i];

    while (true)
    {
        for (i = 0; i < trap6_dis.size; i++)
            trap6_dis[i] movez(150,1);
            wait 2;
        for (i = 0; i < trap6_dis.size; i++)
            trap6_dis[i] movez(-150,1);
            wait 6;
    }
    trig delete();
}
//traps
trap7()
{
    trig = getEnt("trap7","targetname");
    trig sethintstring("Press ^5[&&1]^7 to activate trap 7!");
    trig waittill("trigger", player); 
    plat7_1 = getEnt("trap7_1", "targetname");
    plat7_2 = getEnt("trap7_2", "targetname");
    plat7_3 = getEnt("trap7_3", "targetname");
while(true)
{
    plat7_1 hide();
    plat7_1 notsolid();
    plat7_2 hide();
    plat7_2 notsolid();
    plat7_3 hide();
    plat7_3 notsolid();
    wait 3;
    plat7_1 show();
    plat7_1 solid();
    plat7_2 show();
    plat7_2 solid();
    plat7_3 show();
    plat7_3 solid();
    wait 7;
}

}
trap8()
{
    // Czekanie na aktywację triggera
    trig = getEnt("trap8", "targetname");
    trig sethintstring("Press ^5[&&1]^7 to activate trap 8!");
    trig waittill("trigger", player);

    // Zbierz lewą stronę pułapki
    groupLeft = [];
    platformsLeft = getEntArray("trap8_1", "targetname");
    bushesLeft = getEntArray("trap8_bush1", "targetname");

    for (i = 0; i < platformsLeft.size; i++)
        groupLeft[groupLeft.size] = platformsLeft[i];

    for (i = 0; i < bushesLeft.size; i++)
        groupLeft[groupLeft.size] = bushesLeft[i];

    // Zbierz prawą stronę pułapki
    groupRight = [];
    platformsRight = getEntArray("trap8_2", "targetname");
    bushesRight = getEntArray("trap8_bush2", "targetname");

    for (i = 0; i < platformsRight.size; i++)
        groupRight[groupRight.size] = platformsRight[i];

    for (i = 0; i < bushesRight.size; i++)
        groupRight[groupRight.size] = bushesRight[i];

    // Uruchom pułapkę w pętli
    while (true)
    {
        // Lewa grupa: lewo
        for (i = 0; i < groupLeft.size; i++)
            groupLeft[i] moveX(-150, 0.5);

        // Prawa grupa: prawo
        for (i = 0; i < groupRight.size; i++)
            groupRight[i] moveX(150, 0.5);

        wait 1;

        // Lewa grupa: prawo
        for (i = 0; i < groupLeft.size; i++)
            groupLeft[i] moveX(150, 0.5);

        // Prawa grupa: lewo
        for (i = 0; i < groupRight.size; i++)
            groupRight[i] moveX(-150, 0.5);

        wait 1;
    }
    trig delete();
}
