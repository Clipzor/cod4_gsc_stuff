/*
	Traps: 14
	
	Size: small

	Difficult: Easy-Med

	Map made by nexuS|Team
*/
main()
{
maps\mp\_load::main();

	ambientPlay ( "nexus" );

	thread trap1();
	thread trap2();
	thread kocka();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();
	thread creator();
	thread sniper();
	thread knife();
	thread bounce();
	thread fun();
	thread old();
	thread lift();
	thread bpart1();
	thread bpart2();
	thread mover();
	thread mozgo();
	thread fail();
	thread secret();
	thread secret_final();

	addTriggerToList("trap1_t");
	addTriggerToList("trap2_t");
	addTriggerToList("kocka_trig");
	addTriggerToList("trap4_t");
	addTriggerToList("trap5_t");
	addTriggerToList("trap6_t");
	addTriggerToList("trap7_t");
	addTriggerToList("trap8_t");
	addTriggerToList("trap9_t");
	addTriggerToList("trap10_t");
	addTriggerToList("trap11_t");
	addTriggerToList("trap12_t");
	addTriggerToList("trap13_t");
	addTriggerToList("trap14_t");

	level.green = LoadFX ( "explosions/green_exp" );
}

trap1()
{
	trig =getent("trap1_t", "targetname");
	trap1 = getent("trap1","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{
	trap1 rotateRoll (360, 5);
	wait 0.05;
	}
}

trap2()
{

	trig =getent("trap2_t", "targetname");
	trap2 = getent("trap2","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{
	trap2 rotateYaw (360, 2.3);
	wait 5;
	trap2 rotateYaw (-360, 2.3);
	wait 5;
	}
}

kocka()
   {
   trig = getent( "kocka_trig", "targetname" );
   while (1)
   {
   trig sethintstring("Press ^3&&1 ^7for activate.");
   trig waittill ("trigger", user);
   trig delete();
   { randb = randomInt(9);
   kocka1 = getent( "kocka1", "targetname" );
   kocka2 = getent( "kocka2", "targetname" );
   kocka3 = getent( "kocka3", "targetname" );
   kocka4 = getent( "kocka4", "targetname" );
   if (randb == 0)
   {kocka1 notsolid(); wait .05; kocka1 notsolid(); }
   if (randb == 1)
   { kocka1 notsolid(); wait .05; kocka2 notsolid(); }
   if (randb == 2)
   { kocka1 notsolid(); wait .05; kocka3 notsolid(); }
   if (randb == 3)
   { kocka1 notsolid(); wait .05; kocka4 notsolid(); }
   if (randb == 4)
   {kocka2 notsolid(); wait .05; kocka2 notsolid(); }
   if (randb == 5)
   { kocka2 notsolid(); wait .05; kocka3 notsolid(); }
   if (randb == 6)
   { kocka2 notsolid(); wait .05; kocka4 notsolid(); }
   if (randb == 7)
   { kocka3 notsolid(); wait .05; kocka3 notsolid(); }
   if (randb == 8)
   { kocka3 notsolid(); wait .05; kocka4 notsolid(); }
   if (randb == 9)
   { kocka3 notsolid(); wait .05; kocka4 notsolid(); }
   }
   }
   }


trap4()
{
	trig =getent("trap4_t", "targetname");
	trap4 = getent("trap4", "targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");
	
	trap4 delete();
	
}

creator()
{

	for(;;)
	{
	wait 10;
	iprintln ("^1>> ^5Map created by ^2Nexus Team");
	wait 10;
	iprintln ("^1>> ^5xfire: ^2kovacsakos23");
	wait 10;
	iprintln ("^1>> ^5Good Luck & Have Fun :)");
	wait 10;
	iprintln ("^1>> ^5Thanks for playing on the map!");
	}
}

trap5()
{
	trig=getent("trap5_t", "targetname");
	trap5_1=getent("trap5_1","targetname");
	trap5_2=getent("trap5_2","targetname");
	trap5_dmg=getent("trap5_dmg","targetname");

	trap5_dmg enablelinkto();
	trap5_dmg linkto(trap5_2);

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap5_1 moveZ ( 144, 1.2);
	wait 3;
	trap5_2 movex (-377, 2.3);
	wait 3;
	trap5_2 movex (377, 2.3);
	wait 4;
	trap5_1 moveZ (-144, 1.2);
}

trap6()
{
	trig=getent("trap6_t", "targetname");
	trap6_1=getent("trap6_1","targetname");
	trap6_2=getent("trap6_2","targetname");
	trap6_3=getent("trap6_3","targetname");
	dmg1=getent("dmg1","targetname");
	dmg2=getent("dmg2","targetname");
	dmg3=getent("dmg3","targetname");

	dmg1 enablelinkto();
	dmg1 linkto(trap6_1);
	dmg2 enablelinkto();
	dmg2 linkto(trap6_2);
	dmg3 enablelinkto();
	dmg3 linkto(trap6_3);
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{
	trap6_1 moveZ (45, 1);
	wait 2;
	trap6_2 moveZ (45, 1);
	wait 2;
	trap6_3 moveZ (45, 1);
	wait 2;
	trap6_1 moveZ (-45, 1);
	wait 2;
	trap6_2 moveZ (-45, 1);
	wait 2;
	trap6_3 moveZ (-45, 1);
	}
}

trap7()
{
	trig =getent("trap7_t", "targetname");
	trap7_1 = getent("trap7_1", "targetname");
	trap7_2 = getent("trap7_2", "targetname");
	hozza_a = getent("a","targetname");
	hozza_b = getent("b","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap7_1 enablelinkto();
	trap7_1 linkto(hozza_a);
	trap7_2 enablelinkto();
	trap7_2 linkto(hozza_b);
	
	hozza_a rotateRoll (75, 1);
	wait 0.05;
	hozza_b rotateRoll (-75, 1);
	wait 5;
	hozza_a rotateroll (-75, 1);
	wait 0.05;
	hozza_b rotateroll (75, 1);
}

mozgo()
{
	mozgo=getent("mozog","targetname");
	
	while(1)
	{
	mozgo moveY(-785, 5);
	wait 10;
	mozgo moveY(785, 5);
	wait 10;
	}
}

trap8()
{
	trig=getent("trap8_t", "targetname");
	trap8=getent("trap8","targetname");
	trap8_dmg=getent("trap8_dmg","targetname");

	trap8_dmg enablelinkto();
	trap8_dmg linkto(trap8);

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap8 moveZ (95 , 1.2);
	wait 3;
	trap8 movez (-95, 1.2);
		
}

trap9()
{
	trig=getent("trap9_t", "targetname");
	trap9_1=getent("trap9_1","targetname");
	trap9_2=getent("trap9_2","targetname");
	dama1=getent("dmg9_1","targetname");
	dama2=getent("dmg9_2","targetname");

	dama1 enablelinkto();
	dama1 linkto(trap9_1);
	dama2 enablelinkto();
	dama2 linkto(trap9_2);

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{
	trap9_1 rotateyaw (360, 2.3);
	wait 0.5;
	trap9_2 rotateYaw (360, 2.3);
	wait 0.5;
	}
}

trap10()
{
	trig =getent("trap10_t", "targetname");
	trap10 = getent("trap10", "targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");
	
	trap10 delete();
	
}


trap11()
{
	trig = getent("trap11_t", "targetname");
	trap11_1 = getent( "trap11_1", "targetname");
	trap11_2 = getent( "trap11_2", "targetname");
	
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{
	trap11_1 moveZ ( -150, 0.5);
	wait 0.9;
	trap11_1 moveZ (150, 0.5);
	wait 0.9;
	trap11_2 moveZ (-150, 0.5);
	wait 0.9;
	trap11_2 moveZ (150, 0.5);
	wait 0.9;
	}
}

trap12()
{
	trig =getent("trap12_t", "targetname");
	trap12 = getent("trap12", "targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");
	
	trap12 delete();
	
}

trap13()
{
	trig =getent("trap13_t", "targetname");
	trap13_1 = getent("trap13_1", "targetname");
	trap13_2 = getent("trap13_2", "targetname");
	abc = getent("abc","targetname");
	def = getent("def","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap13_1 enablelinkto();
	trap13_1 linkto(def);
	trap13_2 enablelinkto();
	trap13_2 linkto(abc);
	
	abc rotatePitch (90, 1.5);
	wait 0.05;
	def rotatePitch (-90, 1.5);
	wait 5;
	abc rotatePitch (-90, 1.5);
	wait 0.05;
	def rotatePitch (90, 1.5);
}

trap14()
{
	trig =getent("trap14_t", "targetname");
	trap14 = getent("trap14", "targetname");

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap14 moveZ (312, 2);
	wait 6;
	trap14 moveZ (-312,2);
}

mover()
{
	mover=getent("mozgo","targetname");
	
	while(1)
	{
	mover moveY (900, 9);
	wait 13;
	mover moveY (-900, 9);
	wait 13;
	}
}

old()
{
	door=getent("old_door","targetname");
	level.old_trig=getent("old_trig", "targetname");
	fx_elem=getent("c4", "targetname");
	expl=getent("end", "targetname");

	level.old_trig sethintstring("Press ^3&&1 ^7for ^3open");
	level.old_trig waittill ("trigger", player);
	level.old_trig delete();

	level.sniper_trig delete();
	level.knife_trig delete();
	level.bounce_trig delete();
	level.fun_trig delete();

	playFx ( level.green, expl.origin );
	fx_elem delete();
	door delete();
	iPrintLnBold("^1" + player.name + " ^3has choosen ^0Old Way^5!");
	
}

sniper()
{
	level.sniper_trig = getEnt( "sniper_t", "targetname");
	jump = getEnt( "sniper_j", "targetname" );
	acti = getEnt( "sniper_a", "targetname" );
	
	while(1)
	{
		level.sniper_trig SetHintstring ("Press ^3&&1 ^7for ^2Sniper RooM!");
		level.sniper_trig waittill( "trigger", player );
		level.sniper_trig SetHintstring ("^1Wait!");
		if( !isDefined( level.sniper_trig ) )
			return;

		level.old_trig delete();
		level.knife_trig delete();
		level.bounce_trig delete();
		level.fun_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );
		player giveMaxAmmo( "remington700_mp" );
		player giveMaxAmmo( "m40a3_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveWeapon( "m40a3_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
		level.activ GiveMaxAmmo( "m40a3_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
		player switchToWeapon( "remington700_mp" );
		player switchToWeapon( "m40a3_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		level.activ switchToWeapon( "m40a3_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
  		iPrintLnBold("^1" + player.name + " ^3has choosen ^0Sniper^5!");
		wait 1;
		iPrintLnBold("^33");
		wait 1;
		iPrintLnBold("^22");
		wait 1;
		iPrintLnBold("^11");
		wait 1;
		iPrintLnBold("^5FIGHT!");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	
            while( isDefined( player ) && isAlive( player ) )
		wait 1;
	}
}

knife()
{
	level.knife_trig = getEnt( "knife_t", "targetname");
	jump = getEnt( "knife_j", "targetname" );
	acti = getEnt( "knife_a", "targetname" );
	
	while(1)
	{
		level.knife_trig SetHintstring ("Press ^3&&1 ^7for ^2Knife RooM!");
		level.knife_trig waittill( "trigger", player );
		level.knife_trig SetHintstring ("^1Wait!");
		if( !isDefined( level.knife_trig ) )
			return;

		level.sniper_trig delete();
		level.old_trig delete();
		level.bounce_trig delete();
		level.fun_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );
		player giveMaxAmmo( "knife_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );
		level.activ GiveMaxAmmo( "knife_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ switchToWeapon( "knife_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
  		iPrintLnBold("^1" + player.name + " ^3has choosen ^0Knife^5!");
		wait 1;
		iPrintLnBold("^3[3]");
		wait 1;
		iPrintLnBold("^2[2]");
		wait 1;
		iPrintLnBold("^1[1]");
		wait 1;
		iPrintLnBold("^5[FIGHT!]");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	
            while( isDefined( player ) && isAlive( player ) )
		wait 1;
	}
}

bounce()
{
	level.bounce_trig = getEnt( "bou_t", "targetname");
	jump = getEnt( "bou_j", "targetname" );
	acti = getEnt( "bou_a", "targetname" );
	
	while(1)
	{
		level.bounce_trig SetHintstring ("Press ^3&&1 ^7for ^2Bounce RooM!");
		level.bounce_trig waittill( "trigger", player );
		level.bounce_trig SetHintstring ("^1Wait!");
		if( !isDefined( level.bounce_trig ) )
			return;

		level.sniper_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.fun_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );
		player giveMaxAmmo( "knife_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );
		level.activ GiveMaxAmmo( "knife_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ switchToWeapon( "knife_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
  		iPrintLnBold("^1" + player.name + " ^3has choosen ^0Bounce^5!");
		wait 1;
		iPrintLnBold("^3[3]");
		wait 1;
		iPrintLnBold("^2[2]");
		wait 1;
		iPrintLnBold("^1[1]");
		wait 1;
		iPrintLnBold("^5[FIGHT!]");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	
            while( isDefined( player ) && isAlive( player ) )
		wait 1;
	}
}

fun()
{
	level.fun_trig = getEnt( "fun_t", "targetname");
	jump = getEnt( "fun_j", "targetname" );
	acti = getEnt( "fun_a", "targetname" );
	
	while(1)
	{
		level.fun_trig SetHintstring ("Press ^3&&1 ^7for ^2Funny RooM!");
		level.fun_trig waittill( "trigger", player );
		level.fun_trig SetHintstring ("^1Wait!");
		if( !isDefined( level.fun_trig ) )
			return;

		level.sniper_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.bounce_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );
		player giveMaxAmmo( "knife_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );
		level.activ GiveMaxAmmo( "knife_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ switchToWeapon( "knife_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
  		iPrintLnBold("^1" + player.name + " ^3has choosen ^0Fun^5!");
		wait 1;
		iPrintLnBold("^3[3]");
		wait 1;
		iPrintLnBold("^2[2]");
		wait 1;
		iPrintLnBold("^1[1]");
		wait 1;
		iPrintLnBold("^5[FIGHT!]");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	
            while( isDefined( player ) && isAlive( player ) )
		wait 1;
	}
}

bpart1()
{
	trig = getent ("jumper", "targetname");
	end = getent ("goback", "targetname");

	while(1)
	{
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	wait 0.1;
	}
}

bpart2()
{
	trig = getent ("acti", "targetname");
	end = getent ("backgo", "targetname");

	while(1)
	{
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	wait 0.1;
	}
}
secret()
{
	trig = getent ("secret", "targetname");
	end = getent ("sec", "targetname");

	while(1)
	{
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	wait 0.1;
	}
}

fail()
{
	trig = getent ("sec_tele", "targetname");
	end = getent ("telep", "targetname");

	while(1)
	{
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	wait 0.1;
	}
}

secret_final()
{
	trig = getent ("sec_f", "targetname");
	end = getent ("f_sec", "targetname");

	while(1)
	{
	trig SetHintstring ("Press ^3&&1 ^7for ^2finish!");
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	iprintLnbold ("^1" + player.name + " a PRO ^2Jumper?!");
	wait 0.1;
	}
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

lift()
{
	lift=getent("lift","targetname");
	trig=getent("lift_trig","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for ^3Start");
	trig waittill ("trigger", player);
	trig delete();

	while(1)
	{
	lift moveZ (-740, 6);
	wait 12;
	lift moveZ (740, 6);
	wait 12;
	}
}
	