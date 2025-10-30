///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////																									///////
///////																									///////
///////		//			//	////////////	//////////	///////////		//////////	/////////////		///////
///////		//			//	//				//					//		//		//	/		   //		///////
///////		//			//	//				//			 	   // 		//		//	////////////		///////
///////		//			//	////////////	//////////		  //		//		//	//	  //			///////
///////		//			//	//				//				 //			//		//	//	   //			///////
///////		//			//	//				//			    //			//		//	//		//			///////
///////		/////////	//	//				///////////	   ///////////	//////////	//		 //			///////
///////																									///////
///////																									///////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////



//Map by Lifezor
//Script by Lifezor
//Exclusively for boss'Deathrun // fucking cringe lord holy shit
//mp_deathrun_boss_v2
//Started: 12.12.2016
//Finished: 27.12.2016
//Mapping started: 8.12.2016
//Mapping finished:27.12.2016
//bullshit script dont care lol
//thanks Wingzor for room scripts, i havent bothered making my own xd
//tarik's a stupid bosnian cunt that isn't socialist and bosnia is not strong :))))) and you make "Exclusive" maps and comment out _load

main()
{
	//maps\mp\_load::main();
	
	precacheItem ("deserteagle_mp");
	precacheItem ("colt45_silencer_mp");
	precacheItem ("winchester1200_mp");

	level.auto_open_door = false;
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	
	
	//////Doors teles etc random stuff/////
	
	
	thread credits();
	thread stage2teleport();
	thread stage3teleport();
	thread movingstage3();
	thread mapper();
	thread actistage1tele();
	thread actitele1();
	thread actitele2();
	thread startdoor();
	thread secretenter();
	thread secretend();
	thread music();
	thread jumpertp();
	thread actitp();
	
	
	//////Traps/////
	
	
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
	
	/////Rooms/////
	
	thread sniper();
	thread knife();
	thread bounce();
	thread pistol();
	thread shotgun();
	
	//Triggerlist//
	
	addTriggerToList( "trap1_acti" );
	addTriggerToList( "trap2_acti" );
	addTriggerToList( "trap3_trig" );
	addTriggerToList( "trap4_trig" );
	addTriggerToList( "trap5_trig" );
	addTriggerToList( "trap6_trig" );
	addTriggerToList( "trap7_trig" );
	addTriggerToList( "trap8_trig" );
	addTriggerToList( "trap9_trig" );
	addTriggerToList( "trap10_trig" );
	
	/////FX List/////
	
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


credits()
{
     for(;;)
	 {
	 iPrintLn ("^3>>^1Map By ^2Lifezor");
	 wait 7;
	 iPrintLn ("^3>>^1Youtube ^2http://www.youtube.com/IH8LifesSucks");
	 wait 7;
	 iPrintLn ("^3>>Song Name: ^2Mickey Valen - Meet Me Feat. Noe (Fancy Folks Flip) ");
	 wait 7;
	 iPrintLn ("^3>>^1Thanks for playing ^2mp_deathrun_boss_v2");
	 wait 7;
	 iPrintLn ("^3>>Map exclusively made for ^2boss'Deathrun");
	 wait 7;
	 iPrintLn ("^3>>Steam: ^2Lifezor");
	 wait 14;
	 }
}

stage2teleport()
{
	trig = getEnt("tele1", "targetname");
	target = getEnt("tele1_target", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
			player iPrintLnBold(" ^3Welcome to stage 2.");
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

stage3teleport()
{
	trig = getEnt("tele2", "targetname");
	target = getEnt("tele2_target", "targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		
		
		{	
			player iPrintLnBold(" ^5Welcome to stage 3.");
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

mapper()
{
            wait 6;
        hud_clock = NewHudElem();
            hud_clock.alignX = "center";
            hud_clock.alignY = "middle";
            hud_clock.horzalign = "center";
            hud_clock.vertalign = "middle";
            hud_clock.alpha = 1;
            hud_clock.x = 0;
            hud_clock.y = 0;
            hud_clock.font = "objective";
            hud_clock.fontscale = 2;
            hud_clock.glowalpha = 5;
            hud_clock.glowcolor = (0.0,0.8,0.0);
            hud_clock.label = &"Made by Lifezor";
                       hud_clock SetPulseFX( 40, 5400, 200 );
                       wait 5;
}

trap1()
{
	trig = getent("trap1_acti", "targetname");
	brush = getent("brush3", "targetname");
	brush2 = getent("brush4", "targetname");
	brush3 = getent("brush1", "targetname");
	brush4 = getent("brush2", "targetname");
	trig waittill("trigger", player);
	trig delete();
	x = randomInt(4); //change the ones you want solid or not.
		if(x == 0)
			brush notsolid();
		else if(x == 1)
			brush2 notsolid();
		else if(x == 2)
			brush3 notsolid();
		else if(x == 3)
			brush4 notsolid();
		else
		{
		brush notsolid();
		brush3 notsolid();
		}
}


trap2()
{
	trig = getent("trap2_acti", "targetname");
	brush = getent("spinning1", "targetname");
	brush2 = getent("spinning2", "targetname");
	brush3 = getent("spinning3", "targetname");
	brush4 = getent("spinning4", "targetname");
	brush5 = getent("spinning5", "targetname");
	brush6 = getent("spinning6", "targetname");
	brush7 = getent("spinning7", "targetname");
	brush8 = getent("spinning8", "targetname");
	trig waittill("trigger", player);
	trig delete();
		for(;;)
		{
		brush rotateyaw(360, 3);
		brush2 rotateyaw(-360, 3);
		brush3 rotateyaw(360, 3);
		brush4 rotateyaw(-360, 3);
		brush5 rotateyaw(360, 3);
		brush6 rotateyaw(-360, 3);
		brush7 rotateyaw(360, 3);
		brush8 rotateyaw(-360, 3);
		wait 8;
		}
}

movingstage3()
    {
            elevator = getEnt("movingbrushalone", "targetname");
            while(1)
            {
                    wait(0.05);
                    elevator movex(1540, 5, 1, 4);
                    elevator waittill("movedone");
                    wait(2);
                    elevator movex(-1540, 6, 1, 5);
                    elevator waittill("movedone");
                    wait(2);
            }
    }
	
trap8()//play around with the timeing to get speed you want
{
	trig = getent("trap8_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();
	thread trap8a();
	thread trap8b();
}

trap8a()
{
	brush = getent("brush9", "targetname");
	brush movez (100,1);
	brush waittill("movedone");
		for(;;)
		{
		brush movez (-200,2);
		brush waittill("movedone");
		brush movez (200,2);
		brush waittill("movedone");
		}
}

trap8b()
{
	brush2 = getent("brush10", "targetname");
	brush2 movez (-50,1);
	brush2 waittill("movedone");
		for(;;)
		{
		brush2 movez (200,2);
		brush2 waittill("movedone");
		brush2 movez (-200,2);
		brush2 waittill("movedone");
		}
}

trap9()//still not fixed, lol its now lmao
{     
	 trig = getent("trap9_trig", "targetname");
	 brush = getent("brush11", "targetname");
	 brush2 = getent("brush12", "targetname");
	 brush3 = getent("brush13", "targetname");
	 brush4 = getent("brush14", "targetname");
	 trig waittill("trigger");
	 trig delete();
	 for (;;)
		{
		brush rotatepitch(360, 4.5);
		wait 1;
		brush2 rotatepitch(360, 4.5);
		wait 1;
		brush3 rotatepitch(360, 4.5);
		wait 1;
		brush4 rotatepitch(360, 4.5);
		wait 1;
		}
	 
}

sniper() //WINGZOOOOR :D:D:D:D:D:D:D:D:d:DDDD:D:D:D:D:D:D
{
     level.sniper_trig = getEnt( "sniper", "targetname");
     sjump = getEnt( "players", "targetname" );
     sacti = getEnt( "actis", "targetname" );
	 
	 if( !isDefined( level.sniper_trig ) )
         return;
		 
	 while(1)
	 {
		level.sniper_trig waittill( "trigger", player );
		
			
		if(!isdefined(level.firstenter))
		{
			level.pistol_trig delete();
			level.knife_trig delete();
			level.shotgun_trig delete();
			level.bounce_trig delete();
			level.firstenter=true;
		}

		level.activ freezeControls(1);
		player FreezeControls(1);
		
		player SetPlayerAngles( sjump.angles );
		player setOrigin( sjump.origin );
		level.activ setPlayerangles( sacti.angles );
		level.activ setOrigin( sacti.origin );
		level.activ TakeAllWeapons();
		player TakeAllWeapons();
		
		level.activ giveweapon( "m40a3_mp");
		player giveweapon( "m40a3_mp");
		player switchToWeapon( "m40a3_mp" );
		level.activ SwitchToWeapon( "m40a3_mp" );
		player giveMaxAmmo( "m40a3_mp" );
		level.activ giveMaxAmmo( "m40a3_mp" );
		
		level.activ giveweapon( "remington700_mp");
		player giveweapon( "remington700_mp");
		player switchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		player giveMaxAmmo( "remington700_mp" );
		level.activ giveMaxAmmo( "remington700_mp" );
		
		level.activ freezeControls(1);
		player FreezeControls(1);
		
		noti = SpawnStruct();
		noti.titleText = (player.name+"^3Has ^6Chosen ^5Sniper ^2Fight!");
		noti.notifyText = level.activ.name + " ^1VS^5 " + player.name;
		noti.duration = 6;
		noti.glowcolor = (0, 0, 1.0);
		
		players = getEntArray("player", "classname");
		for(i=0;i<players.size;i++)
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				
		wait 2;
		
		level.activ FreezeControls(0);
		player FreezeControls(0);
					
		while(isAlive(player))
			wait 1;
	}
}

knife() //WINGZOOOOR :D:D:D:D:D:D:D:D:D:D:D:D:D:D:DDDD:D:
{
	level.knife_trig = getEnt( "knife", "targetname");
	kjump = getEnt( "playerk", "targetname" );
	kacti = getEnt( "actik", "targetname" );
	 
	if( !isDefined( level.knife_trig ) )
        return;
		 
	while(1)
	{
		level.knife_trig waittill( "trigger", player );

			
		if(!isdefined(level.firstenter))
		{
			level.pistol_trig delete();
			level.sniper_trig delete();
			level.shotgun_trig delete();
			level.bounce_trig delete();
			level.firstenter = true;
		}

		level.activ freezeControls(1);
		player FreezeControls(1);
		
		player SetPlayerAngles( kjump.angles );
		player setOrigin( kjump.origin );
		level.activ setPlayerangles( kacti.angles );
		level.activ setOrigin( kacti.origin );
		level.activ TakeAllWeapons();
		player TakeAllWeapons();
		
		level.activ giveweapon( "tomahawk_mp");
		player giveweapon( "tomahawk_mp");
		player switchToWeapon( "tomahawk_mp" );
		level.activ SwitchToWeapon( "tomahawk_mp" );
		
		level.activ freezeControls(1);
		player FreezeControls(1);
		
				noti = SpawnStruct();
				noti.titleText = (player.name+"^3Has ^6Chosen ^5Knife ^2Fight!");
				noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
				noti.duration = 6;
				noti.glowcolor = (0, 0, 1.0);
				
				players = getEntArray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				
		wait 2;
		
		level.activ FreezeControls(0);
		player FreezeControls(0);
		
		wait 0.1;
					
		while(isAlive(player))
			wait 1;

	}
}

actitele1()
{
	trig = getEnt("actitele1", "targetname");
	target = getEnt("actitele1_target", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
			player iPrintLnBold(" ^3You have been teleported to stage 2.");
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

actitele2()
{
	trig = getEnt("actitele2", "targetname");
	target = getEnt("actitele2_target", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
			player iPrintLnBold(" ^3You have been teleported to stage 3.");
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

actistage1tele()
{
	trig = getEnt("actistage1tele", "targetname");
	target = getEnt("actistage1tele_target", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
			player iPrintLnBold(" ^3You have been teleported.");
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

trap3()
{
    trig = getEnt("trap3_trig", "targetname");
    brush1 = getEnt("spin1", "targetname");
    brush2 = getEnt("spin2", "targetname");
	brush3 = getEnt("spin3", "targetname");
	brush4 = getEnt("spin4", "targetname");
     
    trig waittill("trigger");
    trig delete();
     
      while(1)
      {
        brush1 rotatePitch(360,4);
        brush2 rotatePitch(-360,4);
		brush3 rotatePitch(360,4);
		brush4 rotatePitch(-360,4);
        wait 12;
      }
}

trap4()
{
	trig = getent("trap4_trig", "targetname");
	brush = getent("notsolid1", "targetname");
	brush2 = getent("notsolid2", "targetname");
	trig waittill("trigger", player);
	trig delete();
	x = randomInt(2); //change the ones you want solid or not.
		if(x == 0)
			brush notsolid();
		else if(x == 1)
			brush2 notsolid();
		else
		{
		brush notsolid();
		}
}

trap5()
{
	trig = getent("trap5_trig", "targetname");
	brush = getent("spinbrush1", "targetname");
	brush2 = getent("spinbrush2", "targetname");
	brush3 = getent("spinbrush3", "targetname");
	trig waittill("trigger", player);
	trig delete();
		for(;;)
		{
		brush rotateyaw(360, 3.5);
		wait 1;
		brush2 rotateyaw(-360, 3.5);
		wait 1;
		brush3 rotateyaw(360, 3.5);
		wait 1;
		}
}

trap6()
{
	trig = getent("trap6_trig", "targetname");
	brush = getent("spindeath1", "targetname");
	brush2 = getent("spindeath2", "targetname");
	trig waittill("trigger", player);
	trig delete();
		for(;;)
		{
		brush rotateyaw(360, 0.8);
		brush2 rotateyaw(-360, 0.8);
		wait 1.3;
		}
}

trap7()
{
    trig = getent("trap7_trig", "targetname");
    brush = getent("solid1", "targetname");
    brush2 = getEnt("solid2","targetname");
    brush3 = getEnt("solid3", "targetname");
	brush4 = getent("solid4", "targetname");
	brush5 = getEnt("solid5", "targetname");
    trig waittill("trigger", player);
    trig delete();
           
        while(1)
        {
         brush notsolid();
         brush hide();
         wait randomint(8);
         brush solid();
         brush show();
         brush3 notsolid();
         brush3 hide();
         wait randomint(5);
         brush3 solid();
         brush3 show();
         brush2 notsolid();
         brush2 hide();
         wait randomint(6);
         brush2 solid();
         brush2 show();
         brush3 notsolid();
         brush3 hide();
         wait randomint(7);
         brush3 solid();
         brush3 show();
		 brush4 notsolid();
		 brush4 hide();
		 wait randomint(5);
		 brush solid();
		 brush show();
		 brush5 notsolid();
		 brush5 hide();
		 wait randomint(8);
		 brush4 solid();
		 brush4 show();
		 brush notsolid();
		 brush hide();
        }
}

startdoor()
{
	startdoor = getent("startdoor","targetname");
	if(isdefined(level.auto_open_door) && level.auto_open_door) {
		startdoor delete();
	} else {
		level waittill("round_started");
		wait 5;
		iPrintLnBold("Start door Removed..");
		startdoor delete();
	}
}
	
trap10()
{
	trig = getent("trap10_trig", "targetname");
	brush = getent("weirdsolid1", "targetname");
	brush2 = getent("weirdsolid2", "targetname");
	brush3 = getent("weirdsolid3", "targetname");
	trig waittill("trigger", player);
	trig delete();
	x = randomInt(2); //change the ones you want solid or not.
		if(x == 0)
			brush notsolid();
		else if(x == 1)
			brush2 notsolid();
		else if(x==2)
		brush3 notsolid();
		else
		{
		brush notsolid();
		brush2 notsolid();
		}
}

secretenter()
{
	trig = getEnt("secretenter_multi", "targetname");
	target = getEnt("secretenter_origin", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
			player iPrintLnBold(" ^6Welcome to secret.");
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

secretend()
{
	trig = getEnt("secretend_multi", "targetname");
	target = getEnt("secretend_origin", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
		    iPrintLnBold(player.name+" ^2Finished the secret.");
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

music()
{	
	level waittill("round_started");
	wait 1;
	ambientPlay("song1");
}

bounce()
{
	level.bounce_trig = getEnt( "bounceroom_trig", "targetname");
	bjumper = getEnt( "jumperb", "targetname" );
	bacti = getEnt( "actib", "targetname" );
		
	if( !isDefined( level.bounce_trig ) )
		return;
				
	while(1)
	{
		level.bounce_trig waittill( "trigger", player );
		
				
		if(!isdefined(level.firstenter))
		{
			level.sniper_trig delete();
			level.knife_trig delete();
			level.pistol_trig delete();
			level.shotgun_trig delete();
			level.firstenter=true;
		}
		level.activ freezeControls(1);
		player FreezeControls(1);
		
		player SetPlayerAngles( bjumper.angles );
		player setOrigin( bjumper.origin );
		level.activ setPlayerangles( bacti.angles );
		level.activ setOrigin( bacti.origin );
		
		player takeallweapons();
		player GiveWeapon( "tomahawk_mp" );
		player SwitchtoWeapon( "tomahawk_mp" );
		level.activ takeallweapons();
		level.activ GiveWeapon( "tomahawk_mp" );
		level.activ SwitchtoWeapon( "tomahawk_mp" );
				
				
		level.activ freezeControls(1);
		player FreezeControls(1);

		noti = SpawnStruct();
		noti.titleText = (player.name+"Has Chosen Bounce Room!");
		noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
		noti.duration = 6;
		noti.glowcolor = (0, 0, 1.0);
		
		players = getEntArray("player", "classname");
		for(i=0;i<players.size;i++)
				players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		
		wait 2;
		
		level.activ FreezeControls(0);
		player FreezeControls(0);
		
		
		while(isAlive(player))
				wait 1;
	}
}
	
    jumpertp()
    {
            trig = getEnt("bouncetele", "targetname");
            target = getEnt("jumpertp_origin", "targetname");
           
            while(1)
            {
                    trig waittill("trigger", player);
                   
                    {
                            player setOrigin( target.origin );
                            player setPlayerAngles( target.angles );
                    }
            }
    }
	
	actitp()
    {
            trig = getEnt("actitp_bounce", "targetname");
            target = getEnt("actitp_origin", "targetname");
           
            while(1)
            {
                    trig waittill("trigger", player);
                   
                    {
                            player setOrigin( target.origin );
                            player setPlayerAngles( target.angles );
                    }
            }
    }
	
	    pistol()
    {
     
            level.pistol_trig = getEnt( "pistol", "targetname");
        jump = getEnt( "jumperpistol", "targetname" );
        acti = getEnt( "actipistol", "targetname" );
     
         while(1)
        {
           level.pistol_trig waittill( "trigger", player );
            if( !isDefined( level.pistol_trig ) )
                return;
     
                    level.sniper_trig delete();
                    level.knife_trig delete();
                    level.bounce_trig delete();
                    level.shotgun_trig delete();
                   
                    player SetPlayerAngles( jump.angles );
            player setOrigin( jump.origin );
            level.activ setPlayerangles( acti.angles );
            level.activ setOrigin( acti.origin );
     
                    wait 0.5;
                   
                    player takeallweapons();
                    player GiveWeapon( "colt45_silencer_mp" );
            player SwitchtoWeapon( "colt45_silencer_mp" );
     
            level.activ takeallweapons();
                    level.activ GiveWeapon( "colt45_silencer_mp" );
            level.activ SwitchtoWeapon( "colt45_silencer_mp" );
     
            player FreezeControls(1);
                    level.activ FreezeControls(1);
     
                    noti = SpawnStruct();
                                            noti.titleText = (player.name+"Has Chosen Pistol Room!");
                                            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                                            noti.duration = 6;
                                            noti.glowcolor = (0, 0, 1.0);
                players = getEntArray("player", "classname");
                for(i=0;i<players.size;i++)
                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                wait 2;
     
                    player FreezeControls(0);
                    level.activ FreezeControls(0);
     
     
            while( isAlive( player ) && isDefined( player ) )
                wait 1;
        }
    }
	
shotgun()
    {
     
            level.shotgun_trig = getEnt( "shotgun", "targetname");
        jump = getEnt( "jumpershotgun", "targetname" );
        acti = getEnt( "actishotgun", "targetname" );
     
         while(1)
        {
           level.shotgun_trig waittill( "trigger", player );
            if( !isDefined( level.pistol_trig ) )
                return;
     
                    level.sniper_trig delete();
                    level.knife_trig delete();
                    level.bounce_trig delete();
                    level.pistol_trig delete();
                   
                    player SetPlayerAngles( jump.angles );
            player setOrigin( jump.origin );
            level.activ setPlayerangles( acti.angles );
            level.activ setOrigin( acti.origin );
     
                    wait 0.5;
                   
                    player takeallweapons();
                    player GiveWeapon( "winchester1200_mp" );
            player SwitchtoWeapon( "winchester1200_mp" );
     
            level.activ takeallweapons();
                    level.activ GiveWeapon( "winchester1200_mp" );
            level.activ SwitchtoWeapon( "winchester1200_mp" );
     
            player FreezeControls(1);
                    level.activ FreezeControls(1);
     
                    noti = SpawnStruct();
                                            noti.titleText = (player.name+"Has Chosen Shotgun Room!");
                                            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                                            noti.duration = 6;
                                            noti.glowcolor = (0, 0, 1.0);
                players = getEntArray("player", "classname");
                for(i=0;i<players.size;i++)
                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                wait 2;
     
                    player FreezeControls(0);
                    level.activ FreezeControls(0);
     
     
            while( isAlive( player ) && isDefined( player ) )
                wait 1;
        }
    }