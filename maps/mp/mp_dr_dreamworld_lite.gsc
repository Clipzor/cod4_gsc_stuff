//////////////////////////Map By///////////////////////////
//
//  _   _            _           
// | \ | |          | |          
// |  \| | ___ _ __ | |__  _   _ 
// | . ` |/ _ \ '_ \| '_ \| | | |
// | |\  |  __/ |_) | | | | |_| |
// | | \_|\___| .__/|_| |_|\__, |
//            | |           __/ |
//            |_|          |___/ 
//
// Map & Script by Nephy
// 
// Thx Frazzle & Blade for helping me
//

main()
{
	maps\mp\_load::main(); 
 
	game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
	setdvar("g_speed",210);
	setdvar("bg_falldamagemaxheight" , 99999);
	setdvar("bg_falldamageminheight" , 99998);
	setdvar("dr_jumpers_speed" ,"1.1");
	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	//Music info (name, duration)
	self.songs = [];
	self.songs[0] = [];
	self.songs[0][0] = "S3RL - MTC (Different Heaven Remix)";
	self.songs[0][1] = 181;
	self.songs[1] = [];
	self.songs[1][0] = "Among Us - Theme song (EDM REMIX)";
	self.songs[1][1] = 130;
	self.songs[2] = [];
	self.songs[2][0] = "Lukas G - Better Off Without Me";
	self.songs[2][1] = 163;
	self.songs[3] = [];
	self.songs[3][0] = "Scott Rill - I Don't Know Why";
	self.songs[3][1] = 178;
	self.songs[4] = [];
	self.songs[4][0] = "KEAN DYSSO - Plain Jane";
	self.songs[4][1] = 187;
	self.songs[5] = [];
	self.songs[5][0] = "Demando - Crystal Ice";
	self.songs[5][1] = 145;
	
	
	

	
	// PRECACHE
    precacheItem("colt45_mp");
	precacheItem("barrett_mp");
	precacheItem("m40a3_mp");
	precacheItem("deserteagle_mp");
	preCacheMenu("frzl_music");
	preCacheMenu("frzl_music_main"); //Custom music menu

    // RANDOM
	thread messages();

	thread musicbox();
	// TRAPS
	thread trap_1();
	thread trap_2();
	thread trap_3();
    thread trap_4();
    thread trap_5();
    thread trap_6();
	thread trap_7();
    thread trap_8();
	thread trap_9();
	thread trap_10();
  

  // ENDROOMS
	thread endrooms();
	thread sniperroom();
	thread bounceroom();
	thread kniferoom();
    thread oldroom();
	thread bounce_fail_acti();
	thread bounce_fail_jumper(); 
    thread givesniper();
    thread sniper_fail();
	//SECRET

	//easy
	thread easy();
	thread easysecret_end();
	//hard
	thread hard();
	thread hardsecret_end();
	thread hardsecret_switch();
 
}

addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers)) level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt(name,"targetname");
}

TriggerList()
{
	for(i=1;i<14;i++) addTriggerToList("trap_" + i + "_use");
}


messages()
{
	level waittill("round_started");

	wait 2;
	iprintlnBold("Welcome to DreamWorld Lite ^7:3\n^7Made by: ^6N^7ephy");
	wait 2;

	thread startdoor();
}

startdoor()
{
	door = getent("startdoor","targetname");

	if(isdefined(level.auto_open_door) && level.auto_open_door) {
		door delete();
	} else {
		wait 5;
		door movez(-400,5);
		wait 5;
		door delete();

		iprintlnbold("Start Door Opened !");
	}
}

musicbox()
{
	music = getent("musicbox","targetname");	

	music sethintstring("Press ^1[USE]^7 to select music");
	music waittill("trigger", player);		
	music delete();

	player openMenu("frzl_music_main");
	player waittill("menuresponse", menu, response);
	
	while (true)
	{
		songData = self.songs[int(response) - 1];
		ambientPlay("frzl_music_" + response);
		iPrintLn("^1>> ^7Now Playing: " + songData[0]);
		wait(songData[1]);
		response = randomIntRange(1, self.songs.size + 1);
	}
}




// TRAPS

trap_1()
{
	trap1 = getEnt("trap_1", "targetname");
	trig1 = getEnt("trap_1_use", "targetname");
	trap1_1 = getEnt("dmg1", "targetname");
	trig1 setHintString("^2> ^7Press ^1[USE] ^7to activate the rotator ! ^2<");
	trig1 waittill ("trigger"); 
	trig1 setHintString("^2> ^7Trap already ^1USED^2 <");
	
	{
		wait 0.1;
		trap1 rotatePitch(180, 1.3);
	}
}

trap_2()
{
    trap2 = getent("trap_2","targetname");
	trig = getent("trap_2_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to delete the slope ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	trap2 delete();


}

trap_3()
{
    trap3 = getent("trap_3","targetname");
	trig = getent("trap_3_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to activate the rotators ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	{
        wait 0.1;
	    trap3 notSolid();
		trap3 hide();
	}
}

trap_4()
{
    trap4 = getent("trap_4_1","targetname");
	trig = getent("trap_4_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to raise the spikes ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	trap4_dmg1 = getent ("trap_4_dmg1", "targetname");
	trap4_dmg1 enableLinkTo();
	trap4_dmg1 linkTo(trap4);
	while(1){
		wait 5;
		trap4 movez (-205, 1.3);
		trap4 waittill ("movedone");
		trap4 movez (205, 1.3);	
		trap4 waittill ("movedone");	
	}
}

trap_5_1()
{
	trap5_1 = getent("trap_5_1","targetname");
	trap5_3 = getent("trap_5_3","targetname");
	trap5_2 = getent("trap_5_2","targetname");
	trap5_4 = getent("trap_5_4","targetname");
	trig = getent ("trap_5_1_use","targetname");
	trig2 = getent ("trap_5_2_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to delete the white bounce ^2<");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	trap5_2 delete();
	trap5_4 delete();
}

trap_5_2()
{
	trap5_2 = getent("trap_5_2","targetname");
	trap5_4 = getent("trap_5_4","targetname");
	trig = getent ("trap_5_1_use","targetname");
	trig2 = getent ("trap_5_2_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to delete the black bounce ^2<");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	trap5_2 delete();
	trap5_4 delete();
}



	
trap_6()
{
	trap6 = getent("trap_6","targetname");
	trap6_1 = getent("trap_6_dmg","targetname");
	trig = getent ("trap_6_use","targetname");
	{
		trig setHintString("^2> ^7Press ^1[USE] ^7to crush them all ^2<");
		trig waittill ("trigger"); 
		trig setHintString("^2> ^7Trap already ^1USED^2 <");
		trap6_1 enableLinkTo();
		trap6_1 linkTo(trap6);
		wait 0.1;
		trap6 movez(-256, 1, .5, .5);
	}
}
	

trap_7()
{
	trap7 = getent("trap_7","targetname");
	trig = getent ("trap_7_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to activate the rotators ^2<");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	
	while(1){
		wait 0.1;
		trap7 rotateYaw (360, 3.5);
	
    }
}	

trap_8()
{
	trap8_1 = getent("trap_8_1","targetname");
	trap8_2 = getent("trap_8_2","targetname");
	trig = getent ("trap_8_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to make the rocks move ^2<");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	
	while(1){
		trap8_1 movex (448, 1.3);
		trap8_2 movex (-448, 1.3);
		trap8_1 waittill ("movedone");
		trap8_1 movex (-448, 1.3);
		trap8_2 movex (448, 1.3);	
		trap8_1 waittill ("movedone");	
    }
}	

trap_9()
{
	trap9_1 = getent("trap_9_1","targetname");
	trap9_2 = getent("trap_9_2","targetname");
	trap9_3 = getent("trap_9_3","targetname");
	trap9_4 = getent("trap_9_4","targetname");
	trig = getent ("trap_9_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to activate the swiper ^2<");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	
	for(;;){
		wait 0.1;
		trap9_1 rotatePitch(180, 1.3);
		trap9_2 rotatePitch(-180, 1.3);
		trap9_3 rotatePitch(180, 1.3);
		trap9_4 rotatePitch(-180, 1.3);
		wait 0.5;
	}
}	

trap_10()
{
	trap10 = getent("trap_10","targetname");
	trig = getent("trap_10_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to make the bounce disappear ^2<");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	{
        wait 0.1;
	    trap10 notSolid();
		trap10 hide();
	}
}
	

RoomDeath() 
{ 
	self common_scripts\utility::waittill_any("death","disconnect");
	iPrintLnBold("^2"+self.name+" ^7is dead ^2!"); 
	iPrintLnBold("^2Selection Room ^7is now ^7open^2!!!"); 
}

endrooms() 
{
	end_game_selection = getent("trig_end","targetname");
	end_game_target = getent("origin_end","targetname");

	while(1)
	{
		end_game_selection waittill("trigger",who);
		if(!isdefined(end_game_selection))
			return;

        if (isDefined(who.ghost) && who.ghost) {
            who suicide();
            continue;
        } //kill players in ghost mode

        if (who.pers["team"] == "axis") //only accept jumpers
            continue;

        if (isDefined(level.disableRoomPlugin) && !level.disableRoomPlugin) { //check if respect plugin is enabled
            if (!respectPluginCheck(who))
                continue;
        }
		
		if(!isdefined(level.xm_spaceship_first))
		{
			level.xm_spaceship_first = true;
			iprintlnbold("^2"+who.name+"^7 has entered the ^2Game Selection^7!");
		}
		else 
			iprintlnbold("^2"+who.name+"^7 has entered the ^2Game Selection^7!");

		who setorigin(end_game_target.origin);
		who setplayerangles(end_game_target.angles);
		who takeallweapons();

		who RoomDeath();
		while(isAlive(who) && isDefined(who))
            wait 1;

	}
}

oldroom()
{
	trig = getent("trig_old","targetname");
	snip = getent("trig_sniper","targetname");
	knife = getent("trig_knife","targetname");
	bounce = getent("trig_bounce","targetname");
	jump = getent("origin_end","targetname");
	door = getent("old_door","targetname");
	trig setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Old ^7Room!");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	{
		wait 0.1;
	    player giveweapon("deserteagle_mp");
		
		if(isdefined(level.activ))
        {
		    player room_setup(jump,"deserteagle_mp","undefined","yes",1);
			iprintln("^2"+player.name+"^7 has entered the ^2Old^7!");
            noti = SpawnStruct();
            noti.titleText = "Old Room";
            noti.notifyText = "^7"+level.activ.name+" ^1vs ^7"+player.name;
            noti.duration = 6;
            noti.glowcolor = (1,0,1);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
 			wait 1;
           	iPrintLnBold("^63");
			wait 1;
			iPrintLnBold("^62");
			wait 1;
			iPrintLnBold("^61");
			wait 1;
			iPrintLnBold("^1FIGHT!");

            player freezecontrols(0);

        }
		else 
        {
            player room_setup(jump,"deserteagle_mp","undefined","yes",1);
            
            iprintln("^2"+player.name+"^7 has entered the ^2Old^7!");
			wait 1;
           	player iPrintLnBold("^23");
			wait 1;
			player iPrintLnBold("^22");
			wait 1;
			player iPrintLnBold("^21");
			wait 1;
			player iPrintLnBold("^1FIGHT!");
			
            player freezecontrols(0);
        }

		snip delete();
		knife delete();
		bounce delete();
		trig delete();
		wait 1;
	    door movez(-250,3);
		wait 5;
		door delete();
	}
}
	
	
	
	

sniperroom()
{
	level.sniper = getent("trig_sniper","targetname");
	acti = getent("origin_actisniper","targetname");
	jump = getent("origin_jumpersniper","targetname");
	old = getent("trig_old","targetname");
	
	level.sniper setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Sniper ^7Room!");
	while(1)
	{
		level.sniper waittill("trigger", player);
        old delete();
		
		if(!isdefined(level.sniper))
			return;

		if(isdefined(level.activ))
        {
		    player room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            level.activ room_setup(acti,"remington700_mp","m40a3_mp","yes",1);
			iprintln("^2"+player.name+"^7 has entered the ^2Sniper^7!");
            noti = SpawnStruct();
            noti.titleText = "Sniper Room";
            noti.notifyText = "^7"+level.activ.name+" ^1vs ^7"+player.name;
            noti.duration = 6;
            noti.glowcolor = (1,0,1);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
 			wait 1;
           	player iPrintLnBold("^63");
			level.activ iPrintLnBold("^23");
			wait 1;
			player iPrintLnBold("^62");
			level.activ iPrintLnBold("^22");
			wait 1;
			player iPrintLnBold("^61");
			level.activ iPrintLnBold("^21");
			wait 1;
			player iPrintLnBold("^1FIGHT!");
			level.activ iPrintLnBold("^1FIGHT!");

            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            
            iprintln("^2"+player.name+"^7 has entered the ^2Sniper^7!");
			wait 1;
           	player iPrintLnBold("^23");
			wait 1;
			player iPrintLnBold("^22");
			wait 1;
			player iPrintLnBold("^21");
			wait 1;
			player iPrintLnBold("^1FIGHT!");
			
            player freezecontrols(0);
        }

		while(isAlive(player) && isDefined(player))
            wait 1;

        iPrintLnBold("^6"+player.name+" ^7is dead ^6!"); 
	}
}

kniferoom()
{
	level.knife = getent("trig_knife","targetname");
	acti = getent("origin_actiknife","targetname");
	jump = getent("origin_jumperknife","targetname");
	old = getent("trig_old","targetname");
	
	level.knife setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Knife ^7Room!");
	while(1)
	{
		level.knife waittill("trigger", player);
		old delete();
		
		if(!isdefined(level.knife))
			return;

		if(isdefined(level.activ))
        {
			player room_setup(jump,"knife_mp","hands_mp","yes",1);
            level.activ room_setup(acti,"knife_mp","hands_mp","yes",1);
			iprintln("^2"+player.name+"^7 has entered the ^2Knife^7!");
            noti = SpawnStruct();
            noti.titleText = "Knife Room";
            noti.notifyText = "^7"+level.activ.name+" ^1vs ^7"+player.name;
            noti.duration = 6;
            noti.glowcolor = (1,0,1);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
 			wait 1;
           	player iPrintLnBold("^63");
			level.activ iPrintLnBold("^23");
			wait 1;
			player iPrintLnBold("^62");
			level.activ iPrintLnBold("^22");
			wait 1;
			player iPrintLnBold("^61");
			level.activ iPrintLnBold("^21");
			wait 1;
			player iPrintLnBold("^1FIGHT!");
			level.activ iPrintLnBold("^1FIGHT!");

            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"knife_mp","hands_mp","yes",1);
            
            iprintln("^2"+player.name+"^7 has entered the ^2Knife^7!");
			wait 1;
           	player iPrintLnBold("^23");
			wait 1;
			player iPrintLnBold("^22");
			wait 1;
			player iPrintLnBold("^21");
			wait 1;
			player iPrintLnBold("^1FIGHT!");
			
            player freezecontrols(0);
        }

		while(isAlive(player) && isDefined(player))
            wait 1;

        iPrintLnBold("^6"+player.name+" ^7is dead ^6!"); 
	}
}

bounceroom()
{
	level.bounce = getent("trig_bounce","targetname");
	acti = getent("origin_actibounce","targetname");
	jump = getent("origin_jumperbounce","targetname");
	old = getent("trig_old","targetname");
	
	level.bounce setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Bounce ^7Room!");
	while(1)
	{
		level.bounce waittill("trigger", player);
        old delete();
		
		if(!isdefined(level.bounce))
			return;

		if(isdefined(level.activ))
        {
		    player room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ room_setup(acti,"knife_mp",undefined,"yes",1);
            noti = SpawnStruct();
            noti.titleText = "Bounce Room";
            noti.notifyText = "^7"+level.activ.name+" ^1vs ^7"+player.name;
            noti.duration = 6;
            noti.glowcolor = (1,0,1);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
 			wait 1;
           	player iPrintLnBold("^63");
			level.activ iPrintLnBold("^23");
			wait 1;
			player iPrintLnBold("^62");
			level.activ iPrintLnBold("^22");
			wait 1;
			player iPrintLnBold("^61");
			level.activ iPrintLnBold("^21");
			wait 1;
			player iPrintLnBold("^1FIGHT!");
			level.activ iPrintLnBold("^1FIGHT!");

            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"knife_mp","hands_mp","yes",1);
            
            iprintln("^2"+player.name+"^7 has entered the ^2Bounce^7!");
			wait 1;
           	player iPrintLnBold("^23");
			wait 1;
			player iPrintLnBold("^22");
			wait 1;
			player iPrintLnBold("^21");
			wait 1;
			player iPrintLnBold("^1FIGHT!");
			
            player freezecontrols(0);
        }

		while(isAlive(player) && isDefined(player))
            wait 1;

        iPrintLnBold("^6"+player.name+" ^7is dead ^6!"); 
	}
}





// If you use 2 Weapons as in maybe sniper room 
// player room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
// 
// If you use 1 Weapon as in Bounce or Knife
//player room_setup(jump,"knife_mp",undefined,"yes",1);
room_setup(targ,weap,weap2,health,freeze)
{
    self setorigin(targ.origin);
    self setplayerangles(targ.angles);

    self takeallweapons();
    self giveweapon(weap);
    self switchtoweapon(weap);
    self givemaxammo(weap);

    if(isdefined(weap2))
    {
        self giveweapon(weap2);
        self givemaxammo(weap2);
    }

    self freezecontrols(freeze);

    if( health == "yes")
    {
        if(self.health < self.maxhealth)
            self.health=self.maxhealth;
    }
}

givesniper() //bounce room s
{
givesnip = getEnt("snipgive","targetname");

	for (;;)
	{
		givesnip setHintString(">>Press ^6[USE] ^7to get a sniper :)<<");
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("barrett_mp");
		player giveweapon("m40a3_mp");
		player switchtoweapon("barrett_mp");
		player givemaxammo("barrett_mp");
		player givemaxammo("m40a3_mp");
	}
}

bounce_fail_acti()
{
	trig = getent("bounce_fail_acti","targetname");
	og = getent("origin_actibounce","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
	}
}

bounce_fail_jumper()
{
	trig = getent("bounce_fail_jumper","targetname");
	og = getent("origin_jumperbounce","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
	}
}

sniper_fail()
{
	trig = getent("trig_sniper_fail","targetname");
	og = getent("sniper_fail","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
	}
}



// SECRET - EASY 


easysecret_end()
{
	trig = getent("trig_easyend","targetname");
	og = getent("og_easyend","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
		iPrintLnBold("^2" + player.name + " ^2has finished the ^2Easy ^2Secret^7!");
	}
}

// SECRET - HARD

hardsecret_switch()
{
	trig = getent("trig_hard_switch","targetname");
	targ = getent("easy_enter_targ","targetname");

	for(;;)
	{
		trig sethintstring("Press ^3&&1^7 to switch to ^2Easy ^7Secret");
		trig waittill("trigger",who);

		who setorigin(targ.origin);
		who setplayerangles(targ.angles);
		iprintlnBold("^3"+who.name+"^7 left ^1Hard^7 Secret");
		iprintlnBold("^2What a noob :p");

		who.easy_checkpoint = 0;
	}
}

hardsecret_end()
{
	trig = getent("trig_hardend","targetname");
	og = getent("og_hardend","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
		iPrintLnBold("^2" + player.name + " ^2has finished the ^1Hard ^2Secret^7!");
	}
}


// Secret Fail by Blade

easy()
{
	thread easy_enter();
	thread easy_checkpoint_system();
	thread easy_checkpoints();
}

easy_enter()
{
	trig = getent("easy_trigger","targetname");
	targ = getent("easy_enter_targ","targetname");

	for(;;)
	{
		trig sethintstring("Press ^3&&1^7 to enter the ^2Easy ^7Secret");
		trig waittill("trigger",who);

		who setorigin(targ.origin);
		who setplayerangles(targ.angles);
		iprintlnBold("^3"+who.name+"^7 has entered the ^2Easy^7 Secret");

		who.easy_checkpoint = 0;
	}
}

easy_checkpoint_system()
{
	trig = getent("easy_fail_trig","targetname");

	for(;;)
	{
		trig waittill("trigger",who);

		if(who.easy_checkpoint == 0)
			targ = getent("easy_enter_targ","targetname");
		else 
			targ = getent("easy_cp_"+ who.easy_checkpoint,"targetname");

		who iprintln("Checkpoint: "+ who.easy_checkpoint);

		who setorigin(targ.origin);
		who setplayerangles(targ.angles);
	}
}

easy_checkpoints()
{
	cp_limit = 2;

	for(i=1;i<cp_limit+1;i++)
	{
		trig = getent("easy_cp_trig"+i,"targetname");

		trig thread check_cp_usage("easy",i);

		wait .05;
	}
}

hard()
{
	thread hard_enter();
	thread hard_checkpoint_system();
	thread hard_checkpoints();
}

hard_enter()
{
	trig = getent("hard_trigger","targetname");
	targ = getent("hard_enter_targ","targetname");

	for(;;)
	{
		trig sethintstring("Press ^3&&1^7 to enter the ^1Hard ^7Secret");
		trig waittill("trigger",who);

		who setorigin(targ.origin);
		who setplayerangles(targ.angles);
		iprintlnBold("^3"+who.name+"^7 has entered the ^1Hard^7 Secret");

		who.hard_checkpoint = 0;
	}
}

hard_checkpoint_system()
{
	trig = getent("hard_fail_trig","targetname");

	for(;;)
	{
		trig waittill("trigger",who);

		if(who.hard_checkpoint == 0)
			targ = getent("hard_enter_targ","targetname");
		else 
			targ = getent("hard_cp_"+ who.hard_checkpoint,"targetname");

		who iprintln("Checkpoint: "+ who.hard_checkpoint);

		who setorigin(targ.origin);
		who setplayerangles(targ.angles);
	}
}

hard_checkpoints()
{
	cp_limit = 6;

	for(i=1;i<cp_limit+1;i++)
	{
		trig = getent("hard_cp_trig"+i,"targetname");

		trig thread check_cp_usage("hard",i);

		wait .05;
	}
}

check_cp_usage(way,num)
{
    for(;;)
    {
        self waittill("trigger",who);
        if(way == "easy")
        {
            if(who.easy_checkpoint < num)
            {
                who.easy_checkpoint += 1;
                who iprintln("You've reached Checkpoint #"+who.easy_checkpoint);
            }
        }
        else if(way == "inter")
        {
            if(who.inter_checkpoint < num)
            {
                who.inter_checkpoint += 1;
                who iprintln("You've reached Checkpoint #"+who.inter_checkpoint);
            }
        }
        else if(way == "hard")
        {
            if(who.hard_checkpoint < num)
            {
                who.hard_checkpoint += 1;
                who iprintln("You've reached Checkpoint #"+who.hard_checkpoint);
            }
        }
    }
}


//Respect plugin
respectPluginCheck(player) { //support for _respect plugin
	if (level.finishPosition[level.playerEnterNum].guid != player.guid || level.inRoomPlugin) {
		player IPrintLnBold("^1Wait your turn");
		//teleport player here
		player setOrigin((-1275, 2683, 141));
		player setPlayerAngles((360, 270, 0));
		return false;
	}

	player notify("romm_enter_plugin"); //stop the onQueueDeath check
	level.inRoomPlugin = true;
	player thread respectPluginOnRoomDeath();
	respectPluginUpdateHud();
	return true;
}

respectPluginOnRoomDeath() {
	while(isAlive(self) && isDefined(self))
		wait(0.1);
	level.playerEnterNum++;
	level.inRoomPlugin = false;

	respectPluginUpdateHud();
}

respectPluginUpdateHud() {
	queueStr = "";

	if (isDefined(level.finishPosition[level.playerEnterNum]))
		queueStr += "^7[ ^3Current Player ^7]^7\n" + level.finishPosition[level.playerEnterNum].name + "\n\n^7[ ^3Queue ^3^7]^7\n";
	for (i = level.playerEnterNum; i < level.finishPosition.size; i++)
		queueStr += "^7" + level.finishPosition[i].name + "\n";
	level.queueHud SetText(queueStr);
}