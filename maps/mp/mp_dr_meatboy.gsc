main() {  
	maps\mp\_load::main();
	
	addTriggerToList( "trap1_trig" );
    addTriggerToList( "trap2_trig" );
	addTriggerToList( "trap3_trig" );
    addTriggerToList( "trap4_trig" );
	addTriggerToList( "trap5_trig" );
    addTriggerToList( "trap6_trig" );
	addTriggerToList( "trap7_trig" );
    addTriggerToList( "trap8_trig" );
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	
	
	//////////////threads////////////////
	thread hud();
	thread fall();
	thread trap1();
	thread trap2();
	thread trap3();
	thread actitele1();
	thread actitele2();
	thread actitele3();
	thread trap4();
	thread actitele4();
	thread actitele5();
	thread actitele6();
	thread actitele7();
	thread trap5();
	thread trap5_short();
	thread trap6();
	thread trap7();
	thread trap7_teleport();
	thread trap7_teleport2();
	thread trap7_teleport3();
	thread trap8();
	thread main_door();
	thread Sniperroom();
	thread kniferoom();
	thread roomhide();
	

}

randommusic()
{
    wait 0.05;

	songs = randomint (7);
	switch (songs) 
    {
		case 0:
		{
        ambientStop(2);
        ambientPlay("song_1");  
			break;
		}
		case 1: 
		{
        ambientStop(2);
        ambientPlay("song_2");
		break;
		}
		case 2: 
		{
        ambientStop(2);
        ambientPlay("song_3");
		break;
		}
        case 3:
		{
        ambientStop(2);
        ambientPlay("song_4");
			break;
			
		}
		case 4:
		{
        ambientStop(2);
        ambientPlay("song_5");
			break;
		}
		case 5:
		{
        ambientStop(2);
        ambientPlay("song_6");
			break;
		}
		case 6:
		{
        ambientStop(2);
        ambientPlay("song_7"); 
			break;
		}
	}

}

hud()
{
	wait 3;
	
    thread hud_set_1("Event - Nostalgic Return To The Past !");
	wait 0.95;
	thread hud_set_2("Mp_Dr_Meatboy | Map 2/5! [Speed:190]");
	wait 0.95;
	thread hud_set_3("Activating traps is disabled !");

	thread randommusic();
	
}

hud_set_1(text_1)
{
	if(!isdefined(text_1))
		return;

	level.hud_set_1=newhudelem();
	level.hud_set_1.alignx="left";
	level.hud_set_1.aligny="top";
	level.hud_set_1.horzalign="left";
	level.hud_set_1.vertalign="top";
	level.hud_set_1.alpha=1;
	level.hud_set_1.x=-400;
	level.hud_set_1.y=300;
	level.hud_set_1.font = "objective";
	level.hud_set_1.fontscale=1.6;	
	level.hud_set_1.glowalpha=1;
	level.hud_set_1.glowcolor=(0.85,0.76,0.14);
	
	level.hud_set_1 settext("^7"+text_1);
	wait .1;
	level.hud_set_1 moveovertime(1);
	level.hud_set_1.x=7;
}

hud_set_2(text_2)
{
	if(!isdefined(text_2))
		return;

	level.hud_set_2=newhudelem();
	level.hud_set_2.alignx="left";
	level.hud_set_2.aligny="top";
	level.hud_set_2.horzalign="left";
	level.hud_set_2.vertalign="top";
	level.hud_set_2.alpha=2;
	level.hud_set_2.x=-400;
	level.hud_set_2.y=320;
	level.hud_set_2.font = "objective";
	level.hud_set_2.fontscale=1.4;	
	level.hud_set_2.glowalpha=1;
	level.hud_set_2.glowcolor=(0.85,0.76,0.14);
	
	level.hud_set_2 settext("^7"+text_2);
	wait .1;
	level.hud_set_2 moveovertime(1);
	level.hud_set_2.x=7;
}

hud_set_3(text_3)
{
	if(!isdefined(text_3))
		return;

	level.hud_set_3=newhudelem();
	level.hud_set_3.alignx="left";
	level.hud_set_3.aligny="top";
	level.hud_set_3.horzalign="left";
	level.hud_set_3.vertalign="top";
	level.hud_set_3.alpha=2;
	level.hud_set_3.x=-400;
	level.hud_set_3.y=340;
	level.hud_set_3.font = "objective";
	level.hud_set_3.fontscale=1.4;	
	level.hud_set_3.glowalpha=1;
	level.hud_set_3.glowcolor=(0.85,0.76,0.14);
	
	level.hud_set_3 settext("^7"+text_3);
	wait .1;
	level.hud_set_3 moveovertime(1);
	level.hud_set_3.x=7;
}


addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}


//////////////////////////////////////////////////////////////////////////////////


fall()
{
	death = getEnt ("death", "targetname");
	
	while(1)
	{
		death waittill ("trigger", player);
		player freezecontrols (1);
		player PlaySound("wtf");
		player suicide();
		player freezecontrols (0);
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap1()
{
	trig = getEnt ("trap1_trig", "targetname");

	trig waittill ("trigger", player);
	player PlaySound("box");
	trig delete();

}


//////////////////////////////////////////////////////////////////////////////////


trap2()
{
	trig = getEnt ("trap2_trig", "targetname");
	trap2_hide = getEnt ("trap2_hide", "targetname");
	trap2_roll = getEnt ("trap2_roll", "targetname");

	trig waittill ("trigger", player);
	player PlaySound("box");
	trig delete();
	
	
}


//////////////////////////////////////////////////////////////////////////////////


trap3()
{
	trig = getEnt( "trap3_trig", "targetname" );
	trap3_easy = getEnt( "trap3_easy", "targetname" );
	trap3_easy2 = getEnt( "trap3_easy2", "targetname" );
	
	trig waittill( "trigger", player );
	player PlaySound("box");
	trig delete();
	
	
}


//////////////////////////////////////////////////////////////////////////////////


actitele1()
{
	acti_tele1=getent("acti_tele1","targetname");
	acti_p1=getent("acti_p1","targetname");
	while(1)
	{
		acti_tele1 waittill("trigger", player);
		player PlaySound("teleport");
		wait (0.5) ;
		player FreezeControls(1);
		player SetOrigin( acti_p1.origin );
		player setplayerangles( acti_p1.angles );
		player FreezeControls(0);
	}
}


//////////////////////////////////////////////////////////////////////////////////


actitele2()
{
	acti_tele2=getent("acti_tele2","targetname");
	acti_p2=getent("acti_p2","targetname");
	while(1)
	{
		acti_tele2 waittill("trigger", player);
		player PlaySound("teleport");
		wait (0.5) ;
		player FreezeControls(1);
		player SetOrigin( acti_p2.origin );
		player setplayerangles( acti_p2.angles );
		player FreezeControls(0);
	}
}


//////////////////////////////////////////////////////////////////////////////////


actitele3()
{
	acti_tele3=getent("acti_tele3","targetname");
	acti_p3=getent("acti_p3","targetname");
	while(1)
	{
		acti_tele3 waittill("trigger", player);
		player PlaySound("teleport");
		wait (0.5) ;
		player FreezeControls(1);
		player SetOrigin( acti_p3.origin );
		player setplayerangles( acti_p3.angles );
		player FreezeControls(0);
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap4()
{
	trig4 = getent("trap4_trig", "targetname");
	trig4_a = getent("trap4_a", "targetname");
	trig4_b = getent("trap4_b", "targetname");
	trig4_c = getent("trap4_c", "targetname");
	trap4_1 = getent( "trap4_1", "targetname" );
	trap4_2 = getent( "trap4_2", "targetname" );
	trap4_3 = getent( "trap4_3", "targetname" );
	
	trig4_a enablelinkto();
	trig4_a linkto (trap4_1);
	trig4_b enablelinkto();
	trig4_b linkto (trap4_2);
	trig4_c enablelinkto();
	trig4_c linkto (trap4_3);

	trig4 waittill("trigger", player);
	player PlaySound("box");
	trig4 delete();

}


//////////////////////////////////////////////////////////////////////////////////


actitele4()
{
	opendoor=getent("opendoor","targetname");
	left_door=getent("left_door","targetname");
	right_door=getent("right_door","targetname");
	trig_move=getent("trig_move","targetname");
	move=getent("move","targetname");
	stop=getent("stop","targetname");
	block=getent("block","targetname");
	clip_move=getent("clip_move","targetname");
	kill=getent("elevator_kill","targetname");
	
	
	kill enablelinkto();
	kill linkto (move); 
	clip_move linkto (move);
	block notSolid();
	opendoor waittill("trigger", player);
	opendoor delete();
	left_door movex (16,1);
	right_door movex (16,1);
	wait(1);
	left_door movey (48,2);
	right_door movey (-48,2);
	wait(2);
	trig_move waittill("trigger", player);
	trig_move delete();
	block Solid();
	left_door movey (-48,2);
	right_door movey (48,2);
	wait(2);
	left_door movex (-16,0.5);
	right_door movex (-16,0.5);
	wait(2);
	left_door movey (1600,5);
	right_door movey (1600,5);
	move movey (1600,5);
	block movex (-32,1);
	wait(6);
	left_door movez (1120,5);
	right_door movez (1120,5);
	move movez (1120,5);
	wait(5);
	left_door movex (16,1);
	right_door movex (16,1);
	wait(1);
	left_door movey (48,2);
	right_door movey (-48,2);
	wait(2);
	stop waittill("trigger", player);
	stop delete();
	left_door movey (-48,2);
	right_door movey (48,2);
	wait(2);
	left_door movex (-16,0.5);
	right_door movex (-16,0.5);
	wait(1);
}


//////////////////////////////////////////////////////////////////////////////////


actitele5()
{
	acti_tele5=getent("acti_tele5","targetname");
	acti_p5=getent("acti_p5","targetname");
	while(1)
	{
		acti_tele5 waittill("trigger", player);
		player PlaySound("teleport");
		wait (0.5) ;
		player FreezeControls(1);
		player SetOrigin( acti_p5.origin );
		player SetPlayerAngles((0,180,0));
		player FreezeControls(0);
	}
}


//////////////////////////////////////////////////////////////////////////////////


actitele6()
{
	acti_tele6=getent("acti_tele6","targetname");
	acti_p6=getent("acti_p6","targetname");
	while(1)
	{
		acti_tele6 waittill("trigger", player);
		player PlaySound("teleport");
		wait (0.5) ;
		player FreezeControls(1);
		player SetOrigin( acti_p6.origin );
		player SetPlayerAngles((0,180,0));
		player FreezeControls(0);
	}
}


//////////////////////////////////////////////////////////////////////////////////


actitele7()
{
	acti_tele7=getent("acti_tele7","targetname");
	acti_p7=getent("acti_p7","targetname");
	while(1)
	{
		acti_tele7 waittill("trigger", player);
		player PlaySound("teleport");
		wait (0.5) ;
		player FreezeControls(1);
		player SetOrigin( acti_p7.origin );
		player SetPlayerAngles((0,180,0));
		player FreezeControls(0);
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap5()
{
	trap5_1 = getent("trap5_1","targetname");
	trap5_2 = getent("trap5_2","targetname");
	trap5_3 = getent("trap5_3","targetname");
	trap5_4 = getent("trap5_4","targetname");
	trig5 = getent("trap5_trig", "targetname");
	
	trig5 waittill("trigger", player);
	player PlaySound("box");
	trig5 delete();
	
}


//////////////////////////////////////////////////////////////////////////////////


trap5_short()
{
	trap5 = getent("trap5_short","targetname");
	short_trig = getent("short_trig","targetname");
	
	trap5 show();
	trap5 Solid();
	
}


//////////////////////////////////////////////////////////////////////////////////


trap6()
{
	death_trigger=getent("deathtrigger","targetname");
	trigger=getent("trap6_trig","targetname");

    death_trigger delete();
	trigger waittill("trigger",player);
	player PlaySound("box");
	trigger delete();
}


//////////////////////////////////////////////////////////////////////////////////


trap7()
{
	trigger = getent("trap7_trig","targetname");
	trap7_owned = getent("trap7_owned","targetname");
	trap7_tele = getent("trap7_tele","targetname");
	push = getent("push","targetname");
	room_dmg= getent("room_dmg","targetname");
	
	trap7_tele enablelinkto();
	trap7_tele linkto (trap7_owned);
	room_dmg enablelinkto();
	room_dmg linkto (push);
	
	trap7_owned hide();
	trap7_owned notSolid();
	
	trigger waittill("trigger", player);
	player PlaySound("box");
	trigger delete();

}


//////////////////////////////////////////////////////////////////////////////////

trap7_teleport()
{
	trap7_tele = getent("trap7_tele","targetname");
	trap7_sp = getent("trap7_sp","targetname");
	while(1)
	{
		trap7_tele waittill("trigger", player);
		player FreezeControls(1);
		wait(5);
		player SetOrigin( trap7_sp.origin );
		player setplayerangles( trap7_sp.angles );
		wait(1);
		player FreezeControls(0);
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap7_teleport2()
{

	trap7_acmove = getEnt ( "trap7_acmove" , "targetname" );
	trap7_trig_map = getEnt ( "trap7_trig_map" , "targetname" );
	
	trap7_trig_map enablelinkto();
	trap7_trig_map linkto (trap7_acmove);
	
	while (1)
	{	
	trap7_acmove movex(1000,9);
	wait 0.5;
	trap7_acmove movex(-1000,9);
	wait 0.5;
	}

}


//////////////////////////////////////////////////////////////////////////////////


trap7_teleport3()
{
	trap7_trig_map=getent("trap7_trig_map","targetname");
	trap7_map2=getent("trap7_map2","targetname");
	{
		trap7_trig_map waittill("trigger", player);
		player SetOrigin( trap7_map2.origin );
		player setplayerangles( trap7_map2.angles );
	}
}

trap8()
{
	trap8_bomb=getent("trap8_bomb","targetname");
	trap8_bomb2=getent("trap8_bomb2","targetname");
	bomb_origin1=getent("bomb_origin1","targetname");
	bomb_origin2=getent("bomb_origin2","targetname");
	bomb_origin3=getent("bomb_origin3","targetname");
	bomb_origin4=getent("bomb_origin4","targetname");
	bomb_origin5=getent("bomb_origin5","targetname");
	bomb_origin6=getent("bomb_origin6","targetname");
	bomb_origin7=getent("bomb_origin7","targetname");
	bomb_origin8=getent("bomb_origin8","targetname");
	bomb_origin9=getent("bomb_origin9","targetname");
	bomb_origin10=getent("bomb_origin10","targetname");
	bomb_origin11=getent("bomb_origin11","targetname");
	bomb_origin12=getent("bomb_origin12","targetname");
	bomb_origin13=getent("bomb_origin13","targetname");
	bomb_origin14=getent("bomb_origin14","targetname");
	bomb_origin15=getent("bomb_origin15","targetname");
	bomb_origin16=getent("bomb_origin16","targetname");
	bomb_origin17=getent("bomb_origin17","targetname");
	bomb_origin18=getent("bomb_origin18","targetname");
	monkey_origin=getent("monkey_origin","targetname");
	monkey_right1=getent("monkey_right1","targetname");
	monkey_right2=getent("monkey_right2","targetname");
	monkey_right3=getent("monkey_right3","targetname");
	monkey_right4=getent("monkey_right4","targetname");
	monkey_right5=getent("monkey_right5","targetname");
	monkey_right6=getent("monkey_right6","targetname");
	monkey_centre1=getent("monkey_centre1","targetname");
	monkey_centre2=getent("monkey_centre2","targetname");
	monkey_centre3=getent("monkey_centre3","targetname");
	monkey_centre4=getent("monkey_centre4","targetname");
	monkey_centre5=getent("monkey_centre5","targetname");
	monkey_centre6=getent("monkey_centre6","targetname");
	monkey_left1=getent("monkey_left1","targetname");
	monkey_left2=getent("monkey_left2","targetname");
	monkey_left3=getent("monkey_left3","targetname");
	monkey_left4=getent("monkey_left4","targetname");
	monkey_left5=getent("monkey_left5","targetname");
	monkey_left6=getent("monkey_left6","targetname");
	trigger=getent("trap8_trig","targetname");
	trap8_bricks=getent("trap8_bricks","targetname");
	trap8_brickdam=getent("trap8_brickdam","targetname");
	trap8_normalglass=getent("trap8_normalglass","targetname");
	trap8_brokenglass=getent("trap8_brokenglass","targetname");

	trap8_brokenglass hide();
	trap8_brickdam hide();
	trap8_bomb2 hide();
	trap8_bomb2 notsolid();
	
	trap8_bomb enablelinkto();
	trap8_bomb linkto (trap8_bomb2);
	
	trigger waittill("trigger",player);
	player PlaySound("box");
	trigger delete();

}


//////////////////////////////////////////////////////////////////////////////////


main_door()
{
	maindoor_broken  =getent( "maindoor_broken", "targetname" );
	spawn_whiteori  =getent( "spawn_whiteori", "targetname" );
	maindoor_remains  =getent( "maindoor_remains", "targetname" );
	meatboy_soundori =getent( "meatboy_soundori", "targetname" );
	fire1 =getent( "fire1", "targetname" );
	fire2 =getent( "fire2", "targetname" );
	fire3 =getent( "fire3", "targetname" );
	fire4 =getent( "fire4", "targetname" );
	fire5 =getent( "fire5", "targetname" );
	fire6 =getent( "fire6", "targetname" );
	brick1 =getent( "brick1", "targetname" );
	brick2 =getent( "brick2", "targetname" );
	floorfire1 =getent( "floorfire1", "targetname" );
	floorfire2 =getent( "floorfire2", "targetname" );
	boomsoundori =getent( "boomsoundori", "targetname" ); 
	flamesound1 =getent( "flamesound1", "targetname" ); 
	flamesound2 =getent( "flamesound2", "targetname" );
	terror =getent( "terror", "targetname" ); 
	sniperroom =getent( "sniperroom", "targetname" ); 
	
	maindoor_remains delete();
	terror delete();
	maindoor_broken delete();
	
}
	
	


Sniperroom()
{
	level.trig_sniper = getEnt( "trig_sniper", "targetname");
	snip_jump = getEnt( "snip_jump", "targetname" );
	snip_acti = getEnt( "snip_acti", "targetname" );
	
	while(1)
	{
		level.trig_sniper waittill( "trigger", player );
		if( !isDefined( level.trig_sniper ) )
			return;
		
			thread kniferoomdel();
			
		//AmbientPlay( "friend" );
		player FreezeControls(1);
		player setplayerangles( snip_jump.angles );
		player setOrigin( snip_jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );
		player giveMaxAmmo( "remington700_mp" );
		level.activ FreezeControls(1);
		level.activ setPlayerangles( snip_acti.angles );
		level.activ setOrigin( snip_acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
		wait 0.05;
		player switchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		iPrintlnBold( " ^7" + player.name + " has entered ^5S^7niper ^5R^7oom^5!!" );
		wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);
		player iprintlnbold("^5F^7IGHT^5!!");
		level.activ iprintlnbold("^5F^7IGHT^5!!");
        while( isDefined( player ) && isAlive( player ) )
		wait 1;
	}
}


sniperroomdel()
{

	sniper_portal = getent("sniper_portal","targetname");
	level.trig_sniper = getent("trig_sniper","targetname");
	sniper_portalbroken = getent("sniper_portalbroken","targetname");

	sniper_portal hide();
	sniper_portalbroken show();
	level.trig_sniper delete();
}


kniferoomdel()
{

	knife_portal = getent("knife_portal","targetname");
	level.trig_knife = getent("trig_knife","targetname");
	
	knife_portalbroken = getent("knife_portalbroken","targetname");

	knife_portalbroken hide();

	
	knife_portal hide();
	knife_portalbroken show();
	
	level.trig_knife delete();
}



kniferoom()
{
	level.trig_knife = getEnt( "trig_knife", "targetname");
	knife_jump = getEnt( "knife_jumper", "targetname" );
	knife_acti = getEnt( "knife_acti", "targetname" );
	
	while(1)
	{
		level.trig_knife waittill( "trigger", player );
		if( !isDefined( level.trig_knife ) )
			return;
		
		thread sniperroomdel();
		
		player FreezeControls(1);
		player SetPlayerAngles( knife_jump.angles );
		player setOrigin( knife_jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );	
		player GiveWeapon( "deserteagle_mp" );	
		player setWeaponAmmoClip( "deserteagle_mp", 0 );
		player setweaponammostock( "deserteagle_mp", 0 );
		level.activ FreezeControls(1);
		level.activ setPlayerangles( knife_acti.angles );
		level.activ setOrigin( knife_acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );	
		level.activ GiveWeapon( "deserteagle_mp" );	
		level.activ setWeaponAmmoClip( "deserteagle_mp", 0 );
		level.activ setweaponammostock( "deserteagle_mp", 0 );		
		wait 0.05;
		player switchToWeapon( "deserteagle_mp" );
		level.activ SwitchToWeapon( "deserteagle_mp" );
		iPrintlnBold( " ^7" + player.name + " ^7has entered ^5K^7nife ^5R^7oom^5!!" );	
		wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);
		player iprintlnbold("^5F^7IGHT^5!!");
		level.activ iprintlnbold("^5F^7IGHT^5!!");
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

roomhide()
{
	sniper_portalbroken = getent("sniper_portalbroken","targetname");
	knife_portalbroken = getent("knife_portalbroken","targetname");

	knife_portalbroken hide();
	sniper_portalbroken hide();
}




