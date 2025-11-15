/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////																									              ///////
///////																									              ///////
///////		////////	     //		/////////////	//	 //  ////////////  ////////////  //////////   /////////////   ///////
///////		//		//    //   //   //         //	//  //   //	                //       //           //         //   ///////
///////		//		//    //   //   ////////////    // //    //	                //       //           ////////////    ///////
///////		//		//    ///////	//	  //	    ////     ////////////       //       //////////   //              ///////
///////		//		//	  //   //	//	   //	    // //              //       //       //           //              ///////
///////		//		//	  //   //	//		//      //  //             //       //       //           //              ///////
///////		////////	  //   //   //		 //     //   //  ////////////       //       //////////   //              ///////
///////																									              ///////
///////																									              ///////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Steam: Thor The Lini
//Discord: Tortellini#5729
//YouTube: DarkSTEP / Tortellini
//Website: darkstep.altervista.org
//PayPal: paypal.me/darktest (DM me on discord before donating)
//Every donator will get lifetime VIP access to all my updated maps!
//Feel free to copy without permission ;)

#include braxi\_common;
#include braxi\_rank;
#include common_scripts\utility;

main() {
maps\mp\_load::main();

precacheItem("fists_mp");
 
	game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
	setdvar("bg_falldamagemaxheight" , 99999);
	setdvar("bg_falldamageminheight" , 99998);
	visionSetNaked("mp_dr_rawstyle", 0);
	
	
	level.purplelight = LoadFx("deathrun/darkstep");
	level.particles = LoadFx("deathrun/purpleparticles");
	level.purpleburst = LoadFx("deathrun/purpleburst");
	level.projectile = LoadFx("deathrun/projectile");
	level.gas = LoadFx("deathrun/gas");
	
	level.firstenter = true;
	level.musicchanged = false;
	
	thread steps();
	thread spawning();
	thread startdoor();
	thread music1();
	thread music2();
	thread music3();
	thread music4();
	thread music5();
	thread door1();
	thread door2();
	thread purplelight();
	thread platform1();
	thread platform2();
	thread beat();
	thread movesign();
	thread arrows();
	thread rotator();
	thread gold();
	
	thread sniper();
	thread knife();
	thread deagle();
	thread bounceroom();
	thread btp();
	thread bouncesniper();
	
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
//	thread trap7();
	thread trap8();
	
	thread maketp("trig_atp1", "o_atp1");
	thread maketp("trig_atp2", "o_atp2");
	thread maketp("trig_atp3", "o_atp3");
	thread maketp("trig_atp4", "o_atp4");
	thread maketp("trig_atp5", "o_atp5");
	thread maketp("trig_atp6", "o_atp6");
	thread maketp("trig_ab", "o_ab");
	
	addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap8");
	
}

steps()
{
s = getentarray("trig_s","targetname");
for(i=0;i<s.size;i++)
{
	s[i] thread secretsetup(i);
	}
}

startmusic()
{
	trig = getEnt("trig_music1", "targetname");
	trig2 = getEnt("trig_music2", "targetname");
	trig3 = getEnt("trig_music3", "targetname");
	trig4 = getEnt("trig_music4", "targetname");
	trig5 = getEnt("trig_music5", "targetname");
	if(level.musicchanged == false)
	{
		x = randomInt(5) + 1;
		ambientStop(3);
		musicStop(3);
		ambientStop(0);
		musicStop(0);
		ambientPlay("song" + x);
		trig delete();
		trig2 delete();
		trig3 delete();
		trig4 delete();
		trig5 delete();
		level.musicchanged = true;
	}
}

endmusic()
{
	if(level.firstenter)
	{
		x = randomInt(4) + 1;
		ambientStop(3);
		musicStop(3);
		ambientStop(0);
		musicStop(0);
		ambientPlay("end" + x);
		level.firstenter = false;
	}
}

secretsetup(i)
{
s = getentarray("trig_s","targetname");
k = s.size;
for(;;)
{
	self waittill("trigger", player);
	if(!isdefined(player.fakesecret[i]))
	{
		player.fakesecret[i] = 1;
		if(!isdefined(player.secretnumber))
		{
			player.secretnumber = 0;
		}
		player.secretnumber += 1;
		if(player.secretnumber == s.size)
		{
			player iPrintLnBold("^6Congratulations, you won the FREE VIP!");
			wait 1;
			player iPrintLnBold("^5VIP Month Password: ^6MY5T");
			wait 1;
			player thread braxi\_rank::giveRankXP("", 500);
			player iPrintLnBold("^6Just kidding, don't expect much more than this...");
		}
		else
		{
			player iPrintLnBold("^5FREE VIP Steps^7:^1 " + player.secretnumber + "^7/^6" + k);
		}
	}	
}
}

addTriggerToList(name)
{
    if(!isdefined(level.trapTriggers))
      level.trapTriggers=[];

    level.trapTriggers[level.trapTriggers.size]=getent(name,"targetname");
}

maketp(trigname, oname, message, globalmessage, xp) 
{
	trig = getEnt(trigname, "targetname");
	o = getEnt(oname, "targetname");
    for(;;) 
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player playSoundToPlayer("tp", player);
		if (isDefined(message))
			player iPrintLnBold(message);
		if (isDefined(globalmessage))
			iPrintLnBold(globalmessage);
		if (isDefined(xp))
			player braxi\_rank::giveRankXP("", xp);	
    }
}

startdoor() {
	door = getEnt("startdoor", "targetname");
	level waittill("round_started");
		if(game["roundsplayed"] > 1) {
			thread games();
		}
		else {
			trig = getEnt("trig_freehint","targetname");
			trig setHintString("^1Room selection disabled on Free Run!");
		}
	thread credits();
	iPrintLn("^3Map originally made for ^5CM'^1 Deathrun");
	wait 12;
	thread startmusic();
	door moveZ(174, 2);
	wait 2;
}


credits()
{
	noti = SpawnStruct();
	noti.titleText = "^9Rawstyle";
	noti.notifyText = "^5Map made by ^2DarkSTEP";
	noti.duration = 6;
	noti.glowcolor = (1,0,1);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 10;
	noti.titleText = "^9Start opening...";
	noti.notifyText = "";
	noti.glowcolor = (.4,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}


spawning()
{
    for(;;)
    {
		level waittill( "player_spawn", player );
            //self detachAll();
			//player setModel("trump");
			player setClientDvar("r_specular", "0");
			player setClientDvar("r_filmTweakEnable", "1");
			player setClientDvar("r_filmUseTweaks", "1");
			player setClientDvar("r_filmTweakLightTint", "1.7 .2 1.7");
			player setClientDvar("r_filmTweakDarkTint", "1.7 .2 1.7");
			player setClientDvar("r_contrast", "1.1");
			player.hasWeapon = 0;
    }
}

music1()
{
	o = getEnt("o_music", "targetname");
	trig = getEnt("trig_music1", "targetname");
	trig2 = getEnt("trig_music2", "targetname");
	trig3 = getEnt("trig_music3", "targetname");
	trig4 = getEnt("trig_music4", "targetname");
	trig5 = getEnt("trig_music5", "targetname");
	trig setHintString("^6Foreseen - Hardstyle Intro");
	trig waittill("trigger", player);
	iPrintLn("^5Now Playing: ^6Foreseen - Hardstyle Intro");
	level.musicchanged = true;
	ambientStop();
	ambientPlay("song1");
	trig delete();
	trig2 delete();
	trig3 delete();
	trig4 delete();
	trig5 delete();
	wait .5;
	player setOrigin(o.origin);
	player setPlayerAngles(o.angles);
	
}

music2()
{
	o = getEnt("o_music", "targetname");
	trig = getEnt("trig_music1", "targetname");
	trig2 = getEnt("trig_music2", "targetname");
	trig3 = getEnt("trig_music3", "targetname");
	trig4 = getEnt("trig_music4", "targetname");
	trig5 = getEnt("trig_music5", "targetname");
	trig2 setHintString("^5ShowTek - Analogue Players");
	trig2 waittill("trigger", player);
	level.musicchanged = true;
	iPrintLn("^5Now Playing: ^6ShowTek - Analogue Players");
	ambientStop();
	ambientPlay("song2");
	trig delete();
	trig2 delete();
	trig3 delete();
	trig4 delete();
	trig5 delete();
	wait .5;
	player setOrigin(o.origin);
	player setPlayerAngles(o.angles);
	
}

music3()
{
	o = getEnt("o_music", "targetname");
	trig = getEnt("trig_music1", "targetname");
	trig2 = getEnt("trig_music2", "targetname");
	trig3 = getEnt("trig_music3", "targetname");
	trig4 = getEnt("trig_music4", "targetname");
	trig5 = getEnt("trig_music5", "targetname");
	trig3 setHintString("^9Ran-D - No Guts, No Glory");
	trig3 waittill("trigger", player);
	level.musicchanged = true;
	iPrintLn("^5Now Playing: ^6Ran-D - No Guts, No Glory");
	ambientStop();
	ambientPlay("song3");
	trig delete();
	trig2 delete();
	trig3 delete();
	trig4 delete();
	trig5 delete();
	wait .5;
	player setOrigin(o.origin);
	player setPlayerAngles(o.angles);
	
}

music4()
{
	o = getEnt("o_music", "targetname");
	trig = getEnt("trig_music1", "targetname");
	trig2 = getEnt("trig_music2", "targetname");
	trig3 = getEnt("trig_music3", "targetname");
	trig4 = getEnt("trig_music4", "targetname");
	trig5 = getEnt("trig_music5", "targetname");
	trig4 setHintString("^2Eiffel 65 - Move Your Body");
	trig4 waittill("trigger", player);
	level.musicchanged = true;
	iPrintLn("^5Now Playing: ^6Eiffel 65 - Move Your Body");
	ambientStop();
	ambientPlay("song4");
	trig delete();
	trig2 delete();
	trig3 delete();
	trig4 delete();
	trig5 delete();
	wait .5;
	player setOrigin(o.origin);
	player setPlayerAngles(o.angles);
	
}

music5()
{
	o = getEnt("o_music", "targetname");
	trig = getEnt("trig_music1", "targetname");
	trig2 = getEnt("trig_music2", "targetname");
	trig3 = getEnt("trig_music3", "targetname");
	trig4 = getEnt("trig_music4", "targetname");
	trig5 = getEnt("trig_music5", "targetname");
	trig5 setHintString("^3Headhunterz - End Of My Existence");
	trig5 waittill("trigger", player);
	level.musicchanged = true;
	iPrintLn("^5Now Playing: ^6Headhunterz - End Of My Existence");
	ambientStop();
	ambientPlay("song5");
	trig delete();
	trig2 delete();
	trig3 delete();
	trig4 delete();
	trig5 delete();
	wait .5;
	player setOrigin(o.origin);
	player setPlayerAngles(o.angles);
	
}

door1()
{
	trig = getEnt("trig_door1", "targetname");
	door1 = getEnt("door1", "targetname");
	trig waittill("trigger", player);
	trig delete();
	o = spawn( "script_origin", player.origin + (352,0,0), 1, 200 );
	o playSound("door");
	door1 moveX(-80,2);
	wait 2;
}

door2()
{
	trig = getEnt("trig_door2", "targetname");
	door2 = getEnt("door2", "targetname");
	trig waittill("trigger", player);
	trig delete();
	o = spawn( "script_origin", player.origin + (0,-350,0), 1, 200 );
	o playSound("door");
	door2 moveZ(154,1.5);
	wait 1.5;
}


purplelight()
{
	trig = getEnt("trig_purplelight", "targetname");
	o = getEntArray("o_purplelight", "targetname");
	o2 = getEntArray("o_partylights", "targetname");
	o3 = getEntArray("o_purpleburst", "targetname");
	trig waittill("trigger", player);
	for (i = 0; i < o.size; i++)
		{
			PlayFX(level.purplelight, o[i].origin);
		}
	for (i = 0; i < o2.size; i++)
		{
			PlayFX(level.particles, o2[i].origin);
		}
	for (i = 0; i < o3.size; i++)
		{
			PlayFX(level.purpleburst, o3[i].origin);
		}			
}

platform1()
{
	trig = getEnt("trig_platform1", "targetname");
	a = getEnt("platform1", "targetname");
  for (;;) 
  {	
	trig waittill("trigger", player);
	wait 1;
	a moveX(-1760, 4);
	a waittill("movedone");
	wait 4;
	a moveX(1760, 4);
	a waittill("movedone");
	wait 4;
  }
}

platform2()
{
	a = getEnt("platform2", "targetname");
	h = getEnt("platform2_hurt", "targetname");
	h enableLinkTo();
	for(;;)
	{
		h thread maps\mp\_utility::triggerOff();
		h linkTo(a);
		a moveZ(408, .3);
		a waittill("movedone");
		wait .7;
		h unlink();
		h thread maps\mp\_utility::triggerOn();
		h linkTo(a);
		a moveZ(-408, .3);
		a waittill("movedone");
		wait .7;
		h unlink();
	}
}

beat()
{
	beat1 = getEnt("beat1", "targetname");
	beat2 = getEnt("beat2", "targetname");
	thread beats(beat1);
	wait .48;
	thread beats(beat2);
}

beats(ent)
{
	for(;;)
	{
		ent moveX(-2554, .3);
		wait .48;
		ent moveX(2554, .3);
		wait .48;
	}
}

movesign()
{
	sign = getEnt("sign", "targetname");
	for(;;)
	{
		sign rotatePitch(720, 3);
		wait 3;
	}
}

arrows()
{
	arrows = getEnt("arrows", "targetname");
	arrows moveX(90, 1.5, .75, .75);
	wait 1.5;
	for(;;)
	{
		arrows moveX(-90, 1.5, .75, .75);
		wait 1.5;
		arrows moveX(90, 1.5, .75, .75);
		wait 1.5;
	}
}

rotator()
{
	r = getEntArray("rotator", "targetname");
	for(i = 0; i < r.size; i++)
	{
		r[i] thread modelRotator();
	}
}

modelRotator()
{
	while(isDefined(self))
	{
		x = randomFloatRange(1.8, 2.7);
		y = randomIntRange(240, 620);
		self rotateRoll(y, x);
		wait x;
		y = 0 - y;
		self rotateRoll(y, x);
		wait x;
	}
}

games() 
{
    level.games_trig = getEnt( "trig_endselector", "targetname");
    games = getEnt( "o_endselector", "targetname" );

    for(;;)
    {
        level.games_trig waittill( "trigger", player );
        if( !isDefined( level.games_trig ) )
        return;

        if(!isdefined(getactivator())){
            player iprintln("^1No Activator Detected");
            continue;
        }

        iPrintlnBold( " ^6" + player.name + " is picking a room" );
        acti = GetActivator();
        if(level.firstenter == true)
        {
            acti freezeControls(1);
            acti iPrintLnBold("^1Sorry man, antiglitch");
            level notify("acti_antiglitch");
        }
        player SetPlayerAngles( games.angles );
        player setOrigin( games.origin );
        player TakeAllWeapons();
        player antiglitcher();
    }
}

antiglitcher() 
{
	level.activator1 = GetActivator();
	level.activ = GetActivator();  
	self common_scripts\utility::waittill_any("death","disconnect");
	//self waittill("death");
	if(isDefined(self))
	{
		self notify("matchend");
	}
	else
	{
		level waittill("actiKill");
		//wait 3;
		self notify("matchend");
	}
	self freezeControls(0);
	level.activ notify("matchend");
	//level.activKills++;
	//thread killstreak();
	iPrintlnBold("^6"+self.name+" ^1died"); 
	wait 0.2; 
	iPrintlnBold("^6Room selection open!");
}

waitdead()
{
activator = GetActivator();
weapons = getent("trig_deagle","targetname");
bounce = getent("trig_bounce","targetname");
sniper = getent("trig_sniper","targetname");
knife = getent("trig_knife","targetname");
//gap = getent("trig_gap","targetname");
//simon = getent("trig_simon","targetname");
//pure = getent("trig_pure","targetname");
weapons thread maps\mp\_utility::triggerOff();
bounce thread maps\mp\_utility::triggerOff();
sniper thread maps\mp\_utility::triggerOff();
knife thread maps\mp\_utility::triggerOff();
//gap thread maps\mp\_utility::triggerOff();
//simon thread maps\mp\_utility::triggerOff();
//pure thread maps\mp\_utility::triggerOff();
self common_scripts\utility::waittill_any("death","disconnect");
activator freezeControls(false);
self freezeControls(false);
activator.health = activator.maxhealth;
weapons thread maps\mp\_utility::triggerOn();
bounce thread maps\mp\_utility::triggerOn();
sniper thread maps\mp\_utility::triggerOn();
knife thread maps\mp\_utility::triggerOn();
//gap thread maps\mp\_utility::triggerOn();
//simon thread maps\mp\_utility::triggerOn();
//pure thread maps\mp\_utility::triggerOn();
//level.actigap = false;
//level.jumpfinish = false;
//level.pureacti = 0;
//level.purejumper = 0;
//level.gapmode = 0;
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

createhud(messages)
{
hud_start = NewHudElem();
hud_start.alignX = "center";
hud_start.alignY = "middle";
hud_start.horzalign = "center";
hud_start.vertalign = "middle";
hud_start.alpha = 1;
hud_start.x = 0;
hud_start.y = -150;
hud_start.font = "objective";
hud_start.fontscale = 2;
hud_start.glowalpha = 1;
hud_start.glowcolor = (0,.2,.8);
hud_start setText(messages);
//hud_start setPulseFX( 100, 4000, 500 );
hud_start setPulseFX( 70, 4000, 500 );
wait 7;
if(isdefined(hud_start))
	hud_start destroy();
}

antiLeave(jumper,acti)  //this might be useful to you
{
	thread _antileave(jumper,acti);
	thread _antileave(acti,jumper);
}

_antileave(winner,faggot)
{
	self endon("matchend");
	gayname = faggot.name;
	faggot waittill("disconnect");
	thread supremeparser(gayname);
	wait 1.5;
	iPrintLnBold("^6"+gayname+" ^1left as looser, what a faggot!");
	wait 1;
	iPrintLnBold("^5Rebalancing things, please wait...");
	wait 1;
	if(winner.pers["team"] == "allies")
	{
		a = GetActivator();
		a finishPlayerDamage( winner, winner, 9999, 0, "MOD_PROJECTILE", "none", a.origin, a.origin, "none", 0 );
	}
	else {
		winner.pers["kills"]++;																																//WAY BETTER
	}
}

supremeparser(faggot)
{
	for(;;)
	{
	wait 5;
	player = thread funnyshit(faggot);
	if (isDefined(player))
	{
		wait 1;
		player setClientDvar( "g_speed", 10 );
		player shellshock( "jeepride_ridedeath", 60 );
		player setMoveSpeedScale(0.5);
		player iPrintLnBold( "^5Sorry but you're ^1not^5 allowed to play my maps" );
		wait 1.5;
		player iPrintLnBold( "^1For map unban... well... do nothing" );
		wait 1.5;
		iPrintln( "Player " + player.name + "^7 was kicked from the server because he's ^6gay!" );
		player thread braxi\_common::clientCmd( "disconnect; wait 10; connect "+ getDvar("net_ip") + ":" + getDvar("net_port") );
		wait 0.2;
	}		
	}
}

funnyshit( nickname ) 
{
	players = getallnabs();
	for ( i = 0; i < players.size; i++ )
		if ( isSubStr( toLower(removeAssFromString(players[i].name)), toLower(nickname) ) ) 
			return players[i];
}
removeAssFromString( string )
{
	output = "";

	for ( i = 0; i < string.size; i++ )
	{
		if ( string[i] == "^" )
		{
			if ( i < string.size - 1 )
			{
				if ( string[i + 1] == "0" || string[i + 1] == "1" || string[i + 1] == "2" || string[i + 1] == "3" || string[i + 1] == "4" ||
					 string[i + 1] == "5" || string[i + 1] == "6" || string[i + 1] == "7" || string[i + 1] == "8" || string[i + 1] == "9" )
				{
					i++;
					continue;
				}
			}
		}

		output += string[i];
	}

	return output;
}

getallnabs()
{
	return getEntArray( "player", "classname" );
}

sniper()
{
sniper = getent("trig_sniper","targetname");
jumper = getent("o_sniper1","targetname");
acti = getent("o_sniper2","targetname");
sniper setHintString("^5Sniper");
for(;;)
{
	sniper waittill("trigger", player);
	player thread waitdead();
	activator = GetActivator();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	player takeallweapons();
	activator takeallweapons();
	player giveweapon("m40a3_mp");
	activator giveweapon("m40a3_mp");
	player giveweapon("remington700_mp");
	activator giveweapon("remington700_mp");
	player show();
	activator show();
	thread createhud(player.name + " ^5selected ^1Sniper ^5room!");
	thread endmusic();
	wait 5;
	player iprintlnbold("^8FIGHT!");
	activator iprintlnbold("^9FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("m40a3_mp");
	activator switchtoweapon("m40a3_mp");
	player givemaxammo("m40a3_mp");
	activator givemaxammo("m40a3_mp");
	}
}

knife()
{
knife = getent("trig_knife","targetname");
jumper = getent("o_knife1","targetname");
acti = getent("o_knife2","targetname");
knife setHintString("^1Fists");
for(;;)
{
	knife waittill("trigger", player);
	//old delete();
	player thread waitdead();
	activator = GetActivator();
	player takeallweapons();
	activator takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator giveweapon("fists_mp");
	player giveweapon("fists_mp");
	player show();
	activator show();
	thread createhud(player.name + " ^5entered ^2Fists^5 room!");
	thread endmusic();
	wait 5;
	player freezeControls(false);
	activator freezeControls(false);
	player switchToWeapon("fists_mp");
	activator switchToWeapon("fists_mp");
	}
}

trap1()
{
	trigger = getent("trig_trap1","targetname");
	object = getEnt("trap1","targetname");
	killtrigger = getent ("trap1hurt", "targetname");
	killtrigger thread maps\mp\_utility::triggerOff();
	trigger setHintString("^5Press ^6F ^5to activate!");
	trigger waittill ("trigger" , player );
	killtrigger thread maps\mp\_utility::triggerOn();
	trigger delete();
	wait .5;
	killtrigger enableLinkTo();
	killtrigger linkTo(object);
	object moveZ(28, 1);
	wait 1;
	wait 2.5;
	object moveZ(-28, 1);
	wait 1;
	killtrigger thread maps\mp\_utility::triggerOff();
}

trap2()
{
	trig = getEnt("trig_trap2", "targetname");
	a = getEnt("trap2", "targetname");
	trig setHintString("^5Press ^6F ^5to activate!");
	trig waittill("trigger", player);
	trig delete();
	a moveZ(-824, 2);
	wait 4;
	a moveZ(824, 2);
	wait 2;
}

trap3()
{
	trig = getEnt("trig_trap3", "targetname");
	a = getEnt("trap3a", "targetname");
	b = getEnt("trap3b", "targetname");
	c = getEnt("trap3c", "targetname");
	trig setHintString("^5Press ^6F ^5to activate!");
	trig waittill("trigger", player);
	trig delete();
	for(;;)
	{
		a rotateYaw(720, 3);
		b rotateYaw(-720, 3);
		c rotateYaw(720, 3);
		wait 3;
	}
}

trap4()
{
	trig = getEnt("trig_trap4", "targetname");
	a = getEnt("trap4", "targetname");
	b = getEnt("trap4m", "targetname");
	c = getEnt("trap4m2", "targetname");
	trig setHintString("^5Press ^6F ^5to activate!");
	trig waittill("trigger", player);
	trig delete();
	b linkTo(a);
	c linkTo(a);
	for(;;)
	{
		a rotateYaw(1440, 6);
		wait 6;
		a rotateYaw(-1440, 6);
		wait 6;
	}
}

trap5()
{
	trig = getEnt("trig_trap5", "targetname");
	a = getEnt("trap5a", "targetname");
	b = getEnt("trap5b", "targetname");
	ah = getEnt("trap5ahurt", "targetname");
	bh = getEnt("trap5bhurt", "targetname");
	o = spawn( "script_origin", a.origin + (0,531,0), 1, 200 );
	ah thread maps\mp\_utility::triggerOff();
	bh thread maps\mp\_utility::triggerOff();
	ah enableLinkTo();
	bh enableLinkTo();
	trig setHintString("^5Press ^6F ^5to activate!");
	
	trig waittill("trigger", player);
	trig delete();
	for(;;)
	{
		ah thread maps\mp\_utility::triggerOn();
		bh thread maps\mp\_utility::triggerOn();
		ah linkTo(a);
		bh linkTo(b);									//apparently you can't disable linked trigs
		a moveY(531, .5);
		b moveY(-526, .5);
		wait .5;
		o playSound("sbam");
		earthquake( 1.4, 1, o.origin, 1000 );
		wait 1.5;
		a moveY(-531, .5);
		b moveY(526, .5);
		wait .5;
		ah thread maps\mp\_utility::triggerOff();
		bh thread maps\mp\_utility::triggerOff();
		ah unlink();
		bh unlink();
		ah thread maps\mp\_utility::triggerOff();
		bh thread maps\mp\_utility::triggerOff();		//not working smh idk fuck it i guess
		wait 2;
	}
}

trap6()
{
	trig = getEnt("trig_trap6", "targetname");
	a = getEnt("trap6hurt", "targetname");
	o = getEntArray("fx_projectile", "targetname");
	o2 = [];
	for(i = 0; i < o.size; i++)
	{
		o2[i] = spawn( "script_model", o[i].origin, 1, 200 );
		o2[i] setModel("tag_origin");
		o2[i] linkTo(o[i]);
		o[i] rotateYaw(90, .1);
		wait .1;
	}
	a thread maps\mp\_utility::triggerOff();
	trig setHintString("^5Press ^6F ^5to activate!");
	
	trig waittill("trigger", player);
	trig delete();
	for(i = 0; i < o2.size; i++)
	{
		o2[i] playSound("projectile");
	}
	wait .8;
	a thread maps\mp\_utility::triggerOn();
	for(t = 0; t < 50; t++)
	{
		for(i = 0; i < o.size; i++)
		{
			playFXOnTag(level.projectile, o2[i], "tag_origin");
		}
		wait .02;
	}
	a thread maps\mp\_utility::triggerOff();
}

trap7()
{
	trig = getEnt("trig_trap7", "targetname");
	a = getEnt("trap7a", "targetname");
	b = getEnt("trap7ma", "targetname");
	c = getEnt("trap7mb", "targetname");
	trig setHintString("^5Press ^6F ^5to activate!");				//fuck script models...
	
	trig waittill("trigger", player);
	trig delete();
	a delete();
	b delete();
	c delete();	
}

trap8()
{
	trig = getEnt("trig_trap8", "targetname");
	h = getEnt("trap8hurt", "targetname");
	o = getEnt("o_trap8", "targetname");
	doors = getEnt("door2", "targetname");
	h thread maps\mp\_utility::triggerOff();
	trig setHintString("^5Press ^6F ^5to activate!");
	trig waittill("trigger", player);
	trig delete();
	o playSound("door");
	doors moveZ(-149, 1);
	wait 1;
	playFX(level.gas, o.origin);
	o playSound("gas");
	wait 1.5;
	h thread maps\mp\_utility::triggerOn();
	wait 5.5;
	h thread maps\mp\_utility::triggerOff();
	o playSound("door");
	doors moveZ(149, 1);
	wait 1;
}

gold()
{
	trig = getEnt("trig_gold", "targetname");
	o = getEnt("o_gold", "targetname");
	trig waittill("trigger", player);
	trig delete();
	player freezeControls(1);
	iPrintLnBold( "^5"+player.name+ " ^6got some ^3gold!");
	o2 = spawn( "script_origin", player.origin , 1, 200 );
	o2 playSound("cash");
	player thread braxi\_rank::giveRankXP("", 500);
	wait 1.5;
	player setOrigin(o.origin);
	player setPlayerAngles(o.angles);
	player freezeControls(0);
}

deagle()
{
deagle = getent("trig_deagle","targetname");
jumper = getent("o_sniper1","targetname");
acti = getent("o_sniper2","targetname");
deagle setHintString("^3Deagle");
for(;;)
{
	deagle waittill("trigger", player);
	//old delete();
	player thread waitdead();
	activator = GetActivator();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	player takeallweapons();
	activator takeallweapons();
	player giveweapon("deserteagle_mp");
	activator giveweapon("deserteagle_mp");
	thread createhud(player.name + " ^5selected ^3Deagle ^5room!");
	thread endmusic();
	wait 5;
	player iprintlnbold("^8FIGHT!");
	activator iprintlnbold("^9FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("deserteagle_mp");
	activator switchtoweapon("deserteagle_mp");
	player givemaxammo("deserteagle_mp");
	activator givemaxammo("deserteagle_mp");
	}
}

bounceroom()
{
bounce = getent("trig_bounce","targetname");
jumper = getent("o_bounce1","targetname");
acti = getent("o_bounce2","targetname");
for(;;)
{
    bounce setHintString("^2Bounce");
	bounce waittill("trigger", player);
	//level notify("end");
	player thread waitdead();
	activator = GetActivator();
	
	player takeallweapons();
	activator takeallweapons();
	player.hasWeapon = 0;
	activator.hasWeapon = 0;
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	player.hasGun = 0;
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator.hasGun = 0;
	activator giveweapon("knife_mp");
	player giveweapon("knife_mp");
	thread createhud(player.name + " ^5entered ^3Bounce^5 room!");
	thread endmusic();	
	wait 5;
	player iprintlnbold("^5FIGHT!");
	activator iprintlnbold("^5FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("knife_mp");
	activator switchtoweapon("knife_mp");
	}
}

btp()
{
		trig = getEnt("trig_btp", "targetname");
		jumper = getEnt("o_bounce1","targetname");
		acti = getEnt("o_bounce2","targetname");
		for(;;)
		{
			trig waittill("trigger", player);
			if(player.pers["team"] == "axis")
			{
				player setOrigin(acti.origin);
				player setPlayerAngles(acti.angles);
			}
			else
			{
				player setOrigin(jumper.origin);
				player setPlayerAngles(jumper.angles);
			}
		}
}

bouncesniper()
{
givesnip = getEnt("trig_bouncesniper","targetname");
givesnip setHintString("^5Press ^6F ^5to get a Sniper!");
	for (;;)
	{
		givesnip waittill("trigger", player);
		if (player.hasWeapon == 0)
		{
		player takeallweapons();
		player giveweapon("m40a3_mp");
		player giveweapon("remington700_mp");
		player switchtoweapon("remington700_mp");
		player givemaxammo("m40a3_mp");
		player givemaxammo("remington700_mp");
		player.hasWeapon = 1;
		}
		else player iPrintLnBold("^1You already got a Sniper!");
	}
}
