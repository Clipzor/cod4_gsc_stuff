main() {

	maps\mp\_load::main();

	ambientPlay("ambient1");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	trigger = spawn( "trigger_radius", (239.342, 1021.27, -271.875), 0, 185, 150 );
	trigger.targetname = "endmap_trig";
	trigger.radius = 185; 

	level.rnd_weapon_goobster = [];
	level.rnd_weapon_goobster[level.rnd_weapon_goobster.size] = "t5_spas12_mp";
	level.rnd_weapon_goobster[level.rnd_weapon_goobster.size] = "t4_ppsh_mp";
	level.rnd_weapon_goobster[level.rnd_weapon_goobster.size] = "t7_mr6_mp";
	level.rnd_weapon_goobster[level.rnd_weapon_goobster.size] = "iw5_mp7_mp";
	level.rnd_weapon_goobster[level.rnd_weapon_goobster.size] = "ak47_mp";
	level.rnd_weapon_goobster[level.rnd_weapon_goobster.size] = "t6_s12_mp";

	level.firstenter = false;
	level.jump_room_weapon_given = false;


	precacheItem("m40a3_mp");
	precacheItem("t7_mr6_mp");
	precacheItem("t5_spas12_mp");
	precacheItem("remington700_mp");
	precacheItem("knife_mp");
	precacheItem("ak47_mp");
	precacheItem("t6_s12_mp");
	precacheItem("t4_ppsh_mp");
	precacheItem("iw5_mp7_mp");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7a();
	thread trap7b();

	thread teleport();
	thread SWJ();
	
	thread sniper_tele();
	thread weapon_tele();
	thread jump_tele();
	
	addTriggerToList( "trap1_trig" );
    addTriggerToList( "trap2_trig" );
    addTriggerToList( "trap3_trig" );
    addTriggerToList( "trap4_trig" );
    addTriggerToList( "trap5_trig" );
    addTriggerToList( "trap6_trig" );
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


teleport()
{
	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter()
{
	entTarget = getEnt( self.target, "targetname" );
	for(;;)
	{
		self waittill( "trigger", player );
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	}
}

SWJ()
{
	S = getent ("S", "targetname");
	W = getent ("W", "targetname");
	J = getent ("J", "targetname");

	for(;;)
	{
		S rotateYaw (-360, 3);
		W rotateYaw (360, 3);
		J rotateYaw (-360, 3);
		wait 3;
	}
}

trap1()
{
    trig1 = getEnt("trap1_trig", "targetname");
    trap1a = getEnt("trap1a", "targetname");
    trap1b = getEnt("trap1b", "targetname");
    trap1c = getEnt("trap1c", "targetname");

    trig1 waittill("trigger");
    trig1 delete();

	for(;;)
    {
		trap1a rotateRoll (360, 2);
		trap1c rotateRoll (360, 2);
		trap1b rotateRoll (-360, 2);
		wait 3;
	}
}

trap2()
{
	trap2a = getent ("trap2a", "targetname");
	trap2b = getent ("trap2b", "targetname");
	trig2 = getent ("trap2_trig", "targetname");

	trig2 waittill ("trigger");
	trig2 delete();

	for(;;)
	{
		trap2a rotateRoll (-360, 3);
		trap2b rotateRoll (360, 3);
		wait 3;
	}
}

trap3()
{
	trap3a = getent ("trap3a", "targetname");
	trap3b = getent ("trap3b", "targetname");
	trap3c = getent ("trap3c", "targetname");
	trap3d = getent ("trap3d", "targetname");
	trig3 = getent ("trap3_trig", "targetname");

	trig3 waittill ("trigger");
	trig3 delete();

	for(;;)
	{
		trap3a rotateYaw (1800, 5);
		trap3b rotateYaw (-1800, 5);
		trap3c rotateYaw (1800, 5);
		trap3d rotateYaw (-1800, 5);
		wait 6;
	}
}

trap4()
{
	trap4a = getent ("trap4a", "targetname");
	trap4b = getent ("trap4b", "targetname");
	trap4c = getent ("trap4c", "targetname");
	trap4f = getent ("trap4f", "targetname");
	trig4 = getent ("trap4_trig", "targetname");

	trig4 waittill ("trigger");
	trig4 delete();

	for(;;)
	{
		trap4a rotateYaw (90, 4);
		trap4b rotateYaw (90, 4);
		trap4c rotateYaw (90, 4);
		trap4f rotateYaw (90, 4);
		wait 10;
		trap4a rotateYaw (-90, 4);
		trap4b rotateYaw (-90, 4);
		trap4c rotateYaw (-90, 4);
		trap4f rotateYaw (-90, 4);
		wait 10;
	}
}

trap5()
{
	trap5a = getent ("trap5a", "targetname");
	trap5b = getent ("trap5b", "targetname");
	trig5 = getent ("trap5_trig", "targetname");

	trig5 waittill ("trigger");
	trig5 delete();

	for(;;)
	{
		trap5a movez (-88, 1);
		trap5b movez (88, 1);
		wait 1;
		trap5a movez (88, 1);
		trap5b movez (-88, 1);
		wait 1;
		trap5a movez (88, 1);
		trap5b movez (-88, 1);
		wait 1;
		trap5a movez (-88, 1);
		trap5b movez (88, 1);
		wait 1;
	}
}

trap6()
{
	trap6a = getent ("trap6a", "targetname");
	trap6b = getent ("trap6b", "targetname");
	trap6c = getent ("trap6c", "targetname");
	trap6d = getent ("trap6d", "targetname");
	trig6 = getent ("trap6_trig", "targetname");

	trig6 waittill ("trigger");
	trig6 delete();

	for(;;)
	{
		trap6a movey (-384, 1);
		trap6a rotateYaw (360, 1);
		trap6b movey (384, 1);
		trap6b rotateYaw (-360, 1);
		trap6c movey (-384, 1);
		trap6c rotateYaw (360, 1);
		trap6d movey (384, 1);
		trap6d rotateYaw (-360, 1);
		wait 1;
		trap6a movey (384, 1);
		trap6a rotateYaw (360, 1);
		trap6b movey (-384, 1);
		trap6b rotateYaw (-360, 1);
		trap6c movey (384, 1);
		trap6c rotateYaw (360, 1);
		trap6d movey (-384, 1);
		trap6d rotateYaw (-360, 1);
		wait 1;
	}
}

trap7a()
{
	trap7a = getent ("trap_7a", "targetname");

	for(;;)
	{
		trap7a rotateYaw (360, 6);
		wait 4;
	}
}

trap7b()
{
	trap7b = getent ("trap_7b", "targetname");

	for(;;)
	{
		trap7b rotateYaw (-360, 4);
		wait 2;
	}
}

sniper_tele()
{
	weapontrig = getent ("weapon_trigger", "targetname");
	jumptrig = getent ("jump_trigger", "targetname");

	snipertrig = getent ("sniper_trigger", "targetname");
	sniperactitele = getent ("sniper_acti_tele", "targetname");
	sniperjumpertele = getent ("sniper_jumper_tele", "targetname");

	for(;;) {
		snipertrig waittill("trigger", player);

		if(level.firstenter == false) {
			weapontrig delete();
			jumptrig delete();
			level.firstenter = true;
		}

		player SetOrigin (sniperjumpertele.origin);
		player setplayerangles (sniperjumpertele.angles);

		player TakeAllWeapons();
		player GiveWeapon ("m40a3_mp"); 
		player GiveWeapon ("remington700_mp"); 

        player.health = player.maxhealth;
        level.activ.health = level.activ.maxhealth;

		level.activ SetOrigin (sniperactitele.origin);
		level.activ setplayerangles (sniperactitele.angles);

		level.activ TakeAllWeapons();
		level.activ GiveWeapon ("m40a3_mp");
		level.activ GiveWeapon ("remington700_mp");
        
		player GiveWeapon ("m40a3_mp"); 
		player GiveWeapon ("remington700_mp"); 

		player switchToWeapon ("m40a3_mp");
		level.activ SwitchToWeapon ("m40a3_mp");
		iPrintLnBold(player.name+ "^4 has entered the ^1Sniper Room");
			
		while(isAlive(player))
		{
			wait 1;
		}
	}
}

weapon_tele()
{
	snipertrig = getent ("sniper_trigger", "targetname");
	jumptrig = getent ("jump_trigger", "targetname");

	weapontrig = getent ("weapon_trigger", "targetname");
	weaponactitele = getent ("weapon_acti_tele", "targetname");
	weaponjumpertele = getent ("weapon_jumper_tele", "targetname");

	for(;;) {
		weapontrig waittill ("trigger", player);

		if(level.firstenter == false) {
			snipertrig delete();
			jumptrig delete();
			level.firstenter = true;
		}

		gun = GetRandomWeapon();

        player.health = player.maxhealth;
        level.activ.health = level.activ.maxhealth;

		player SetOrigin (weaponjumpertele.origin);
		player setplayerangles (weaponjumpertele.angles);
		level.activ SetOrigin (weaponactitele.origin);
		level.activ setplayerangles (weaponactitele.angles);

		player TakeAllWeapons();
		level.activ TakeAllWeapons();

		player GiveWeapon( gun );
		level.activ GiveWeapon( gun );

		player SwitchToWeapon( gun );
		level.activ SwitchToWeapon( gun );

		iPrintLnBold(player.name+ "^4 has entered the ^1Weapon Room");

		while(isAlive(player))
		{
			wait 1;
		}		
	}
}

GetRandomWeapon() {
	return level.rnd_weapon_goobster[randomint(level.rnd_weapon_goobster.size)];
}

jump_tele()
{
	weapontrig = getent ("weapon_trigger", "targetname");
	snipertrig = getent ("sniper_trigger", "targetname");

	jumptrig = getent ("jump_trigger", "targetname");
	jumpactitele = getent ("jump_acti_tele", "targetname");
	jumpjumpertele = getent ("jump_jumper_tele", "targetname");

	thread jump_wep();

	for(;;) {
		jumptrig waittill("trigger", player);
		
		if(level.firstenter == false) {
			snipertrig delete();
			weapontrig delete();
			level.firstenter = true;
		}

		level.jump_room_weapon_given = false;

        player.health = player.maxhealth;
        level.activ.health = level.activ.maxhealth;

		player SetOrigin (jumpjumpertele.origin);
		player setplayerangles (jumpjumpertele.angles);
		level.activ SetOrigin (jumpactitele.origin);
		level.activ setplayerangles (jumpactitele.angles);

		player TakeAllWeapons();
		level.activ TakeAllWeapons();

		player GiveWeapon ("knife_mp"); 
		level.activ GiveWeapon ("knife_mp");

		player switchToWeapon ("knife_mp");
		level.activ SwitchToWeapon ("knife_mp");

		iPrintLnBold(player.name+ "^4 has entered the ^1Jump Room");
	
		while(isAlive(player))
		{
			wait 1;
		}
	}
}
	
jump_wep()
{
	trigger = getent ("give_wep_trig", "targetname");

	for(;;) {
		trigger waittill ("trigger", user);

		if(!level.jump_room_weapon_given) {
			level.jump_room_weapon_given = true;
			user iPrintLnBold(user.name+ "^4 has gotten the Jump Room ^1weapon!");
			user giveWeapon ("m40a3_mp");
			user switchToWeapon ("m40a3_mp");
		}
	}

}