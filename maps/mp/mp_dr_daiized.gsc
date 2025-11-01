//////////////////////////Map By///////////////////////////////
//               Map & Script by DaiiZed (Nephy)             //
//                                                           //
//   Thx Frazzle & Blade for giving me so script they made   //
///////////////////////////////////////////////////////////////

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
	setdvar("g_speed","210");
	setdvar("bg_fallDamageMaxHeight", "99999"); 
	setdvar("bg_fallDamageMinHeight", "99998");
	setdvar("dr_jumpers_speed" ,"1.2");	
	setdvar( "r_specular", "0" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	addTriggerToList("trap_1_use");
	addTriggerToList("trap_2_use");
	addTriggerToList("trap_3_use");
	addTriggerToList("trap_4_use");
	addTriggerToList("trap_5_use");
	addTriggerToList("trap_6_use");
	addTriggerToList("trap_7_use");

	//Music info (name, duration)
	self.songs = [];
	self.songs[0] = [];
	self.songs[0][0] = "DMNDS & Fallen Roses - Calabria";
	self.songs[0][1] = 141;
	self.songs[1] = [];
	self.songs[1][0] = "Steve Void - Sweet Dreams";
	self.songs[1][1] = 125;
	self.songs[2] = [];
	self.songs[2][0] = "Steve Void & DMNDS - Goosebumps";
	self.songs[2][1] = 124;
	self.songs[3] = [];
	self.songs[3][0] = "Koosen & Green Bull - Heathens";
	self.songs[3][1] = 124;
	self.songs[4] = [];
	self.songs[4][0] = "DMNDS - One Dance";
	self.songs[4][1] = 152;
	self.songs[5] = [];
	self.songs[5][0] = "Green Bull & Koosen - Vossi Bop";
	self.songs[5][1] = 155;
	
	
	

	
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
	thread TriggerList();
	thread trap_1();
	thread trap_2();
	thread trap_3();
    thread trap_4();
    thread trap_5();
    thread trap_6();
    thread trap_7();
	thread TriggerList();

    // TELEPORTER
	thread tp1();
	thread tp2();
	thread tp3();	
	thread tp4();	
	
	thread tp_acti_1();
	thread tp_acti_2();
	thread tp_acti_3();

	//ENDROOMS
	thread endrooms();
	thread sniperroom();
	thread kniferoom();
	thread pistolroom();
	thread bounceroom();
	thread bounce_fail_acti();
	thread bounce_fail_jumper(); 
    thread givesniper();

}

// MISC //
addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers)) level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt(name,"targetname");
}

TriggerList()
{
	for(i=1;i<7;i++) addTriggerToList("trap_" + i + "_use");
}


messages()
{
	level waittill("round_started");

	iprintlnBold("Welcome to DaiiZed v1 ^7:3\n^7Made by: ^2DaiiZed");

	thread startdoor();
	thread easy();
	thread easysecret_end();
	thread hard();
	thread hardsecret_end();	
}

startdoor()
{
	door = getent("startdoor","targetname");

	if(isdefined(level.auto_open_door) && level.auto_open_door) {
		door delete();
	} else {
		wait 9;
		door movez(-400,5);
		wait 5;
		door delete();
	}

	iprintlnbold("Start Door Opened !");
	wait 5;
	iprintlnbold("^7Map made by DaiiZed ^1<3");
}
// MUSIC //
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
// You can't use this script without having the ui_mp files //


// TRAPS //

trap_1()
{
	trap1 = getEnt("trap_1", "targetname");
	trig1 = getEnt("trap_1_use", "targetname");
	trig1 setHintString("^2> ^7Press ^1[USE] ^7to delete the platforms ! ^2<");
	trig1 waittill ("trigger"); 
	trig1 setHintString("^2> ^7Trap already ^1USED^2 <");
	trap1 delete();

}

trap_2()
{
    trap2 = getent("trap_2","targetname");
	trig = getent("trap_2_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to rotate the bounces ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	while(true){
		wait 1;
		trap2 rotateRoll (360, 3.5);
		trap2 waittill ("movedone");
	}
}

trap_3()
{
    trap3 = getent("trap_3","targetname");
	trig = getent("trap_3_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to rotate the white platforms ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	while(true){
		wait 1;
		trap3 rotateRoll (360, 3.5);
		trap3 waittill ("movedone");

	}
}

trap_4()
{
    trap4 = getent("trap_4","targetname");
	trig = getent("trap_4_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to activate the spinners ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	
	while(1){
		wait 0.1;
		trap4 rotateYaw (360, 3);
	}
}

trap_5()
{
	trap5 = getent("trap_5","targetname");
	trig = getent ("trap_5_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to swipe them down ^2<");
   	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");	


	while(1){
		wait 0.1;
		trap5 rotateYaw (360, 3);
	}
}

	
trap_6()
{
	trap6 = getent("trap_6_1","targetname");
	trap6_1 = getent("trap_6_2","targetname");
	trig = getent ("trap_6_use","targetname");
	{
		trig setHintString("^2> ^7Press ^1[USE] ^7to separate the stairs ^2<");
		trig waittill ("trigger"); 
		trig setHintString("^2> ^7Trap already ^1USED^2 <");
		wait 0.1;
		trap6 movex(120, 1, .5, .5);
		trap6_1 movex(-120, 1, .5, .5);
	}
}
	
trap_7()
{
    trap7 = getent("trap_7","targetname");
	trig = getent("trap_7_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to activate the rotating wall ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	
	while(1){
		wait 0.1;
		trap7 rotateYaw (360, 3);
	}
}



// TELEPORTER JUMPER //

tp1()
{
	og = getent ("og_part2","targetname");
	trig = getent ("tp_jumper_1","targetname");
	trig setHintString("^2>^7 Press ^2[USE] ^7to teleport to the next area !");
	while(1){
		trig waittill("trigger", player);
		wait 0.1;
		player setorigin(og.origin);
    	player setplayerangles(og.angles);
	    player iPrintLn("^2>> ^7Teleported !");
	}
}	

tp2()
{
	og = getent ("og_part3","targetname");
	trig = getent ("tp_jumper_2","targetname");
	trig setHintString("^2>^7 Press ^2[USE] ^7to teleport to the next area !");
	while(1){
		trig waittill("trigger", player);
		wait 0.1;
		player setorigin(og.origin);
    	player setplayerangles(og.angles);
		player iPrintLn("^2>> ^7Teleported !");
	
	}
}	

tp3()
{
	og = getent ("og_part4","targetname");
	trig = getent ("tp_jumper_3","targetname");
	trig setHintString("^2>^7 Press ^2[USE] ^7to teleport to the next area !");
	while(1){
		trig waittill("trigger", player);
		wait 0.1;
		player setorigin(og.origin);
    	player setplayerangles(og.angles);
		player iPrintLn("^2>> ^7Teleported !");
	
	}
}

tp4()
{
	og = getent ("og_part5","targetname");
	trig = getent ("tp_jumper_4","targetname");
	trig setHintString("^2>^7 Press ^2[USE] ^7to teleport to the end !");
	while(1){
		trig waittill("trigger", player);
		wait 0.1;
		player setorigin(og.origin);
    	player setplayerangles(og.angles);
		player iPrintLn("^2>> ^7Teleported !");
	
	}
}	


// TELEPORTER ACTIVATOR //

tp_acti_1()
{
	og = getent ("og_acti1","targetname");
	trig = getent ("tp_acti_1","targetname");
	trig setHintString("^2>^7 Press ^2[USE] ^7to teleport to the next area !");
	while(1){
		trig waittill("trigger", player);
		wait 0.1;
		player setorigin(og.origin);
    	player setplayerangles(og.angles);
		player iPrintLn("^2>> ^7Teleported !");

	}
}	

tp_acti_2()
{
	og = getent ("og_acti2","targetname");
	trig = getent ("tp_acti_2","targetname");
	trig setHintString("^2>^7 Press ^2[USE] ^7to teleport to the next area !");
	while(1){
		trig waittill("trigger", player);
		wait 0.1;
		player setorigin(og.origin);
    	player setplayerangles(og.angles);
		player iPrintLn("^2>> ^7Teleported !");

	}
}	

tp_acti_3()
{
	og = getent ("og_acti3","targetname");
	trig = getent ("tp_acti_3","targetname");
	trig setHintString("^2>^7 Press ^2[USE] ^7to teleport to the next area !");
	while(1){
		trig waittill("trigger", player);
		wait 0.1;
		player setorigin(og.origin);
    	player setplayerangles(og.angles);
		player iPrintLn("^2>> ^7Teleported !");

	}
}	

// ENDROOMS //

// ROOMS (SELECTION)

RoomDeath() 
{ 
	self common_scripts\utility::waittill_any("death","disconnect");
	iPrintLnBold(""); 
	iPrintLnBold("^2Selection Room ^7is now ^7open^2!!!"); 
}

endrooms() 
{
	end_game_selection = getent("trig_end","targetname");
	end_game_target = getent("og_end","targetname");

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
	
sniperroom()
{
	level.sniper = getent("trig_sniper","targetname");
	acti = getent("og_actisniper","targetname");
	jump = getent("og_jumpersniper","targetname");

	
	level.sniper setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Sniper ^7Room!");
	while(1)
	{
		level.sniper waittill("trigger", player);
		
		if(!isdefined(level.sniper))
			return;

		if(isdefined(level.activ))
        {
		    player room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            level.activ room_setup(acti,"m40a3_mp","remington700_mp","yes",1);
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

pistolroom()
{
	level.pistol = getent("trig_pistol","targetname");
	acti = getent("og_actisniper","targetname");
	jump = getent("og_jumpersniper","targetname");

	
	level.pistol setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Pistol ^7Room!");
	while(1)
	{
		level.pistol waittill("trigger", player);
		
		if(!isdefined(level.pistol))
			return;

		if(isdefined(level.activ))
        {
			player room_setup(jump,"colt45_mp",undefined,"yes",1);
            level.activ room_setup(acti,"colt45_mp",undefined,"yes",1);
			iprintln("^2"+player.name+"^7 has entered ^2Pistol^7!");
            noti = SpawnStruct();
            noti.titleText = "Pistol Room";
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
            player room_setup(jump,"colt45_mp",undefined,"yes",1);
            
            iprintln("^2"+player.name+"^7 has entered ^2Pistol^7!");
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
	acti = getent("og_actiknife","targetname");
	jump = getent("og_jumperknife","targetname");
	
	level.knife setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Knife ^7Room!");
	while(1)
	{
		level.knife waittill("trigger", player);
		
		
		if(!isdefined(level.knife))
			return;

		if(isdefined(level.activ))
        {
			player room_setup(jump,"knife_mp","undefined","yes",1);
            level.activ room_setup(acti,"knife_mp","undefined","yes",1);
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
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            
            iprintln("^2"+player.name+"^7 has entered ^2Knife^7!");
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
	acti = getent("og_actibounce","targetname");
	jump = getent("og_jumperbounce","targetname");
	
	level.bounce setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Bounce ^7Room!");
	while(1)
	{
		level.bounce waittill("trigger", player);
       
		
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
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            
            iprintln("^2"+player.name+"^7 has entered ^2Bounce^7!");
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

bounce_fail_acti()
{
	trig = getent("bounce_fail_acti","targetname");
	og = getent("og_actibounce","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
	}
}

bounce_fail_jumper()
{
	trig = getent("bounce_fail_jumper","targetname");
	og = getent("og_jumperbounce","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
	}
}

givesniper() //bounce room s
{
givesnip = getEnt("givesnip","targetname");

	for (;;)
	{
		givesnip setHintString("^1>>^7 Press ^1&&1 ^7 to get the ^2Sniper !");
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("remington700_mp");
		player giveweapon("m40a3_mp");
		player switchtoweapon("remington700_mp");
		player givemaxammo("remington700_mp");
		player givemaxammo("m40a3_mp");
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


//Respect plugin
respectPluginCheck(player) { //support for _respect plugin
	if (level.finishPosition[level.playerEnterNum].guid != player.guid || level.inRoomPlugin) {
		player IPrintLnBold("^1Wait your turn");
		//teleport player here
		player setOrigin((-10918, 521, 236));
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
		queueStr += "^7[ ^5Current Player ^7]^7\n" + level.finishPosition[level.playerEnterNum].name + "\n\n^7[ ^5Queue ^5^7]^7\n";
	for (i = level.playerEnterNum; i < level.finishPosition.size; i++)
		queueStr += "^7" + level.finishPosition[i].name + "\n";
	level.queueHud SetText(queueStr);
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
		trig sethintstring("Press ^5&&1^7 to enter the ^2Easy ^7Secret");
		trig waittill("trigger",who);

		who setorigin(targ.origin);
		who setplayerangles(targ.angles);
		iprintlnBold("^5"+who.name+"^7 has entered the ^2Easy^7 Secret");

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
	cp_limit = 1;

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
		trig sethintstring("Press ^5&&1^7 to enter the ^1Hard ^7Secret");
		trig waittill("trigger",who);

		who setorigin(targ.origin);
		who setplayerangles(targ.angles);
		iprintlnBold("^5"+who.name+"^7 has entered the ^1Hard^7 Secret");

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
	cp_limit = 4;

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

hardsecret_end()
{
	trig = getent("trig_hardend","targetname");
	og = getent("og_part5","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
		iPrintLnBold("^2" + player.name + " ^2has finished the ^1Hard ^7Secret^7!");
	}
}

easysecret_end()
{
	trig = getent("trig_easyend","targetname");
	og = getent("og_part4","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player setOrigin(og.origin);
		iPrintLnBold("^2" + player.name + " ^2has finished the ^2Easy ^7Secret^7!");
	}
}