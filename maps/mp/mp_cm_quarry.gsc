
//	/$$$$$$$$ /$$$$$$$  /$$$$$$ /$$   /$$
//	| $$_____/| $$__  $$|_  $$_/| $$  /$$/
//	| $$      | $$  \ $$  | $$  | $$ /$$/ 
//	| $$$$$   | $$$$$$$/  | $$  | $$$$$/  
//	| $$__/   | $$__  $$  | $$  | $$  $$  
//	| $$      | $$  \ $$  | $$  | $$\  $$ 
//	| $$$$$$$$| $$  | $$ /$$$$$$| $$ \  $$
//	|________/|__/  |__/|______/|__/  \__/

//	addMenuOption("^1Give Life",Braxi\_mod::GiveLife);
//	addMenuOption("^1Respawn",braxi\_mod::respawn);
//	addMenuOption("^1Splat !!",Braxi\_mod::gib_splat);
//iw3mp.exe +set fs_game "mods/" +set gametype "deathrun"
//mp_cm_quarry
main() {
	maps\mp\_load::main();
	//maps\mp\_mapper_only::main();
	
	SetExpFog(1500, 3000, 0.2, 0.2, 0.2, 0);  
	//set scr_enable_nightvision 0
	
	game["allies"] = "sas"; 
	game["axis"] = "opfor"; 
	game["attackers"] = "axis"; 
	game["defenders"] = "allies"; 
	game["allies_soldiertype"] = "woodland"; 
	game["axis_soldiertype"] = "woodland"; 


	setdvar( "r_specularcolorscale", "1" ); 
	//setdvar("r_glowbloomintensity0",".25"); 
	//setdvar("r_glowbloomintensity1",".25"); 
	setdvar("r_glowskybleedintensity0",".3"); 
	setdvar("compassmaxrange","1800"); 
	setdvar("dr_bunnyhoop_pro","1");	
	
	AmbientPlay( "ambient_citystreets_night" );
	
	//////loadFX//////
	level.explosion		= loadFX("explosions/vehicle_explosion_bm21");
	
	//////PreCacheMenu//////
	//precacheMenu("double_jump");
	
	//////PreCacheShader//////
	//PreCacheShader("menu_texture");


	//////precacheShellShock//////
	//precacheShellShock( "teleport");
	
	//////PreCacheModel//////
	//PreCacheModel("com_laptop_generic_open_obj");
	//Weapons
	PreCacheModel("Agnija_Radoncic");
	//Character
	precacheModel("body_mp_opforce_eningeer");
	precacheModel("head_mp_opforce_gasmask");
	precacheModel("body_mp_usmc_woodland_support");
	precacheModel("head_mp_usmc_nomex");
	
	//////PreCacheItem//////
	//PrecacheItem("machete_mp");	
	//PrecacheItem("erik_mp");
	PrecacheItem("ak47_mp");   
	PreCacheItem("winchester1200_mp");	
	PrecacheItem("remington700_mp");   
	PreCacheItem("m40a3_mp");	
	PrecacheItem("knife_mp");  
	
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
	thread start();
	thread c4_door1();
	thread c4_door2();
	thread move();
	thread round();
	thread final();
	thread roomer();

	
	addTriggerToList( "trap1_trigger" );
	addTriggerToList( "trap2_trigger" );
	addTriggerToList( "trap3_trigger" );
	addTriggerToList( "trap4_trigger" );
	addTriggerToList( "trap5_trigger" );
	addTriggerToList( "trap6_trigger" );
	addTriggerToList( "trap7_trigger" );
	addTriggerToList( "trap8_trigger" );
	addTriggerToList( "trap9_trigger" );
	addTriggerToList( "trap10_trigger" );
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
} 

trap_execute()
{ 
    //orgy = getent(self.target, "targetname");
	wait 0.5;
	self SetHintString("^7Press ^3[&&1] ^7To Activate");
	self SetCursorHint( "HINT_ACTIVATE" );
	self waittill("trigger",player);
	self SetCursorHint( "" );
	self playsound("laugh");
	self SetHintString("^9Activated");
	wait 0.5;
}

trap1()
{
brush = getEnt("trap1_brush","targetname");
trigger = getEnt("trap1_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
for(;;)
{
brush rotatePitch(360,5);
wait 5;
}
}

trap2()
{
brush = getEnt("trap2_brush","targetname");
trigger = getEnt("trap2_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
for(;;)
{
brush rotateRoll(1440,18,2,2);
wait 20;
}
}

trap3()
{
brush1 = getEnt("trap3_brush1","targetname");
brush2 = getEnt("trap3_brush2","targetname");
trigger = getEnt("trap3_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
for(;;)
{
brush1 moveY(45,2.5,1,1);
wait 1;
brush2 moveX(-45,2.5,1,1);
wait 4;
brush1 moveY(-45,2.5,1,1);
brush2 moveX(45,2.5,1,1);
wait 3;
}
}

trap4()
{
brush = getEnt("trap4_brush","targetname");
trigger = getEnt("trap4_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
brush moveZ(-320,5,2,2);
wait 8;
brush moveZ(320,6,2,2);
}

trap5()
{
level endon("trap5");
in = getEnt("trap5_in","targetname");
out = getEnt("trap5_out","targetname");
trigger = getEnt("trap5_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
if(isdefined(player) && player.pers["team"] == "axis")	
{
	level.activ.health = 9999999;
	player SetPlayerAngles( in.angles );
	player setOrigin( in.origin );
	player iprintlnbold("^915 Seconds left to Kill");
	thread trap5_sub();
	wait 15;
	player SetPlayerAngles( out.angles );
	player setOrigin( out.origin );
	level.activ.health = 100;
	level notify("trap5");
}
}

trap5_sub()
{
level endon("trap5");
out = getEnt("trap5_out","targetname");
trigger = getEnt("trap5_sub_trigger","targetname");
for(;;)
{
trigger waittill("trigger",player);
if(isdefined(player) && player.pers["team"] == "axis")	
{
level.activ.health = 100;
player iprintlnbold("^9Kill Zone Left");
player SetPlayerAngles( out.angles );
player setOrigin( out.origin );
level notify("trap5");
}
wait 0.05;
}
}
trap6()
{
brush = getEnt("trap6_brush","targetname");
trigger = getEnt("trap6_trigger","targetname");
hurt = getEnt("trap6_hurt","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
hurt linkto(brush);
brush rotatePitch(180,3,1,1);
wait 5;
brush rotatePitch(-180,6,2,2);
}

trap7()
{
brush1 = getEnt("trap7_brush1","targetname");
brush2 = getEnt("trap7_brush2","targetname");
brush3 = getEnt("trap7_brush3","targetname");
trigger = getEnt("trap7_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
brush1 thread trap7_sub();
wait 1;
brush2 thread trap7_sub();
wait 1;
brush3 thread trap7_sub();
wait 1;
}

trap7_sub()
{
for(;;)
{
self moveZ(-100,2.5,1,1);
wait 3;
self moveZ(100,2.5,1,1);	
wait 2.5;
}
}

trap8()
{
brush1 = getEnt("trap8_brush1","targetname");
brush2 = getEnt("trap8_brush2","targetname");
brush3 = getEnt("trap8_brush3","targetname");
trigger = getEnt("trap8_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
brush1 thread trap8_sub();
wait 1;
brush2 thread trap8_sub();
wait 1;
brush3 thread trap8_sub();
wait 1;
}

trap8_sub()
{
for(;;)
{
self rotateyaw(360,5);
wait 5;
}
}

trap9()
{
brush1 = getEnt("trap9_brush1","targetname");
brush2 = getEnt("trap9_brush2","targetname");
trigger = getEnt("trap9_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
brush1 thread trap9_sub();
wait 2;
brush2 thread trap9_sub();
wait 1;
}

trap9_sub()
{
for(;;)
{
self moveZ(88,1.5,0.7,0.7);
wait 1.5;
self moveZ(-88,1.5,0.7,0.7);
wait 1.5;
}
}

trap10()
{
model = getEnt("trap10_model","targetname");
kill = getEnt("trap10_kill","targetname");
org = getEnt("trap10_org","targetname");
trigger = getEnt("trap10_trigger","targetname");
trigger thread trap_execute();
trigger waittill("trigger",player);
		kill thread killplayer();
		PlayFX(level.explosion,org.origin);
		org playsound("grenade_explode_layer");
		wait 0.45;
		kill delete();
		level notify("trap10");
}

killplayer()
{
level endon("trap10");
	while(isdefined(self))
	{
		self waittill("trigger",player);
		player suicide();
		wait 0.05;
	}
}


c4_door1()
{
	c4 = getent( "super_door_model", "targetname" );
	door = getent( "super_door_brush", "targetname" );
	fx = getent( "super_door_fx", "targetname" );
	trig = getent("super_door_trigger", "targetname");
{
	trig waittill ("trigger", player);
	
	trig delete();
	c4 setmodel( "weapon_c4_mp" );       // swap xmodel by _off
	wait 1;
	door delete();
	Earthquake( 5, 1, fx.origin, 500 );
	playFx(level.explosion, fx.origin);
	fx playsound("explo");
	c4 delete();
}
}

c4_door2()
{
	c4 = getent( "mega_door_model", "targetname" );
	door = getent( "mega_door_brush", "targetname" );
	fx = getent( "mega_door_fx", "targetname" );
	trig = getent("mega_door_trigger", "targetname");
{
	trig waittill ("trigger", player);
	
	trig delete();
	c4 setmodel( "weapon_c4_mp" );       // swap xmodel by _off
	wait 1;
	door delete();
	Earthquake( 5, 1, fx.origin, 500 );
	playFx(level.explosion, fx.origin);
	fx playsound("explo");
	c4 delete();
}
}



start()
{
	level waittill("round_started");
	
	noti = SpawnStruct();
	noti.titleText = "^9Map Made By ^2E^3R^5I^6K^9!";
	noti.notifyText = "^9And ^8S^5T^2E^1N^9D^3B^7Y";
	noti.duration = 6;
	noti.glowcolor = (1,0,1);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	AmbientPlay( "main_music" );
	thread tdm();
	thread start_door();
	wait 0.5;
}



start_door()
{
brush = getEnt("start_door","targetname");

wait 1;
brush moveZ(-136,3,2);
wait 0.05;
}

move()
{
brush = getEnt("move_brush","targetname");
trigger = getEnt("move_trig","targetname");
for(;;)
{
trigger waittill("trigger",player);
player setmodel("Agnija_Radoncic");
brush moveX(650,7,2,2);
wait 9;
brush moveX(-650,5,2,2);
wait 7;
}
}

round()
{
brush = getEnt("round","targetname");
for(;;)
{
brush rotateyaw(-360,7);
wait 7;
}
wait 0.5;
}	

final()
{
trigger = getEnt("old_trigger","targetname");
del = getEnt("room_trigger","targetname");
brush1 = getEnt("end_door_brush1","targetname");
brush2 = getEnt("end_door_brush2","targetname");

trigger SetHintString("^7Old Room");
trigger SetCursorHint( "HINT_ACTIVATE" );

trigger waittill("trigger",player);
trigger delete();
del delete();
wait 1;
brush1 rotateyaw(-90,2,1,1);
brush2 rotateyaw(90,2,1,1);
wait 1;
}

roomer()
{
trigger = getEnt("room_trigger","targetname");
del = getEnt("old_trigger","targetname");
brush1 = getEnt("end_door_brush3","targetname");
brush2 = getEnt("end_door_brush4","targetname");

trigger SetHintString("^7Room Selection");
trigger SetCursorHint( "HINT_ACTIVATE" );

trigger waittill("trigger",player);
trigger delete();
del delete();
wait 1;
brush1 rotateyaw(90,2,1,1);
brush2 rotateyaw(-90,2,1,1);
wait 1;

thread sniper_r();
thread shotgun_r();
thread knife_r();
}

knife_r()
{
	while(1)
	{
		level.trigknife = getEnt("knife_trigger","targetname");
		acti = getEnt("knife_acti","targetname");
		jump = getEnt("knife_jumper","targetname");
		
		level.trigknife setHintString("^3Knife Room");
		
		level.trigknife waittill("trigger", player);
		
		AmbientStop();
		AmbientPlay( "deathbell" );
		
		noti = SpawnStruct();
		noti.titleText = "^3Knife Room";
		noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
		noti.duration = 5;
		players = getEntArray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		
		player setOrigin (jump.origin);
		player setPlayerAngles (jump.angles);

		level.activ setOrigin (acti.origin);
		level.activ setPlayerAngles (acti.angles);
	
		player takeAllWeapons();
		level.activ takeAllWeapons();
		
		player freezeControls(1);
		level.activ freezeControls(1);
		
		//player.maxhealth = 100;
		player.health = player.maxhealth;
		level.activ.maxhealth = 100;
		level.activ.health = level.activ.maxhealth;  
		
		player takeAllWeapons();
		player giveWeapon("knife_mp");
		player switchToWeapon("knife_mp");
		
		level.activ takeAllWeapons();
		level.activ giveWeapon("knife_mp");
		level.activ switchToWeapon("knife_mp");

		wait 3;
		player iPrintLnBold("^7Fight!");
		level.activ iPrintLnBold("^7Fight!");
		
		player freezeControls(0);
		level.activ freezeControls(0);
	
		while( isDefined( player ) && isAlive( player ) && player.sessionstate == "playing" )
		wait 0.5;
		
		wait 1;
		iPrintLn("^3[Room Selection Open]");
		player = undefined;
	}
}

sniper_r()
{
	while(1)
	{
		level.trigsniper = getEnt("sniper_trigger","targetname");
		acti = getEnt("sniper_acti","targetname");
		jump = getEnt("sniper_jumper","targetname");
		
		level.trigsniper setHintString("^3Sniper Room");
		
		level.trigsniper waittill("trigger", player);
		
		AmbientStop();
		AmbientPlay( "deathbell" );
		
		noti = SpawnStruct();
		noti.titleText = "^3Sniper Room";
		noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
		noti.duration = 5;
		players = getEntArray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		
		player setOrigin (jump.origin);
		player setPlayerAngles (jump.angles);

		level.activ setOrigin (acti.origin);
		level.activ setPlayerAngles (acti.angles);
	
		player takeAllWeapons();
		level.activ takeAllWeapons();
		
		player freezeControls(1);
		level.activ freezeControls(1);
		
		//player.maxhealth = 100;
		player.health = player.maxhealth;
		level.activ.maxhealth = 100;
		level.activ.health = level.activ.maxhealth;  
		
		player takeAllWeapons();
		player giveWeapon("remington700_mp");
		player giveMaxAmmo("remington700_mp");
		player giveWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		
		level.activ takeAllWeapons();
		level.activ giveWeapon("remington700_mp");
		level.activ giveMaxAmmo("remington700_mp");
		level.activ giveWeapon("m40a3_mp");
		level.activ giveMaxAmmo("m40a3_mp");
		level.activ switchToWeapon("m40a3_mp");

		wait 3;
		player iPrintLnBold("^7Fight!");
		level.activ iPrintLnBold("^7Fight!");
		
		player freezeControls(0);
		level.activ freezeControls(0);
	
		while( isDefined( player ) && isAlive( player ) && player.sessionstate == "playing" )
		wait 0.5;
		
		wait 1;
		iPrintLn("^3[Room Selection Open]");
		player = undefined;
	}
}


shotgun_r()
{
	while(1)
	{
		level.trigshotgun = getEnt("shotgun_trigger","targetname");
		acti = getEnt("sniper_acti","targetname");
		jump = getEnt("sniper_jumper","targetname");
		
		level.trigshotgun setHintString("^3Shotgun Room");
		
		level.trigshotgun waittill("trigger", player);
		
		AmbientStop();
		AmbientPlay( "deathbell" );
		
		noti = SpawnStruct();
		noti.titleText = "^3Shotgun Room";
		noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
		noti.duration = 5;
		players = getEntArray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		
		player setOrigin (jump.origin);
		player setPlayerAngles (jump.angles);

		level.activ setOrigin (acti.origin);
		level.activ setPlayerAngles (acti.angles);
	
		player takeAllWeapons();
		level.activ takeAllWeapons();
		
		player freezeControls(1);
		level.activ freezeControls(1);
		
		//player.maxhealth = 100;
		player.health = player.maxhealth;
		level.activ.maxhealth = 100;
		level.activ.health = level.activ.maxhealth;  
		
		player takeAllWeapons();
		player giveWeapon("winchester1200_mp");
		player giveMaxAmmo("winchester1200_mp");
		player switchToWeapon("winchester1200_mp");
		
		level.activ takeAllWeapons();
		level.activ giveWeapon("winchester1200_mp");
		level.activ giveMaxAmmo("winchester1200_mp");
		level.activ switchToWeapon("winchester1200_mp");

		wait 3;
		player iPrintLnBold("^7Fight!");
		level.activ iPrintLnBold("^7Fight!");
		
		player freezeControls(0);
		level.activ freezeControls(0);
	
		while( isDefined( player ) && isAlive( player ) && player.sessionstate == "playing" )
		wait 0.5;
		
		wait 1;
		iPrintLn("^3[Room Selection Open]");
		player = undefined;
	}
}


tdm_delete()
{
	trig = getEnt("tdm_trigger","targetname");
	wait 8;
	trig delete();
	wait 1;
}

tdm()
{
	killt = getEnt("kill_brusherino","targetname");
	trig = getEnt("tdm_trigger","targetname");
	players_required = 6;
	players = getentarray("player", "classname");

    //iprintlnbold(players.size);
	wait 1;
	trig SetHintString("^7Team Death Match ");
	trig SetCursorHint( "HINT_ACTIVATE" );
	thread tdm_delete();
	trig waittill("trigger",player);

	if(players_required<=players.size)
	{
	killt delete();
	thread tdm_sub();
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "^9Team Death Match";
	noti.notifyText = "";
	noti.duration = 6;
	noti.glowcolor = (1,1,1);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 5;	
	
	AmbientPlay( "tdm_music" );
	}
	else
	{
	player iprintlnbold("Not Enough Players");
	}
}

tdm_sub()
{
    players = getentarray("player", "classname");  
    activators = 0;
    half = players.size / 2;
 
    for(i = 0; i < players.size; i++)
    {
        if(activators < half)
        {
            players[i] thread spawn_acti();
            activators++;
        }
        else
            players[i] thread spawn_player();
    }
}

tdm_effect()
{
	self.tdm_tune = RandomIntRange( 1, 3 );
	self.tdm_axis = RandomIntRange( 1, 2 );
	self.tdm_allies = RandomIntRange( 1, 2 );
	wait 0.25;
	self PlaySoundToPlayer("whoosh", self );
	wait 2;
	self PlaySoundToPlayer("tdm_tune0"+self.tdm_tune,self);
	wait 0.2;	
if(isdefined(self) && self.pers["team"] == "axis")		
{
	self PlaySoundToPlayer("tdm_axis0"+self.tdm_axis,self);
	self detachAll();
	self setModel("body_mp_opforce_eningeer");
	self attach("head_mp_opforce_gasmask");
}
else if(isdefined(self) && self.pers["team"] == "allies")	
{
	self PlaySoundToPlayer("tdm_allies0"+self.tdm_allies,self);	
	self detachAll();
	self setModel("body_mp_usmc_woodland_support");
	self attach("head_mp_usmc_nomex");
}
	
	wait 1;
	self takeAllWeapons();
	wait 0.05;
	self giveWeapon("ak47_mp");
	self giveMaxAmmo("ak47_mp");
	wait 0.05;
	self switchToWeapon("ak47_mp");
	wait 0.05;
}

spawn_acti()
{
    target = getEntarray("acti_spawn","targetname");
	
    randomLocation = randomIntRange(0, target.size);

	self setTeam( "axis" );
	self thread tdm_effect();	
	self freezeControls(1);		
	wait 0.5;
	self freezeControls(1);	
	//self SetPlayerAngles( randomLocation.angles );
	self setOrigin( target[randomLocation].origin );
	wait 4;
	self freezeControls(0);			
	
	self PlaySoundToPlayer( "frag_out", self );
}

spawn_player()
{
    target = getEntarray("jumper_spawn","targetname");
	
    randomLocation = randomIntRange(0, target.size);
	
	self setTeam( "allies" );
	self thread tdm_effect();
	self freezeControls(1);		
	wait 0.5;
	self freezeControls(1);			
	//self SetPlayerAngles( randomLocation.angles );
	self setOrigin( target[randomLocation].origin );
	wait 4;
	self freezeControls(0);		
	
	self PlaySoundToPlayer( "frag_out", self );
}

setTeam( team ) 
{

	self.pers[ "team" ] = team;
	self.team = team;
	self.sessionteam = team;

	//self setClientDvars( "g_scriptMainMenu", game[ "menu_ingame_main" ] );
}

onroundstarts()
{
	level waittill("round_started");
	players = getentarray("player","classname");
	for(i=0;i<=players.size;i++)
	{
		players[i].counter = 0; //for secret save/load systeam
		players[i].cheaker = 0; //cheaking if someone uses cuts
		players[i].insecret = false;
	}
}
