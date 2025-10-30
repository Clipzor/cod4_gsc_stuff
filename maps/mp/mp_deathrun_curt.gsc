//Map by CM'Death
//Discord:Death#7416
//Its my 1st map so scripts are quite easy. For beginners this scripts are very usefull. :)
//Sniper,knife and bounce room with activator and jumper secret.
//You cant trap camp people on 1st and 2nd trap because I added delay.
//Any cut you might try you can't.Why? Because I disabled all possible cuts huehue.
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
	setdvar( "r_specularcolorscale", "0" );
    setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998);
	
	level.music=[];
    level.music[0]["song"]    ="^5AronChupa - I'm An Albatraoz";
    level.music[0]["alias"]    ="songa";
	level.music[0]["length"]	=169;
    level.music[1]["song"]    ="^5Dynoro & Gigi DAgostino - In My Mind";
    level.music[1]["alias"]    ="songb";
	level.music[1]["length"]	=184;
    level.music[2]["song"]    ="^5El Chombo - Chacarron";
    level.music[2]["alias"]    ="songc";
	level.music[2]["length"]	=168;
    level.music[3]["song"]    ="^5Eurythmics - Sweet Dreams";
    level.music[3]["alias"]    ="songd";
	level.music[3]["length"]	=214;
    level.music[4]["song"]    ="^5Burak Yeter - Tuesday ";
    level.music[4]["alias"]    ="songe";
	level.music[4]["length"]	=217;
    level.music[5]["song"]    ="^5NALYRO - Lady";
    level.music[5]["alias"]    ="songf";
	level.music[5]["length"]	=177;
	
	addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap2");
	//trap3 works without activating
    addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
    addTriggerToList("trig_trap6");
    addtriggerTolist("trig_trap7");
	addTriggerToList("trig_trap8");
	addTriggerToList("trig_trap9");
	addtriggerTolist("trig_trap10");
	addtriggerTolist("trig_trap11");
	
	precacheItem("ak47_mp");
	precacheItem("remington700_mp");
	precacheItem("m40a3_mp");
	precacheItem("knife_mp");
    precacheItem("skorpion_mp");
	precacheItem("usp_silencer_mp");
	precacheshader("mtl_naruto_eyes");
    precacheshader("mtl_naruto_head");
    precacheshader("mtl_naruto_body");
    precacheModel("plr_terry_naruto");  
    precacheModel("plr_mrheyley_venom");

	thread messages();
	thread startdoor1();
	thread startdoor2();
    thread finishdoor();

	thread movingplatform();
	thread movingplatformb();

	thread teleport1();
	thread teleport2();
	thread teleport3();
	thread teleport4();

	thread easysecret1();
	thread easysecrettp();
    thread secretgapfailload();
	thread secretladder();
    thread secretfailload();

	thread musicbox();
    
    thread vipchecksong();
    thread vipcheckweapon();
    thread freeitem();

	thread actisecret();
	thread actirespawn();
	thread actiplacetp();
    thread actireturn();

	thread roomselection();
	thread sniper();
	thread knife();
	thread bounce();
	thread bounce_room_weapon();
	thread bounceroomrespawnacti();
	thread bounceroomrespawnjumper();

	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
 
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
    level.hud_fight2 setText("^5" + jumper + " ^3VS^3 ^5" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

DoorHUD(messages)
{
    self notify("newFhud");
    self endon("newFhud");

    waitTime = 4; //s
    offset = 200; //ms

    if (isDefined(level.hud_door)) level.hud_door destroy();
	if (isDefined(level.hud_door2)) level.hud_door2 destroy();

    level.hud_door = createHUD( 0, 85, "center", "middle", 1, "objective", 1.5 );
    level.hud_door setText("^7Welcome to the ^4Curt^7.");
    level.hud_door setPulseFX( 40, waitTime*1000-offset, offset );
    
	level.hud_door2 = createHUD( 0, 100, "center", "middle", 1, "objective", 1.5 );
    level.hud_door2 setText("^7Map by ^5death");
    level.hud_door2 setPulseFX( 40, waitTime*1000-offset, offset );
	
    wait waitTime;
    if (isDefined(level.hud_door)) level.hud_door destroy();
	if (isDefined(level.hud_door2)) level.hud_door2 destroy();
}

messages()
{
   wait 12;
   thread doorHUD("^5messages");
   wait 8;
   for(;;)
{  
   wait 15;
   x=randomint(5);
   if (x==0)
{
   iPrintln("^7There is ^5Gap Secret ^7and ^5Bounce Secret^7.");
}

   if (x==1)
{
   iPrintln("^7Map made by ^5death");
}

   if (x==2)
{
    iPrintln("^7Visit: ^5teamcmdr^7.^5clanwebsite");
}

   if (x==3)
{
   iPrintln("^5CM'^7Deathrun ^5IP^7: ^5cm^7-^5clan^7.^5com^7:^528960");
}
   
   if (x==4)
{
   iPrintln("^7Huge thanks to ^5CM'Nobody ^7 and ^5CM'Exe ^7for helping with the bugs.");
}
   
   if (x==5)
{
   iPrintln("^7Remastered version with fixed ^5scripts^7,^5bounces ^7and ^5lights^7!");
}

}
}

startdoor1()
{
    door = getent("startdoor1","targetname");
    if(isdefined(level.auto_open_door) && level.auto_open_door) {
        door delete();
    } else {
        wait 10;
        door moveZ(400, 12);
        iprintlnbold("^5Start door opened.");
        wait 12;
        door delete();
    }
}

startdoor2()
{
   door = getent("startdoor2","targetname");

    if(isdefined(level.auto_open_door) && level.auto_open_door) {
        door delete();
    } else {
        wait 10;
        door moveZ(400, 12);
        wait 12;
        door delete();
    }

}

movingplatform()
{

   movingplatform = getent("movingplatform", "targetname");
   movingplatform_trigger = getent("movingplatform_trigger", "targetname");
   
   
   while(1)
   {
   
   movingplatform_trigger setHintString("^7Press ^3[&&1] ^7to move platform.");
   movingplatform_trigger waittill ("trigger");
   movingplatform moveX (625,3,1,1);
   wait 3;
   movingplatform moveX (-625,3,1,1);
   wait 3;
   
   }
}   


movingplatformb()
{

   movingplatformb = getent("movingplatformb", "targetname");
   movingplatformb_trigger = getent("movingplatformb_trigger", "targetname");
   
   
   while(1)
   {
   
   movingplatformb_trigger setHintString("^7Press ^3[&&1] ^7to move platform.");
   movingplatformb_trigger waittill ("trigger");
   movingplatformb moveX (625,3,1,1);
   wait 3;
   movingplatformb moveX (-625,3,1,1);
   wait 3;
   
   }
}   

finishdoor()
{
   finishdoor = getent("finishdoor", "targetname");
   finishdoor_trigger = getent("finishdoor_trigger", "targetname");
   
   finishdoor_trigger setHintString("^7Press ^3[&&1] ^7to open the door!");
   finishdoor_trigger waittill ("trigger");
   finishdoor moveZ(550, 10);
   iprintlnBOld ("^5Finish door ^7opened.");   

   finishdoor_trigger delete();   
}
   
teleport1()
{
   trig = getent("trigger_teleport1", "targetname");
   tele1 = getent ("origin_teleport1", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
      player setPlayerAngles(tele1.angles);
	  iPrintLnBold ("^5" + player.name + " ^7has entered in ^5Secret Room!");
    }
}
	
teleport2()
{
   trig = getent("trigger_teleport2", "targetname");
   tele2 = getent ("origin_teleport2", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele2.origin);
      player setPlayerAngles(tele2.angles);
	  player braxi\_rank::giveRankXP("", 500);
	  iPrintLnBold ("^5" + player.name + " ^7has finished the ^5Secret Room!");
    }
}

teleport3()
{
   trig = getent("trigger_teleport3", "targetname");
   tele3 = getent ("origin_teleport3", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele3.origin);
      player setPlayerAngles(tele3.angles);
    }
}

teleport4()
{
   trig = getent("trigger_teleport4", "targetname");
   tele4 = getent ("origin_teleport4", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele4.origin);
      player setPlayerAngles(tele4.angles);
    }
}

easysecret1()
{
   trig = getent("trig_easysecret", "targetname");
   tele6 = getent ("origin_easysecret", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele6.origin);
      player setPlayerAngles(tele6.angles);
	  iPrintLnBold ("^5" + player.name + " ^7has  entered in ^5Gap Room!");
    }
}

easysecrettp()
{
   trig = getent("trig_eztp", "targetname");
   tele7 = getent ("origin_eztp", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele7.origin);
      player setPlayerAngles(tele7.angles);
	  player braxi\_rank::giveRankXP("", 500);
	  iPrintLnBold ("^5" + player.name + " ^7has finished ^5Gap Room!");
    }
}

secretgapfailload()
{
   trig = getent("trig_gapsecfail", "targetname");
   tele1 = getent ("origin_gapsecfail", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
      player setPlayerAngles(tele1.angles);
      player iprintlnbold("^1Try again :/");
    }
}

secretladder()
{
    trig = getent("trig_secretladder", "targetname");
    caulk = getent("secretladder", "targetname");

while(1)
{
 trig waittill("trigger", player);
iprintln("^4Secret opened.");
    caulk delete();
    trig delete();
wait 0.5;
}
}

secretfailload()
{
   trig = getent("trig_secretfail", "targetname");
   tele1 = getent ("origin_secretfail", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
      player setPlayerAngles(tele1.angles);
      player iprintlnbold("^1Try again :/");
    }
}

musicbox()
{   
    trig = getEnt("musictrigger","targetname");
    trig setHintString("^7Press ^5[&&1]^7 to select song");
    trig waittill("trigger", p);
    trig delete();
    p freezeControls(1);
    level.playingMusic = "choosing";
    p musicmenu();
}

musicmenu()
{
    //self endon( "disconnect" );
    //self endon( "death" );
    //self endon( "spawned" );
    //self endon( "joined_spectators" );
    self endon( "music thread terminated" );

    self.hud_music = [];
    self.selection = 0;

    // create huds
    i = 0;
    self.hud_music[i] = addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
    self.hud_music[i].sort = 879;
    self.hud_music[i] setShader( "white", 360, 160 ); //background image
    i++;
    self.hud_music[i] = addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 346, 20 ); //should be bar image, i suggest to not change cuz your texture will be stretched
    self.hud_music[i].color=(0,1,1);

    i++;
    self.hud_music[i] = addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("                             Music Menu"); //title
    self.hud_music[i].glowalpha=1;
    self.hud_music[i].glowcolor=(0,1,1); //title text color
    i++;
    self.hud_music[i] = addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 900;
    self.hud_music[i] setText("                                                                   Scroll: ^5[{+attack}] ^7| Select: ^5[{+activate}]"); //just change numbers of colors here if you need different ones

    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
        self.hud_music[i].glowalpha=1;
        self.hud_music[i].glowcolor=(0,1,1);

        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }

    i++;
    self.hud_music[self.hud_music.size] = addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 346, 17 ); //another bar image that will most likely stretch, i suggest to only change colors
    indicator.color=(0,1,1);

    while(self.sessionstate == "playing")
    {
        wait 0.1;

        if(self attackButtonPressed())
        {
            self.hud_music[4+self.selection].alpha = 0.93;

            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;

            item = self.hud_music[4+self.selection];
            item.alpha = 1;
            indicator.y = item.y;
        }
        else if(self useButtonPressed())
        {
            thread playMusic(level.music[self.selection]["alias"], level.music[self.selection]["length"], level.music[self.selection]["song"], true);
            self freezeControls(0);
            break;
        }
        else if (!isAlive(self))
        {
            thread playMusic(level.music[self.selection]["alias"], level.music[self.selection]["length"], level.music[self.selection]["song"], true);
            break;
        }
    }

    if(!isdefined(self))
        return;
    if(isdefined(self.hud_music))
    {
        for(i=0;i<self.hud_music.size;i++)
        {
            if(isdefined(self.hud_music[i]))
                self.hud_music[i] destroy();
        }
    }
    self notify( "music thread terminated" );
}

playMusic(music, time, print, default_styling) //music = alias, time = length, print = song, default_styling = styling or not (true/false)
{
    if (isDefined(level.playingMusic) && level.playingMusic == music)
        return 0;
    if (isDefined(level.playingMusic) && level.playingMusic == "musica"){iPrintLn("^1Absolute song playing!"); return 0;}
    
    level.playingMusic = music;

    level notify ("newmusic"); //tells new music is here
    level endon ("newmusic"); //ends if new music comes
    level notify ("stop_party");
    wait 0.1;
    SetExpFog(0, 1000000, 0, 0, 0, 0);


    AmbientStop();
    wait 0.5;
    for(;;)
    {
        if (isDefined(default_styling) && default_styling == true)
            iPrintLn("^5>>^7Now playing: " +print+ "^5<<");
        else
            iPrintLn(print);

        AmbientPlay(music);
        wait time;
        AmbientStop();
        wait 1;
    }
}
GetMusicFromArray(searchBy, search)
{
    for(i=0;i<level.music.size;i++)
    {
        if (level.music[i][searchBy] == search)
        {
            music = level.music[i];
            return music;
        }
    }
    iPrintLnBold("NO SONG FOUND \n NO SONG FOUND \n NO SONG FOUND");
    return "Nomusic";
}

vipchecksong()
{
	trigger = getEnt ("trig_vipsong", "targetname");
	trigger setHintString ("^3VIP ^1Access!");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
guid = getSubStr(guid, 24);
gametag = player.name;

	if ( (isSubStr( toLower(gametag), toLower("CM'")) && !isSubStr( toLower(gametag), toLower("CM'") ) ) || gametag == "ScarFace" || gametag == "Nobody" || gametag == "CM'Scarface" || gametag == "CM'Exe" || gametag == "CM'Nobody")  
	                   
		{
	iPrintLn("^3VIP ^7is here^3!");
		level.vipisplaying = true;
    	AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("vipsong");	
		level.vipisplaying = true;
    player braxi\_rank::giveRankXp( "", 1000);	
       trigger delete();
	   }

      else if( isSubStr( toLower(gametag), toLower("Death") ) || gametag == "CM'Death" || gametag == "Death" || gametag == "death") 
      {
	    AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
	  ambientPlay("deathvip");
	  iPrintLnBold("^1Death is here!");
	  player braxi\_rank::giveRankXp( "", 2000);	
	  level.vipisplaying = true;
	  trigger delete();
	  }
	  
		else
		{
			player iPrintLnBold("^1 You are not an authorized ^3VIP");
		}
	}
}

vipcheckweapon()
{
	trigger = getEnt ("trig_vipweapon", "targetname");
	trigger setHintString ("^3VIP ^1Access!");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( (isSubStr( toLower(gametag), toLower("CM'")) && !isSubStr( toLower(gametag), toLower("CM'") ) )  || gametag == "CM'ScarFace" || gametag == "ScarFace" || gametag == "CM'Exe" || gametag == "CM'Nobody" || gametag == "Nobody")  
	                   
		{     
        player giveWeapon("skorpion_mp");
        player giveMaxAmmo("skorpion_mp");
        player switchToWeapon("skorpion_mp");
        player setmodel("plr_mrheyley_venom");
       
	   }

      else if( isSubStr( toLower(gametag), toLower("Death") ) || gametag == "CM'Death" || gametag == "Death") 
      {
	    player takeAllWeapons();
        player giveWeapon("usp_silencer_mp");
        player giveMaxAmmo("usp_silencer_mp");
        player giveWeapon("skorpion_mp");
        player giveMaxAmmo("skorpion_mp");
        player switchToWeapon("usp_silencer_mp");
        player setmodel("plr_terry_naruto");
	  
	  }
	  
		else
		{
			player iPrintLnBold("^1You are not an authorized ^3VIP");
		}
	}
}

freeitem()
{   
    trig = getEnt("trig_freeitem","targetname");

    trig setHintString ("^7Get a ^1Life");

    trig waittill("trigger", player);

    player thread braxi\_mod::givelife();

    trig delete();

}

actisecret()
{
   trig = getent("trig_actisecret", "targetname");
   tele1 = getent ("origin_actisecret", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
      player setPlayerAngles(tele1.angles);
	  iPrintLn ("^5" + player.name + " ^7has entered in ^5Activator Secret Room!");
    }
}

actirespawn()
{
   trig = getent("trig_respawn", "targetname");
   tele1 = getent ("origin_respawn", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
      player setPlayerAngles(tele1.angles);
    }
}

actiplacetp()
{
   trig = getent("trig_actiplace", "targetname");
   tele1 = getent ("origin_actiplace", "targetname");

   for(;;)
    {   
	  trig setHintString("^7Press ^5[&&1]^7 to finish ^5Secret Room");
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
      player setPlayerAngles(tele1.angles);
    }
}

actireturn()
{
   trig = getent("trig_actisecreturn", "targetname");
   tele1 = getent ("origin_actiplace", "targetname");

   for(;;)
    {   
	  trig setHintString("^7Press ^3[&&1]^7 to leave ^5Secret");
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
      player setPlayerAngles(tele1.angles);
    }
}

roomselection()
{
    trig = getEnt ("trigger_teleport5", "targetname");
    orig = getEnt ("origin_room", "targetname");

    while (1)
    {
        trig setHintString ("^7Press ^5[&&1]^7 to enter ^5Selection Room");
        trig waittill ("trigger", player);
		iPrintLnBold ("^5" + player.name + " ^7has entered in ^5Selection Room!");
        player setOrigin (orig.origin);
        player setPlayerAngles(orig.angles);
		player takeAllWeapons();
        trig setHintString (player + " in room!");
        while (isDefined(player) && isAlive(player))
        wait .05;
    }
}

sniper()
{
    level.trigger_scope = getEnt ("trigger_sniper", "targetname");

    jumpersc = getEnt ("sniper_jumper", "targetname");
    actisc = getEnt ("sniper_activator", "targetname");

    for(;;)
    {
        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Sniper Room", player, activator);
        player thread endTimerPure("^5Go Go Go !", 3, 0);
        activator thread endTimerPure("^5Go Go Go !", 3, 0);
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

        iPrintLnBold ("^5" + player.name + " ^7has died in ^5Sniper Room!");
    }
}

knife()
{
   level.trigger_knife = getEnt ("trigger_knife", "targetname");

    jumperk = getEnt ("knife_jumper", "targetname");
    actik = getEnt ("knife_activator", "targetname");

   for(;;)
    {
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Knife Room", player, activator);
        activator thread endTimerPure("^5Go Go Go !", 3, 0);
        player thread endTimerPure("^5Go Go Go !", 3, 0);
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
        
        iPrintLnBold ("^5" + player.name + " ^7has died in ^5Knife Room!");
    }
}

bounce()
{
    level.trigger_jump = getEnt ("trigger_bounce", "targetname");

    jumperb = getEnt ("bounce_jumper", "targetname");
    actib = getEnt ("bounce_activator", "targetname");

    for(;;)
    {
        level.trigger_jump waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Jump Room", player, activator);
        activator thread endTimerPure("^5Go Go Go !", 3, 0);
        player thread endTimerPure("^5Go Go Go !", 3, 0);
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
        
        iPrintLnBold ("^5" + player.name + " ^7has died in ^5Jump Room!");
    }
}

bounce_room_weapon()
{
    trig = getEnt ("trig_bounceweapon", "targetname");
    trig setHintString ("^5Press ^3[&&1]^7 to get a ^5Sniper");
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

bounceroomrespawnacti()
{
   trigb = getent("trigger_bounceb", "targetname");
   teleb = getent ("origin_bounceb", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

bounceroomrespawnjumper()
{
   triga = getent("trigger_bouncea", "targetname");
   telea = getent ("origin_bouncea", "targetname");

   for(;;)
    {   
      triga waittill("trigger", player);
	  player setOrigin(telea.origin);
	  player setPlayerAngles (telea.angles);
    }
}

waitdead()
{
    activator = GetActivator();
    knife = getent("trigger_knife","targetname");
    sniper = getent("trigger_sniper","targetname");
    bounce = getent("trigger_bounce","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    bounce thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    bounce thread maps\mp\_utility::triggerOn();
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

trap1()
{
   plata = getent("trap1a", "targetname");
   platb = getent("trap1b", "targetname");
   platc = getent("trap1c", "targetname");
   platd = getent("trap1d", "targetname");
   trig = getent("trig_trap1", "targetname");
   trig setHintString("Rotate Platforms");
   trig waittill ("trigger");
   trig setHintString("^3Activated");
   
   for(;;)
  { 
   plata rotatepitch (360,3);
   platb rotatepitch (-360,3);
   platc rotatepitch (360,3);
   platd rotatepitch (-360,3);
   wait 8;
   plata rotatepitch (-360,3);
   platb rotatepitch (360,3);
   platc rotatepitch (360,3);
   platd rotatepitch (-360,3);
   wait 8;
   }
}

trap2()
{
   plata = getent("trap2a", "targetname");
   platb = getent("trap2b", "targetname");
   platc = getent("trap2c", "targetname");
   platd = getent("trap2d", "targetname");
   trig = getent("trig_trap2", "targetname");
   trig setHintString("Rotate Platforms");
   trig waittill ("trigger");
   trig setHintString("^3Activated");
   
   for(;;)
  { 
   plata rotateroll (-360,3);
   platb rotateroll (-360,3);
   platc rotateroll (-360,3);
   platd rotateroll (-360,3);
   wait 3;
   plata rotateroll (360,3);
   platb rotateroll (360,3);
   platc rotateroll (360,3);
   platd rotateroll (360,3);
   wait 3;
   }
}

trap3()
{
  trap = getent("trap3", "targetname");
	for(;;)
  {
  trap rotateyaw (360, 9); // 360 degrees in 3 seconds
  wait 9;
  }
}

trap4()
{

   bounce2 = getent("trap4", "targetname");
   trig = getent("trig_trap4", "targetname");
   trig setHintString("Rotate the Bounce");
   trig waittill ("trigger");
   trig setHintString("^3Activated");
   
  for(;;)
	{
	bounce2 notsolid();
    bounce2 hide();
	wait 4;
	bounce2 solid();
    bounce2 show();
	wait 4;
	}
}   

trap5()
{

   cylinder = getent("trap5", "targetname");
   cylinder2 = getent("trap5b", "targetname");
   trig = getent("trig_trap5", "targetname");
   trig setHintString("Rotate the Cylinder");
   trig waittill ("trigger");
   trig setHintString("^3Activated");
   
   for(;;)
  { 
   wait 0.1;
   cylinder rotateYaw (-360,2);
   cylinder2 rotateYaw (360,2);
   wait 0.1;
   }
}   

trap6()
{

   bounce = getent("trap6", "targetname");
   trig = getent("trig_trap6", "targetname");
   trig setHintString("Rise up the platform");
   trig waittill ("trigger");
   trig setHintString("^3Activated");
   bounce moveZ (630,3,1,1);
   wait(4);
   bounce moveZ (-630,3,1,1);
   wait(4);
}   

trap7()
{
    platform = getent("trap7", "targetname");
    trig = getent("trig_trap7", "targetname");
    trig setHintString("Remove the Block");
	trig waittill("trigger", player);
	trig setHintString("^3Activated");
    
	platform delete();
}

trap8()
{
   platform = getent("trap8", "targetname");
   platformb = getent("trap8b", "targetname");
   platformc = getent("trap8c", "targetname");
   trig = getent ("trig_trap8", "targetname");
   trig setHintString("Move platforms");
   trig waittill("trigger", player);
   trig setHintString("^3Activated");
   
   for(;;)
   {
   platform moveZ (-100,4,1,1);
   platformb moveZ (100,4,1,1);
   platformc moveZ (-100,4,1,1);
   wait 2;
   platform moveZ (100,4,1,1);
   platformb moveZ (-100,4,1,1);
   platformc moveZ (100,4,1,1);
   wait 2;
   }
}

trap9()
{
    bounce = getent("trap9", "targetname");
    trig = getent("trig_trap9", "targetname");
    trig setHintString("Remove the Bounce");
	trig waittill("trigger", player);
	trig setHintString("^3Activated");
   
    wait 0.1;
    bounce hide();
	bounce notsolid();

}

trap10()
{
   platform = getent("trap10", "targetname");
   trig = getent("trig_trap10", "targetname");
   trig setHintString("Remove the Bounce");
   trig waittill("trigger", player);
   trig setHintString("^3Activated");
   
   for(;;)
   { 
   platform notSolid();
   platform hide();
   wait 5; 
   platform Solid();
   platform show();
   wait 5;
   }
}  

trap11()
{
   platform = getent("trap11", "targetname");
   trig = getent("trig_trap11", "targetname");
   trig setHintString("Remove the Platform");
   trig waittill("trigger", player);
   trig setHintString("^3Activated");
   
   platform notSolid();
   platform hide();
   wait 5; 
   platform Solid();
   platform show();
   wait 5;
}  
