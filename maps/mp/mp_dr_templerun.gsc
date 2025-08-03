#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include common_scripts\utility;

/*
Map By: Death
Code Fixed By: Clippy
*/

main()
{
    maps\mp\_load::main();

    ///FX LOAD
    level.water = LoadFx("misc/water_drop");
    level.fireblast = loadfx ("fire/temple_fire2");
    level.fan = loadfx ("fire/temple_fan");
    level.fire = loadfx ("fire/firelp_med_streak_pm_h");
    level.fire_torch = loadfx ("fire/tv_fire");
    level.board = LoadFx("explosions/wall_explosion_round");
    level.sparkle = LoadFx("misc/temple_sparkle");
    level.break_door = LoadFx("breakables/temple_wall_explode");

    game["allies"] = "sas";
    game["axis"] = "russian";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
        
    ///DVARS       
	// setdvar("r_specularcolorscale", "1"); // dont touch these dvars they stick on server if they dont get reset
    // setdvar("r_glowbloomintensity0",".1");
	// setdvar("r_glowbloomintensity1",".1");
	// setdvar("r_glowskybleedintensity0",".1");

	setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998);

///TRAP TRIGGERS
    addTriggerToList("trig_fan");
    addTriggerToList("trig_fire");
    addTriggerToList("trig_spinner");
    addTriggerToList("trig_ball");
    addTriggerToList("trig_board");
    addTriggerToList("trig_laser");

///PRECACHE MODEL/ITEM TO SEE MODEL/ITEM IN GAME
    precacheshader("mtl_laraclothes");
    precacheshader("mtl_laraface");
    precacheshader("mtl_eyes_etc");
    precacheshader("mtl_boots_etc");
    precacheshader("mtl_larahair");
    precacheModel("plr_terry_laracroft");

    precacheshader("mtl_ursegor_full");
    precacheModel("plr_terry_ursegor");

    precacheItem("frag_grenade_mp");
    precacheItem("m40a3_mp");
    precacheItem("remington700_mp");
    precacheItem("knife_mp");
    precacheItem("deserteagle_mp");
    precacheItem("beretta_mp");
    precacheItem("ak47_mp");
  
///THREADS/ACTIVATES SCRIPT   
    thread messagescreen();
    thread messages();
    thread randommusic();
    thread jumperskin();
    thread actiskin();
    thread arrow();
    thread coinsmover();
    thread coins();

    thread spinner();

    thread stage2door();
    thread stage2tp();

    thread hints();
    thread enddoorsniper();
    thread enddoorknife();
    thread enddoorrun();
    thread enddoorspin();
    thread enddoormaze();

    thread sectp();
    thread secend();
    thread save_load_logic();

    thread actitp1();
    thread actitp2();

    thread waterfx1();
    thread waterd1_sound();
    thread waterfx2();
    thread waterd2_sound();

    thread fan();
    thread fire_loop();
    thread fire_torch_sound_fx();
    thread fire_statue_sound_fx();
    thread knife_fire();
    thread knife_fire_sound();
    thread knife_vase();
    thread fire_failroom();
    thread fire_fail_sound();
    thread board();
    thread laser();
	thread rope();
    thread ball();
    thread end_wall();


    thread roomselection();
    thread kniferoom();
    thread sniperroom();
    thread sniperfail();
    thread runroom();
    thread run_jumper_fail();
    thread run_acti_fail();
    thread run_jumper_stage();
    thread run_acti_stage();
    thread spinroom();
    thread mazeroom();

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

removehudsondeath()
{
    self endon ("death");
    self.owner waittill_any("death", "disconnect");
    
    if( isDefined( self ) )
    {
        self destroy();
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
    level.hud_fight setText("^3" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^3" + jumper + " ^7VS^7 " + "^3" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

messagescreen()
{
	level waittill("round_started");
	wait 1;
	noti = SpawnStruct();
	noti.TitleText = "^7Welcome to ^3TempleRun^7!";
    noti.notifyText = "^7Mapped and Scripted by ^3CM'death^7!";
	noti.duration = 8;
	noti.glowcolor = (0,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}

messages()
{
   wait 4;
   for(;;)
{  
   wait 10;
 x = randomint(6);
   if (x==0)
{
   iPrintln("^3Mapped ^7and ^3scripted ^7by ^3CM'death^7!");
}

   if (x==1)
{
   iPrintln("^7Visit ^3CM'Discord Server: ^7dv82mEHCY7");
}

   if (x==2)
{
   iPrintln("^3CM'Deathrun IP: ^7cm-clan.com:28960");
}

   if (x==3)
{
   iPrintln("^7Feel free to report any ^3bugs^7.");
}

   if (x==4)
{
   iPrintLn("^3Map speed: ^7[^3"+getDvar("g_speed")+"^7]^7, ^7[^3"+getDvar("dr_jumpers_speed")+"^7]");
}

   if (x==5)
{
   iPrintLn("^7Thanks to ^3CM'Nobody ^7and ^3Ohh Rexy<3 ^7for helping me with the ^3bugs^7!");
}
}
}

randommusic()
{
    wait 5;

    randommusic = randomint(4);

    if (randommusic == 0)
    {
        ambientStop(2);
        AmbientPlay("temple3");  
    }
    if (randommusic == 1)
    {
        ambientStop(2);
        AmbientPlay("temple2"); 
    }
    if (randommusic == 2)
    {
        ambientStop(2);
        AmbientPlay("temple1");   
    } 
    if (randommusic == 3)
    {
        ambientStop(2);
        AmbientPlay("temple4");  
    }
}

jumperskin()
{

for(;;)
{
    level waittill( "player_spawn", player );
	
    player detachAll();
	player setmodel("plr_terry_laracroft");

}	
}

actiskin()
{ 
trig = getent("trig_actiskin", "targetname");
	
while(1)
{
 trig waittill("trigger", player);

  wait 0.05;
    if(isDefined(level.activ) && isAlive(level.activ))
    {
        level.activ detachAll();
        level.activ setmodel("plr_terry_ursegor");
    }      

 trig delete();

}
}

arrow()
{
   arrow= getent("arrow","targetname");
    
   level waittill("round_started"); 

   for(;;)
   { 
   arrow moveZ (40,2);
   arrow waittill("movedone");
   arrow moveZ (-40,2);
   arrow waittill("movedone");
   }
      
} 

coins() {
    coin_array = [];
    coin_array[coin_array.size] = getent("coin1", "targetname");
    coin_array[coin_array.size] = getent("coin2", "targetname");
    coin_array[coin_array.size] = getent("coin3", "targetname");
    coin_array[coin_array.size] = getent("coin4", "targetname");
    coin_array[coin_array.size] = getent("coin5", "targetname");
    coin_array[coin_array.size] = getent("coin6", "targetname");
    coin_array[coin_array.size] = getent("coin7", "targetname");
    coin_array[coin_array.size] = getent("coinred1", "targetname");
    coin_array[coin_array.size] = getent("coinred2", "targetname");
    coin_array[coin_array.size] = getent("coinred3", "targetname");
    coin_array[coin_array.size] = getent("coinblue1", "targetname");
    coin_array[coin_array.size] = getent("coinblue2", "targetname");
    thread coin_move(coin_array);

    for(i=0;i<coin_array.size;i++) {
        if(i>9)
            coin_array[i] thread coin_think(getentArray("sparkle", "targetname")[i], getent("trig_coin"+(i+1), "targetname"), int(200));
        else if(i>6)
            coin_array[i] thread coin_think(getentArray("sparkle", "targetname")[i], getent("trig_coinred"+(i-6), "targetname"), int(500), false);
        else
            coin_array[i] thread coin_think(getentArray("sparkle", "targetname")[i], getent("trig_coinblue"+(i-9), "targetname"), int(1000), true);
    }       
}

coin_move(coin_array) {
    for(;;)
    {
        wait 2.05;
        for(i=0;i<coin_array.size;i++) {
            coin_array[i] rotateYaw (-720,4);
            coin_array[i] moveZ (-15,2);
        }
        wait 2.05;
        for(i=0;i<coin_array.size;i++) {
            coin_array[i] rotateYaw (-720,4);
            coin_array[i] moveZ (15,2);
        }
    } 
}

coin_think(sparkle, trig, xp, big)
{
    if(!isdefined(big))
        tmp = "^3";
    else if(!big)
        tmp = "^1Red ^3";
    else
        tmp = "^3Big ^3";

    self show();

    trig enablelinkto();
    trig linkto (self);

    trig waittill ("trigger",player);

    self hide();
    
    PlayFX(level.sparkle, sparkle.origin);

    player iprintln ("^3You ^7collected a "+tmp+"coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", xp);

    trig delete();
    self delete();
}  

spinner()
{
    spin = getent("spinner", "targetname");

    trig = getent("trig_spinner", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to activate a ^3spinner^7!");

    trig waittill ("trigger",player);

        trig setHintString("^1Activated!");

    for(;;)
    {
        spin rotateYaw (-720,4);
        wait 8;
        spin rotateYaw (720,4);
        wait 8;
    } 
}   

stage2door()
{
   doora = getent("stage2doora", "targetname");
   doorb = getent("stage2doorb", "targetname");

   trig = getent("trig_stage2door", "targetname");

   trig waittill ("trigger",player);

   wait 0.1;
   doora rotateYaw(100,4);
   doorb rotateYaw(-100,4);
   iprintlnBold ("^3" + player.name + " ^7opened the ^3gate^7!");
   player braxi\_rank::giveRankXP("", 500);

   trig delete();
	
}

stage2tp()
{
   trig = getent("trig_stage2tp", "targetname");
   tele = getent ("orig_stage2tp", "targetname");

    for(;;)
    {   
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
    }
}

hints()
{
    trig = getEnt("trig_sniper_hint","targetname");
    trig setHintString ("^3Sniper Room^7!");

    trig = getEnt("trig_knife_hint","targetname");
    trig setHintString ("^3Knife Room^7!");

    trig = getEnt("trig_run_hint","targetname");
    trig setHintString ("^3Run Room^7!");

    trig = getEnt("trig_spin_hint","targetname");
    trig setHintString ("^3Spin Room^7!");

    trig = getEnt("trig_maze_hint","targetname");
    trig setHintString ("^3Maze Room^7!");
}

enddoorsniper()
{
   door = getent("door_sniper", "targetname");

   trig = getent("trig_door_sniper", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Sniper Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(-95,4);
   
   trig delete();
	
}

enddoorknife()
{
   door = getent("door_knife", "targetname");

   trig = getent("trig_door_knife", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Knife Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(95,4);
   
   trig delete();
	
}

enddoorrun()
{
   door = getent("door_run", "targetname");

   trig = getent("trig_door_run", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Run Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(95,4);
   
   trig delete();

}

enddoorspin()
{
   door = getent("door_spin", "targetname");

   trig = getent("trig_door_spin", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Spin Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(-95,4);
   
   trig delete();

}

enddoormaze()
{
   door = getent("door_maze", "targetname");

   trig = getent("trig_door_maze", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Maze Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(95,4);
   
   trig delete();

}

sectp()
{
    trig = getent("trig_sectp", "targetname");
    tele = getent ("orig_sectp", "targetname");

    for(;;)
    {   
        trig waittill("trigger", player);
        player thread secret_timer();
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
        player.sc_pos = 0;
        player.insec = true;
        player iprintlnBOld ("^3You ^7entered in ^3Secret Room ^7!");

        player thread secend();
    }
}

secend()
{
    self endon( "spawned_player" );
    self endon( "joined_spectators" );
    self endon( "death" );


   trig = getent("trig_secend", "targetname");
   tele = getent ("orig_secend", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);

      if(player != self)
        continue;

     player notify("secret_done");
	 player.secretTimer destroy();
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player.sc_pos = 0;
     player.insec = false;
     player braxi\_rank::giveRankXP("", 5000);
     iprintln ("^3" + player.name + " ^7finished the ^3Secret Room^7!");

      break;
    }
}

save_load_logic()
{
    fail_trigger = getent("trig_fail","targetname");
    save_triggers = GetEntArray("save_triggers","targetname");
    
    for(i=0;i<save_triggers.size;i++)
        thread save_pos(save_triggers[i],i);

    while(1)
    {
        fail_trigger waittill("trigger",player);
        player SetOrigin( save_triggers[player.sc_pos].origin+(0,0,1) );
    }
}

save_pos(trig,pos)
{
    while(1)
    {
        trig waittill("trigger",player);
        
        if(!IsDefined(player.sc_pos))
            player.sc_pos = pos;

        else if(IsDefined(player.sc_pos) && player.sc_pos < pos)
        {
            player.sc_pos = pos;
            player IPrintLn("^3" + " Checkpoint " + "^7" + pos);
        }

        wait 0.1;
    }
}

secret_timer()
{
	self endon("secret_done");
	self endon("death");
	self endon("round_ended");
	self thread destroyOnDeath();
	
	if(isdefined(self.secretTimer))
	    self.secretTimer destroy();

	self.secretTimer = newclienthudelem(self);
	self.secretTimer.foreground = true;
	self.secretTimer.alignX = "center";
	self.secretTimer.alignY = "bottom";
	self.secretTimer.horzAlign = "center";
	self.secretTimer.vertAlign = "bottom";
	self.secretTimer.x = 0;
	self.secretTimer.y = -7;
	self.secretTimer.sort = 5;
	self.secretTimer.fontScale = 1.4;
	self.secretTimer.font = "default";
	self.secretTimer.glowAlpha = 0;
	self.secretTimer.hidewheninmenu = true;
	self.secretTimer.label = &"^3Time left: ^7&&1";

	if(isdefined(level.randomcolor))
	    self.secretTimer.glowColor = level.randomcolor;
	else 
	    self.secretTimer.glowColor = (1,0,0);

	time = 120; 
	for(i=0;i<time;i++)
    {
        self.secretTimer setvalue(time-i);
        wait 1;
    }

    self.secretTimer setvalue(0);
    self suicide();

    if(isdefined(self.secretTimer))
    self.secretTimer destroy();
}

destroyOnDeath()
{
	self waittill("death");

	if(isDefined(self.secretTimer))
	    self.secretTimer destroy();
    
}

actitp1()
{
    trig = getent("trig_actitp1", "targetname");
    tele = getent ("orig_actitp1", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to ^3teleport^7!");

    for(;;)
    {   
        trig waittill("trigger", player);
        player setOrigin(tele.origin);
        player setPlayerAngles(tele.angles);
    }
}

actitp2()
{
    trig = getent("trig_actitp2", "targetname");
    tele = getent ("orig_actitp2", "targetname");

    for(;;)
    {   
        trig waittill("trigger", player);

        wait 0.05;
        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin(tele.origin);
            level.activ setPlayerAngles(tele.angles);
            level.activ iprintlnBold ("^3Jumper ^7trapped ^3you ^7so you can't ^3run away^7!");
            wait 5;
        }      

        trig delete();
    }
}

waterfx1()
{   
    origin_effect1 = getEntArray("waterd1", "targetname");

    level waittill("round_started");

    PlayFX(level.water, origin_effect1[0].origin);
    PlayFX(level.water, origin_effect1[1].origin);
    PlayFX(level.water, origin_effect1[2].origin);
    PlayFX(level.water, origin_effect1[3].origin);
    PlayFX(level.water, origin_effect1[4].origin);
    PlayFX(level.water, origin_effect1[5].origin);
    PlayFX(level.water, origin_effect1[6].origin);
    PlayFX(level.water, origin_effect1[7].origin);

}

waterd1_sound()
{
    sound = getentArray ("waterd1","targetname");
   
    level waittill("round_started");
    sound[3] playloopsound ("temple_waterfall");
}

waterfx2()
{   
    origin_effect2 = getEntArray("waterd2", "targetname");

    level waittill("round_started");

    PlayFX(level.water, origin_effect2[0].origin);
    PlayFX(level.water, origin_effect2[1].origin);
    PlayFX(level.water, origin_effect2[2].origin);
    PlayFX(level.water, origin_effect2[3].origin);
    PlayFX(level.water, origin_effect2[4].origin);
    PlayFX(level.water, origin_effect2[5].origin);
    PlayFX(level.water, origin_effect2[6].origin);
    PlayFX(level.water, origin_effect2[7].origin);
}

waterd2_sound()
{
    sound = getentArray ("waterd2","targetname");
   
    level waittill("round_started");
    sound[3] playloopsound ("temple_waterfall");
}

fan()
{   
    fan1 = getEnt("fan1", "targetname");
    fan2 = getEnt("fan2", "targetname");
    fan3 = getEnt("fan3", "targetname");
    fan4 = getEnt("fan4", "targetname");
    fan1fx = getEnt("fanfx1", "targetname");
    fan2fx = getEnt("fanfx2", "targetname");
    fan3fx = getEnt("fanfx3", "targetname");
    fan4fx = getEnt("fanfx4", "targetname");
    fan1fx.angles = (-1, 0, 0);
    fan2fx.angles = (1, 0, 0);
    fan3fx.angles = (-1, 0, 0);
    fan4fx.angles = (1, 0, 0);

    hurt = getEntArray("trig_hurt_fan1", "targetname");
   
    trig = getent("trig_fan", "targetname");
    
    trig setHintString("^7Press ^3[&&1] ^7to activate ^3fans!");

    hurt[0] maps\mp\_utility::triggerOff();
    hurt[1] maps\mp\_utility::triggerOff();
    hurt[2] maps\mp\_utility::triggerOff();
    hurt[3] maps\mp\_utility::triggerOff();

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

    for(;;)
    { 
        fan1 fan_stuff(fan1fx);
        fan2 fan_stuff(fan2fx);
        fan3 fan_stuff(fan3fx);
        fan4 fan_stuff(fan4fx);

        thread hurt(hurt);

        wait 18;
    }

}

fan_stuff(fx_ent) {
    fx_ent thread fan_fx(fx_ent);
    self RotatePitch(3240, 9);
    self thread fan_sound();
}

fan_fx()
{
    fx = spawnFX(level.fan, self.origin, self.angles);

    triggerFX(fx);
    wait 9;
    fx delete();
}

fan_sound()
{
    self playsound ("temple_fan_wind");
    wait 3;
    self playsound ("temple_fan_wind");
    wait 3;
    self playsound ("temple_fan_wind");
    wait 3; 
}

hurt(hurt)
{

    hurt[0] maps\mp\_utility::triggerOn();
    hurt[1] maps\mp\_utility::triggerOn();
    hurt[2] maps\mp\_utility::triggerOn();
    hurt[3] maps\mp\_utility::triggerOn();

    wait 9; // would need to test in game to see how this trap works, but wtf was this

    hurt[0] maps\mp\_utility::triggerOff();
    hurt[1] maps\mp\_utility::triggerOff();
    hurt[2] maps\mp\_utility::triggerOff();
    hurt[3] maps\mp\_utility::triggerOff();

}

fire_loop()
{   
    origin_effect = getEntArray("fireblaster1", "targetname");
    hurta = getent("trig_hurt_fire1", "targetname");
    hurtb = getent("trig_hurt_fire2", "targetname");
   
    trig = getent("trig_fire", "targetname");

    hurta maps\mp\_utility::triggerOff();
	hurtb maps\mp\_utility::triggerOff();

    trig setHintString("^7Press ^3[&&1] ^7to activate ^3fireburner^7!");

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

    for(;;)
    {
        thread fire_sound(15);
        thread fire_sound(45);

        for(i=1;i<=54;i++)
            thread fire(i);
            
        thread hurt_fire(hurta,hurtb);

        wait 12;
    }
}

fire_sound(index) //15 - 45
{
    trig_sound = getent ("fireblaster"+index,"targetname");
     
    trig_sound playsound ("temple_burner_fire");
    wait 3;
    trig_sound playsound ("temple_burner_fire");
    wait 3;

}

fire(index)
{
    fire = getent ("fireblaster" + index ,"targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

hurt_fire(hurta,hurtb)
{
    hurta maps\mp\_utility::triggerOn();
    hurtb maps\mp\_utility::triggerOn();
    wait 6;
    hurta maps\mp\_utility::triggerOff();
    hurtb maps\mp\_utility::triggerOff();
    wait 6;
}


fire_torch_sound_fx()
{
    ent = getentArray ("temple_torch","targetname");
   
    level waittill("round_started");
     
    for(i=0;i<sound.size;i++) {
        PlayFX(level.fire_torch, ent[i].origin);
        ent[i] playloopsound ("temple_fire_statue");
    }
}


fire_statue_sound_fx()
{
    ent = [];
    ent[ent.size] = getent ("fire_statue1","targetname");
    ent[ent.size] = getent ("fire_statue2","targetname");
    ent[ent.size] = getent ("fire_statue3","targetname");
    ent[ent.size] = getent ("fire_statue4","targetname");
    ent[ent.size] = getent ("fire_statue5","targetname");
    ent[ent.size] = getent ("fire_statue6","targetname");

    level waittill("round_started");
     
    for(i=0;i<ent.size;i++) {
        ent[i] playloopsound ("temple_fire_statue");
        PlayFX(level.fire, ent[i].origin);
    }
}

knife_fire()
{   
    origin_effect1 = getEnt("knife_fire1", "targetname");
    origin_effect2 = getEnt("knife_fire2", "targetname");
    origin_effect3 = getEnt("knife_fire3", "targetname");
    origin_effect4 = getEnt("knife_fire4", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect1.origin);
    PlayFX(level.fire, origin_effect2.origin);
    PlayFX(level.fire, origin_effect3.origin);
    PlayFX(level.fire, origin_effect4.origin);

}

knife_fire_sound()
{
    sound1 = getent ("knife_fire1","targetname");
    sound2 = getent ("knife_fire2","targetname");
    sound3 = getent ("knife_fire3","targetname");
    sound4 = getent ("knife_fire4","targetname");
   
    level waittill("round_started");

 {    
    sound1 playloopsound ("temple_fire_statue");
    sound2 playloopsound ("temple_fire_statue");
    sound3 playloopsound ("temple_fire_statue");
    sound4 playloopsound ("temple_fire_statue");
 }  
 
}

knife_vase()
{
   vase = getEnt("knife_vase", "targetname");

   level waittill("round_started");

   for(;;)
 {

    vase moveZ (-15,2);
    vase waittill ("movedone");
    wait 2;
    vase moveZ (15,2);
    vase waittill ("movedone");
    wait 2;

 } 

}

fire_failroom()
{   
    origin_effect0 = getEnt("fire_1_fail", "targetname");
    origin_effect1 = getEnt("fire_2_fail", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect0.origin);
    PlayFX(level.fire, origin_effect1.origin);

}

fire_fail_sound()
{
    sound1 = getent ("fire_1_fail","targetname");
    sound2 = getent ("fire_2_fail","targetname");
   
    level waittill("round_started");

 {    
    sound1 playloopsound ("temple_fire_statue");
    sound2 playloopsound ("temple_fire_statue");
   
 }  
 
}

board()
{   
    origin_effect = getEntArray("orig_boardfx", "targetname");
    boarda = getEnt("board", "targetname");
    board = getEntArray("boardfx", "targetname");
    trig = getent("trig_board", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to ^3crush ^7the ^3board^7!");

    board[0] hide();
    board[0] notsolid();
    board[1] hide();
    board[1] notsolid();
    board[2] hide();
    board[2] notsolid();
    board[3] hide();
    board[3] notsolid();

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

    PlayFX(level.board, origin_effect[0].origin);
    PlayFX(level.board, origin_effect[1].origin);
    PlayFX(level.board, origin_effect[2].origin);
    boarda delete();
    wait 0.2;
    board[0] show();
    board[0] solid();
    board[1] show();
    board[1] solid();
    board[2] show();
    board[2] solid();
    board[3] show();
    board[3] solid();

}

laser()
{
   trig = getent("trig_laser", "targetname");
 
    trig setHintString("^7Press ^3[&&1] ^7to activate ^3lasers^7!");

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");
   
  thread laser1();
  thread laser2();
}   

laser1()
{
   laser1 = getent("laser1", "targetname");
   hurta = getent("trig_hurt_laser1", "targetname");
   
   hurta enablelinkto();
   hurta linkto (laser1);
   
   for(;;)
  { 
   laser1 moveZ (-160,0.5);
   laser1 waittill ("movedone");
   laser1 moveZ (160,0.5);
   laser1 waittill ("movedone");
   }
}   

laser2()
{
   laser2 = getent("laser2", "targetname");
   hurtb = getent("trig_hurt_laser2", "targetname");
   
   hurtb enablelinkto();
   hurtb linkto (laser2);
   
   for(;;)
  { 
   laser2 moveZ (-115,0.5);
   laser2 waittill ("movedone");
   laser2 moveZ (115,0.5);
   laser2 waittill ("movedone");
   }
}   


rope()
{
	trig = getEnt ("trig_rope", "targetname");
    trig sethintstring("^7Press ^3[&&1] ^7to ^3move over^7!");

	for(;;)
	{
	 trig waittill ("trigger",user);

	 user thread ropeContent();
	}
}

ropeContent()
{
	self.start = (3328,-377,340);
	self.end = (3328,670,70);
    self.disableAntiEle = true;

    self.air = spawn ("script_model",(0,0,0));
    self.air.origin = self.origin;
    self.air.angles = self.angles;

    self linkTo (self.air);

    self.air moveTo(self.start, 1);
    wait 1.5;
    self.air moveTo(self.end, 2);
    wait 2;
    self unlink();

    self.air delete();

    self.disableAntiEle = undefined;
}

ball()
{
   trig = getent("trig_ball", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to ^3drop ^7the ^3balls^7!");

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");
   
  thread ballmoving1();
  thread ballmoving2();
}   

ballmoving1()
{
	self.down1 = (3300,-612,127);
    self.forward1 = (3300,-815,127);
    self.downagain1 = (3300,-815,-120);

	self.ball1 = getEnt ("ball1", "targetname");
    self.hurt1 = getEnt ("trig_hurtball1", "targetname");

    self.hurt1 enablelinkto();
    self.hurt1 linkto (self.ball1);
    
    wait 0.5;
	self.ball1 moveTo(self.down1, 1);
    self.ball1 rotateRoll (720,2.5);
	wait 1;
	self.ball1 moveTo(self.forward1, 2);
    self.ball1 rotateRoll (720,1.75);
	wait 1.75;
    self.ball1 moveTo(self.downagain1, 3);
    self.ball1 rotateRoll (720,2.5);
    wait 2.5;

}

ballmoving2()
{
	self.down2 = (3360,-612,127);
    self.forward2 = (3360,-815,127);
    self.downagain2 = (3360,-815,-120);

	self.ball2 = getEnt ("ball2", "targetname");
    self.hurt2 = getEnt ("trig_hurtball2", "targetname");

    self.hurt2 enablelinkto();
    self.hurt2 linkto (self.ball2);

    wait 0.5;
	self.ball2 moveTo(self.down2, 1);
    self.ball2 rotateRoll (720,2.5);
	wait 1;
	self.ball2 moveTo(self.forward2, 2);
    self.ball2 rotateRoll (720,1.75);
	wait 1.75;
    self.ball2 moveTo(self.downagain2, 3);
    self.ball2 rotateRoll (720,2.5);
    wait 2.5;

}

end_wall()
{
   plat = getent("end_wall", "targetname");
   origin_effect = getEntArray("end_wall_fx", "targetname");

   trig = getent("trig_end_wall", "targetname");

   trig waittill ("trigger",player);

   iprintlnBOld ("^3" + player.name + " ^7exploded ^3wall^7!");
   player braxi\_rank::giveRankXP("", 500);

    PlayFX(level.break_door, origin_effect[0].origin);
    PlayFX(level.break_door, origin_effect[1].origin);
    PlayFX(level.break_door, origin_effect[2].origin);
    PlayFX(level.break_door, origin_effect[3].origin);
   
    player playlocalSound("wall_explode");

	plat notsolid();
    plat hide();

    trig delete();
	
}

///ROOMS
waitdead()
{
    activator = GetActivator();
    knife = getent("trig_knife","targetname");
    sniper = getent("trig_sniper","targetname");
    run = getent("trig_run","targetname");
    maze = getent("trig_maze","targetname");
    spin = getent("trig_spin","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    run thread maps\mp\_utility::triggerOff();
    maze thread maps\mp\_utility::triggerOff();
    spin thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    level notify ("spin_finished");

    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    run thread maps\mp\_utility::triggerOn();
    maze thread maps\mp\_utility::triggerOn();
    spin thread maps\mp\_utility::triggerOn();
}

endTimer(text, duration, extra)
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
        self.endTimerHUD setText("^7" + duration);
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


roomselection() 
{
level.room_trig = getEnt( "trig_end", "targetname");
room = getEnt( "origin_end", "targetname" );
level.room_trig setHintString ("^7Press ^3[&&1]^7 to enter ^3Room Selection^7!");

for(;;)
{
    level.room_trig waittill( "trigger", player );
    if( !isDefined( level.room_trig ) )
    return;

    acti = GetActivator();
    if(!isdefined(level.firstenter))
    {
        acti freezeControls(1);
        acti iPrintLnBold("^3Jumper ^7is picking a ^3room ^7so don't ^3move^7!");
        level notify("acti_antiglitch");
        level.firstenter = false;
    }
    player SetPlayerAngles( room.angles );
    player setOrigin( room.origin );
    player TakeAllWeapons();
    player antiglitcher();
}
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

	iPrintln("^3"+self.name+" ^7died^3!"); 
	wait 0.2; 
	iPrintlnBold("^3Room selection opened^7!");
}

kniferoom()
{
   level.trigger_knife = getEnt ("trig_knife", "targetname");

    jumperk = getEnt ("knife_jumper", "targetname");
    actik = getEnt ("knife_acti", "targetname");

   for(;;)
    {
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Knife Room", player, activator);
        activator thread endTimer("^3Kill each other !", 3, 0);
        player thread endTimer("^3Kill each other !", 3, 0);
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
        
    }
}

sniperroom()
{
    level.trigger_scope = getEnt ("trig_sniper", "targetname");

    jumpersc = getEnt ("sniper_jumper", "targetname");
    actisc = getEnt ("sniper_acti", "targetname");

    for(;;)
    {

        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Sniper Room", player, activator);
        player thread endTimer("^3Kill each other !", 3, 0);
        activator thread endTimer("^3Kill each other !", 3, 0);
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

    }
}

sniperfail()
{
trigger = getEnt ("sniper_fail", "targetname");
tele1 = getent ("orig_sniper_fail_1", "targetname");
tele2 = getent ("orig_sniper_fail_2", "targetname");


for(;;)
{

    trigger waittill ("trigger", player);

    randomspawn = randomint(2);

    if (randomspawn == 0 )
    {
        player setOrigin(tele1.origin);
        player setPlayerAngles(tele1.angles);
    }
    if (randomspawn == 1 )
    {
        player setOrigin(tele2.origin);
        player setPlayerAngles(tele2.angles); 
    }
    
}

}

runroom()
{
    level.trigger_run = getEnt ("trig_run", "targetname");

    jumpersc = getEnt ("run_jumper", "targetname");
    actisc = getEnt ("run_acti", "targetname");

    for(;;)
    {

        level.trigger_run waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Run Room", player, activator);
        player thread endTimer("^3Kill each other !", 3, 0);
        activator thread endTimer("^3Kill each other !", 3, 0);
        player setClientDvar( "g_speed", 170 );
        activator setClientDvar( "g_speed", 170 );
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);    
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        activator giveWeapon("deserteagle_mp");
        player switchToWeapon("deserteagle_mp");
        activator switchToWeapon("deserteagle_mp"); 
        player.maxhealth = 100;
        thread runend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

runend(who, who2)
{
	trig = getEnt ("trig_run_finish", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");
	
	while(1)
	{
		trig waittill("trigger", winner);
        winner freezeControls (1);
        winner setClientDvar( "g_speed", 210 );
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner iPrintLnBold("^3You won^7!");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
        wait 0.1;
		
		if (winner == who)
			loser = who2;
		else
			loser = who;
		
		if (isDefined(loser))
		{   
            loser setClientDvar( "g_speed", 210 );
			loser setOrigin (origLose.origin);
			loser setPlayerAngles (origLose.angles);
			loser freezeControls (1);
			loser takeAllWeapons();
            loser iPrintLnBold("^3You lost ^7!");
		}
	}
}

run_jumper_fail()
{
   trig = getent("trig_run_fail1", "targetname");
   tele = getent ("run_jumper", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3You failed^7!");
    }
}

run_acti_fail()
{
   trig = getent("trig_run_fail2", "targetname");
   tele = getent ("run_acti", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3You failed^7!");
    }
}

run_jumper_stage()
{
   trig = getent("trig_run_jumper_stage", "targetname");
   tele = getent ("orig_run_jumper_stage", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3Now strafe ^7to the ^3end^7!");
    }
}

run_acti_stage()
{
   trig = getent("trig_run_acti_stage", "targetname");
   tele = getent ("orig_run_acti_stage", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3Now strafe ^7to the ^3end^7!");
    }
}

spinroom()
{
   level.trigger_spin = getEnt ("trig_spin", "targetname");

    orig_jumper = getEnt ("spin_jumper", "targetname");
    orig_acti = getEnt ("spin_acti", "targetname");

    for(;;)
    {
        level.trigger_spin waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        
        thread spin_wait();
        thread fightHUD("Spin Room", player, activator);
        player SetClientDVAR("cg_thirdperson", 1);
        activator SetClientDVAR("cg_thirdperson", 1);
        player thread endTimer("^3Kill each other !", 3, 0);
        activator thread endTimer("^3Kill each other !", 3, 0);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player.maxhealth = 100;
		thread spinend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

spinend(who, who2)
{
	trig = getEnt ("trig_spin_fail", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");
	
	while(1)
	{
		trig waittill("trigger", loser);

        loser freezeControls (1);
        loser setOrigin (origLose.origin);
		loser setPlayerAngles (origLose.angles);
		loser takeAllWeapons();
        loser SetClientDVAR("cg_thirdperson", 0);
        loser iPrintLnBold("^3You lost ^7!");
        level notify ("spin_finished");
		
		if (loser == who)
			winner = who2;
		else
			winner = who;
		
		if (isDefined(winner))
		{
        winner freezeControls (1);
        winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner SetClientDVAR("cg_thirdperson", 0);
        winner takeAllWeapons();
        winner iPrintLnBold("^3You won^7!");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
        wait 0.1;
		}
	}
}

spin_wait()
{
    wait 8;
    thread spin_launch();

}

spin_launch()
{
    level endon ("spin_finished");
    level.spin_on = 1;
    level.spin_speed = 6;
    for(;;)
    {
        if (level.spin_on == 1)
        {
            thread spin_script();
        }
        wait(level.spin_speed);
    }
}

spin_script()
{
    spinner = getEnt ("spin", "targetname");
    random_spinner = randomint(3);

    if (random_spinner == 0)
    {
        spinner rotateyaw(-360, (level.spin_speed));
        wait(level.spin_speed);
        level.spin_speed = level.spin_speed - 0.5;
    }
    else
    {
        spinner rotateyaw(360, (level.spin_speed));
        wait(level.spin_speed);
        level.spin_speed = level.spin_speed - 0.5;
    }
    if (level.spin_speed < 2)
    {
        level.spin_speed = 1.6;
    }

}

mazeroom()
{
   level.trigger_maze = getEnt ("trig_maze", "targetname");

    orig_jumper = getEnt ("maze_jumper", "targetname");
    orig_acti = getEnt ("maze_acti", "targetname");

    for(;;)
    {
        level.trigger_maze waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        
        thread fightHUD("Maze Room", player, activator);
        player thread endTimer("^3Kill each other !", 3, 0);
        activator thread endTimer("^3Kill each other !", 3, 0);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        activator giveWeapon("deserteagle_mp");
        player switchToWeapon ("deserteagle_mp");
        activator switchToWeapon("deserteagle_mp");
        player.maxhealth = 100;
		thread mazeend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

mazeend(who, who2)
{
	trig = getEnt ("trig_maze_finish", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");
	
	while(1)
	{
		trig waittill("trigger", winner);
        winner freezeControls (1);
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner iPrintLnBold("^3You won^7!");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
        wait 0.1;
		
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
            loser iPrintLnBold("^3You lost ^7!");
		}
	}
}
