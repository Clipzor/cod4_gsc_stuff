//Map by Kris
//Thanks to Poseidon for letting me use his script ^^
//Thanks to Mrozy for fixing the script :D

main()
{
	precacheItem("knife_arrow_mp");
 maps\mp\_load::main();

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
	setdvar("g_speed" ,"210");
	setdvar("dr_jumpers_speed" ,"1.12");
	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	thread messages();
	thread songactivate();
	thread fishninja();
	thread startdoor();
	thread trap6();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5a();
	thread trap5b();
	thread trap5c();
	thread deagle();
	thread old();
	thread sniper();
	thread knife();
	thread jump();
	thread jumpweapon();
	thread jumperteleport();
	thread activatorteleport();
	thread secret();
	thread secretopen();
	thread secrethard();
	thread secrettp1();
	thread secrettp2();
	thread secrettp3();
	thread secrettp4();
	thread secrettp5();
	thread secrettp6();
	thread secrettp7();
	thread secretend();
	thread actiarea1();
	thread actiarea2();
	thread actiarea2back();
	thread actiarea3();
	thread trap7();
	thread trap7a();
	thread trap7b();
	thread trap7c();
	thread trap7d();
	thread trap7e();
	//V2
	// Why you add thread v2 to script? It isn't easier to add thread here? ^^
	thread v2trap1();
	thread v2trap2();
	thread v2trap3();
	thread v2secrettp2();
	thread v2secrettp3();
	thread v2secrettp4();
	thread v2secrettp5();
	thread v2secretend();
	thread v2secret();
	
	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_v2trap1" );
	addTriggerToList( "trig_v2trap2" );
	addTriggerToList( "trig_v2trap3" );


	level.firstenter = true;
}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

fishninja() {
	self.welcomeused = 0;
	
	if( self.welcomeused == 0 ) {
	level waittill("connected",player);
		if(player getGuid() == "c202a498938e04217abc776445e072dd")	{
			wait 5;
			iPrintLnBold( "^3KING");
			wait 1;
			iPrintLnBold( "^6Ninja^1Wa" );
			wait 1;
			iPrintLnBold( "^7is" );
			wait 1;
			iPrintLnBold( "here ^1:'D" );
		}
		else if(player getGuid() == "c00c1d0305de2e0cab28a0eb6f6d0d02")	{
			wait 5;
			iPrintLnBold("^2Da");
			wait 1;
			iPrintLnBold("^1BAUSS");
			wait 1;
			iPrintLnBold("^3Fish");
			wait 1;
			iPrintLnBold("^7is here! :D");
			wait 1;
		}
	self.welcomeused = 1;
	}
}

messages()
{
wait 6;
iPrintLnBold("^1Mp_dr_heavyweight_v2");																																																								wait 10;			iPrintLnBold("^1Ninja has been here heheheh  >:D"); wait 1;              iPrintLnBold("^1Fish saw it nub -.-");	
wait 1;
iPrintLnBold("^2Map made by Fish Da Rekter/Kris");
wait 1;
iPrintLnBold("^3Thanks to NinjaWa for help");
wait 1;
iPrintLn("^3Big thanks to my map testers :D");
}

songactivate()
{
trig = getent("songactivate", "targetname");
trig waittill ("trigger", player);

{
AmbientPlay("heavy1");
iPrintLn ("^0>> ^1Now playing: ^2 Don Diablo - Silent Shadows (Mind Vortex Remix) ^0<<");
iPrintLn ("^0>> ^1Now playing: ^2 Don Diablo - Silent Shadows (Mind Vortex Remix) ^0<<");
iPrintLn ("^0>> ^1Now playing: ^2 Don Diablo - Silent Shadows (Mind Vortex Remix) ^0<<");
}
trig delete();
}

startdoor()
{
door = getent("startdoor","targetname");
{
wait 6;
door moveZ(-200, 4);
iPrintLnBold("^3Start door opened.");
wait 2;
}
}


trap6()
{
	lift = getent("trap6", "targetname");
	trig = getent("trig_trap6", "targetname");
	trig waittill("trigger", player );
	
	
	{
	iPrintLnBold("^5" + player.name + "^2 finished the map" + "^1 1st");
	lift moveZ (320, 1);
	}

}

trap1()
{
	platform = getent("trap1", "targetname");
	trig = getent("trig_trap1", "targetname");
	trig SetHintString("^1 Bring em down!");
	trig waittill("trigger", player );
	
	
	{
	wait 0.1;
	platform moveZ (-224, 0.5);
	wait 2;
	platform moveZ (224, 0.5);
	}
	
	trig delete();
}


trap2()
{
	block = getent("trap2", "targetname");
	trig = getent("trig_trap2", "targetname");
	trig SetHintString("^1 Spin their heads off!");
	trig waittill("trigger", player );
	
	
	for(;;)
	{
	block rotateYaw(720, 1.5);
	block moveY (-512, 1.5);
	wait 1.5;
	block rotateYaw(720, 1.5);
	block moveY (512, 1.5);
	wait 1.5;
	}
	
	trig delete ();
}


trap3()
{
	square = getent("trap3a", "targetname");
	trig = getent("trig_trap3", "targetname");
	square2 = getent("trap3b", "targetname");
	trig = getent("trig_trap3", "targetname");
	pravokutnik = getent("trap3c", "targetname");
	trig = getent("trig_trap3", "targetname");
	remove = getent("trap3d", "targetname");
	trig = getent("trig_trap3", "targetname");
	remove2 = getent("trap3e", "targetname");
	trig = getent("trig_trap3", "targetname");
	remove3 = getent("trap3f", "targetname");
	trig = getent("trig_trap3", "targetname");
	trig SetHintString("^1 Its obvious nub -.-");
	trig waittill("trigger", player);
	
	{
	remove delete();
	remove2 delete();
	remove3 delete();
	wait 0.1;
	}
	
	for(;;)
	{
	square moveY (-80, 0.5);
	square2 moveY (80, 0.5);
	wait 0.5;
	pravokutnik moveY (64, 0.5);
	wait 0.5;
	square moveY (80, 0.5);
	square2 moveY (-80, 0.5);
	wait 0.5;
	pravokutnik moveY (-64, 0.5);
	wait 0.5;
	}
	
	trig delete ();
}


trap4()
{
	blockade = getent("trap4a", "targetname");
	trig = getent("trig_trap4", "targetname");
	blockade2 = getent("trap4b", "targetname");
	trig = getent("trig_trap4", "targetname");
	blockade3 = getent("trap4c", "targetname");
	trig = getent("trig_trap4", "targetname");
	blockade4 = getent("trap4d", "targetname");
	trig = getent("trig_trap4", "targetname");
	blockade5 = getent("trap4e", "targetname");
	trig = getent("trig_trap4", "targetname");
	trig SetHintString("^1 Staph da bounce!");
	trig waittill("trigger", player);
	
	{
	wait 0.1;
	blockade moveZ (128, 0.5);
	wait 3;
	blockade moveZ (-128, 0.5);
	}
	
	for(;;)
	{
	blockade2 moveX (-120, 0.5);
	blockade3 moveX (-120 ,0.5);
	blockade4 moveX (-120, 0.5);
	blockade5 moveX (-120 ,0.5);
	wait 1;
	blockade2 moveX (120, 0.5);
	blockade3 moveX (120 ,0.5);
	blockade4 moveX (120, 0.5);
	blockade5 moveX (120 ,0.5);
	wait 1;
	}
	
	trig delete ();
}
	
	
trap5a()
{
	mover = getent("trap5a", "targetname");
	trig = getent("trig_trap5", "targetname");
	mover2 = getent("trap5b", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("^1 Pin them down!");
	
	{
	wait 1;
	}
	
	for(;;)
	{
	mover moveY (-608, 3);
	mover2 moveY (608, 3);
	wait 3;
	mover moveX (384, 2);
	mover2 moveX (-384, 2);
	wait 2;
	mover moveY (608, 3);
	mover2 moveY (-608, 3);
	wait 3;
	mover moveX (-384, 2);
	mover2 moveX (384, 2);
	wait 2;
	}
	
	trig delete();
}

trap5b()
{
	puller = getent("trap5c", "targetname");
	trig = getent("trig_trap5", "targetname");
	puller2 = getent("trap5d", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("^1 Pin them down!");
	trig waittill("trigger", player);
	
	for(;;)
	{
	puller moveY (-768,1);
	puller2 moveY (768, 1);
	wait 1.5;
	puller moveY (768,1);
	puller2 moveY (-768, 1);
	wait 1.5;
	}
	
	trig delete();
}

trap5c()
{
	spinner = getent("trap5e", "targetname");
	trig = getent("trig_trap5", "targetname");
	spinner2 = getent("trap5f", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("^1 Pin them down!");
	trig waittill("trigger", player);
	
	for(;;)
	{
	wait 0.1;
	spinner rotateroll(360, 3);
	spinner2 rotateroll(-360, 3);
	wait 0.1;
	}
	
	trig delete ();
}

deagle()
{			
			give_deagle = getent ( "deagle" , "targetname");
			give_deagle waittill ( "trigger" , player);
			player giveweapon("knife_arrow_mp");
			player switchToWeapon("knife_arrow_mp"); 
			give_deagle delete();
}

old()
{
			level.old_trigger = getent ( "oldroom", "targetname" );
			level.knife_trigger = getent("trig_knife", "targetname");
			level.sniper_trigger = getEnt("trig_sniper", "targetname");
			level.jump_trigger = getent("trig_jump", "targetname");
			door = getent ( "actidoor", "targetname" );
			level.old_trigger waittill ( "trigger", player );
		
			{
		
			level.old_trigger delete ();
			level.knife_trigger delete();
			level.sniper_trigger delete();
			level.jump_trigger delete();
		
			iPrintLnBold("^8" + player.name + "^2 entered the old room");
			door moveZ (-192, 2);
			wait 1;
			}
}


sniper()
{		
		level.teleactorigin3 = getEnt("sniper_activator", "targetname");
		telejumporigin3 = getEnt("sniper_jumper", "targetname");
		level.sniper_trigger = getEnt("trig_sniper", "targetname");
		level.old_trigger = getEnt("oldroom", "targetname");
		level.knife_trigger = getent("trig_knife", "targetname");
		level.jump_trigger = getent("trig_jump", "targetname");

		while(1)
		{
		level.sniper_trigger waittill( "trigger", player );
		
		
		level.old_trigger delete();
		level.knife_trigger delete();
		level.jump_trigger delete();


		if( !isDefined( level.sniper_trigger ))
					return;
			if(level.firstenter==true)
		{
				//level.knife_trigger delete();
				level.old_trigger delete();
				//level.jump_trigger delete();
				level.firstenter=false;
				} 
				wait(0.05);
		player setOrigin( telejumporigin3.origin );
		player setPlayerAngles( telejumporigin3.angles );
		player takeAllWeapons();
		player giveWeapon("m40a3_mp");
		player giveWeapon( "remington700_mp" ); 
		player giveMaxAmmo("m40a3_mp");
		player giveMaxAmmo( "remington700_mp" );
		wait (0.05);
		player switchToWeapon("m40a3_mp"); 
		wait(0.05);
		level.activ setOrigin (level.teleactorigin3.origin);
		level.activ setPlayerAngles (level.teleactorigin3.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon( "m40a3_mp" );
		level.activ giveWeapon( "remington700_mp" );
		level.activ giveMaxAmmo("m40a3_mp");
		level.activ giveMaxAmmo( "remington700_mp" );
		wait (0.05);
		level.activ switchToWeapon("m40a3_mp");
		player freezeControls(true); 
		level.activ freezeControls(true);
		iPrintLnBold( " ^3" + player.name + " ^2 has entered the Sniper room^2!" );
		wait 2;
		player freezeControls(false); 
		level.activ freezeControls(false); 
		
		player waittill( "death" );
		level.PlayerInRoom = false;

}

}

knife()
{		
		level.teleactorigin2 = getEnt("knife_activator", "targetname");
		telejumporigin2 = getEnt("knife_jumper", "targetname");
		level.knife_trigger = getent("trig_knife", "targetname");
		level.sniper_trigger = getEnt("trig_sniper", "targetname");
		level.old_trigger = getEnt("oldroom", "targetname");
		level.jump_trigger = getent("trig_jump", "targetname");
		
		while(1)
		{
		level.knife_trigger waittill( "trigger", player );
		
		
			if( !isDefined( level.knife_trigger ))
			return;
			if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_trigger delete();
		level.jump_trigger delete();
		level.firstenter=false;
		}
		
		{
		wait (0.05);
		
		player setOrigin( telejumporigin2.origin );
		player setPlayerAngles( telejumporigin2.angles );
		player takeAllWeapons();
		player giveWeapon("knife_arrow_mp");
		player switchToWeapon("knife_arrow_mp"); 
		wait(0.05);
		level.activ setOrigin (level.teleactorigin2.origin);
		level.activ setPlayerAngles (level.teleactorigin2.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon( "knife_arrow_mp" );
		level.activ switchToWeapon("knife_arrow_mp"); 
		player freezeControls(true); 
		level.activ freezeControls(true);
		iPrintLnBold( " ^3" + player.name + " ^2 has entered the Knife room^2!" ); 		
		wait 2;
		player freezeControls(false); 
		level.activ freezeControls(false); 		
		
		player waittill( "death" );
		level.PlayerInRoom = false;

		}

}

}

jump()
{	
		level.teleactorigin = getEnt("jump_activator", "targetname");
		telejumporigin = getEnt("jump_jumper", "targetname");
		level.jump_trigger = getent("trig_jump", "targetname");
		level.knife_trigger = getent("trig_knife", "targetname");
		level.sniper_trigger = getEnt("trig_sniper", "targetname");
		level.old_trigger = getEnt("oldroom", "targetname");
		
	
		
		while(1)
		{
		level.jump_trigger waittill( "trigger", player );
		
		
		if( !isDefined( level.jump_trigger ))
					return;
			if(level.firstenter==true)
				{
				level.sniper_trigger delete();
				level.knife_trigger delete();
				level.old_trigger delete();
				level.firstenter=false;
				} 
				wait(0.05);
		
		player setOrigin( telejumporigin.origin );
		player setPlayerAngles( telejumporigin.angles );
		player takeAllWeapons();
		player giveWeapon("knife_arrow_mp");
		wait (0.05);
		player switchToWeapon("knife_arrow_mp"); 
		wait (0.05);
		level.activ setOrigin (level.teleactorigin.origin);
		level.activ setPlayerAngles (level.teleactorigin.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon( "knife_arrow_mp" );
		wait (0.05);
		level.activ switchToWeapon("knife_arrow_mp");
		player freezeControls(true); 
		level.activ freezeControls(true);
		iPrintLnBold( " ^3" + player.name + " ^2 has entered the Jump room^2!" );
		wait 2;
		player freezeControls(false); 
		level.activ freezeControls(false); 
		
		player waittill( "death" );
		level.PlayerInRoom = false;
		}
}

jumpweapon()
{
weapon = getent("jump_weapon", "targetname");
weapon sethintstring ("^2 Press &&1 for weapon!");

while(1)
{
weapon waittill ("trigger", player);
player giveWeapon ("m40a3_mp");
player giveMaxAmmo ("m40a3_mp");
player switchToWeapon ("m40a3_mp");
player iPrintLnBold ("^3 You got a sniper!");
}

}




jumperteleport()
{
	trig = getent("trigger_teleport1", "targetname");
	tele1 = getent("origin_teleport1", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (tele1.origin);
	}
}

activatorteleport()
{
	trig2 = getent("trigger_teleport2", "targetname");
	tele2 = getent ("origin_teleport2", "targetname");
	
	for(;;)
	{
		trig2 waittill("trigger", player);
		player setOrigin (tele2.origin);
	}
}

secret()
{
	trigsecret = getent("trigger_teleportsecret", "targetname");
	telesecret = getent ("origin_teleportsecretroom", "targetname");
	
	while(1)
	{
		trigsecret waittill("trigger", player);
		player setOrigin (telesecret.origin);
		player iPrintLnBold ("^2Gl ^3 mate!");
	}
}

secrethard()
{
hard = getent("origin_teleportsecret", "targetname");
trighard = getent("secrethard", "targetname");

while(1)
{
trighard waittill ("trigger", player);
player setOrigin (hard.origin);
iPrintLnBold(" ^1 OMG nub ^3" + player.name + " ^2 entered the ^1 HARD ^2 secret!" );

player thread secretTimer();

}

}

SecretTimer()
{
        self endon( "disconnect" );
 
        self.secret_timer = NewClientHudElem( self );
        self.secret_timer.y = 10;
        self.secret_timer.alignX = "center";
        self.secret_timer.alignY = "middle";
        self.secret_timer.horzAlign = "center";
        self.secret_timer.sort = -3;
        self.secret_timer.fontScale = 2;
        self.secret_timer.owner = self;
        self.secret_timer thread removehudifsuicide();
 
        self.secret_time_left = 120;
        self.secret_finished = false;
 
        while( self.secret_time_left > 0 && !self.secret_finished )
        {
                self.secret_timer setText( "^5Time until you die: ^6" + self.secret_time_left );
                self.secret_time_left--;
                wait 1;
        }
       
        if( !self.secret_finished )
        {
                self.secret_timer Destroy();
                self Suicide();
                self iPrintLnBold( "^2 I knew you wouldnt make it, ^1nub." );
        }
       
}

removehudifsuicide() 
{
        self endon ("death");
        self endon ("disconnect");
        self.owner waittill("death", player);
                player.secret_finished = true;
                player.secret_timer destroy();
                self destroy();
       
}

	


secretopen()
{
	secrettrig = getent("open_secret", "targetname");
	secrettrig2 = getent("open_secret2", "targetname");
	secrettrig waittill("trigger", player);
	
	
	{
	iPrintLnBold("^3Why u shoot my name nub -.-");
	secrettrig2 moveZ(-200, 1);
	AmbientStop(3);
    MusicStop(3);
    AmbientStop(0);
    MusicStop(0);
	ambientPlay("heavy2");
	iPrintLn ("^0>> ^1Now playing: ^2 Party Favor - Booty Loose (feat. Fly Boi Keno) ^0<<");
	iPrintLn ("^0>> ^1Now playing: ^2 Party Favor - Booty Loose (feat. Fly Boi Keno) ^0<<");
	iPrintLn ("^0>> ^1Now playing: ^2 Party Favor - Booty Loose (feat. Fly Boi Keno) ^0<<");	
	secrettrig delete();
	}
}


secrettp1()
{
	trigtp1 = getent("trigger_tp1", "targetname");
	teletp1 = getent("origin_tp1", "targetname");
	
	for(;;)
	{
		trigtp1 waittill("trigger", player);
		player setOrigin (teletp1.origin);
	}
}

secrettp2()
{
	trigtp2 = getent("trigger_tp2", "targetname");
	teletp2 = getent("origin_tp2", "targetname");
	
	for(;;)
	{
		trigtp2 waittill("trigger", player);
		player setOrigin (teletp2.origin);
	}
}

secrettp3()
{
	trigtp3 = getent("trigger_tp3", "targetname");
	teletp3 = getent("origin_tp3", "targetname");
	
	for(;;)
	{
		trigtp3 waittill("trigger", player);
		player setOrigin (teletp3.origin);
	}
}	
secrettp4()
{
	trigtp4 = getent("trigger_tp4", "targetname");
	teletp4 = getent("origin_tp4", "targetname");
	
	for(;;)
	{
		trigtp4 waittill("trigger", player);
		player setOrigin (teletp4.origin);
	}
}

secrettp5()
{
	trigtp5 = getent("trigger_tp5", "targetname");
	teletp5 = getent("origin_tp5", "targetname");
	
	for(;;)
	{
		trigtp5 waittill("trigger", player);
		player setOrigin (teletp5.origin);
	}
}

secrettp6()
{
	trigtp6 = getent("trigger_tp6", "targetname");
	teletp6 = getent("origin_tp6", "targetname");
	
	for(;;)
	{
		trigtp6 waittill("trigger", player);
		player setOrigin (teletp6.origin);
	}
}

secrettp7()
{
	trigtp7 = getent("trigger_tp7", "targetname");
	teletp7 = getent("origin_tp7", "targetname");
	
	for(;;)
	{
		trigtp7 waittill("trigger", player);
		player setOrigin (teletp7.origin);
	}
}

secretend()
{
	trigtpend = getent("trigger_secretend", "targetname");
	teletpend = getent("origin_secretend", "targetname");
	
	for(;;)
	{
		trigtpend waittill("trigger", player);
		
		player.secret_finished = true;
        player.secret_timer Destroy();
		
		player setOrigin (teletpend.origin);
		iPrintLnBold(" ^1 WOW nub ^3" + player.name + " ^1 finished the ^2 HARD ^1 secret!" );
		player iPrintLnBold("^1Well done ^^");
		wait 1;
		player iPrintLnBold("^2 Enjoy.");
		wait 2;
		player giveWeapon ("knife_arrow_mp");
		player switchToWeapon ("knife_arrow_mp");
		player iPrintLnBold (" ^3Take this my ^4friend. ");
		
	}
}

actiarea1()
{
	trigarea1 = getent("trigger_area1", "targetname");
	telearea1 = getent("origin_area1", "targetname");
	
	for(;;)
	{
		trigarea1 waittill("trigger", player);
		player setOrigin (telearea1.origin);
	}
}


actiarea2()
{
	trigarea2 = getent("trigger_area2", "targetname");
	telearea2 = getent("origin_area2", "targetname");
	
	for(;;)
	{
		trigarea2 waittill("trigger", player);
		player setOrigin (telearea2.origin);
	}
}

actiarea2back()
{
	trigarea2back = getent("trigger_area2back", "targetname");
	telearea2back = getent("origin_area2back", "targetname");
	
	for(;;)
	{
		trigarea2back waittill("trigger", player);
		player setOrigin (telearea2back.origin);
	}
}

actiarea3()
{
	trigarea3 = getent("trigger_area3", "targetname");
	telearea3 = getent("origin_area3", "targetname");
	
	for(;;)
	{
		trigarea3 waittill("trigger", player);
		player setOrigin (telearea3.origin);
	}
}

trap7()
{
	platform = getent("trap7a", "targetname");
	trig = getent("trig_trap7", "targetname");
	trig SetHintString("^1 Drop em!");
	trig waittill("trigger", player);
	
	{
	
	platform delete();
	}
	
	trig delete();
}

trap7a()
{
	pusher1 = getent("trap7b", "targetname");
	trig = getent("trig_trap7", "targetname");
	trig SetHintString("^1 Drop em!");
	trig waittill("trigger", player);
	
	for(;;)
	
	{
	pusher1 moveY (-48, 1);
	wait 1.5;
	pusher1 moveY (48, 1);
	wait 1.5;
	}
	
	trig delete();
}
	
trap7b()
{
	pusher2 = getent("trap7c", "targetname");
	trig = getent("trig_trap7", "targetname");
	trig SetHintString("^1 Drop em!");
	trig waittill("trigger", player);

	wait 1.5;
	
	for(;;)
	
	{
	pusher2 moveY (-48, 1);
	wait 1.5;
	pusher2 moveY (48, 1);
	wait 1.5;
	}
	
	trig delete();
}


trap7c()
{
	pusher3 = getent("trap7d", "targetname");
	trig = getent("trig_trap7", "targetname");
	trig SetHintString("^1 Drop em!");
	trig waittill("trigger", player);
	
	wait 3;
	
	for(;;)
	
	{
	pusher3 moveY (-48, 1);
	wait 1.5;
	pusher3 moveY (48, 1);
	wait 1.5;
	}
	
	trig delete();
}

trap7d()
{
	pusher4 = getent("trap7e", "targetname");
	trig = getent("trig_trap7", "targetname");
	trig SetHintString("^1 Drop em!");
	trig waittill("trigger", player);
	
	wait 4.5;
	
	for(;;)
	
	{
	pusher4 moveY (-48, 1);
	wait 1.5;
	pusher4 moveY (48, 1);
	wait 1.5;
	}
	
	trig delete();
}

trap7e()
{
	pusher5 = getent("trap7f", "targetname");
	trig = getent("trig_trap7", "targetname");
	trig SetHintString("^1 Drop em!");
	trig waittill("trigger", player);
	
	wait 6;
	
	for(;;)
	
	{
	pusher5 moveY (-48, 1);
	wait 1.5;
	pusher5 moveY (48, 1);
	wait 1.5;
	}
	
	trig delete();
}

v2trap1()
{
main = getent("v2trap1main", "targetname");
trig = getent("trig_v2trap1", "targetname");
trig sethintstring ("^1Spin em out!");
trig waittill ("trigger", player);

{
wait 0.1;
main moveZ (152, 0.1);
}

while(1)
{  
main rotateYaw (360, 4);
wait 0.1;
}

}

v2trap2()
{
bounce = getent("v2trap2", "targetname");
trig = getent("trig_v2trap2","targetname");
trig sethintstring ("^1Make it spin!");
trig waittill ("trigger", player);

{
wait 0.1;
}

while(1)
{
bounce rotateYaw (360, 2);
wait 4;
}

}

v2trap3()
{
blocky1 = getent("v2trap3a", "targetname");
blocky2 = getent("v2trap3b", "targetname");
blocky3 = getent("v2trap3c", "targetname");
blocky4 = getent("v2trap3d", "targetname");
trig = getent("trig_v2trap3", "targetname");
trig sethintstring ("^1Suprise 0.o!");
trig waittill ("trigger", player);

{
wait 0.1;
}

x=randomint(1);

	if(x==0) {
	blocky1 notsolid();
	blocky4 notsolid();
	blocky2 hide();
	blocky3 hide();
	}
	if(x==1) {
	blocky2 notsolid();
	blocky3 notsolid();
	blocky1 hide();
	blocky4 hide();
	}

}

v2secrettp2()
{
v2tele2 = getent("origin_secreteasy2", "targetname");
v2trig2 = getent("trigger_secreteasy2", "targetname");

for(;;)
{
v2trig2 waittill ("trigger", player);
player setOrigin (v2tele2.origin);
}

}
v2secrettp3()
{
v2tele3 = getent("origin_secreteasy3", "targetname");
v2trig3 = getent("trigger_secreteasy3", "targetname");

for(;;)
{
v2trig3 waittill ("trigger", player);
player setOrigin (v2tele3.origin);
}

}
v2secrettp4()
{
v2tele4 = getent("origin_secreteasy4", "targetname");
v2trig4 = getent("trigger_secreteasy4", "targetname");

for(;;)
{
v2trig4 waittill ("trigger", player);
player setOrigin (v2tele4.origin);
}

}
v2secrettp5()
{
v2tele5 = getent("origin_secreteasy5", "targetname");
v2trig5 = getent("trigger_secreteasy5", "targetname");

for(;;)
{
v2trig5 waittill ("trigger", player);
player setOrigin (v2tele5.origin);
}

}

v2secretend()
{
v2teleend = getent("origin_secreteasydone", "targetname");
v2trigend = getent("trigger_secreteasydone", "targetname");

for(;;)
{
		v2trigend waittill ("trigger", player);

		player.secret_finished = true;
        player.secret_timer Destroy();
		
		player setOrigin (v2teleend.origin);
		iPrintLnBold(" ^1 Pro ^3" + player.name + " ^1 finished the ^2 EASY ^1 secret!" );
		player iPrintLnBold("^1That was too easy wasnt it? ^^");
		wait 1;
		player iPrintLnBold("^2 Now try hard one.");
		wait 1;
		player iPrintLnBold("^3 Biatch.");
}

}	

v2secret()
{
easy = getent("secreteasyenter", "targetname");
trigeasy = getent("secreteasy", "targetname");

while(1)
{
trigeasy waittill ("trigger", player);
player setOrigin (easy.origin);
iPrintLnBold(" ^1 Pro ^3" + player.name + " ^2 entered the ^1 EASY ^2 secret!" );

player thread secretTimer2();

}

}

SecretTimer2()
{
        self endon( "disconnect" );
 
        self.secret_timer = NewClientHudElem( self );
        self.secret_timer.y = 10;
        self.secret_timer.alignX = "center";
        self.secret_timer.alignY = "middle";
        self.secret_timer.horzAlign = "center";
        self.secret_timer.sort = -3;
        self.secret_timer.fontScale = 2;
        self.secret_timer.owner = self;
        self.secret_timer thread removehudifsuicide2();
 
        self.secret_time_left = 120;
        self.secret_finished = false;
 
        while( self.secret_time_left > 0 && !self.secret_finished )
        {
                self.secret_timer setText( "^5Time until you die: ^6" + self.secret_time_left );
                self.secret_time_left--;
                wait 1;
        }
       
        if( !self.secret_finished )
        {
                self.secret_timer Destroy();
                self Suicide();
                self iPrintLnBold( "^2 Wow why dont u try normal way? ^1 U might have more ^3 luck ^1 there pro." );
        }
       
}

removehudifsuicide2() 
{
        self endon ("death");
        self endon ("disconnect");
        self.owner waittill("death", player);
                player.secret_finished = true;
                player.secret_timer destroy();
                self destroy();
       
}
	

			