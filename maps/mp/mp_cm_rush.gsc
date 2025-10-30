///Map by CM'Death
///Discord:Death#7416
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
main()
{
 maps\mp\_load::main();

 level.fire_tv = LoadFx("fire/tv_fire2");

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

    level.vipisplaying = false;

    precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("knife_mp");
    precacheItem("beretta_mp");
    precacheItem("deserteagle_mp");
    precacheItem("m4_mp");
    precacheItem("usp_silencer_mp");
    precacheItem("p90_mp");

    precacheshader("mtl_tronguycolor");
    precacheModel("plr_terry_tron");
    precacheshader("mtl_paladin");
    precacheshader("mtl_paladin_cloth");
    precacheModel("plr_terry_paladin");
    precacheshader("mtl_hitler_body");
    precacheshader("mtl_hitler_head");
    precacheModel("plr_terry_hitler");
    precacheshader("mtl_police_arms");
    precacheshader("mtl_police_patches");
    precacheshader("mtl_police_glasseshandles");
    precacheshader("mtl_police_watch");
    precacheshader("mtl_police_pants");
    precacheshader("mtl_police_gear");
    precacheshader("mtl_police_head");
    precacheshader("mtl_police_glasses");
    precacheshader("mtl_police_ears");
    precacheshader("mtl_police_earpiece");
    precacheshader("mtl_police_torso");
    precacheModel("plr_terry_police");

///FX
    thread effect();

///MESSAGES
    thread messagescreen ();
    thread messages ();

///MUSIC,DOOR,RTD
    thread randommusic ();
    thread startdoor ();
    thread rtdcheck ();

///VIP
    thread deathvip ();
    thread cmname ();

///OTHER   
    thread freexp ();
    //thread actiskin ();
    //thread jumperskin ();
    thread randomchoice ();

///JUMPER SECRET
    thread secretstep ();
    thread sectp ();
    thread save_load_logic ();
    thread secfinish ();

///ACTI SECRET
    thread actisectp ();
    thread actistraferoom ();
    thread actibounceroom ();
    thread actibouncereturn ();
    thread actibouncefail ();
    thread actistrafereturn ();
  
///ACTI TELEPORTS 
    thread actitp1 ();
    thread actitp2 ();
    thread actitp3 ();
    thread actitp4 ();
    thread actitp5 ();
    thread actitp6 ();

///TRAPS
    thread trap1 ();
    thread trap2 ();
    thread trap3 ();
    thread trap4 ();
    thread trap5 ();
    thread trap6 ();

///ROOMS
    thread sniperroom ();
    thread kniferoom ();
    thread bounceroom ();
    thread bounceweapon ();
    thread bounceroomfail1 ();
    thread bounceroomfail2 ();
    thread purestraferoom ();
    thread pureend();
    thread slideroom ();
    thread slideroomfail1 ();
    thread slideroomfail2 ();
    thread slideend();

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
    level.hud_fight setText("^5" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^5" + jumper + " ^6VS^6 " + "^5" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

///FX
effect()
{   
    origin_effect1 = getEnt("fxfire", "targetname");
    origin_effect2 = getEnt("fxfire2", "targetname");
    origin_effect3 = getEnt("fxfire3", "targetname");
    origin_effect4 = getEnt("fxfire4", "targetname");
    origin_effect5 = getEnt("fxfire5", "targetname");
    origin_effect6 = getEnt("fxfire6", "targetname");
    origin_effect7 = getEnt("fxfire7", "targetname");
    origin_effect8 = getEnt("fxfire8", "targetname");
    origin_effect9 = getEnt("fxfire9", "targetname");
    origin_effect10 = getEnt("fxfire10", "targetname");
    origin_effect11 = getEnt("fxfire11", "targetname");
    origin_effect12 = getEnt("fxfire12", "targetname");
    origin_effect13 = getEnt("fxfire13", "targetname");

    level waittill("round_started");

    PlayFX(level.fire_tv, origin_effect1.origin);
    PlayFX(level.fire_tv, origin_effect2.origin);
    PlayFX(level.fire_tv, origin_effect3.origin);
    PlayFX(level.fire_tv, origin_effect4.origin);
    PlayFX(level.fire_tv, origin_effect5.origin);
    PlayFX(level.fire_tv, origin_effect6.origin);
    PlayFX(level.fire_tv, origin_effect7.origin);
    PlayFX(level.fire_tv, origin_effect8.origin);
    PlayFX(level.fire_tv, origin_effect9.origin);
    PlayFX(level.fire_tv, origin_effect10.origin);
    PlayFX(level.fire_tv, origin_effect11.origin);
    PlayFX(level.fire_tv, origin_effect12.origin);
    PlayFX(level.fire_tv, origin_effect13.origin);
}

///WELCOME MESSAGES
messagescreen()
{
	level waittill("round_started");
	wait 1;
	noti = SpawnStruct();
	noti.TitleText = "^6Welcome to ^5mp_cm_rush^6!";
    noti.notifyText = "^6Map created by ^5death^6!";
	noti.duration = 8;
	noti.glowcolor = (7,7,7);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}

///MESSAGES POPING OUT IN LEFT CORNER
messages()
{
   wait 5;
   for(;;)
{  
   wait 7;
 x = randomint(7);
   if (x==0)
{
   iPrintln("^6Mapped ^5and ^6scripted by ^5death");
}

   if (x==1)
{
   iPrintln("^6Visit our ^5Discord ^6Server: ^5dv82mEHCY7");
}

   if (x==2)
{
   iPrintln("^5CM'^6Deathrun ^5IP^6:  ^5cm^6-^5clan^6.^5com^6:^528960");
}

   if (x==3)
{
   iPrintln("^5Feel free to report any ^5bugs.");
}

   if (x==4)
{
   iPrintln("^5Discord: ^6death01_");
}

   if (x==5)
{
   iPrintLn("^6Map speed: ^5[^6"+getDvar("g_speed")+"^5]^6, ^5[^6"+getDvar("dr_jumpers_speed")+"^5]");
}

   if (x==6)
{
   iPrintLn("^6Credits to ^5Cammy^6, ^5Ohh Rexy<3 ^6and ^5CM'Nobody ^6for helping me with the ^5bugs^6!");
}
}
}

///MUSIC
randommusic()
{
	trig = getEnt("trig_musicmenu","targetname");

	trig setHintString("^6>> ^5Music ^6<<");

	trig waittill("trigger",player);

	trig delete();

    music = randomInt(7);

    switch(music)
    {
    
        case 0:
            ambientStop(2);
			ambientPlay("homie", 2);
            iPrintLn("^6>>^5Now playing: HOMIE Эгоист SL Remix.^6<<");
        break;
             
        case 1:
            ambientStop(2);
			ambientPlay("krewella", 2);
            iPrintLn("^6>>^5Now playing: Krewella - Killin' It.^6<<");
        break;
                
        case 2:
            ambientStop(2);
			ambientPlay("likeit", 2);
            iPrintLn("^6>>^5Now playing: Cardi, Bad Bunny & J Balvin -I Like It.^6<<");
        break;     

		case 3:
            ambientStop(2);
			ambientPlay("groove", 2);
            iPrintLn("^6>>^5Now playing: Da Tweekaz - The Groove.^6<<");
        break;
                   
        case 4:
            ambientStop(2);
			ambientPlay("cominghome", 2);
            iPrintLn("^6>>^5Now playing: Dirty Money - Coming Home.^6<<");
        break;
                
        case 5:
            ambientStop(2);
			ambientPlay("spaceman", 2);
            iPrintLn("^6>>^5Now playing: Hardwell ft. Mitch Crown - Spaceman.^6<<");
        break;    

        case 6:
            ambientStop(2);
			ambientPlay("turnitup", 2);
            iPrintLn("^6>>^5Now playing: Yellow Claw - DJ Turn It U.^6<<");
        break;    
    }
}

///DOOR AT START
startdoor()
{
   sdoor = getent("startdoor","targetname");
 
wait(5);
	iPrintlnBold( "^6Floor is moving in..." );
	iPrintlnBold( "^55" );
	wait(1);
	iPrintlnBold( "^54" );
	wait(1);
    iPrintlnBold( "^53" );
	wait(1);
    iPrintlnBold( "^52" );
	wait(1);
    iPrintlnBold( "^51" );
	wait(1);
    iPrintlnBold( "^6Good Luck!" );
    
  sdoor  moveY (-256,3,1,1);

 }  

///RTD SYSTEM
RTDcheck()
{
trig = getent("trig_rtd", "targetname");

    while(1)
    { 
    trig waittill("trigger", player);
    if(!isDefined(player.RTDused))
    {
        player.RTDused = true;
        player thread RTDitem();
    }
    else
    {
        player iprintlnbold("^6Told you not to use ^5RTD ^6again...");
        wait 2;
        player suicide();
    }
}
}

RTDitem()
{
    self iPrintLnBold ("^6RTD is opening...");
    self iPrintLnBold ("^6When you get ^5item^6, ^5don't ^6use ^5RTD ^6again or you will ^5die^6!");
    wait 3;
    randomitem = randomint(5);

    if (randomitem == 0)
    {
        self setmodel("plr_terry_tron");
        iPrintLn("^5" + self.name + " ^6changed ^5clothes^6!"); 
        self iPrintLnBold("^6New ^5clothes^6,nice^5!");     
    }
    if (randomitem == 1)
    {
        self takeAllWeapons();
        self giveWeapon("deserteagle_mp");  
        self switchToWeapon("deserteagle_mp");  
        iPrintLn("^5" + self.name + " ^6got ^5Trump Deagle ^6from ^5RTD^6!");     
    }
    if (randomitem == 2)
    {
        self takeAllWeapons();
        self giveWeapon("m4_mp"); 
        self switchToWeapon("m4_mp");  
        iPrintLn("^5" + self.name + " ^6got ^5m4 ^6Hyperbeast ^5from ^6RTD^5!");    
    }
    if (randomitem == 3)
    {  
        self thread braxi\_mod::givelife();
        iPrintLn("^5" + self.name + " ^6got ^5life ^6from ^5RTD^6!");   
    }
    if (randomitem == 4)
    {
        self braxi\_rank::giveRankXP("", 9000);
        iPrintLnBold("^5" + self.name + " ^6won ^5RTD XP Jackpot ^6:^3o"); 
    }
}

///VIP STUFF
deathvip()
{
	trigger = getEnt ("trig_deathvip", "targetname");
	trigger setHintString ("^5VIP Access^6!");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( isSubStr( toLower(gametag), toLower("Death") ) || gametag == "DC | death" || gametag == "Death")  
	                   
		{
    	ambientStop(2);
		wait 0.5;
		ambientPlay("dontcarehs");
        player setmodel("plr_terry_paladin");	
        iPrintLnBold("^6Death is here!");
        player braxi\_rank::giveRankXP("", 2000);
        player giveWeapon("usp_silencer_mp");
        player giveMaxAmmo("usp_silencer_mp");
        player switchToWeapon("usp_silencer_mp");	
        level.vipisplaying = true;
        trigger delete();
	   }

      else if ( (isSubStr( toLower(gametag), toLower("CM'")) && !isSubStr( toLower(gametag), toLower("CM'") ) )  || gametag == "Cam" || gametag == "cam" || gametag == "Cammy" || gametag == "CM'Nobody"  || gametag == "Ohh Rexy <3")  
	                   
		{     
        player giveWeapon("p90_mp");
        player giveMaxAmmo("p90_mp");
        player switchToWeapon("p90_mp");
        player setmodel("plr_terry_tron");
        player iPrintLnBold("^6Enjoy your ^5VIP ^6Stuff^5!");
       
	   }
		else
		{
			player iPrintLnBold("^6You are not ^5VIP^6!");

		}
	}
}

cmname()
{
    trigger = getent ("trig_cmvip", "targetname");
    trigger setHintString ("^5CM'^6Member Stuff^5!");

    while(1) 
    {
        trigger waittill("trigger", player);

        name = getDvar("name");
        if (isSubStr( toLower(name), toLower("DC | ")) )
        {
            player iPrintLnBold( "^6Enjoy your gift ^5District ^6Member!" );
            player giveWeapon("m4_mp");
            player giveMaxAmmo("m4_mp");
            player switchToWeapon("m4_mp");
            player setmodel("plr_terry_tron");
        }
        else
        {
            player iPrintLnBold( "^6Sorry I can't give you Member stuff!" );
        }
    }
}

///FREE XP
freexp()
{ 
    trig = getent("freexp", "targetname");
    trig setHintString ("^6XP!");
	
for(;;)
{
 trig waittill("trigger", player);
 iPrintLn("^6" + player.name + " ^5found free XP!");
 player braxi\_rank::giveRankXP("", 2000);
 trig delete();
 wait 0.5;
}
}

///ACTIVATOR CHARACTER
actiskin()
{ 
    trig = getent("trig_actiskin", "targetname");
	
for(;;)
{
 trig waittill("trigger", player);

 player Setviewmodel("viewhands_desert_opfor_clr");
 player setmodel("plr_terry_hitler");
 trig delete();
 wait 0.5;
}
}

///JUMPER CHARACTER
jumperskin()
{ 
    trig = getent("trig_jumperskin", "targetname");
	
for(;;)
{
 trig waittill("trigger", player);
 
 player Setviewmodel("viewhands_marine_gloves_col");
 player setmodel("plr_terry_police");
 trig delete();
 wait 0.5;
}
}

///RANDOM FAIL(live or die)
randomchoice()
{
trigger = getEnt ("trig_endfail", "targetname");
tele1 = getent ("orig_endfail", "targetname");
tele2 = getent ("orig_secfinish", "targetname");


for(;;)
{
    trigger waittill ("trigger", player);

    player setOrigin(tele1.origin);
    player setPlayerAngles(tele1.angles);

    player iprintlnBOld("^1I saved you from death, but not from long...");
    wait 1;
    player iprintlnBOld("^1Now,I will gamble your life so you might die :)"); 
    wait 4;

    randomtext = randomint(2);

    if (randomtext == 0 )
    {
        player iprintlnBOld("^2You are worthy to live."); 
        player setOrigin(tele2.origin);
        player setPlayerAngles(tele2.angles); 
        player playlocalSound("yes");     
    }
    if (randomtext == 1)
    {
       player iprintlnBOld("^1You are not worthy to live."); 
       player playlocalSound("no");
       wait 1;
       player suicide ();      
    }
    
}

}

///JUMPER SECRET
secretstep()
{
   trig = getent("trig_secstep", "targetname");
   bounce = getent ("secretstep", "targetname");

   bounce hide();
   bounce notsolid();
   for(;;)
    {   
     trig waittill("trigger", player);
	
     bounce show();
     bounce solid();

     trig delete();

	 player braxi\_rank::giveRankXP("", 500);
	 iPrintLn ("^6Secret opened.");
     player iprintlnBOld ("^6You just opened something...");
    }
}

sectp()
{
   trig = getent("trig_sectp", "targetname");
   tele1 = getent ("orig_sectp", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
     player thread secret_timer();
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player.sc_pos = 0;
     player.insec = true;
     player iprintlnBOld ("^6You entered in ^5Secret Room.");
     iPrintLn("^6" + player.name + " ^5entered ^6Secret Room!");
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
        player SetOrigin( save_triggers[player.sc_pos].origin+(0,0,50) );
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
            //IPrintLnBold(pos+" save");
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
	self.secretTimer.label = &"^5Time left: ^6&&1";
	if(isdefined(level.randomcolor))
	self.secretTimer.glowColor = level.randomcolor;
	else 
	self.secretTimer.glowColor = (1,0,0);

	time = 160; 
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

secfinish()
{
   trig = getent("trig_secfinish", "targetname");
   tele1 = getent ("orig_secfinish", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
     player notify("secret_done");
	 player.secretTimer destroy();
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player.sc_pos = 0;
     player.insec = false;
     iPrintLnBold ("^6" + player.name + " ^5finished ^6Secret Room^5!");
     player braxi\_rank::giveRankXP("", 7000);
    }
}

///ACTI SECRET
actisectp()
{
   trig = getent("trig_actitp6", "targetname");
   tele1 = getent ("orig_actitp6", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Enter Secret!");
     trig waittill("trigger", player);
     player playlocalSound("tp");
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player iprintlnBOld("^6Choose between ^5Strafe room ^6or ^5Bounce room^6!");
    }
}

actistraferoom()
{
   trig = getent("trig_actisecstrafe", "targetname");
   tele1 = getent ("orig_actisecstrafe", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Strafe Room!");
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player iprintlnBOld("^5Good luck!");
    }
}

actibounceroom()
{
   trig = getent("trig_actisecbounce", "targetname");
   tele1 = getent ("orig_actisecbounce", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Bounce Room!");
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player iprintlnBOld("^5Good luck!");
    }
}

actibouncereturn()
{
   trig = getent("trig_actibouncereturn", "targetname");
   tele1 = getent ("orig_actitp5", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player iprintlnBOld("^5Good Job!");
    }
}

actibouncefail()
{
   trig = getent("trig_actisecbouncefail", "targetname");
   tele1 = getent ("orig_actisecbounce", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player iprintlnBOld("^5Try again :/");
    }
}

actistrafereturn()
{
   trig = getent("trig_actistrafereturn", "targetname");
   tele1 = getent ("orig_actitp5", "targetname");

   for(;;)
    {   
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player iprintlnBOld("^5Good Job!");
    }
}

///ACTIVATOR TELEPORTS
actitp1()
{
   trig = getent("trig_actitp1", "targetname");
   tele1 = getent ("orig_actitp1", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Teleport to the next Trap!");
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

actitp2()
{
   trig = getent("trig_actitp2", "targetname");
   tele1 = getent ("orig_actitp2", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Teleport to the next Trap!");
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

actitp3()
{
   trig = getent("trig_actitp3", "targetname");
   tele1 = getent ("orig_actitp3", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Teleport to the next Trap!");
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

actitp4()
{
   trig = getent("trig_actitp4", "targetname");
   tele1 = getent ("orig_actitp4", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Teleport to the next Trap!");
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

actitp5()
{
   trig = getent("trig_actitp5", "targetname");
   tele1 = getent ("orig_actitp5", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Teleport to the next Trap!");
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

actitp6()
{
   trig = getent("trig_actitp6", "targetname");
   tele1 = getent ("orig_actitp6", "targetname");

   for(;;)
    {   
    trig setHintString ("^6Enter Secret!");
     trig waittill("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}


///TRAPS
trap1()
{
   bounce = getent("trap1", "targetname");

   trig = getent("trig_trap1", "targetname");

   trig setHintString("^5Press ^6[&&1] ^5to activate a ^6trap^5!");
   trig waittill ("trigger");
   trig setHintString("^6Activated");

    bounce solid();
    bounce show();

  while(1)
	{
    wait 0.1;
	bounce notsolid();
    bounce hide();
	}
}

trap2()
{
   plata = getent("trap2a", "targetname");
   platb = getent("trap2b", "targetname");

   trig = getent("trig_trap2", "targetname");

   trig setHintString("^5Press ^6[&&1] ^5to activate a ^6trap^5!");
   trig waittill ("trigger");
   trig setHintString("^6Activated");
   
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

trap3()
{
   plata = getent("trap3a", "targetname");
   platb = getent("trap3b", "targetname");
   platc = getent("trap3c", "targetname");

   trig = getent("trig_trap3", "targetname");

   trig setHintString("^5Press ^6[&&1] ^5to activate a ^6trap^5!");
   trig waittill ("trigger");
   trig setHintString("^6Activated");


  for(;;)
	{
	plata moveX (-336,1.5);
    platb moveX (336,1.5);
    platc moveX (-336,1.5);
    wait 1.5;
    plata moveX (336,1.5);
    platb moveX (-336,1.5);
    platc moveX (336,1.5);
    wait 1.5;
	}
}

trap4()
{

   cylinder = getent("trap4", "targetname");

   trig = getent("trig_trap4", "targetname");

   trig setHintString("^5Press ^6[&&1] ^5to activate a ^6trap^5!");
   trig waittill ("trigger");
   trig setHintString("^6Activated");
   
   while(1)
  { 
    wait 0.1;
   cylinder rotateYaw (-360,2);
   }
}   

trap5()
{
   platforma = getent("trap5a", "targetname");
   platformb = getent("trap5b", "targetname");
   platformc = getent("trap5c", "targetname");

   trig = getent("trig_trap5", "targetname");

   trig setHintString("^5Press ^6[&&1] ^5to activate a ^6trap^5!");
   trig waittill("trigger", player);
   trig setHintString("^6Activated.");
   
    for(;;)
   {
   platforma rotateRoll (-720,2);
   platformb rotateRoll (720,2);
   platformc rotateRoll (-720,2);
   wait 2;
   platforma rotateRoll (720,2);
   platformb rotateRoll (-720,2);
   platformc rotateRoll (720,2);
   wait 2;
   }
}

trap6()
{
   plata = getent("trap6a", "targetname");
   platb = getent("trap6b", "targetname");

   trig = getent("trig_trap6", "targetname");

   trig setHintString("^5Press ^6[&&1] ^5to activate a ^6trap^5!");
   trig waittill ("trigger");
   trig setHintString("^6Activated");

    platb show();
    platb solid();

  for(;;)
	{
	plata moveY (200,0.6);
    platb hide();
    platb notsolid();
    wait 0.6;
    plata moveY (-200,0.6);
    wait 0.6;
	}
}


///ROOMS
waitdead()
{
    level.activ = GetActivator();
    knife = getent("trig_kniferoom","targetname");
    sniper = getent("trig_sniperroom","targetname");
    bounce = getent("trig_jumproom","targetname");
    slide = getent("trig_slideroom","targetname");
    purestrafe = getent("trig_purestrafe","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    bounce thread maps\mp\_utility::triggerOff();
    slide thread maps\mp\_utility::triggerOff();
    purestrafe thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    level.activ freezeControls(false);
    self freezeControls(false);
    level.activ.health = level.activ.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    bounce thread maps\mp\_utility::triggerOn();
    slide thread maps\mp\_utility::triggerOn();
    purestrafe thread maps\mp\_utility::triggerOn();
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

sniperroom()
{
    level.trigger_scope = getEnt ("trig_sniperroom", "targetname");

    jumpersc = getEnt ("orig_sniperjumper", "targetname");
    actisc = getEnt ("orig_sniperacti", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("^6Press ^5[&&1]^6 to enter ^5Sniper Room");
        level.trigger_scope waittill ("trigger", player);


		if( !isDefined( level.trigger_scope ) )
		return;

        player thread waitdead();
        level.activ = GetActivator();

        thread fightHUD("Sniper Room", player, level.activ);

        player thread endTimerPure("^6Kill each other !", 3, 0);
        level.activ thread endTimerPure("^6Kill each other !", 3, 0);

        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);    
        level.activ setOrigin (actisc.origin);
        level.activ setPlayerAngles (actisc.angles);

        player takeAllWeapons();
        level.activ takeAllWeapons();
        player giveWeapon("remington700_mp");
        level.activ giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        level.activ giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        level.activ giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        level.activ giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        level.activ switchToWeapon("m40a3_mp");   

        player.maxhealth = 100;
        player.health = player.maxhealth;
        level.activ.maxhealth = 100;
        level.activ.health = level.activ.maxhealth; 
        

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLn ("^6" + player.name + " ^5has died in ^6Sniper Room!");
    }
}

kniferoom()
{
   level.trigger_knife = getEnt ("trig_kniferoom", "targetname");

    jumperk = getEnt ("orig_knifejumper", "targetname");
    actik = getEnt ("orig_knifeacti", "targetname");

   for(;;)
    {
        level.trigger_knife setHintString ("^6Press ^5[&&1]^6 to enter ^5Knife Room");
        level.trigger_knife waittill ("trigger", player);

		if( !isDefined( level.trigger_knife ) )
		return;


        level.activ = getactivator();
        player thread waitdead();

        thread fightHUD("Knife Room", player, level.activ);

        level.activ thread endTimerPure("^6Kill each other !", 3, 0);
        player thread endTimerPure("^6Kill each other !", 3, 0);

	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);

        level.activ setOrigin (actik.origin);
        level.activ setPlayerAngles (actik.angles);

        player takeAllWeapons();
        level.activ takeAllWeapons();
        player giveWeapon("knife_mp");
        level.activ giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        level.activ switchToWeapon("knife_mp");

        player.maxhealth = 100;
        player.health = player.maxhealth;
        level.activ.maxhealth = 100;
        level.activ.health = level.activ.maxhealth;  

        while(isDefined(player) && isAlive(player))
        wait .05;
        
        iPrintLnBold ("^6" + player.name + " ^5has died in ^6Knife Room!");
    }
}

bounceroom()
{
    level.trigger_jump = getEnt ("trig_jumproom", "targetname");

    jumperb = getEnt ("orig_bouncejumper", "targetname");
    actib = getEnt ("orig_bounceacti", "targetname");

    while (1)
    {
        level.trigger_jump setHintString ("^6Press ^5[&&1]^6 to enter ^5Bounce Room");
        level.trigger_jump waittill ("trigger", player);

		if( !isDefined( level.trigger_jump ) )
		return;


        level.activ = getactivator();
        player thread waitdead();

        thread fightHUD("Slide Room", player, level.activ);

        level.activ thread endTimerPure("^6Kill each other !", 3, 0);
        player thread endTimerPure("^6Kill each other !", 3, 0);

	    player setOrigin (jumperb.origin);
        player setPlayerAngles (jumperb.angles);

        level.activ setOrigin (actib.origin);
        level.activ setPlayerAngles (actib.angles);

        player takeAllWeapons();
        level.activ takeAllWeapons();
        player giveWeapon("knife_mp");
        level.activ giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        level.activ switchToWeapon("knife_mp");

        player.maxhealth = 100;
        player.health = player.maxhealth;
        level.activ.maxhealth = 100;
        level.activ.health = level.activ.maxhealth;  

        while(isDefined(player) && isAlive(player))
        wait .05;
        
        iPrintLnBold ("^6" + player.name + " ^5has died in ^6Slide Room!");
    }
}

bounceweapon()
{
    trig = getEnt ("trig_sniperbounce", "targetname");
    trig setHintString ("^6Press ^5[&&1]^6 to get a ^5Sniper");
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

//JUMP ROOM LOAD POSITION
bounceroomfail1()
{
   trigb = getent("trig_bounceactifail", "targetname");
   teleb = getent ("orig_bounceacti", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

bounceroomfail2()
{
   triga = getent("trig_bouncejumperfail", "targetname");
   telea = getent ("orig_bouncejumper", "targetname");

   for(;;)
    {   
      triga waittill("trigger", player);
	  player setOrigin(telea.origin);
	  player setPlayerAngles (telea.angles);
    }
}

purestraferoom()
{
    level.trigger_strafe = getEnt ("trig_purestrafe", "targetname");

    orig_jumper = getEnt ("orig_purejumper", "targetname");
    orig_acti = getEnt ("orig_pureacti", "targetname");

    while (1)
    {
	    level.trigger_strafe setHintString ("^6Press ^5[&&1]^6 to enter ^5PureStrafe Room");
        level.trigger_strafe waittill ("trigger", player);

        level.pure_jumper = player; 

		if( !isDefined( level.trigger_strafe ) )
		return;


        player thread waitdead();
        level.activ = GetActivator();
        
        thread fightHUD("PureStrafe Room", player, level.activ);

        player thread endTimerPure("^0Finish the line faster than the opponent !", 3, 0);
        level.activ thread endTimerPure("^0Finish the line faster than the opponent !", 3, 0);

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);

        level.activ setPlayerAngles(orig_acti.angles);
        level.activ setOrigin(orig_acti.origin);
   
        player.maxhealth = 100;
        player.health = player.maxhealth;
        level.activ.maxhealth = 100;
        level.activ.health = level.activ.maxhealth;  

        player takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        player setWeaponAmmoClip("deserteagle_mp", 0);
        player setWeaponAmmoStock("deserteagle_mp", 0);
        player switchToWeapon("deserteagle_mp");
        
        level.activ takeAllWeapons();
        level.activ giveWeapon("deserteagle_mp");
        level.activ setWeaponAmmoClip("deserteagle_mp", 0);
        level.activ setWeaponAmmoStock("deserteagle_mp", 0);
        level.activ switchToWeapon("deserteagle_mp");

        while (isAlive(player) && isDefined(player) && player.sessionstate == "playing")
            wait 0.5;

        iPrintLnBold("^3" + player.name + "^7 has died!");
        wait 0.5;
        iPrintLnBold("^6Pure Strafe Room ^7Opened^6!");

		// Reset player variables for the next race
        player = undefined;
        level.pure_jumper = undefined;
        level.activ = undefined; // reset activator for next loop
    }
}

pureend()
{
    trig = getEnt("trig_purefinish", "targetname");
    winner = getEnt("orig_purewinner", "targetname");
    loser = getEnt("orig_purelooser", "targetname");
    
    while (1)
    {
        trig waittill("trigger", player);

        if (player == level.pure_jumper) 
        {
            // Jumper finished first
            level.pure_jumper freezeControls(1);
            level.pure_jumper setOrigin(winner.origin);
            level.pure_jumper setPlayerAngles(winner.angles);

            iPrintLn("^3Jumper: ^7" + level.pure_jumper.name + " won the race!");
            level.activ iPrintLnBold("^1You lost the race");

            level.activ freezeControls(1);
            level.activ setOrigin(loser.origin);
            level.activ setPlayerAngles(loser.angles);

            wait 0.5;
            level.pure_jumper freezeControls(0);
            level.pure_jumper giveMaxAmmo("deserteagle_mp");
            wait 0.1;
        }
        else if (player == level.activ)
        {
            // Activator finished first
            level.activ freezeControls(1);
            level.activ setOrigin(winner.origin);
            level.activ setPlayerAngles(winner.angles);

            iPrintLn("^3Activator: ^7" + level.activ.name + " won the race!");
            level.pure_jumper iPrintLnBold("^1You lost the race");

            level.pure_jumper freezeControls(1);
            level.pure_jumper setOrigin(loser.origin);
            level.pure_jumper setPlayerAngles(loser.angles);

            wait 0.5;
            level.activ freezeControls(0);
            level.activ giveMaxAmmo("deserteagle_mp");
            wait 0.1;
        }
        else
        {
            iPrintLnBold("^1Error: Unknown player triggered the finish!");
        }
    }
}


slideroom()
{
    level.trigger_slide = getEnt ("trig_slideroom", "targetname");

    orig_jumper = getEnt ("orig_slidejumper", "targetname");
    orig_acti = getEnt ("orig_slideacti", "targetname");

    while (1)
    {
	    level.trigger_slide setHintString ("^6Press ^5[&&1]^6 to enter ^5Slide Room");
        level.trigger_slide waittill ("trigger", player);

        level.slide_jumper = player; 


		if( !isDefined( level.trigger_slide ) )
		return;


        player thread waitdead();
        level.activ = GetActivator();
        
        thread fightHUD("PureStrafe Room", player, level.activ);

        player thread endTimerPure("^0Finish the room faster than the opponent !", 3, 0);
        level.activ thread endTimerPure("^0Finish the room faster than the opponent !", 3, 0);

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);

        level.activ setPlayerAngles(orig_acti.angles);
        level.activ setOrigin(orig_acti.origin);
   
        player.maxhealth = 100;
        player.health = player.maxhealth;
        level.activ.maxhealth = 100;
        level.activ.health = level.activ.maxhealth;  

        player takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        player setWeaponAmmoClip("deserteagle_mp", 0);
        player setWeaponAmmoStock("deserteagle_mp", 0);
        player switchToWeapon("deserteagle_mp");
        
        level.activ takeAllWeapons();
        level.activ giveWeapon("deserteagle_mp");
        level.activ setWeaponAmmoClip("deserteagle_mp", 0);
        level.activ setWeaponAmmoStock("deserteagle_mp", 0);
        level.activ switchToWeapon("deserteagle_mp");

        while (isAlive(player) && isDefined(player) && player.sessionstate == "playing")
            wait 0.5;

        iPrintLnBold("^3" + player.name + "^7 has died!");
        wait 0.5;
        iPrintLnBold("^6Slide Room ^7Opened^6!");

        // Reset player variables for the next race
        player = undefined;
        level.slide_jumper = undefined;
        level.activ = undefined; // reset activator for next loop
    }
}

slideend()
{
    trig = getEnt("trig_slidefinish", "targetname");
    winner = getEnt("orig_slidewinner", "targetname");
    loser = getEnt("orig_slidelooser", "targetname");
    
    while (1)
    {
        trig waittill("trigger", player);

        if (player == level.slide_jumper) 
        {
            // Jumper finished first
            level.slide_jumper freezeControls(1);
            level.slide_jumper setOrigin(winner.origin);
            level.slide_jumper setPlayerAngles(winner.angles);

            iPrintLn("^3Jumper: ^7" + level.slide_jumper.name + " won the race!");
            level.activ iPrintLnBold("^1You lost the race");

            level.activ freezeControls(1);
            level.activ setOrigin(loser.origin);
            level.activ setPlayerAngles(loser.angles);

            wait 0.5;
            level.slide_jumper freezeControls(0);
            level.slide_jumper giveMaxAmmo("deserteagle_mp");
            wait 0.1;
        }
        else if (player == level.activ)
        {
            // Activator finished first
            level.activ freezeControls(1);
            level.activ setOrigin(winner.origin);
            level.activ setPlayerAngles(winner.angles);

            iPrintLn("^3Activator: ^7" + level.activ.name + " won the race!");
            level.slide_jumper iPrintLnBold("^1You lost the race");

            level.slide_jumper freezeControls(1);
            level.slide_jumper setOrigin(loser.origin);
            level.slide_jumper setPlayerAngles(loser.angles);

            wait 0.5;
            level.activ freezeControls(0);
            level.activ giveMaxAmmo("deserteagle_mp");
            wait 0.1;
        }
        else
        {
            iPrintLnBold("^1Error: Unknown player triggered the finish!");
        }
    }
}


//SLIDE ROOM LOAD POSITION
slideroomfail1()
{
   trigb = getent("trig_slidefailacti", "targetname");
   teleb = getent ("orig_slideacti", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
      player iPrintLnBold("^1Try again :/");
    }
}

slideroomfail2()
{
   triga = getent("trig_slidefailjumper", "targetname");
   telea = getent ("orig_slidejumper", "targetname");

   for(;;)
    {   
      triga waittill("trigger", player);
	  player setOrigin(telea.origin);
	  player setPlayerAngles (telea.angles);
      player iPrintLnBold("^1Try again :/");
    }
}