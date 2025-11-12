#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include braxi\_common;

/*
TO DO:
Block ele
Add triggers to list
Add JUMPER SPAWNS
Add Global intermission
*/

main()
{
	maps\mp\_load::main();
	
	
	
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	SetExpFog(2500, 1500, 0.131, 0.116, 0.191, 0 );

	
	setdvar( "r_specularcolorscale", "1" );
	setdvar( "r_fog", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1500");
	  setdvar("scr_fog_exp_halfplane", "808.57");
		setdvar("scr_fog_exp_halfheight", "100");
		 setdvar("scr_fog_nearplane", "200");
		 setdvar("scr_fog_red", "0.52");
		 setdvar("scr_fog_green", "0.49");
		 setdvar("scr_fog_blue", "0.384");
		 setdvar("scr_fog_baseheight", "50");
		 setDvar("bg_falldamagemaxheight", 20000 );
		 setDvar("bg_falldamageminheight", 15000 );

		 setdvar("visionstore_glowTweakEnable", "0");
		 setdvar("visionstore_glowTweakRadius0", "5");
		 setdvar("visionstore_glowTweakRadius1", "");
		 setdvar("visionstore_glowTweakBloomCutoff", "0.5");
		 setdvar("visionstore_glowTweakBloomDesaturation", "0");
		 setdvar("visionstore_glowTweakBloomIntensity0", "1");
		 setdvar("visionstore_glowTweakBloomIntensity1", "");
		 setdvar("visionstore_glowTweakSkyBleedIntensity0", "");
		 setdvar("visionstore_glowTweakSkyBleedIntensity1", "");
 		level._effect[ "rain_heavy_mist" ] = loadfx( "weather/rain_mp_farm" );
 		level._effect[ "lightning" ] = loadfx( "weather/lighting_no_thunder_main" );
 		level._effect[ "room" ] = loadfx( "custom/inroom" );
 		level._effect[ "fire" ] = loadfx( "custom/outsidefire" );
 		level.zap = loadfx( "custom/zap" );
 		level.minefield_explosion = loadfx( "custom/minefield_explosion" );
 		level.redarrow = loadfx( "custom/redarrow" );
 		level.greenarrow = loadfx( "custom/greenarrow" );
 		level.redlight = loadfx( "custom/redlight" );
 		level._effect[ "nuke1" ] = loadfx( "explosions/nuke_flash" );
 		level._effect[ "nuke2" ] = loadfx( "explosions/nuke_explosion" );
 		level._effect[ "nuke3" ] = loadfx( "explosions/nuke_smoke_fill" );
 		level._effect[ "nuke4" ] = loadfx( "explosions/nuke_dirt_shockwave" );
 		level.spintrap = false;
 		level.minefield_active = false;
 		level.insniperroom = false;
 		level.inbounceroom = false;
 		level.inweaponroom = false;
 		level.inkniferoom = false;
 		level.inpromodroom = false;

	precacheitem("usp_silencer_mp");
	precacheitem("mp44_mp");
	precacheitem("uzi_silencer_mp");
	precacheItem("m40a3_mp");
	precacheItem("m1014_grip_mp");
	precacheItem("remington700_mp");
	precacheItem("p90_silencer_mp");
	precacheItem("ak74u_mp");
	precacheItem("saw_grip_mp");
	precacheItem("deserteaglegold_mp");
	precacheItem("rpg_mp");
	precacheItem("honeybadger_mp");
	precacheItem("winchester1200_mp");
	precacheItem("ak47_mp");
	precacheItem("rpd_mp");
	thread sniperthing();
	thread bomb();
	thread hintsec();
	thread ac130setup();
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
	thread music();
	thread musictrig();
	thread startdoor();
	thread outsidefire();
	thread credits();
	thread spinny();
	thread storm();
	thread enddoor();
	thread actiteleports();
	thread secret_step1();

	 addTriggerToList( "trig1" );
	 addTriggerToList( "trig2" );
	 addTriggerToList( "trig3" );
	 addTriggerToList( "trig4" );
	 addTriggerToList( "trig5" );
	 addTriggerToList( "trig6" );
	 addTriggerToList( "trig7" );
	 addTriggerToList( "trig8" );
	 addTriggerToList( "trig9" );
	 addTriggerToList( "trig10" );
	 addTriggerToList( "trig11" );
		 
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

sniperthing()
{

	sniper = getEnt ("sniper_thing","targetname");
	
	while(1)
	{
	
	sniper waittill ("trigger", player);
	
		
    player giveWeapon( "remington700_mp" );
    player giveMaxAmmo( "remington700_mp" );
    wait 0.5;
    player switchToWeapon( "remington700_mp" );
    wait 1;

	}
}

bomb()
{
	trig = getent("bomb_pickup","targetname");
	bomb = getent("bomb","targetname");
	trig waittill("trigger", player);
	trig delete();
	bomb Delete();
	iPrintln("What's this for?");
	thread wow();
}

wow()
{
	trig = getent("chicken1","targetname");
	trig waittill("trigger", player);
	trig delete();
	IPrintLn("bawk");
	thread switch1();
}

wow2()
{
	trig = getent("chicken2","targetname");
	trig waittill("trigger", player);
	trig delete();
	IPrintLn("bawk");
	thread switch1();
}

switch1()
{
	trig = getent("switch1","targetname");
	trig waittill("trigger", player);
	trig delete();
	thread switch2();
}

switch2()
{
	trig = getent("switch2","targetname");
	trig waittill("trigger", player);
	trig delete();
	thread switch3();
}

switch3()
{
	trig = getent("switch3","targetname");
	trig waittill("trigger", player);
	trig delete();
	thread switch4();
}

switch4()
{
	trig = getent("switch4","targetname");
	trig waittill("trigger", player);
	trig delete();
	thread switch5();
}

switch5()
{
	trig = getent("switch5","targetname");
	trig waittill("trigger", player);
	trig delete();
	IPrintLnBold(player.name + " has done it...");
	thread nuke();
	wait 4;
	IPrintLnBold(player.name + " has blown up the facility!");
}

hintsec()
{
    for(;;)
    {
        wait 30;
        iPrintln("^301000010 01101111 01101101 01100010 00100000 01000011 01101000");
        wait 30;
        iPrintln("^301101001 01100011 01101011 01100101 01101110 00100000 01010011");
        wait 30;
        iPrintln("^201110111 01101001 01110100 01100011 01101000 01100101 01110011"); //what, did you think decompiling the map would help you?
    }
}
ac130setup()
{
	ac130 = getent("ac130","targetname");
	wait 0.5;
	ac130 Hide();
}
nuke()
{
	ac130 = getent("ac130","targetname");
	acorigin = getent("ac130_origin","targetname");
	nuke1 = getent("nuke1","targetname");
	nuke2 = getent("nuke2","targetname");
	nuke3 = getent("nuke3","targetname");
	nuke4 = getent("nuke4","targetname");
	wait 3;
	acorigin PlaySound("ac130s");
	wait 1;
	nuke2 PlaySound("flyby");
	ac130 Show();
	ac130 MoveTo(acorigin.origin, 8);
	wait 5;
	nuke4 PlaySound("exp_building_collapse_dist_layer");
	Earthquake( 1, 5, nuke4.origin, 10000 );
	playFX(level._effect[ "nuke1" ], nuke1.origin);
	wait 0.2;
	playFX(level._effect[ "nuke2" ], nuke2.origin);
	wait 0.3;
	playFX(level._effect[ "nuke3" ], nuke3.origin);
	wait 0.3;
	playFX(level._effect[ "nuke4" ], nuke1.origin);
	wait 0.3;
	playFX(level._effect[ "nuke3" ], nuke4.origin);
	ac130 Hide();
	ambientPlay("afternuke");
	visionSetNaked("airlift_nuke", 4);
	wait 1;
	playFX(level._effect[ "nuke3" ], nuke4.origin);
	wait 4;
	playFX(level._effect[ "nuke3" ], nuke4.origin);
	wait 4;
	playFX(level._effect[ "nuke3" ], nuke4.origin);

}
trap1()
{
arrow = GetEnt("arrow","targetname");
arrowkill = GetEnt("arrowkill","targetname");
trig = GetEnt("trig1","targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig delete();
thread trap1_1();
PlayFX( level.redarrow, arrow.origin );

for(;;)
{
self endon("trap_finished");
arrowkill waittill("trigger", player);
wait 0.01;
player suicide();
}
}

trap1_1()
{
kill = GetEnt("arrowkill","targetname");
arrow = GetEnt("arrow","targetname");
wait 8;
kill delete();
level notify("trap_finished");
PlayFX( level.greenarrow, arrow.origin );
}

trap2()
{
	plat1 = getEntArray("trap2_1","targetname");
	plat2 = getEntArray("trap2_2","targetname");
	trig = getent("trig2", "targetname");
	trig SetHintString("Press ^3&&1 ^7to ^1Activate");
	trig waittill("trigger", player);
	trig Delete();
	for(;;)
	{
	for(i=0;i<plat1.size;i++)
{
		plat1[i] rotateYaw(360, 1);
		wait 0.01;
	}
		for(i=0;i<plat2.size;i++)
	{
		plat2[i] rotateYaw(-360, 1); 
		wait 0.01;

	
}
}
}

trap3()
{
	trig = getent("trig3","targetname");
	bounce = getent("trap3", "targetname");
	trig SetHintString("Press ^3&&1 ^7to ^1Activate");
	trig waittill("trigger", player);
	trig delete();
	bounce moveZ(-500, 4);
	wait 8;
	bounce moveZ(500, 4);
}

trap4()
{
light = GetEnt("trap4_notify","targetname");
hint = GetEnt("trap4_hint", "targetname");
minefield = GetEnt("minefield_trap","targetname");
trig = GetEnt("trig4","targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig delete();
hint SetHintString("^1WARNING: Minefield AHEAD! Try ^3Mantling on objects ^1to AVOID MINES");
PlayFX( level.redlight, light.origin );

for(;;)
{
minefield waittill("trigger", player);
if( isDefined(player.sessionstate))
{
	if(player.sessionstate == "playing" )
	{
wait 0.01;
minefield PlaySound("rocket_explode_default");
PlayFX(level.minefield_explosion, player.origin);
player suicide();
IPrintLn(player.name + " Hit a ^1mine...");
}
else
{

}
}
}
}

trap5()
{
trig = getent("trig5","targetname");
bounce = getent("trap5", "targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig Delete();
	while(1)
	{
	bounce rotatePitch(720, 5);
	wait 10;
	}
}

trap6()
{
trig = getent("trig6","targetname");
bounce = getent("trap6", "targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig Delete();
	while(1)
	{
	bounce NotSolid();
	bounce Hide();
	wait 5;
	bounce Solid();
	bounce Show();
	wait 5;
	}
}

trap7()
{
fx=getentarray("trap7_origin","targetname");
trig = getent("trig7","targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig Delete();

for(i=0;i<fx.size;i++)
{
	PlayFX(level.zap, fx[i].origin);
	fx[i] playSound("zap");
	RadiusDamage( fx[i].origin, 100, 75, 100 );
	wait 0.3;
}
}

trap8()
{
fx=getentarray("trap8","targetname");
trig = getent("trig8","targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig Delete();

for(i=0;i<fx.size;i++)
{
	PlayFX(level.minefield_explosion, fx[i].origin);
	fx[i] playSound("rocket_explode_default");
	RadiusDamage( fx[i].origin, 80, 50, 75 );
	wait 0.3;
}
}

trap9()
{
trig = getent("trig9","targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig Delete();
level.spintrap = true;
}

trap10()
{
trig = getent("trig10","targetname");
plat = getent("trap10","targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig Delete();
plat NotSolid();
plat Hide();
}

trap11()
{
trig = getent("trig11","targetname");
plat = getent("trap11_1","targetname");
plat2 = getent("trap11_2","targetname");
plat3 = getent("trap11_3","targetname");
trig SetHintString("Press ^3&&1 ^7to ^1Activate");
trig waittill("trigger", player);
trig Delete();
for(;;)
{
	plat RotateRoll(360, 4);
	plat waittill("rotatedone");
	plat2 RotateRoll(360, 4);
	plat2 waittill("rotatedone");
	plat3 RotateRoll(360, 4);
	plat3 waittill("rotatedone");
}
}



music()
{
		level.music = [];
 
        i = 0;
		level.music[i]["artist"] = "Marshmello";
		level.music[i]["title"] = "Happier";
		level.music[i]["alias"] = "happy";
		
		i++;
		level.music[i]["artist"] = "Illenium";
		level.music[i]["title"] = "Crashing ft. Bahari";
		level.music[i]["alias"] = "crashing";
		
		i++;
		level.music[i]["artist"] = "Astra & Pooja";
		level.music[i]["title"] = "Time To Fly";
		level.music[i]["alias"] = "fly";
		
		i++;
		level.music[i]["artist"] = "Mokita";
		level.music[i]["title"] = "When I See You";
		level.music[i]["alias"] = "magnetic";
		
		i++;
		level.music[i]["artist"] = "Alok";
		level.music[i]["title"] = "Pray feat. Conor Maynard";
		level.music[i]["alias"] = "pray";

		i++;
		level.music[i]["artist"] = "Nurko";
		level.music[i]["title"] = "Breathe Without ft. Luma";
		level.music[i]["alias"] = "nurko";

 
		precacheShader( "black" );
		precacheShader( "white" );
}

musicMenu()
{

	self endon( "death" );
 
	self thread onDeath();
	self thread onDisconnect();
 
	self.hud_music = [];
	self.selection = 0;
 
	i = 0;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.35, "left", "top", 2 );
	self.hud_music[i].sort = 880;
	self.hud_music[i] setShader( "black", 320, 160 );
	
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 180, 1, "left", "top", 1.8 );
	self.hud_music[i].sort = 883;
	self.hud_music[i] setText( "^1Industrial" );
	
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText( "Select a Song" );
 
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
	self.hud_music[i].sort = 885;
	self.hud_music[i] setText( "Press ^2[^7USE^2]^7: Play Song" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText( "Visit Raid-gaming.net" );
 
	for( j = 0; j < level.music.size; j++ )
	{
		i++;
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";
 
		entry = level.music[j];
		self.hud_music[i] setText( entry["artist"] + " ^2-^7 " + entry["title"] );
	}
 
	i++;
	self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
	self.hud_music[i].sort = 881;
	indicator = self.hud_music[self.hud_music.size-1];
	indicator setShader( "white", 306, 17 );
 
	while( self.sessionstate == "playing" )
	{
		wait 0.1;
 
		if( self attackButtonPressed() )
		{
			self.hud_music[5+self.selection].alpha = 0.93;
 
			self.selection++;
			if( self.selection >= level.music.size )
				self.selection = 0;
 
			item = self.hud_music[5+self.selection];
			item.alpha = 1;
			indicator.y = item.y;
		}
		else if( self useButtonPressed() )
		{
			iPrintln( "^2Now playing: ^7" + level.music[self.selection]["artist"]+" - ^2" +level.music[self.selection]["title"] );
 
			ambientPlay( level.music[self.selection]["alias"], 3 );
			self freezeControls(0);
			level notify ( "song_picked" );
			self braxi\_rank::giveRankXp( "trap_activation" );
			break;
		}
		else if( self meleeButtonPressed() )
		{
			self freezeControls(0);
			break;
		}
	}
 
	self cleanUp();
}
 
musictrig()
{
	trigger = getEnt ( "jukebox", "targetname" );
	trigger setHintString( "Press ^2[^7USE^2] ^7to choose a Song" );
 
	trigger waittill( "trigger", player );
	trigger delete();
	level endon ( "song_picked" );
	player thread musicMenu();
	player freezeControls(1);
}
 
onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}
 
onDeath()
{
	self endon( "disconnect" );
	self endon( "music thread terminated" );
	self waittill( "death" );
	self cleanUp();
}
 
 
cleanUp()
{
	if( !isDefined( self ) )
		return;
 
	if( isDefined( self.hud_music ) )
	{
		for( i = 0; i < self.hud_music.size; i++ )
		{
			if( isDefined( self.hud_music[i] ) )
				self.hud_music[i] destroy();
		}
	}
	self notify( "music thread terminated" );
}

startdoor()
{
	startdoor = GetEnt("start_door", "targetname");
	level waittill("round_started");
	wait 8;
	IPrintLn("Start door is opening...");
	startdoor MoveZ(176, 6, 3, 3);

}

credits()
{
	if( isDefined( self.logoText ) )
		self.logoText destroy();

	self.logoText = newHudElem();
	self.logoText.y = 10;
	self.logoText.alignX = "center";
	self.logoText.alignY = "middle";
	self.logoText.horzAlign = "center_safearea";

	self.logoText.alpha = 0;
	self.logoText.sort = -3;
	self.logoText.fontScale = 1.6;
	self.logoText.archieved = true;

	for(;;)
	{
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^1-Industrial-");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^1---Map Made By TheHumble_J---");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^1Map Made for Raid Mapping Contest");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^1Thank you to ^3Lossy");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
	}
}

spinny()
{
	spin = getent("spinny","targetname");
	level waittill("round_started");
	for(;;)
	{
	if(level.spintrap)
	{
		spin rotateYaw(-360, 6);
		wait 6;
	}
	else
	{

		spin rotateYaw(360, 6);
		wait 6;
	}
	
}
}




storm()
{
storm = randomInt(3);

if(storm == 1)
{
level.storm = true;
level waittill("round_started");
visionSetNaked("stormy");
thread ambientfx();
thread lightning();
ambientPlay("ambient_cargoshipmp_ext");
}
else
{
wait 0.1;
visionSetNaked("mp_dr_industrial");
}
}




outsidefire()
{
fx=GetEnt("outside_fire","targetname");
wait 1;

	PlayFX(level._effect[ "fire" ],fx.origin);
}

ambientfx()
{
fx=getentarray("ambient_fx","targetname");
wait 1;
//for(;;)
//{
	for(i=0;i<fx.size;i++)
	{
	PlayFX(level._effect[ "rain_heavy_mist" ],fx[i].origin);
	wait 0.1;
//}
}

}


lightning()
{		
	wait 1; //otherwise doesn't spawn for some reason
	playLoopedFX(level._effect[ "lightning" ], 0.3, (-3520, -810, 200)); 
	wait 0.1;
	playLoopedFX(level._effect[ "lightning" ], 0.3, (-6549, -730, 130)); 
	wait 0.1;
	playLoopedFX(level._effect[ "lightning" ], 0.3, (1893, -323, 153)); 
}

enddoor()
{
	door = GetEnt("end_door", "targetname");
	trig = GetEnt("end_door_trig", "targetname");
	trig waittill("trigger", player);
	IPrintLnBold(player.name + " Has Finished ^1Industrial ^3First^7!");
	thread sniper();
	thread a74uroom();
	thread bounceroom();
	thread knife();
	thread weapon();
	thread jump_respawn_jumper();
	thread jump_respawn_acti();
	thread bounceweapon();
	trig delete();
	door MoveZ(-500, 3);
	door waittill("movedone");
	door delete();
}

actiteleports() {
    triggers = getEntArray("acti_teleport", "targetname");
    for (i = 0; i < triggers.size; i++) {
        triggers[i] thread teleportTrigger();
        triggers[i] SetHintString("Press ^1&&1 ^7To Go To The Next ^3Area");
    }
}

teleportTrigger() {
    loc = getEnt(self.target, "targetname");
    for (;;) {
        self waittill("trigger", player);
        player setOrigin(loc.origin);
        player setPlayerAngles(loc.angles);
    }
}

jump_respawn_jumper()
{
	teleport = GetEnt("respawn_jumper","targetname");
	origin = GetEnt("bouncejump","targetname");
	while(1)
        {
	teleport waittill("trigger", player);
	
			player SetPlayerAngles( origin.angles );
	        player setOrigin( origin.origin );
}	
}

jump_respawn_acti()
{
	teleport = GetEnt("respawn_acti","targetname");
	origin = GetEnt("bounceacti","targetname");
	while(1)
        {
	teleport waittill("trigger", player);
	
			player SetPlayerAngles( origin.angles );
	        player setOrigin( origin.origin );
}	
}

bounceweapon()
{

	weaptrig = getEnt ("bounceweapon","targetname");
	
	while(1)
	{
	
	weaptrig waittill ("trigger", player);
	i = randomintrange(0, 11);
	weapon = "rpg_mp";
	if(i == 0)
	{
		weapon = "saw_grip_mp";
	}
	else if(i == 1)
	{
		weapon = "rpg_mp";
	}
	else if(i == 2)
	{
		weapon = "winchester1200_mp";
	}
	else if(i == 3)
	{
		weapon = "m1014_grip_mp";
	}
	else if(i == 4)
	{
		weapon = "saw_grip_mp";
	}
	else if(i == 5)
	{
		weapon = "honeybadger_mp";
	}
	else if(i == 6)
	{
		weapon = "mp44_mp";
	}
	else if(i == 7)
	{
		weapon = "ak47_mp";
	}
	else if(i == 8)
	{
		weapon = "rpd_mp";
	}
	else if(i == 9)
	{
		weapon = "p90_silencer_mp";
	}
	else if(i == 10)
	{
		weapon = "uzi_silencer_mp";
	}
	//precacheItem(weapon);	
    player giveWeapon( weapon );
    player giveMaxAmmo( weapon );
    wait 0.5;
    player switchToWeapon( weapon);


	}
}

sniper()
{
	level.sniper = GetEnt("sniper","targetname");
	snipefx = GetEnt("sniper_active", "targetname");
    jump = GetEnt( "endroom_jumper", "targetname" );
    acti = GetEnt( "endroom_acti", "targetname" );
    level.sniper SetHintString("^2Sniper Room");

	while(1)
	{
		level.sniper waittill("trigger", player);
		PlayFX(level._effect[ "room" ],snipefx.origin);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.insniperroom = true;
			level.weaponroom delete();
			level.a74uroom delete();
			level.knife delete();
			level.bounceroom delete();

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
	        player TakeAllWeapons();
	        player GiveWeapon( "remington700_mp" );
			player GiveMaxAmmo( "remington700_mp" );
			player GiveWeapon( "m40a3_mp" );
			player GiveMaxAmmo( "m40a3_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
	        level.activ TakeAllWeapons();
	        level.activ GiveWeapon( "remington700_mp" );
	        level.activ GiveMaxAmmo( "remington700_mp" );
			level.activ GiveWeapon( "m40a3_mp" );
	        level.activ GiveMaxAmmo( "m40a3_mp" );
	        wait .05;
	        player switchToWeapon( "remington700_mp" ); 
	        level.activ SwitchToWeapon( "remington700_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Sniper Room!";
					noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player FreezeControls(0);
					level.activ FreezeControls(0);
			player waittill( "death" );
			level.PlayerInRoom = false;
		}
	}
}

a74uroom()
{
	level.a74uroom = GetEnt("ak74u","targetname");
	promodfx = GetEnt("74u_active", "targetname");
    jump = GetEnt( "endroom_jumper", "targetname" );
    acti = GetEnt( "endroom_acti", "targetname" );
    level.a74uroom SetHintString("^1Promod Room");

	while(1)
	{
		level.a74uroom waittill("trigger", player);
		PlayFX(level._effect[ "room" ],promodfx.origin);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.inpromodroom = true;
			level.sniper delete();
			level.knife delete();
			level.weaponroom delete();
			level.bounceroom delete();

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
	        player TakeAllWeapons();
	        player GiveWeapon( "ak74u_mp" );
			player GiveMaxAmmo( "ak74u_mp" );
			player GiveWeapon( "deserteagle_mp" );
			player GiveMaxAmmo( "deserteagle_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
	        level.activ TakeAllWeapons();
	        level.activ GiveWeapon( "ak74u_mp" );
	        level.activ GiveMaxAmmo( "ak74u_mp" );
			level.activ GiveWeapon( "deserteagle_mp" );
	        level.activ GiveMaxAmmo( "deserteagle_mp" );
	        wait .05;
	        player switchToWeapon( "ak74u_mp" ); 
	        level.activ SwitchToWeapon( "ak74u_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Promod Room!";
					noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player FreezeControls(0);
					level.activ FreezeControls(0);
			player waittill( "death" );
			level.PlayerInRoom = false;
		}
	}
}

bounceroom()
{
	level.bounceroom = GetEnt("bounce","targetname");
	bouncefx = GetEnt("bounce_active", "targetname");
    jump = GetEnt( "bouncejump", "targetname" );
    acti = GetEnt( "bounceacti", "targetname" );
    level.bounceroom SetHintString("^3Bounce Room");

	while(1)
	{
		level.bounceroom waittill("trigger", player);
		PlayFX(level._effect[ "room" ],bouncefx.origin);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.inbounceroom = true;
			level.sniper delete();
			level.weaponroom delete();
			level.a74uroom delete();
			level.knife delete();

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
	        player TakeAllWeapons();
	        player GiveWeapon( "tomahawk_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
	        level.activ TakeAllWeapons();
	        level.activ GiveWeapon( "tomahawk_mp" );
	        wait .05;
	        player switchToWeapon( "tomahawk_mp" ); 
	        level.activ SwitchToWeapon( "tomahawk_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Bounce Room!";
					noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player FreezeControls(0);
					level.activ FreezeControls(0);
			player waittill( "death" );
			level.PlayerInRoom = false;
		}
	}
}

knife()
{
	level.knife = GetEnt("knife","targetname");
	knifefx = GetEnt("knife_active", "targetname");
    jump = GetEnt( "endroom_jumper", "targetname" );
    acti = GetEnt( "endroom_acti", "targetname" );
    level.knife SetHintString("^5Knife Room");

	while(1)
	{
		level.knife waittill("trigger", player);
		PlayFX(level._effect[ "room" ],knifefx.origin);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.inkniferoom = true;
			level.sniper delete();
			level.a74uroom delete();
			level.weaponroom delete();
			level.bounceroom delete();

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
	        player TakeAllWeapons();
	        player GiveWeapon( "tomahawk_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
	        level.activ TakeAllWeapons();
	        level.activ GiveWeapon( "tomahawk_mp" );
	        wait .05;
	        player switchToWeapon( "tomahawk_mp" ); 
	        level.activ SwitchToWeapon( "tomahawk_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Knife Room!";
					noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player FreezeControls(0);
					level.activ FreezeControls(0);
			player waittill( "death" );
			level.PlayerInRoom = false;
		}
	}
}

weapon()
{
	level.weaponroom = GetEnt("weapon","targetname");
	weaponfx = GetEnt("wep_active", "targetname");
    jump = GetEnt( "endroom_jumper", "targetname" );
    acti = GetEnt( "endroom_acti", "targetname" );
    level.weaponroom SetHintString("^1Weapon Room");

	while(1)
	{
		level.weaponroom waittill("trigger", player);
		PlayFX(level._effect[ "room" ],weaponfx.origin);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.inweaponroom = true;
			level.sniper delete();
			level.a74uroom delete();
			level.knife delete();
			level.bounceroom delete();

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
	        player TakeAllWeapons();
	        i = randomintrange(0, 11);
	weapon = "rpg_mp";
	if(i == 0)
	{
		weapon = "saw_grip_mp";
	}
	else if(i == 1)
	{
		weapon = "rpg_mp";
	}
	else if(i == 2)
	{
		weapon = "winchester1200_mp";
	}
	else if(i == 3)
	{
		weapon = "m1014_grip_mp";
	}
	else if(i == 4)
	{
		weapon = "saw_grip_mp";
	}
	else if(i == 5)
	{
		weapon = "honeybadger_mp";
	}
	else if(i == 6)
	{
		weapon = "mp44_mp";
	}
	else if(i == 7)
	{
		weapon = "ak47_mp";
	}
	else if(i == 8)
	{
		weapon = "rpd_mp";
	}
	else if(i == 9)
	{
		weapon = "p90_silencer_mp";
	}
	else if(i == 10)
	{
		weapon = "uzi_silencer_mp";
	}
			//PrecacheItem(weapon);
	        player GiveWeapon( weapon );
			player GiveMaxAmmo( weapon );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
	        level.activ TakeAllWeapons();
	        level.activ GiveWeapon( weapon );
	        level.activ GiveMaxAmmo( weapon );
	        wait .05;
	        player switchToWeapon( weapon ); 
	        level.activ SwitchToWeapon( weapon );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Weapon Room!";
					noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player FreezeControls(0);
					level.activ FreezeControls(0);
			player waittill( "death" );
			level.PlayerInRoom = false;
		}
	}
}

secret_step1()
{
	trig = GetEnt("secretstep1","targetname");
	trig waittill("trigger", player);
	IPrintLn("Knock knock....");
	thread secret_step2();
	thread giverpg1();
	thread giverpg2();
	thread giverpg3();
	thread giverpg4();
	thread giverpg5();
	thread giverpg6();
	thread giverpg7();
	thread giverpg8();
	thread back1();
	thread back2();
	thread back3();
	thread back4();
	thread back5();
	thread back6();
	thread back7();
	thread back8();
	thread secret_finish();
	thread secret_goback();
}	

secret_step2()
{
	trig = GetEnt("secretstep2","targetname");
	origin1 = GetEnt("secret_enter", "targetname");
		while(1)
        {
	trig waittill("trigger", player);
	IPrintLn(player.name + " has found the ^5Secret!");
	player IPrintLnBold(player.name + ", this secret is difficult!");
	player IPrintLnBold("If you're not good at CJ, please go back!");
	player IPrintLnBold("You can use the button behind you to return.");
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
	        player thread Secret_init();
}	
}

Secret_init()
{
	self endon("death");
	time=200;
	self endon("secret_leave");
	self thread hhhh();
	self thread time();
	while(1)
	{
		wait 1;
		time--;
		if(time<=0)
		self suicide();			
	}
}

hhhh() {
	self endon ("death");
	self endon ("disconnect");
	self.hud_text = newClientHudElem(self);
	self.hud_text.alignX = "center";
	self.hud_text.alignY = "middle";
	self.hud_text.horzalign = "center";
	self.hud_text.vertalign = "middle";
	self.hud_text.alpha = 1;
	self.hud_text.x = -200;
	self.hud_text.y = 220;
	self.hud_text.font = "objective";
	self.hud_text.fontscale = 1.5;
	self.hud_text.glowalpha = 1;
	self.hud_text.glowcolor = (0.0, 1.0, 0.0);
	self.hud_text.owner = self;
	self.hud_text setText("Time:");
	self.hud_text thread removehudsondeath();	
	wait 180;
	self removeText();	
}

	
time() {	
	self endon ("death");
	self endon ("disconnect");
	self.hud_count = newClientHudElem(self);
	self.hud_count endon ("death");
	self.hud_count.alignX = "center";
	self.hud_count.alignY = "middle";
	self.hud_count.horzalign = "center";
	self.hud_count.vertalign = "middle";
	self.hud_count.alpha = 1;
	self.hud_count.x = -140;
	self.hud_count.y = 220;
	self.hud_count.font = "objective";
	self.hud_count.fontscale = 1.5;
	self.hud_count.glowalpha = 1;
	self.hud_count.glowcolor = (0.7,0.7,0);
	self.hud_count.label = &"&&1";
	self.hud_count.owner = self;
	self.hud_count thread removehudsondeath();
	for(i = 0; i < 200; i++){
		self.hud_count setvalue( 200 - i );
		wait 1;
	}
	
	self removeCountdown();	
}

removeText()
{
	if( isDefined( self.hud_text) )
	{
        self.hud_text destroy();
    }
} 

removeCountdown() {
	if( isDefined( self.hud_count) )
	{
        self.hud_count destroy();
    }
}

removehudsondeath() {
	self endon ("death");
	self.owner waittill("death");
	
	if( isDefined( self ) )
	{
        self destroy();
    }
	
}

giverpg1() {
	rpgtrig = GetEnt("giverpg1", "targetname");
	rpgtrig SetHintString("Press ^5&&1 ^7For an ^1RPG");
	while(1) {		
		rpgtrig waittill ("trigger", player);
		
		player giveWeapon("rpg_mp", 100, 500 );
		player givemaxammo ("rpg_mp");
		player switchToWeapon("rpg_mp");
	}
}

giverpg2() {
	rpgtrig = GetEnt("giverpg2", "targetname");
	rpgtrig SetHintString("Press ^5&&1 ^7For an ^1RPG");
	while(1) {		
		rpgtrig waittill ("trigger", player);
		
		player giveWeapon("rpg_mp", 100, 500 );
		player givemaxammo ("rpg_mp");
		player switchToWeapon("rpg_mp");
	}
}

giverpg3() {
	rpgtrig = GetEnt("giverpg3", "targetname");
	rpgtrig SetHintString("Press ^5&&1 ^7For an ^1RPG");
	while(1) {		
		rpgtrig waittill ("trigger", player);
		
		player giveWeapon("rpg_mp", 100, 500 );
		player givemaxammo ("rpg_mp");
		player switchToWeapon("rpg_mp");
	}
}

giverpg4() {
	rpgtrig = GetEnt("giverpg4", "targetname");
	rpgtrig SetHintString("Press ^5&&1 ^7For an ^1RPG");
	while(1) {		
		rpgtrig waittill ("trigger", player);
		
		player giveWeapon("rpg_mp", 100, 500 );
		player givemaxammo ("rpg_mp");
		player switchToWeapon("rpg_mp");
	}
}

giverpg5() {
	rpgtrig = GetEnt("giverpg5", "targetname");
	rpgtrig SetHintString("Press ^5&&1 ^7For an ^1RPG");
	while(1) {		
		rpgtrig waittill ("trigger", player);
		
		player giveWeapon("rpg_mp", 100, 500 );
		player givemaxammo ("rpg_mp");
		player switchToWeapon("rpg_mp");
	}
}

giverpg6() {
	rpgtrig = GetEnt("giverpg6", "targetname");
	rpgtrig SetHintString("Press ^5&&1 ^7For an ^1RPG");
	while(1) {		
		rpgtrig waittill ("trigger", player);
		
		player giveWeapon("rpg_mp", 100, 500 );
		player givemaxammo ("rpg_mp");
		player switchToWeapon("rpg_mp");
	}
}

giverpg7() {
	rpgtrig = GetEnt("giverpg7", "targetname");
	rpgtrig SetHintString("Press ^5&&1 ^7For an ^1RPG");
	while(1) {		
		rpgtrig waittill ("trigger", player);
		
		player giveWeapon("rpg_mp", 100, 500 );
		player givemaxammo ("rpg_mp");
		player switchToWeapon("rpg_mp");
	}
}

giverpg8() {
	rpgtrig = GetEnt("giverpg8", "targetname");
	rpgtrig SetHintString("Press ^5&&1 ^7For an ^1RPG");
	while(1) {		
		rpgtrig waittill ("trigger", player);
		
		player giveWeapon("rpg_mp", 100, 500 );
		player givemaxammo ("rpg_mp");
		player switchToWeapon("rpg_mp");
	}
}

back1()
{
	teleport1 = GetEnt("back1","targetname");
	origin1 = GetEnt("back1_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	
}

back2()
{
	teleport1 = GetEnt("back2","targetname");
	origin1 = GetEnt("back2_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	
}

back3()
{
	teleport1 = GetEnt("back3","targetname");
	origin1 = GetEnt("back3_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	
}

back4()
{
	teleport1 = GetEnt("back4","targetname");
	origin1 = GetEnt("back4_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	
}

back5()
{
	teleport1 = GetEnt("back5","targetname");
	origin1 = GetEnt("back5_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	
}

back6()
{
	teleport1 = GetEnt("back6","targetname");
	origin1 = GetEnt("back6_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	
}

back7()
{
	teleport1 = GetEnt("back7","targetname");
	origin1 = GetEnt("back7_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	
}

back8()
{
	teleport1 = GetEnt("back8","targetname");
	origin1 = GetEnt("back8_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
}	
}

secret_finish()
{
	teleport1 = GetEnt("secret_finish","targetname");
	origin1 = GetEnt("secret_finish_origin","targetname");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
	        IPrintLnBold(player.name + " Has finished the ^5Secret");
	        player GiveWeapon("ak74u_mp");
			player SwitchToWeapon( "ak74u_mp" );
			player braxi\_rank::giveRankXp("trap_activation", 100);
			player thread removeCountdown();
			player thread removeText();
			player notify("secret_leave");
}	
}

secret_goback()
{
	teleport1 = GetEnt("secret_goback","targetname");
	origin1 = GetEnt("secret_goback_origin","targetname");
	teleport1 SetHintString("Press ^5&&1 ^7to ^1Leave the secret.");
	while(1)
        {
	teleport1 waittill("trigger", player);
	
			player SetPlayerAngles( origin1.angles );
	        player setOrigin( origin1.origin );
			player thread removeCountdown();
			player thread removeText();
			player notify("secret_leave");
}	
}