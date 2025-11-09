//is_raky_angry_from_me_??\\IDK// CRY :(
main()
{
 maps\mp\_load::main();
 precacheModel("plr_hitman");
 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
	setdvar("g_speed","210");
	setdvar("bg_fallDamageMaxHeight", "99999"); 
	setdvar("bg_fallDamageMinHeight", "99998");
	setdvar("g_speed" ,"210");
	setdvar("dr_jumpers_speed" ,"1.1");
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
    level.music=[];
    level.music[0]["song"]    ="INNA Nobody";
    level.music[0]["alias"]    ="song1";
	level.music[1]["song"]    ="Blackbear - Fashion Week (its different remix)";
    level.music[1]["alias"]    ="song2";
	level.music[2]["song"]    ="P!nk - Can We Pretend";
    level.music[2]["alias"]    ="song3";
	level.music[3]["song"]    ="Ameria & Hypression - Not About You";
    level.music[3]["alias"]    ="song4";
	level.music[4]["song"]    ="Halsey - Without Me (ILLENIUM Remix)";
    level.music[4]["alias"]    ="song5";
	
	// Effects
	if(!isdefined(level.xmgalaxy_fx))
		level.xmgalaxy_fx = [];
		
	level.xmgalaxy_fx["fire"] = loadfx("fire/firelp_barrel_pm");
	level.xmgalaxy_fx["explosion"] = loadfx("explosions/powerlines_g_large");
	level.xmgalaxy_fx["fire"] = loadfx("props/barrel_fire");
	level.xmgalaxy_fx["blue"] = loadfx("blue/trail_spark");
	level.xmgalaxy_fx["bluee"] = loadfx("blue/trail_smoke");
	
	//CACHE ROOMS TRIGGER
	level.bounce = getEnt( "run_trig", "targetname");
	level.deagle = getEnt( "deagle_trig", "targetname");
	level.sniper = getEnt( "sniper_trig", "targetname");
	level.knife = getEnt( "knife_trig", "targetname");
	
	thread easy_enter();
	thread easy_checkpoint_system();
	thread easy_checkpoints();
	thread givesniper();
	thread creatorcredit();
	thread bouncejumperfail();
	thread bounceactifail();
	thread startdoor();
	//TRAPS
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	//TELEPORT
	thread teleport1();
	thread teleport4();
	thread secret5();
	//ROOMS
	thread sniproom();
	thread deagroom();
	thread kniferoom();
	thread runroom();
	thread endrooms();
	//MISC
	thread blueparticles();
	thread musicbox();
	thread Messages();
	thread jumper();
	
	
	addTriggerToList( "raky1_trig" );
	addTriggerToList( "raky2_trig" );
	addTriggerToList( "raky3_trig" );
	addTriggerToList( "raky4_trig" );
	addTriggerToList( "raky5_trig" );
	addTriggerToList( "raky6_trig" );
	addTriggerToList( "raky7_trig" );


}

jumper()
{
jumpx = getent ("jump","targetname");
glow = getent ("glow","targetname");
air1 = getent ("air1","targetname");
air2 = getent ("air2","targetname");
air3 = getent ("air3","targetname");
air4 = getent ("air4","targetname");
air5 = getent ("air5","targetname");




	while (1)
	{
	jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{

		//throw = user.origin + (100, 100, 0);
		air = spawn ("script_model",(0,0,0));

		air.origin = user.origin;
		air.angles = user.angles;
		user linkto (air);
		time = 1;
            air moveto (air1.origin, 1);
		wait 1;
            air moveto (air2.origin, 1);
		wait .5;
            air moveto (air3.origin, 1);
		wait .5;
            air moveto (air4.origin, 1);
			wait .5;
            air moveto (air5.origin, 1);


		//air moveto (throw, time, 0.5,0.5);
		//air moveto (throw, time, 0.5,0.5);
		wait 1;
		user unlink();
		wait 1;
		}
	}
}




Messages()
{
    wait 10;
	iPrintLnBold("^5xM^7#^7D^7eathrun");
	
    while(1)
    {
		iPrintLn("^5xM^7#^7D^7eathrun");
		iPrintLn("^5xM^7#^7D^7eathrun");
        wait 5;
		iPrintLn("^5xM^7#^7D^7eathrun");
		wait 5;
        iPrintLn("^5xM^7#^7D^7eathrun");
        wait 5;
        iPrintLn("^5xM^7#^7D^7eathrun");
        wait 5;
        iPrintLn("^5Map ^7Made By : ^5xM^7#^7War");
		wait 5;
    }
}


musicbox()
{
    trig = getEnt("musictrigger","targetname");
    trig setHintString("Press ^1&&1^7 to select song");
    trig waittill("trigger",p);
    p braxi\_rank::giveRankXP("", 50); //remove this if you still got braxi issues
    trig delete();
    p freezeControls(1);
    p musicmenu();
}
 
musicmenu()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );
    self endon( "music thread terminated" );
 
    self.hud_music = [];
    self.selection = 0;
 
    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
    self.hud_music[i].sort = 879;
    self.hud_music[i] setShader( "white", 320, 160 ); //background image
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 ); //should be bar image, i suggest to not change cuz your texture will be stretched
    self.hud_music[i].color=(1,0,0);
    
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("xM#Clan Music Box"); //title
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else 
        self.hud_music[i].glowcolor=(1,0,0); //title text color
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 900;
    self.hud_music[i] setText("                                   Scroll: ^1[{+attack}] ^7| Select: ^1[{+activate}] ^7| Close: ^1[{+frag}]"); //just change numbers of colors here if you need different ones
 
    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
        self.hud_music[i].glowalpha=1;
        if(isdefined(level.randomcolor))
            self.hud_music[i].glowcolor=level.randomcolor;
        else 
            self.hud_music[i].glowcolor=(1,0,0);
 
        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }
 
    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 ); //another bar image that will most likely stretch, i suggest to only change colors
    indicator.color=(1,0,0);
 
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
             iPrintLn("^2>>^1Now playing: ^5"+level.music[self.selection]["song"]+"^2<<"); //text that appears after picking a song
             
            ambientPlay(level.music[self.selection]["alias"]);
            self freezeControls(0);
            break;
        }
        else if(self fragButtonPressed())
        {
            self freezeControls(0);
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




	 
startdoor()
{
	door = getent("startdoor_brush","targetname");
	targ = getent("startdoor_fx","targetname");
	
	level waittill("round_started");
	
	iprintlnbold("Startdoor will open in 15 seconds");
	fire = spawnfx(level.xmgalaxy_fx["fire"],targ.origin);
	triggerfx(fire);
	
	wait 15;
	playfx(level.xmgalaxy_fx["explosion"],targ.origin);
	wait 1;
	fire delete();
	
	door delete();
}


fly()
{
 object = getent("fly", "targetname");

 while (1)
 {
  object moveX(-2227, 3, 0, 1);
  object waittill ("movedone");
  wait 2;
  object moveX(2227, 3, 0, 1);
  object waittill ("movedone");
  wait 2;
 }
}

fly2()
{
 object = getent("ass_1", "targetname");

 while (1)
 {
  object moveY(3009, 3, 0, 1);
  object waittill ("movedone");
  wait 2;
  object moveY(-3009, 3, 0, 1);
  object waittill ("movedone");
  wait 2;
 }
}


blueparticles()
{
blue1 = getEnt("zone1_fx", "targetname");
blue2 = getEnt("zone2_fx", "targetname");
blue3 = getEnt("zone3_fx", "targetname");
blue4 = getEnt("secret_fx", "targetname");


level.xmgalaxy_fx["bluee"] = loadfx("blue/trail_smoke");
	
	while(1)
	{
	playFx(level.xmgalaxy_fx["bluee"],blue1.origin);
	
	playFx(level.xmgalaxy_fx["bluee"],blue2.origin);
	
	playFx(level.xmgalaxy_fx["bluee"],blue3.origin);
	
	playFx(level.xmgalaxy_fx["blue"],blue4.origin);
	
	wait 1;
	}
}

trap1()
{
	trap1 = getent ("raky1", "targetname");
	trig = getent ("raky1_trig", "targetname"); 

	trig setHintString("^7PRESS ^5[F] ^7TO Activate!");
	trig waittill("trigger", player);
	trig setHintString("^7Activated^5!!");
	trig delete();
	
	
	  while(1)
	{
	trap1 rotateYaw (360,1);
	wait 5;
	trap1 rotateYaw (360,1);
	 }

}

trap2()
{
	trap2 = getent("raky2","targetname");
	trig = getEnt ("raky2_trig", "targetname");
	
	trig setHintString("^7PRESS ^5[F] ^7TO Activate!");
	trig waittill("trigger", player);
	trig setHintString("^7Activated^5!!");
	trig delete();
	
	trap2 moveX(650,1);
	wait 3;
	trap2 moveX(-650,1);
	wait 2;
}


trap3()
{
    platform = getent("raky3","targetname");
    trig = getent("raky3_trig","targetname");
	
	trig setHintString("^7PRESS ^5[F] ^7TO Activate!");
	trig waittill("trigger", player);
	trig setHintString("^7Activated^5!!");
    trig delete();
 
    {
        platform delete();
        wait(4);
    }
 
}


trap4()
{
    platform = getent("raky4","targetname");
    trig = getent("raky4_trig","targetname");
	
	trig setHintString("^7PRESS ^5[F] ^7TO Activate!");
	trig waittill("trigger", player);
	trig setHintString("^7Activated^5!!");
    trig delete();
 
    {
        platform delete();
        wait(4);
    }
 
}

trap5()
{
	trap5 = getent ("raky5", "targetname");
	trig = getent ("raky5_trig", "targetname"); 

	trig setHintString("^7PRESS ^5[F] ^7TO Activate!");
	trig waittill("trigger", player);
	trig setHintString("^7Activated^5!!");
	trig delete();
	
	
	  while(1)
	{
	trap5 rotateYaw (360,1);
	wait 5;
	trap5 rotateYaw (360,1);
	 }

}


trap6()
{
    platform = getent("raky6","targetname");
    trig = getent("raky6_trig","targetname");
	
	trig setHintString("^7PRESS ^5[F] ^7TO Activate!");
	trig waittill("trigger", player);
	trig setHintString("^7Activated^5!!");
    trig delete();
 
    {
        platform delete();
        wait(4);
    }
 
}

secret5()
{
trig = getEnt("5_secret","targetname");
tele1 = getEnt("4_secret","targetname");


for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele1.origin);
	player braxi\_rank::giveRankXp( undefined, 5000 );

	


   }
}


trap7()
{
	trap7 = getent ("raky7", "targetname");
	trig = getent ("raky7_trig", "targetname"); 

	trig setHintString("^7PRESS ^5[F] ^7TO Activate!");
	trig waittill("trigger", player);
	trig setHintString("^7Activated^5!!");
	trig delete();
	
	
	  while(1)
	{
	trap7 rotateYaw (360,1);
	wait 5;
	trap7 rotateYaw (360,1);
	 }

}

easy_enter()
{
	trig = getent("easy_trigger","targetname");
	targ = getent("easy_enter_targ","targetname");

	for(;;)
	{
		trig sethintstring("Press ^5&&1^7 to enter the ^7Secret");
		trig waittill("trigger",who);

		who setorigin(targ.origin);
		who setplayerangles(targ.angles);
		iprintlnBold("^5"+who.name+"^7 has entered the ^2 Secret");

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

teleport1()
{
trig = getEnt("trigger_teleport1","targetname");
tele1 = getEnt("origin_teleport1","targetname");


for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele1.origin);


   }
}

teleport2()
{
trig = getEnt("trigger_teleport2","targetname");
tele2 = getEnt("origin_teleport2","targetname");


for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele2.origin);


   }
}




teleport4()
{
trig = getEnt("trigger_teleport4","targetname");
tele4 = getEnt("origin_teleport4","targetname");


for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele4.origin);


   }
}


givesniper() 
{
givesnip = getEnt("givesnip_trig","targetname");

	for (;;)
	{
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("m40a3_mp");
		player giveweapon("m40a3_mp");
		player switchtoweapon("m40a3_mp");
		player switchtoweapon("m40a3_mp");
		player givemaxammo("m40a3_mp");
		player givemaxammo("m40a3_mp");
	}
}

givedeagle() 
{
givesnip = getEnt("deagle","targetname");

	for (;;)
	{
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("colt45_mp");
		player giveweapon("colt45_mp");
		player switchtoweapon("colt45_mp");
		player switchtoweapon("colt45_mp");
		player givemaxammo("colt45_mp");
		player givemaxammo("colt45_mp");
	}
}




bouncejumperfail() // when jumper fail in jump room
{
	bouncejumperfail = getEnt("race2", "targetname");
	tpbouncejumperfail = getEnt("origin_jumper_run", "targetname");
	
	for (;;)
	{
		bouncejumperfail waittill("trigger", player);
		player setOrigin(tpbouncejumperfail.origin);
		player setPlayerAngles(tpbouncejumperfail.angles);
	}
}

bounceactifail() // when acti fail in jump room
{
	bounceactifail = getEnt("race1", "targetname");
	tpbounceactifail = getEnt("origin_acti_run", "targetname");
	
	for (;;)
	{
		bounceactifail waittill("trigger", player);
		player setOrigin(tpbounceactifail.origin);
		player setPlayerAngles(tpbounceactifail.angles);
	}
}

addTriggerToList( name, positionOfIconAboveTrap )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

    if( !isDefined( level.icon_origins ) )
        level.icon_origins = [];
    level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
}

creatorcredit()
{
    wait 15;
    braxi\_mod::drawInformation( 800, 0.8, 1, "xM#Galaxy" );
    wait 5;
    braxi\_mod::drawInformation( 800, 0.8, 1, "xM#War" );
    wait 5;
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




sniproom()
{

	jump = getEnt( "sniper1", "targetname" ); //jumper origin
	acti = getEnt( "sniper2", "targetname" ); //acti origin

	
	level.sniper setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Sniper ^7Room!");
	while(1)
	{
		level.sniper waittill("trigger", player);

		
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

		while(isDefined(player) && isAlive(player))
            wait 1;

        iPrintLnBold("^6"+player.name+" ^7is dead ^6!"); 
	}
}

kniferoom()
{
	jump = getEnt( "origin_jumper_knife", "targetname" ); //jumper origin
	acti = getEnt( "origin_acti_knife", "targetname" ); //acti origin

	
	level.knife setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Knife ^7Room!");
	while(1)
	{
		level.knife waittill("trigger", player);

		
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

		while(isDefined(player) && isAlive(player))
            wait 1;

        iPrintLnBold("^6"+player.name+" ^7is dead ^6!"); 
	}
}

runroom()
{
	jump = getEnt( "origin_jumper_run", "targetname" ); //jumper origin
	acti = getEnt( "origin_acti_run", "targetname" ); //acti origin

	
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

		while(isDefined(player) && isAlive(player))
            wait 1;

        iPrintLnBold("^6"+player.name+" ^7is dead ^6!"); 
	}
}

deagroom()
{

	jump = getEnt( "origin_jumper_deagle", "targetname" ); //jumper origin
	acti = getEnt( "origin_acti_deagle", "targetname" ); //acti origin

	
	level.deagle setHintString("^1>>^7 Press ^1&&1 ^7 to Enter The ^2Deagle ^7Room!");
	while(1)
	{
		level.deagle waittill("trigger", player);
 
		
		if(!isdefined(level.deagle))
			return;

		if(isdefined(level.activ))
        {
		    player room_setup(jump,"deserteagle_mp",undefined,"yes",1);
            level.activ room_setup(acti,"deserteagle_mp",undefined,"yes",1);
			
            noti = SpawnStruct();
            noti.titleText = "Deagle Room";
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
            player room_setup(jump,"deserteagle_mp","hands_mp","yes",1);
            
            iprintln("^2"+player.name+"^7 has entered the ^2Deagle^7!");
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
		player setOrigin((-11, 40146, -12074));
		player setPlayerAngles((96, 10, 0));
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
