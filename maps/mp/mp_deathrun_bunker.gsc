main() {
    maps\mp\_load::main();
	level.effect1 = LoadFX("smoke/hallway_steam_flood");
	level.effect2 = LoadFX( "fire/killing_fire" );
	PreCacheShellShock( "frag_grenade_mp" );
	PreCacheItem("remington700_mp");
	PreCacheItem("m40a3_mp");
	precacheModel("playermodel_baa_joker");
	precacheModel("playermodel_dnf_duke");
	
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread pvp();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8_1();
	thread old();
	thread sniper();
	thread secret();
	thread knife();
	thread joker();
	
	addTriggerToList ("trap1_trig");
	addTriggerToList ("trap2_trig");
	addTriggerToList ("trap3_trig");
	addTriggerToList ("trap4_trig");
	addTriggerToList ("trap5_trigger");
	addTriggerToList ("trap6_trigger");
	addTriggerToList ("trap7_trigger");
	addTriggerToList ("trap8_trigger");
}


addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

pvp()
{
	
	teleporter_jumpers = getEnt( "jumper_tele", "targetname" );
	teleport_acti = getEnt ("acti_teleport", "targetname");
	activator = GetTeamPlayersAlive("axis");
	trig = getEnt ("pvp_trigger", "targetname");
	
    while(1)
    {
		jumparound = getEnt ("jumparound", "targetname");
		trig waittill ("trigger", who);
		trig delete();
	
		if(GetTeamPlayersAlive("allies") != 1 || GetTeamPlayersAlive("axis") != 1)

			continue;

		
			
		players = getentarray("player", "classname");
		for(i=0;i<=players.size;i++)
		{
		

			if(players[i].pers["team"] == "allies")
			{
				players[i] SetOrigin(teleport_acti.origin);
				players[i] SetPlayerAngles( teleport_acti.angles );
				thread minigame();
			}
			else if(players[i].pers["team"] == "axis")
			{
				players[i] SetOrigin(teleporter_jumpers.origin);
				players[i] SetPlayerAngles( teleporter_jumpers.angles );
				players[i] FreezeControls (1);
				wait 2;
				players[i] FreezeControls (0);
			}
			
        }
		
		
		break;
    }
}

 minigame()
{	
	
	
	bar = getEnt ("roll", "targetname");
	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		

		if(players[i].pers["team"] == "allies")
		{
			players[i] FreezeControls (1);
		}

		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "top";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "top";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 3;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &"Welcome to Jumper";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 2;
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,1,0);
		hud_clock.label = &"You must jump over the bar and try to survive longer than your opponent";
		hud_clock SetPulseFX( 40, 5400, 200 );
		hud_clock = NewHudElem();
		hud_clock.alignX = "left";
		hud_clock.alignY = "top";
		hud_clock.horzalign = "left";
		hud_clock.vertalign = "top";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,1,0);
		hud_clock.glowcolor = (1,1,0);
		players[i] FreezeControls (0);
		hud_clock.label = &"Jumper starts in: &&1...";
		hud_clock SetTimer(6);
		hud_clock SetPulseFX( 40, 5400, 200 );	
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
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,1,0);
		hud_clock.label = &"Start Jumping !!";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 1;
		AmbientPlay ("jumparound");
		thread DoJumpRoll();
		break;
	}
}

DoJumpRoll()
{
	
	jump = getEnt("roll", "targetname");
	
	
	
	jump rotateYaw( 2880, 40);
	wait 15;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;	
	jump RotateYaw( 2880, 30 );
	wait 10;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;	
	jump RotateYaw( 2880, 20 );
	wait 9;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 15);
	wait 8;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 14 );
	wait 7;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 13);
	wait 6;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 12 );
	wait 5;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 11.5 );
	wait 4;	
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"This is the final speed. Good luck !";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	
	while(1)
	{
		jump RotateYaw( 2880, 10 );
		wait 11;
	}
}

trap1 ()
{
	trig = getEnt ("trap1_trig" , "targetname");
	gas1 = getEnt ("trap1_gas1", "targetname");
	gas2 = getEnt ("trap1_gas2", "targetname");
	gas3 = getEnt ("trap1_gas3", "targetname");
	gas4 = getEnt ("trap1_gas4", "targetname");
	gas5 = getEnt ("trap1_gas5", "targetname");
	gas6 = getEnt ("trap1_gas6", "targetname");
	hurt = getEnt ("trap1_hurt", "targetname");
	hurt2 = getEnt ("trap1_hurt2", "targetname");
	door1 = getEnt ("trap1_door1", "targetname");
	door2 = getEnt ("trap1_door2", "targetname");
	
	hurt enablelinkto();
	hurt linkto(door1);
	hurt2 enablelinkto();
	hurt2 linkto(door2);
	
	trig waittill ("trigger", who);
	trig delete();

	{
		iPrintln (who.name + " ^5Activated Trap 1");
		thread shell();
		door1 moveZ (-138,1);
		door2 moveZ (-138,1);
		playFx( level.effect1, gas1.origin);
		playFx( level.effect1, gas2.origin);
		playFx( level.effect1, gas3.origin);
		playFx( level.effect1, gas4.origin);
		playFx( level.effect1, gas5.origin);
		playFx( level.effect1, gas6.origin);
		wait 10;
		door1 moveZ (138,3);
		door2 moveZ (138,3);
       
	}
}


shell()
{
	trig = getEnt ("trap1_hurt2", "targetname");
	door2 = getEnt ("trap1_door2", "targetname");
	hurt2 = getEnt ("trap1_hurt2", "targetname");
	
	hurt2 enablelinkto();
	hurt2 linkto(door2);
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who ShellShock ( "frag_grenade_mp", 5 ); // this will shellshock the person
		wait 5;
	}
}

trap2()
{
	trig = getEnt ("trap2_trig", "targetname");
	arm = getEnt ("trap2_arm", "targetname");
	arm2 = getEnt ("trap2_arm2", "targetname");
	spikes = getEnt ("trap2_spikes", "targetname");
	hurt = getEnt ("trap2_hurt", "targetname");
	earth = getEnt ("trap2_earth", "targetname");
	
	hurt enablelinkto();
	hurt linkto(spikes);
	
	trig waittill ("trigger", who);
	trig delete();
    iPrintln (who.name + " ^5Activated Trap 2");
	
    while (1)
	{
		arm moveX (-1919,3); // this will make it move
		arm2 moveX (-1919,3); // so will this
		spikes moveX (-1919,3); // this one too
		wait 3; // this makes it wait
		Earthquake( 1, 1, earth.origin, 500 );
		wait 1;
		arm moveX (1919,2);
		arm2 moveX (1919,2);
		spikes moveX (1919,2);	
		wait 4;
	}
}

trap3()
{
	trig = getEnt ("trap3_trig", "targetname");
	trap3 = getEnt ("trap3", "targetname");
	
	trig waittill ("trigger", who);
	trig delete();
    iPrintln (who.name + " ^5Activated Trap 3");

	while(1)
	{
		trap3 rotateroll (360,5);
		wait 5;
	}
}

trap4()
{
	trig = getEnt ("trap4_trig", "targetname");
	hurt1 = getEnt ("trap4_1_hurt1", "targetname");
	hurt2 = getEnt ("trap4_1_hurt2", "targetname");
	hurt3 = getEnt ("trap4_1_hurt3", "targetname");	
	block1 = getEnt ("trap4_1", "targetname");
	block2 = getEnt ("trap4_2", "targetname");
	block3 = getEnt ("trap4_3", "targetname");
	earth = getEnt ("trap4_earth", "targetname");
	
	hurt1 enablelinkto();
	hurt1 linkto(block1);
	
	hurt2 enablelinkto();
	hurt2 linkto(block2);
	
	hurt3 enablelinkto();
	hurt3 linkto(block3);
	
	trig waittill ("trigger", who);
	trig delete();
    iPrintln (who.name + " ^5Activated Trap 4");
	
	while (1)
	{
		block1 moveZ (-206, 1);
		wait 1;
		Earthquake( 1, 1, earth.origin, 200 );	
		wait .5;
		block2 moveZ (-206, 1);
		wait 1;
		Earthquake( 1, 1, earth.origin, 200 );
		wait 1;
		block1 moveZ (206, 1);
		wait .5;
		block3 moveZ (-206, 1);
		wait .5;
		Earthquake( 1, 1, earth.origin, 200 );
		wait 0.5;
		block2 moveZ (206, 1);
		wait .5;
		block3 moveZ (206, 1);
		wait .5;
		block1 moveZ (-206,0.5);
		wait 0.5;
		Earthquake( 1, 1, earth.origin, 200 );	
		wait .5;
		block1 moveZ (206, 1);
		wait 1;
		block3 moveZ (-206, 0.5);
		wait 0.5;
		Earthquake( 1, 1, earth.origin, 200 );
		wait 2;
		block3 moveZ (206, 1);
		wait 0.5;
		block2 moveZ (-206, 0.5);
		wait 0.5;
		Earthquake( 1, 1, earth.origin, 200 );
		wait 2;
		block2 moveZ (206, 1);
		wait 2;
	}
}

trap5()
{
    fire1 = getEnt ("fire1", "targetname");
	fire2 = getEnt ("fire2", "targetname");
    hurt1 = getEnt ("hurt1", "targetname");  
	hurt2 = getEnt ("hurt2", "targetname");
	link1 = getEnt ("link1", "targetname");
	link2 = getEnt ("link2", "targetname");
    trig = getEnt ("trap5_trigger", "targetname");
  
	
	
	hurt1 enablelinkto();
	hurt1 linkto(link1);
    
	hurt2 enablelinkto();
	hurt2 linkto(link2);
	
	trig waittill ("trigger", who);
	trig delete();
    iPrintln (who.name + " ^5Activated Trap 5");
	while(1)
	{
	effect1 = SpawnFx(level.effect2,fire1.origin);
	TriggerFX(effect1);
	link1 moveY (-224,0.1);
	wait 3;
	link1 moveY (224,0.1);
	effect1 delete();
	wait 0.1;
	effect2 = SpawnFx(level.effect2,fire2.origin);
	TriggerFX(effect2);
	link2 moveY (-224,0.1);
	wait 3;
	link2 moveY (224,0.1);
	effect2 delete();
	wait 0.1;
	}
 
}

trap6()
{
	push = getEnt ("trap6_push", "targetname");
	trig = getEnt ("trap6_trigger", "targetname");
	
	trig waittill ("trigger", who);
	trig delete();
	iPrintln (who.name + " ^5Activated Trap 6");
	
	push moveZ (97,0.1);
	push waittill ("movedone");
	push moveY (256,2);
	push waittill ("movedone");
	wait 2;
	push moveY (-256,4);
	push waittill ("movedone");
	push moveZ (-97,0.1);
	push waittill ("movedone");
	
}

trap7()
{
	spikes = getEnt ("trap7_spikes", "targetname");
	trig = getEnt ("trap7_trigger", "targetname");
	hurt = getEnt ("trap7_hurt", "targetname");
	
	hurt enablelinkto();
	hurt linkto(spikes);
	
	trig waittill ("trigger", who);
	trig delete();
	iPrintln (who.name + " ^5Activated Trap 7");
	
	spikes moveZ (56,1);
	wait 4;
	spikes moveZ (-56,2);
	
}

old()
{
	door = getEnt ("old_door", "targetname");
	old_trig = getEnt ("old_trigger", "targetname");
	snipe_trig = getEnt ("snipe_trigger", "targetname");
	knife_trig = getEnt ("knife_trigger", "targetname");
	earth = getEnt ("old_earth", "targetname");
	
	old_trig waittill ("trigger", who);
	old_trig delete();
	snipe_trig delete();
	knife_trig delete();
	
	iPrintlnbold ("^5" + who.name + " ^7Opened the final door!");
	Earthquake(  .5, 5, door.origin, 300 ); //note to self: Earthquake (velocity, time, origin, radius); 
	door moveZ (-161,5);
	
}


  trap8_1()
{
	hurt = getEnt ("trap8_hurt1", "targetname");
	move1 = getEnt ("trap8_move1", "targetname");
	trig = getEnt ("trap8_trigger", "targetname");
	hurt2 = getEnt ("trap8_hurt2", "targetname");
	move2 = getEnt ("trap8_move2", "targetname");
	trig = getEnt ("trap8_trigger", "targetname");
	
	hurt2 enablelinkto();
	hurt2 linkto(move2);
	hurt enablelinkto();
	hurt linkto(move1);
	
	trig waittill ("trigger", who);
	trig delete();
	thread killplayer1();
	thread killplayer2();
	iPrintln (who.name + " ^5Activated Trap 8");

	move1 moveX (104,1);
	move2 moveX (-104,1);
	
}

killplayer1()
{

	hurt = getEnt ("trap8_hurt1", "targetname");
	
	for(;;)
	{
		hurt waittill ("trigger", player);
		player suicide();
		wait 0.1;
	}
}

killplayer2()
{

	hurt2 = getEnt ("trap8_hurt2", "targetname");
	
	for(;;)
	{
		hurt2 waittill ("trigger", player);
		player suicide();
		wait 0.1;
	}
}


 sniper()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	sniperjumper = getEnt( "sniperjumper", "targetname" );
	snipertrig = getEnt ("snipe_trigger", "targetname");
	sniperacti = getEnt ("sniperacti", "targetname");
	old_trig = getEnt ("old_trigger", "targetname");
	knife_trig = getEnt ("knife_trigger", "targetname");
	
	snipertrig waittill ("trigger", player);
	thread teleport_activator();
	old_trig delete();
	knife_trig delete();

	player FreezeControls (1);
	player SetOrigin(sniperjumper.origin);	
	player SetPlayerAngles( sniperjumper.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("remington700_mp");
	wait 0.01;
	player GiveWeapon("m40a3_mp");
	wait 0.01;
	player SwitchToWeapon("remington700_mp");
	
	wait 2;
	player FreezeControls (0);
	iPrintlnbold ("^1FIGHT!");
	
	player thread onDeath();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath()
{
	self endon("disconnect");
	
	self waittill("death");
	thread sniper();
}

teleport_activator()
{
	sniperacti = getEnt ("sniperacti", "targetname");
	players = getentarray("player", "classname");

	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis" && isAlive(players[i]))
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(sniperacti.origin);
			players[i] SetPlayerAngles( sniperacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("remington700_mp");
			wait 0.01;
			players[i] GiveWeapon("m40a3_mp");
			wait 0.01;
			players[i] SwitchToWeapon("remington700_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

secret()    
{
    sound = getEnt ("secret_origin", "targetname");
    trig = getEnt ("secret_trig", "targetname");
    
    trig waittill ("trigger", who);
    trig delete();
    
    AmbientPlay("song");    
    
    iprintlnbold("^1" + who.name + " ^7Has just found some ^1Singers!");
 
}	


knife()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	knifejumper = getEnt( "knifejumper", "targetname" );
	snipertrig = getEnt ("snipe_trigger", "targetname");
	knifeacti = getEnt ("knifeacti", "targetname");
	old_trig = getEnt ("old_trigger", "targetname");
	knife_trig = getEnt ("knife_trigger", "targetname");
	
	knife_trig waittill ("trigger", player);
	thread teleport_activatorknife();
	old_trig delete();
	snipertrig delete();

	player FreezeControls (1);
	player SetOrigin(knifejumper.origin);	
	player SetPlayerAngles( knifejumper.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("tomahawk_mp");
	wait 0.01;
	player SwitchToWeapon("tomahawk_mp");
	
	wait 2;
	player FreezeControls (0);
	iPrintlnbold ("^1FIGHT!");
	
	player thread onDeath1();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath1()
{
	self endon("disconnect");
	
	self waittill("death");
	thread knife();
}

teleport_activatorknife()
{
	knifeacti = getEnt ("knifeacti", "targetname");
	players = getentarray("player", "classname");

	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis" && isAlive(players[i]))
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(knifeacti.origin);
			players[i] SetPlayerAngles( knifeacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("tomahawk_mp");
			wait 0.01;
			players[i] SwitchToWeapon("tomahawk_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

 joker()
{
	while(1)
	{
		level waittill( "jumper", who ); 
		
		if(who.pers["team"] == "axis") 
		{
			who setModel( "playermodel_dnf_duke" ); // adds the model
		}
		else
		{
			who setModel( "playermodel_baa_joker" ); // adds the model
		}
	}
}