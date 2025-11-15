main() {

maps\mp\_load::main();

game["allies"] = "marines";
game["axis"] = "opfor";
game["attackers"] = "allies";
game["defenders"] = "axis";
game["allies_soldiertype"] = "desert";
game["axis_soldiertype"] = "desert";

//Precaching Guns
precacheItem( "remington700_mp" );
precacheItem( "m40a3_mp" );
precacheItem( "ak74u_mp" );
precacheItem( "knife_mp" );

//Traps
thread trap1(); //Delete Blocks Near Spawn
thread trap2(); //Move spikes
thread trap3(); //Remove Parts of Bridge
thread trap4(); //Make platforms spin
thread trap5(); //Delete a row of platforms
thread trap6(); //Rotate platforms
thread trap7(); //Move bars
thread trap8(); //Move platform
thread trap9(); //Rotate cilinder
thread trap10(); //Make platforms non-solid and remove platforms
thread trap11(); //Move brush to push players off

addTriggerToList( "trap1_trig" );
addTriggerToList( "trap2_trig" );
addTriggerToList( "trap3_trig" );
addTriggerToList( "trap4_trig" );
addTriggerToList( "trap5_trig" );
addTriggerToList( "trap6_trig" );
addTriggerToList( "trap7_trig" );
addTriggerToList( "trap8_trig" );
addTriggerToList( "trap9_trig" );
addTriggerToList( "trap10_trig" );
addTriggerToList( "trap11_trig" );

//Events
thread hud();
thread spawn_cage();

//Jumper Teleports
thread jump_tele1(); // Teleports you to part 2
thread jump_tele2(); // Teleports you to part 3

//Activator Teleports
thread acti_tele1(); // Teleports you out of room 1
thread acti_tele2(); // Teleports you out of room 2
thread acti_tele3(); // Teleports you out of room 3

// Secrets
//thread secret1_enter();
//thread secret1_finish();
//thread secret2_activate();
//thread secret2_teletoloc2();
//thread secret2_fail1();
//thread secret2_fail2();
//thread secret2_fail3();
//hread secret2_finish();

// Minigames
thread minigames_enter(); // Enter minigames room
thread rm_snip();
thread rm_knife();
thread rm_1v1();
thread rm_jump();

// Jump Room Stuff
thread jump_j_fail();
thread jump_a_fail();
thread jump_sniper_give();

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
	thread hud_set_2("Mp_Dr_Slay | Map 3/5! [Speed:190]");
	wait 0.95;
	thread hud_set_3("Activating Traps and Secrets are disabled !");

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

// TRAPS //
trap1()
{
	trig = getEnt("trap1_trig","targetname");
	block1 = getEnt("trap1_block1","targetname");
	block2 = getEnt("trap1_block2","targetname");

	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();

}

trap2()
{
	trig = getEnt("trap2_trig","targetname");
	spike1 = getEnt("trap2_spike1","targetname");
	spike2 = getEnt("trap2_spike2","targetname");
	spike1_trig = getEnt("trap2_spike1_trig","targetname");
	spike2_trig = getEnt("trap2_spike2_trig","targetname");

	spike1_trig enablelinkto(); 
	spike1_trig linkto (spike1);	
	spike2_trig enablelinkto(); 
	spike2_trig linkto (spike2);	

	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();


}

trap3()
{
	trig = getEnt("trap3_trig","targetname");
	t1 = getEnt("trap3_1","targetname");
	t2 = getEnt("trap3_2","targetname");
	t3 = getEnt("trap3_3","targetname");
	t4 = getEnt("trap3_4","targetname");

	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();


}

trap4()
{
	trig = getEnt("trap4_trig","targetname");
	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();


}


trap5()
{
	trig = getEnt("trap5_trig","targetname");
	t1 = getEnt("trap5_1","targetname");
	t2 = getEnt("trap5_2","targetname");

	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();

}

t5_rotb()
{
	bounce = getEnt("trap5_b","targetname");

	
}

trap6()
{
	trig = getEnt("trap6_trig","targetname");
	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();

}


trap7()
{
	trig = getEnt("trap7_trig","targetname");
	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();

}


trap8()
{
	trig = getEnt("trap8_trig","targetname");
	t1 = getEnt("trap8_1","targetname");

	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();

}

trap9()
{
	trig = getEnt("trap9_trig","targetname");
	t1 = getEnt("trap9_1","targetname");

	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();

	
}

trap10()
{
	trig = getEnt("trap10_trig","targetname");
	clip1 = getEnt("trap10_clîp1","targetname");
	clip2 = getEnt("trap10_clîp2","targetname");
	t1 = getEnt("trap10_1","targetname");
	t2 = getEnt("trap10_2","targetname");

	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();

}

trap11()
{
	trig = getEnt("trap11_trig","targetname");
	t1 = getEnt("trap11_1","targetname");

	trig setHintString("^7Press ^1&&1 ^7to Activate Trap");
	trig waittill("trigger", player);
	trig Delete();

	
}


spawn_cage()
{
	cage = getEnt("spawn_cage","targetname");
	wait 5;
	iprintlnbold("^1Cage opening in 10 seconds!");
	wait 5;
	iprintlnbold("^1Cage opening in 5 seconds!");
	wait 2;
	iprintlnbold("^23...");
	cage moveZ(192,8);
	wait 1;
	iprintlnbold("^22...");
	wait 1;
	iprintlnbold("^21...");
	wait 1;
	iprintlnbold("^2Slaya Time!");
	cage waittill ("movedone");
	cage Delete();
}

// JUMPER TELEPORTS //
jump_tele1()
{
	while(1)
	{
		trig = getEnt("tele_jump_part2","targetname");
		end = getEnt("tele_jump_part2_end","targetname");
		trig waittill("trigger", player);

		player SetOrigin(end.origin);
		player SetPlayerAngles( end.angles );
	}
}

jump_tele2()
{
	while(1)
	{
		trig = getEnt("tele_jump_part3","targetname");
		end = getEnt("tele_jump_part3_end","targetname");
		trig waittill("trigger", player);

		player SetOrigin(end.origin);
		player SetPlayerAngles( end.angles );
	}
}

// ACTIVATOR TELEPORTS //
acti_tele1()
{
	trig = getEnt("activ_tele_room1","targetname");
	end = getEnt("activ_tele_room1_end","targetname");
	trig waittill("trigger", player);

	player SetOrigin(end.origin);
    player SetPlayerAngles( end.angles );
}

acti_tele2()
{
	trig = getEnt("activ_tele_room2","targetname");
	end = getEnt("activ_tele_room2_end","targetname");
	trig waittill("trigger", player);

	player SetOrigin(end.origin);
    player SetPlayerAngles( end.angles );
}

acti_tele3()
{
	trig = getEnt("activ_tele_room3","targetname");
	end = getEnt("activ_tele_room3_end","targetname");
	trig waittill("trigger", player);

	player SetOrigin(end.origin);
    player SetPlayerAngles( end.angles );
}

// SECRETS //
secret1_enter()
{
	while(1)
	{
		trig = getEnt("secret1_trig_enter","targetname");
		end = getEnt("secret1_end_enter","targetname");
		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );
	}
}

secret1_finish()
{
	while(1)
	{
		trig = getEnt("secret1_trig_finish","targetname");
		end = getEnt("secret1_end_finish","targetname");
		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );

    	player GiveWeapon("remington700_mp");
    	player GiveMaxAmmo("remington700_mp");
    	player SwitchToWeapon("remington700_mp");
    	iprintlnbold("^4" + player.name + " ^5Got a Sniper!");
	}
}

secret2_activate()
{
	trig = getEnt("secret2_activate_trig","targetname");
	trig waittill("trigger", player);
	trig Delete();
	player iprintln("^1You activated something!");

	thread secret2_enter();
}

secret2_enter()
{
	trig = getEnt("secret2_enter_trig","targetname");
	end = getEnt("secret2_enter_end","targetname");
	while(1)
	{
		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );

    	player iprintlnbold("^1You have entered the ^2Secret^0!");
	}
}

secret2_teletoloc2()
{
	while(1)
	{
		trig = getEnt("secret2_teletoloc2_trig","targetname");
		end = getEnt("secret2_teletoloc2_end","targetname");

		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );
	}
}

secret2_fail1()
{
	while(1)
	{
		trig = getEnt("secret2_fail1","targetname");
		end = getEnt("secret2_enter_end","targetname");

		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );
	}
}
secret2_fail2()
{
	while(1)
	{
		trig = getEnt("secret2_fail2","targetname");
		end = getEnt("secret2_fail2_end","targetname");

		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );
	}
}
secret2_fail3()
{
	while(1)
	{
		trig = getEnt("secret2_fail3","targetname");
		end = getEnt("secret2_fail3_end","targetname");

		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );
	}
}

secret2_finish()
{
	trig = getEnt("secret2_finish_trig","targetname");
	end = getEnt("tele_jump_part3_end","targetname");

	while(1)
	{
		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );

    	iprintlnbold("^4" + player.name + " ^5Finished the ^2Secret^0!");

    	player GiveWeapon("ak74u_mp");
    	player GiveMaxAmmo("ak74u_mp");
    	player SwitchToWeapon("ak74u_mp");
	}
}

// MINIGAMES //
minigames_enter()
{
	trig = getEnt("minigames_trig","targetname");
	end = getEnt("minigames_end","targetname");
	while(1)
	{
		trig waittill("trigger", player);

		player SetOrigin(end.origin);
    	player SetPlayerAngles( end.angles );
	}
}

rm_snip()
{
	level.rm_snip_trig = getEnt("room_snip_trig","targetname");
	level.rm_snip_trig setHintString("^7Press ^1&&1 ^7to Enter ^1Sniper Room");

    jump = getEnt( "sniper_j", "targetname" );
    acti = getEnt( "sniper_a", "targetname" );

	while(1)
	{
		level.rm_snip_trig waittill("trigger", player);
		if( !isDefined( level.rm_snip_trig ) )
            return;

		level.rm_knife_trig Delete();
		level.rm_1v1_trig Delete();
		level.rm_jump_trig Delete();

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );        
		player GiveMaxAmmo( "remington700_mp" );
		player GiveMaxAmmo( "m40a3_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "m40a3_mp" );         
        level.activ GiveMaxAmmo( "remington700_mp" );
        level.activ GiveMaxAmmo( "m40a3_mp" );
        wait 0.05;
        player switchToWeapon( "remington700_mp" ); 
        level.activ SwitchToWeapon( "remington700_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "Sniper Room";
				noti.notifyText = level.activ.name + " ^0VS^7 " + player.name;
				noti.glowcolor = (1,0,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

rm_knife()
{
	level.rm_knife_trig = getEnt("room_knife_trig","targetname");
	level.rm_knife_trig setHintString("^7Press ^1&&1 ^7to Enter ^1Knife Room");

    jump = getEnt( "sniper_j", "targetname" );
    acti = getEnt( "sniper_a", "targetname" );

	while(1)
	{
		level.rm_knife_trig waittill("trigger", player);
		if( !isDefined( level.rm_knife_trig ) )
            return;

		level.rm_snip_trig Delete();
		level.rm_1v1_trig Delete();
		level.rm_jump_trig Delete();

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        wait 0.05;
        player switchToWeapon( "knife_mp" ); 
        level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "Knife Room";
				noti.notifyText = level.activ.name + " ^0VS^7 " + player.name;
				noti.glowcolor = (1,0,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

rm_1v1()
{
	level.rm_1v1_trig = getEnt("room_1v1_trig","targetname");
	level.rm_1v1_trig setHintString("^7Press ^1&&1 ^7to Enter ^11v1 Room");

    jump = getEnt( "old_j", "targetname" );
    old_clip = getEnt("old_clip","targetname");

	while(1)
	{
		level.rm_1v1_trig waittill("trigger", player);
		if( !isDefined( level.rm_1v1_trig ) )
            return;

		level.rm_snip_trig Delete();
		level.rm_knife_trig Delete();
		level.rm_jump_trig Delete();

		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );

        iprintlnbold("^0Old ^1Opened!");

        wait 1;

        if (isDefined(old_clip))
        	old_clip Delete();
	}
}

rm_jump()
{
	level.rm_jump_trig = getEnt("room_jump_trig","targetname");
	level.rm_jump_trig setHintString("^7Press ^1&&1 ^7to Enter ^1Jump Room");

    jump = getEnt( "jump_j", "targetname" );
    acti = getEnt( "jump_a", "targetname" );

	while(1)
	{
		level.rm_jump_trig waittill("trigger", player);
		if( !isDefined( level.rm_jump_trig ) )
            return;

		level.rm_snip_trig Delete();
		level.rm_knife_trig Delete();
		level.rm_1v1_trig Delete();

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        wait 0.05;
        player switchToWeapon( "knife_mp" ); 
        level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "Jump Room";
				noti.notifyText = level.activ.name + " ^0VS^7 " + player.name;
				noti.glowcolor = (1,0,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

jump_j_fail()
{
	trig = getEnt("jump_j_fail","targetname");
	end = getEnt( "jump_j", "targetname" );
	while(1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles( end.angles );
        player setOrigin( end.origin );
	}
}

jump_a_fail()
{
	trig = getEnt("jump_a_fail","targetname");
	end = getEnt( "jump_a", "targetname" );
	while(1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles( end.angles );
        player setOrigin( end.origin );
	}
}

jump_sniper_give()
{
	trig = getEnt("jump_snip_trig","targetname");
	while(1)
	{
		trig waittill("trigger", player);
		player GiveWeapon("remington700_mp");
		player GiveMaxAmmo("remington700_mp");
		player SwitchToWeapon("remington700_mp");
	}
}

// FUNCTIONS //
addTriggerToList( name, positionOfIconAboveTrap )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

    if( !isDefined( level.icon_origins ) )
        level.icon_origins = [];
    level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
} 