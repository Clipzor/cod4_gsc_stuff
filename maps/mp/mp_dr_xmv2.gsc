main()
{
	level._trap1fx = loadfx ("xm/trap1");
	level._effect["xmfx"] = loadfx( "xm/start" );

	maps\mp\_load::main();

	precacheitem("m1014_mp");
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	thread teleporters();
	thread arrowshow();

	thread trap1();
	thread trap2_setup();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread kniferoom();
	thread sniperroom();
	thread shotgunroom();
	thread jumproom();
	thread jumproom_failtrig();
	thread jumproom_sniper();

	addTriggerToList("trap1trig");
	addTriggerToList("trap2trig");
	addTriggerToList("trap3trig");
	addTriggerToList("trap4trig");
	addTriggerToList("trap5trig");
	addTriggerToList("trap6trig");
	addTriggerToList("trap7trig");
	addTriggerToList("trap8trig");
	addTriggerToList("trap9trig");
	addTriggerToList("trap10trig");

	level waittill("round_started");
	thread playspawnfxes();

	thread startdoor();
	thread movingplat();
	x = randomint(3);
	switch(x)
	{
		case 0:
		thread musicandhud("music1","Avicii - Levels");
		break;

		case 1:
		thread musicandhud("music2","Locco Lovers - Booty Bitch");
		break;

		case 2: 
		thread musicandhud("music3","Nightstep - Alive");
		break;
	}
}

musicandhud(song,text)
{
	if(!isdefined(song) || !isdefined(text))
		return;

	ambientstop();
	ambientplay(song);

	level.musichud=newhudelem();
	level.musichud.alignx="left";
	level.musichud.aligny="center";
	level.musichud.horzalign="left";
	level.musichud.vertalign="center";
	level.musichud.alpha=1;
	level.musichud.x=-400;
	level.musichud.y=300;
	level.musichud.font = "default";
	level.musichud.fontscale=1.5;	
	level.musichud.glowalpha=1;
	if(isdefined(level.randomcolor))
		level.musichud.glowcolor=level.randomcolor;
	else 
		level.musichud.glowcolor=(1,0,0);
	
	level.musichud settext("Music: ^3"+text);
	wait .1;
	level.musichud moveovertime(1);
	level.musichud.x=7;
	wait 20;
	level.musichud moveovertime(1);
	level.musichud.x = -100;
	wait 1;
	level.musichud destroy();
}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

playspawnfxes()
{
	PlayFX(level._effect["xmfx"],(384, 384, 384));
	PlayFX(level._effect["xmfx"],(384, 384, 240));
	PlayFX(level._effect["xmfx"],(384, 384, 128));
	PlayFX(level._effect["xmfx"],(384, -384, 384));
	PlayFX(level._effect["xmfx"],(384, -384, 240));
	PlayFX(level._effect["xmfx"],(384, -384, 128));
}

startdoor()
{
	door = getent("startdoor","targetname");
	wait randomint(5);
	door moveZ(176,3);
}

movingplat()
{
	level.movingplat = getent("movingplat","targetname");
	mover1 = getent("mover1","targetname");
	mover2 = getent("mover2","targetname");
	for(;;)
	{
		level.movingplat movey(336,1);
		wait 2;
		level.movingplat movey(-336,1);
		wait 2;
	}
}

arrowshow()
{
	arrow = getent("arrowshow","targetname");
	for(;;)
	{
		arrow movey(-128,2,.5,1.5);
		arrow waittill("movedone");
		arrow movey(128,2,.5,1.5);
		wait 2;
	}
}

teleporters()
{       
 	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporters();
}
 
transporters()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}

trap1()
{
	trig = getent("trap1trig","targetname");
	killtrigtrap1 = getent("killtrigtrap1","targetname");
	killtrigtrap1 maps\mp\_utility::triggerOff();
	trig waittill("trigger",player);
	killtrigtrap1 maps\mp\_utility::triggerOn();
	fire = spawn("script_model",(896, 0, -152));
	fire PlayLoopSound("fire_wood_small");
	fire.angles = (270, 337.822, 22.1777);
	fire SetModel("tag_origin");
	wait .1;
	PlayFXOnTag ( level._trap1fx, fire, "tag_origin" );
	wait randomint(10)+2;
	fire delete();
	killtrigtrap1 delete();
}

trap2_setup()
{
	trig = getent("trap2trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	for(i=1;i<=8;i++)
	{
		thread trap2(i);
	}
}

trap2(num)
{
	plat = getent("plat_"+num,"targetname");
	x = randomint(10);
	if(x <= 5)
	{
		plat hide();
		wait randomint(5);
		plat show();
	}
	if(x > 5)
	{
		plat notsolid();
		wait randomint(5);
		plat solid();
	}
}

trap3()
{
	bounce = getent("trap3b","targetname");
	trig = getent("trap3trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	bounce notsolid();
	bounce hide();
	wait randomint(10)+1;
	bounce show();
	bounce solid();
}

trap4()
{
	bounce = getent("trap4b","targetname");
	trig = getent("trap4trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	bounce notsolid();
	bounce hide();
	wait randomint(10)+1;
	bounce show();
	bounce solid();
}

trap5()
{
	trig = getent("trap5trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	level.movingplat notsolid();
	wait randomint(5);
	level.movingplat solid();
}

trap6()
{
	plats = getent("trap6plats","targetname");
	bounce = getent("trap6bounce","targetname");
	trig = getent("trap6trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	x = randomint(10);
	if(x < 5)
		plats delete();
	else
		bounce delete();
}

trap7()
{
	rotingplat1 = getent("rotingplat1","targetname");
	rotingplat2 = getent("rotingplat2","targetname");
	pillar1 = getent("pillar1","targetname");
	pillar2 = getent("pillar2","targetname");
	trig = getent("trap7trig","targetname");
	rotingplat1 thread rotation1();
	rotingplat2 thread rotation1();
	trig waittill("trigger",player);
	trig delete();
	level notify("trap7");
	rotingplat1 thread rotation2();
	rotingplat2 thread rotation2();
	if(pillar1 candelete())
		pillar1 delete();
	if(pillar2 candelete())
		pillar2 delete();
}

candelete()
{
	can = randomint(10);
	if(can < 5)
		return true;
	else
		return false;
}

rotation1()
{
	level endon("trap7");
	for(;;)
	{
		wait .1;
		self rotateyaw(180,2);
	}
}

rotation2()
{	x = randomint(10);
	for(;;)
	{
		if(x < 5)
		{
		wait .1;
		self rotateyaw(-180,2);
		}
		else if(x >= 5)
		{
			wait .1;
			self rotateyaw(180,2);
		}
	}
}

trap8()
{
	trig = getent("trap8trig","targetname");
	slider1 = getent("slider1","targetname");
	slider2 = getent("slider2","targetname");
	trig waittill("trigger",player);
	trig delete();
	x = randomint(10);
	if(x < 5)
	{
		slider1 notsolid();
		slider1 hide();
		wait x+1;
		slider1 solid();
		slider1 show();
	}
	else{
		slider2 notsolid();
		slider2 hide();
		wait x+1;
		slider2 solid();
		slider2 show();
	}
}

trap9()
{
	rotator = getent("rotator9","targetname");
	trig = getent("trap9trig","targetname");
	killtrig91 = getent("killtrig91","targetname");
	killtrig92 = getent("killtrig92","targetname");
	killtrig91 enablelinkto();
	killtrig91 linkto(rotator);
	killtrig92 enablelinkto();
	killtrig92 linkto(rotator);

	rotator thread rotzor();
	trig waittill("trigger",player);
	trig delete();
	level notify("trap9");
	rotator thread rotzor2();
}

rotzor()
{
	level endon("trap9");
	for(;;)
	{
		wait .1;
		self rotateyaw(180,3);
	}
}

rotzor2()
{
	x = randomint(10);
	for(;;)
	{
		if(x < 5)
		{
			wait .1;
			self rotateyaw(180,3);
		}
		else
		{
			wait .1;
			self rotateyaw(-180,3);
		}
	}
}

trap10()
{
	rot1 = getent("rot101","targetname");
	rot2 = getent("rot102","targetname");
	trig = getent("trap10trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	for(;;)
	{
		rot1 rotateyaw(180,1);
		rot2 rotateyaw(180,1);
		wait 1;
	}
}

kniferoom()
{
    level.knife_trig = getEnt( "knife", "targetname");
    jump = getEnt( "jumper_knife", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.sniper_trig delete();
		level.shotgun_trig delete();
 		level.jump_trig delete();
		level.firstenter=false;
		}
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "deserteagle_mp" );
		player setWeaponAmmoClip("deserteagle_mp", 0 );
		player setWeaponAmmoStock( "deserteagle_mp", 0 );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "deserteagle_mp" ); 
        level.activ setWeaponAmmoClip("deserteagle_mp", 0 );
        level.activ setWeaponAmmoStock( "deserteagle_mp", 0 );		
        wait 0.05;
        player switchToWeapon( "deserteagle_mp" );
        level.activ SwitchToWeapon( "deserteagle_mp" );
        iPrintlnBold( "^7" + player.name + " Entered ^1Knife" );
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 2;
		iPrintlnBold("Fight!!");
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

sniperroom()
{
    level.sniper_trig = getEnt( "sniper", "targetname");
    jump = getEnt( "jumper_sniper", "targetname" );
    acti = getEnt( "acti_sniper", "targetname" );
    
    while(1)
    {
        level.sniper_trig waittill( "trigger", player );
        if( !isDefined( level.sniper_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.knife_trig delete();
		level.shotgun_trig delete();
 		level.jump_trig delete();
		level.firstenter=false;
		}
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
        player GiveWeapon( "m40a3_mp" );
        player givemaxammo("remington700_mp");
        player givemaxammo("m40a3_mp");
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" ); 
        level.activ GiveWeapon( "m40a3_mp" );	
        level.activ givemaxammo("remington700_mp");
        level.activ givemaxammo("m40a3_mp");
        wait 0.05;
        player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
        iPrintlnBold( "^7" + player.name + " Entered ^2Sniper" );
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 2;
		iPrintlnBold("Fight!!");
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

shotgunroom()
{
    level.shotgun_trig = getEnt( "shotgun", "targetname");
    jump = getEnt( "jumper_shotgun", "targetname" );
    acti = getEnt( "acti_shotgun", "targetname" );
    
    while(1)
    {
        level.shotgun_trig waittill( "trigger", player );
        if( !isDefined( level.shotgun_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.knife_trig delete();
		level.sniper_trig delete();
 		level.jump_trig delete();
		level.firstenter=false;
		}
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "m1014_mp" );
        player givemaxammo("m1014_mp");
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "m1014_mp" ); 
        level.activ givemaxammo( "m1014_mp" );	
        wait 0.05;
        player switchToWeapon( "m1014_mp" );
        level.activ SwitchToWeapon( "m1014_mp" );
        iPrintlnBold( "^7" + player.name + " Entered ^3ShotGun" );
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 2;
		iPrintlnBold("Fight!!");
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

jumproom()
{
    level.jump_trig = getEnt( "jump", "targetname");
    level.jump = getEnt( "jumper_jump", "targetname" );
    level.acti = getEnt( "acti_jump", "targetname" );
    
    while(1)
    {
        level.jump_trig waittill( "trigger", player );
        if( !isDefined( level.jump_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.knife_trig delete();
		level.sniper_trig delete();
 		level.shotgun_trig delete();
		level.firstenter=false;
		}
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( level.jump.angles );
        player setOrigin( level.jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
        level.activ setPlayerangles( level.acti.angles );
        level.activ setOrigin( level.acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" ); 
        level.activ givemaxammo( "knife_mp" );	
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( "^7" + player.name + " Entered ^4Jump" );
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 2;
		iPrintlnBold("Fight!!");
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

jumproom_failtrig()
{
	trig = getent("jumproom_failtrig","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(player == player)
		{
			player setOrigin(level.jump.origin);
			player setPlayerangles(level.jump.angles);
		}
		else if(player == level.activ)
		{
			level.activ setOrigin(level.acti.origin);
			level.activ setPlayerangles(level.acti.angles);
		}
		wait .1;
	}
}

jumproom_sniper()
{
	trig = getent("jumproom_sniper","targetname");
	for(;;)
	{
	trig waittill("trigger",player);
	if(player GetCurrentWeapon() != "remington700_mp" || player GetCurrentWeapon() != "deserteagle_mp")
	{
	player TakeAllWeapons();
	player GiveWeapon("remington700_mp");
	player GiveWeapon("deserteagle_mp");
	player givemaxammo("remington700_mp");
	player setWeaponAmmoClip("deserteagle_mp", 0 );
    player setWeaponAmmoStock( "deserteagle_mp", 0 );	
	wait .1;
	player switchToWeapon("remington700_mp");
	}
	wait .1;
	}
}