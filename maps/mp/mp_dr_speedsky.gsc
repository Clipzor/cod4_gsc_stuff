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
	setdvar("g_speed",210);
	SetDvar("bg_falldamagemaxheight", 99999);
	SetDvar("bg_falldamageminheight", 99998);
	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	//Music info (name, duration)
	self.songs = [];
	self.songs[0] = [];
	self.songs[0][0] = "Joyca - Need u";
	self.songs[0][1] = 180;
	self.songs[1] = [];
	self.songs[1][0] = "Joyca - Party End";
	self.songs[1][1] = 164;
	self.songs[2] = [];
	self.songs[2][0] = "Joyca - Wow Wow Wow";
	self.songs[2][1] = 141;
	self.songs[3] = [];
	self.songs[3][0] = "Ateez - Fireworks (I'm the one)";
	self.songs[3][1] = 230;
	self.songs[4] = [];
	self.songs[4][0] = "Whee In - Watercolor";
	self.songs[4][1] = 191;
	self.songs[5] = [];
	self.songs[5][0] = "BTS - Butter (Hotter Remix)";
	self.songs[5][1] = 168;
	
	
	

	
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

   //TRAPS
    thread trap_1();
    thread trap_2();
    thread trap_3();
	thread trap_4();
	thread trap_5();
  
  
  
  
  
  
   //ENDROOMS
   thread endrooms();
   thread sniperroom();
   thread kniferoom();




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
	iprintlnBold("Welcome to SpeedSky ^7:3\n^7Made by: DaiiZed");
	wait 2;

	thread startdoor();

	for(;;)
	{
		iprintln("^2>> ^7Map Made By: ^3DaiiZed");
		wait 30;
		iprintln("^2>> ^7Report any map bug to ^2>> ^1Discord^7 : DaiiZed#6873"); 
		wait 30;
		iprintln("^2>> ^7"); 
		wait 30;
	    iprintln("^2>> ^7"); 
		wait 30;
		iprintln("^2>> ^7Thx to ^1Liserd for testing my map <3"); 
		wait 30;
		iprintln("^2>> ^7Thx to ^1Frazzle ^7for the music menu ^1<3"); 
	}	
}

startdoor()
{
	door = getent("startdoor","targetname");

	wait 6;
	door movez(160,5);
	wait 5;

	iprintlnbold("Start Door Opened !");
	wait 5;
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
    trap1 = getent("trap1","targetname");
	trig = getent("trap_1_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to activate the platform ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");	
	
	while(1){
		wait 0.5;
		trap1 movex (864, 2);
		trap1 waittill ("movedone");
		trap1 movex (-864, 2);
		trap1 waittill ("movedone");	
	}
}

trap_2()
{
    trap = getent("trap2","targetname");
	trig = getent("trap_2_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to spin those bounces ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");	
	
	while(1){
		trap rotatePitch(360, 1.2);
		wait 3;
	}
}

trap_3()
{
    trap = getent("trap3","targetname");
	trig = getent("trap_3_use","targetname");
    trig setHintString("^2> ^7Press ^1[USE] ^7to activate the spinners ^2<");
	trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");	
	
	while(1){
		trap rotatePitch(360, 1.2);
		wait 3;
	}
}

trap_4()
{
	trap = getent("trap4","targetname");
	trig = getent ("trap_4_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to activate the rotator ^2<");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	
	while(1){
		wait 0.1;
		trap rotateYaw (360, 3.5);
	
    }
}	

trap_5()
{
	trap = getent("trap5","targetname");
	trig = getent ("trap_5_use","targetname");
	trig setHintString("^2> ^7Press ^1[USE] ^7to activate the rotator ^2<");
    trig waittill("trigger", player);
	trig setHintString("^2> ^7Trap already ^1USED^2 <");
	
	while(1){
		wait 0.1;
		trap rotateYaw (360,2);
	
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
	acti = getent("origin_actisniper","targetname");
	jump = getent("origin_jumpersniper","targetname");

	
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

		while(isDefined(player) && isAlive(player))
            wait 1;

        iPrintLnBold("^6"+player.name+" ^7is dead ^6!"); 
	}
}

kniferoom()
{
	level.knife = getent("trig_knife","targetname");
	acti = getent("origin_actiknife","targetname");
	jump = getent("origin_jumperknife","targetname");
	
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

		while(isDefined(player) && isAlive(player))
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



//Respect plugin
respectPluginCheck(player) { //support for _respect plugin
	if (level.finishPosition[level.playerEnterNum].guid != player.guid || level.inRoomPlugin) {
		player IPrintLnBold("^1Wait your turn");
		//teleport player here
		player setOrigin((-298, 9053, -276));
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

