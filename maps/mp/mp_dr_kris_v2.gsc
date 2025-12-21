//Map by Kris/Fish Da Rekter ©
//Incase of any script changes/fixes, please contact mapper 1st.


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

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("bg_fallDamageMinHeight","100000000");
	
	level.boom_fx = LoadFx("explosions/default_explosion");
	level.flash_fx = LoadFx("muzzleflashes/tiger_flash");
	level.heli_fx = LoadFx("explosions/helicopter_explosion_mi17_woodland_low");
	level.end_fx = LoadFx("explosions/wall_explosion_grnd");
	
	precacheItem("uzi_reflex_mp");
	precacheItem("rpg_mp");
	
	precacheModel("shadow_rainbow");
	
	thread bestie();
	thread kris();
	thread startdoors();
	thread area2();
	thread area3();
	thread tank();
	thread secretstep1();
	thread secretstep2();
	thread secretenter();
	thread ezsecrettp1();
	thread ezsecrettp2();
	thread ezsecrettp3();
	thread ezsecrettp4();
	thread ezsecrettp5();
	thread ezsecretenter();
	thread ezsecretexit();
	thread hdsecrettp1();
	thread hdsecrettp2();
	thread hdsecrettp3();
	thread hdsecrettp4();
	thread hdsecrettp5();
	thread hdsecrettp6();
	thread hdsecrettp7();
	thread hdsecrettp8();
	thread hdsecretenter();
	thread hdsecretexit();
	thread musicenter();
	thread music1();
	thread music2();
	thread music3();
	thread music4();
	thread music5();
	thread music6();
	thread tank2();
	thread actiarea1();
	thread actiarea2();
	thread actiarea2b();
	thread actiarea3();
	thread sniper();
	thread jump();
	thread knife();
	thread rpg();
	thread sniper1();
	thread sniper2();
	thread bounce1();
	thread bounce2();
	thread bounceweap();
	thread cyanopen();
	thread save1();
	thread save2();
	thread save3();
	thread ammo1();
	thread ammo2();
	thread knifefun1();
	thread knifefun2();
	thread fucku();
	thread helicaptur();
	thread migend();
	thread cyan();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread traphehe();
	thread vipsong();
	thread vipgun();
	thread actisave();
	thread actisave2();
	thread actisave3();
	
	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_traphehe" );
	
	level.firstenter=true;
}

	addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


bestie()
{
trig = getent("bestie", "targetname");

trig waittill ("trigger", player);
{
if( player.name == "Venia")
{
wait 1;
			iPrintLnBold( "^1OH MEIN GOOOOOOT");
			wait 1;
			iPrintLnBold( "^2My Bestieeee" );
			wait 1;
			iPrintLnBold( "^3Elpiiiiiiiiii" );
			wait 1;
			iPrintLnBold( "^4is" );
			wait 1;
			iPrintLnBold( "^2here ^5:'D" );
			wait 1;
			player iPrintLnBold( "^5 Se agapo skyla hahahahaha <3 ");
}

}

}

kris()
{
trig = getent("kingkris", "targetname");

{			
			trig waittill ("trigger", player);
			{
			if( player.name == "Fish Da Rekter")
			player iprintLnBold ("^5KING OF THE MAP ^2 " + player.name + "^5 IS HERE!!!");
			}

}

}


startdoors()
{
door1 = getent ("startdoor1","targetname");
door2 = getent ("startdoor2","targetname");
if(getdvarint("dr_auto_open_door")) {
		door1 delete();
		door2 delete();
		wait 5;
		iPrintLnBold ("^5Mp_dr_kris_v2");
		wait 2;
		iPrintLnBold ("^2Map by Fish Da Rekter");
		wait 10;
		wait 5;
		iprintLn ("^2Thanks to DarkSTEP with music :D");
		wait 5;
		iprintLn ("^2Thanks to bestie for being my bestie c: ");
	}
else
{
wait 5;
iPrintLnBold ("^5Mp_dr_kris_v2");
wait 2;
iPrintLnBold ("^2Map by Fish Da Rekter");
wait 10;
iPrintLnBold ("^3Start doors are opening.");
door1 moveY (689,2);
door2 moveY (-689,2);
wait 5;
iprintLn ("^2Thanks to DarkSTEP with music :D");
wait 5;
iprintLn ("^2Thanks to bestie for being my bestie c: ");
}

}

area2()
{
trig = getent("trig_area2", "targetname");
area2org = getent("origin_area2", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (area2org.origin);
	}
}

area3()
{
trig = getent("trig_area3", "targetname");
area3org = getent("origin_area3", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (area3org.origin);
	}
}

tank()
{
trig = getent("boom_trigger", "targetname");
muzzle = getent("tankboom_origin", "targetname");
boom = getent("boomdoor_origin", "targetname");
door = getent("boomdoor", "targetname");
trig waittill ("trigger", player);

{
PlayFX( level.flash_fx, muzzle.origin );
wait 0.1;
PlayFX( level.end_fx, boom.origin );
door delete();
trig delete();
}

}

secretstep1()
{
trig = getent("secretstep1", "targetname");
block = getent("secretstep2_block", "targetname");
trig waittill ("trigger", player);

{
block delete();
iPrintLnBold ("^3What ^1now???");
}


}

secretstep2()
{
trig = getent("secretstep2", "targetname");
entrance = getent("secretentranceopenblock", "targetname");
trig waittill ("trigger", player);

{
entrance delete();
iPrintLnBold ("^2 Right is the ^5Right ^2 way to go...^1WELL NOT ANYMORE");
wait 4;
iPrintLnBold ("^5 Congratulations u opened secret now its time to find it");
}


}

secretenter()
{
trig = getent("secretenter_trig", "targetname");
secretenterini = getent("secretenteros","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (secretenterini.origin);
	}
}

ezsecrettp1()
{
trig = getent("ezsecret_trig1", "targetname");
ezsecretorigin1 = getent("ezsecret_origin1","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (ezsecretorigin1.origin);
	}
}

ezsecrettp2()
{
trig = getent("ezsecret_trig2", "targetname");
ezsecretorigin2 = getent("ezsecret_origin2","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (ezsecretorigin2.origin);
	}
}

ezsecrettp3()
{
trig = getent("ezsecret_trig3", "targetname");
ezsecretorigin3 = getent("ezsecret_origin3","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (ezsecretorigin3.origin);
	}
}

ezsecrettp4()
{
trig = getent("ezsecret_trig4", "targetname");
ezsecretorigin4 = getent("ezsecret_origin4","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (ezsecretorigin4.origin);
	}
}

ezsecrettp5()
{
trig = getent("ezsecret_trig5", "targetname");
ezsecretorigin5 = getent("ezsecret_origin5","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (ezsecretorigin5.origin);
	}
}

ezsecretenter()
{
trig = getent("ezsecretenter_trig", "targetname");
ezsecretenter_org = getent("ezsecretenter_origin","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (ezsecretenter_org.origin);
		player iprintLnBold ("^2 Welcome to the ^5 EASY CYAN ^1 Secret!!!");
		player iprintLn ("^5 Made for my bestie c: ");
	}
}

ezsecretexit()
{
trig = getent("ezsecret_exit_trig", "targetname");
ezsecretexitorigin = getent("ezsecret_exit_origin","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (ezsecretexitorigin.origin);
		iPrintLnBold ("^2 " + player.name + " ^3 has finished the ^5 EASY CYAN ^1 Secret!!! ");
	}
}

hdsecrettp1()
{
trig = getent("hdsecret_trig1", "targetname");
hdsecretorigin1 = getent("hdsecret_origin1","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretorigin1.origin);
	}
}

hdsecrettp2()
{
trig = getent("hdsecret_trig2", "targetname");
hdsecretorigin2 = getent("hdsecret_origin2","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretorigin2.origin);
	}
}

hdsecrettp3()
{
trig = getent("hdsecret_trig3", "targetname");
hdsecretorigin3 = getent("hdsecret_origin3","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretorigin3.origin);
	}
}

hdsecrettp4()
{
trig = getent("hdsecret_trig4", "targetname");
hdsecretorigin4 = getent("hdsecret_origin4","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretorigin4.origin);
	}
}

hdsecrettp5()
{
trig = getent("hdsecret_trig5", "targetname");
hdsecretorigin5 = getent("hdsecret_origin5","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretorigin5.origin);
	}
}

hdsecrettp6()
{
trig = getent("hdsecret_trig6", "targetname");
hdsecretorigin6 = getent("hdsecret_origin6","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretorigin6.origin);
	}
}

hdsecrettp7()
{
trig = getent("hdsecret_trig7", "targetname");
hdsecretorigin7 = getent("hdsecret_origin7","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretorigin7.origin);
	}
}

hdsecrettp8()
{
trig = getent("hdsecret_trig8", "targetname");
hdsecretorigin8 = getent("hdsecret_origin8","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretorigin8.origin);
	}
}

hdsecretenter()
{
trig = getent("hdsecretenter_trig", "targetname");
hdsecretenter_org = getent("hdsecretenter_origin","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretenter_org.origin);
		player iprintLnBold ("^2 Welcome to the ^5 HARD CYAN ^1 Secret!!!");
		player iprintLn ("^5 Gl.");
	}
}

hdsecretexit()
{
trig = getent("hdsecret_exit_trig", "targetname");
hdsecretexitorigin = getent("hdsecret_exit_origin","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (hdsecretexitorigin.origin);
		iPrintLnBold ("^2 " + player.name + " ^3 has finished the ^5 HARD CYAN ^1 Secret!!! ");
	}
}

musicenter()
{
trig = getent("musicroom_trig", "targetname");
music = getent("musicroom_origin", "targetname");
trig waittill ("trigger", player);

{
player setOrigin (music.origin);
}

}

music1()
{
trig = getent ("song_activate", "targetname");
trig2 = getent ("song_activate2", "targetname");
trig3 = getent ("song_activate3", "targetname");
trig4 = getent ("song_activate4", "targetname");
trig5 = getent ("song_activate5", "targetname");
trig6 = getent ("song_activate6", "targetname");
trig sethintstring ("^2 Hardwell & Dyro - Never Say Goodbye (Flaremode, Marwek & Naems Best Of Life Remix) ");
trig waittill ("trigger", player);

ambientPlay("kris1");
iPrintLn ("^0>> ^1Now playing: ^2  Hardwell & Dyro - Never Say Goodbye (Flaremode, Marwek & Naems Best Of Life Remix) ^0<<");
trig2 delete();
trig3 delete();
trig4 delete();
trig5 delete();
trig6 delete();

}

music2()
{
trig = getent ("song_activate", "targetname");
trig2 = getent ("song_activate2", "targetname");
trig3 = getent ("song_activate3", "targetname");
trig4 = getent ("song_activate4", "targetname");
trig5 = getent ("song_activate5", "targetname");
trig6 = getent ("song_activate6", "targetname");
trig2 sethintstring ("^2 KSHMR & Bassjackers ft. Sirah - Memories (Juacko Remix)");
trig2 waittill ("trigger", player);

ambientPlay("kris2");
iPrintLn ("^0>> KSHMR & Bassjackers ft. Sirah - Memories (Juacko Remix) ^0<<");
trig delete();
trig3 delete();
trig4 delete();
trig5 delete();
trig6 delete();
}

music3()
{
trig = getent ("song_activate", "targetname");
trig2 = getent ("song_activate2", "targetname");
trig3 = getent ("song_activate3", "targetname");
trig4 = getent ("song_activate4", "targetname");
trig5 = getent ("song_activate5", "targetname");
trig6 = getent ("song_activate6", "targetname");
trig3 sethintstring ("^2  Excision & Pegboard Nerds - Bring The Madness (Noisestorm Remix)");
trig3 waittill ("trigger", player);

ambientPlay("kris3");
iPrintLn ("^0>> ^1Now playing: ^2  Excision & Pegboard Nerds - Bring The Madness (Noisestorm Remix) ^0<<");
trig delete();
trig2 delete();
trig4 delete();
trig5 delete();
trig6 delete();
}

music4()
{
trig = getent ("song_activate", "targetname");
trig2 = getent ("song_activate2", "targetname");
trig3 = getent ("song_activate3", "targetname");
trig4 = getent ("song_activate4", "targetname");
trig5 = getent ("song_activate5", "targetname");
trig6 = getent ("song_activate6", "targetname");
trig4 sethintstring ("^2 Pegboard Nerds & Spyker - Extraordinary (feat. Elizaveta ");
trig4 waittill ("trigger", player);

ambientPlay("kris4");
iPrintLn ("^0>> ^1Now playing: ^2  Pegboard Nerds & Spyker - Extraordinary (feat. Elizaveta) ^0<<");
trig delete();
trig2 delete();
trig3 delete();
trig5 delete();
trig6 delete();
}

music5()
{
trig = getent ("song_activate", "targetname");
trig2 = getent ("song_activate2", "targetname");
trig3 = getent ("song_activate3", "targetname");
trig4 = getent ("song_activate4", "targetname");
trig5 = getent ("song_activate5", "targetname");
trig6 = getent ("song_activate6", "targetname");
trig5 sethintstring ("^2W&W - Whatcha Need (Swede Dreams Bootleg) ");
trig5 waittill ("trigger", player);

ambientPlay("kris5");
iPrintLn ("^0>> ^1Now playing: ^2W&W - Whatcha Need (Swede Dreams Bootleg) ^0<<");
trig delete();
trig2 delete();
trig3 delete();
trig4 delete();
trig6 delete();
}

music6()
{
trig = getent ("song_activate", "targetname");
trig2 = getent ("song_activate2", "targetname");
trig3 = getent ("song_activate3", "targetname");
trig4 = getent ("song_activate4", "targetname");
trig5 = getent ("song_activate5", "targetname");
trig6 = getent ("song_activate6", "targetname");
trig6 sethintstring ("^2 Tyron Hapi & Jleo ft. KARRA - One Wish");
trig6 waittill ("trigger", player);

ambientPlay("kris6");
iPrintLn ("^0>> ^3Now playing: ^5 Tyron Hapi & Jleo ft. KARRA - One Wish ^0<<");
trig delete();
trig2 delete();
trig3 delete();
trig4 delete();
trig5 delete();
}

tank2()
{
bridgerotate = getent ("tank2bridgerotate", "targetname");
bridge = getent ("tank2bridge", "targetname");
boom2 = getent ("boomdoor2_origin", "targetname");
boomdoor2 = getent ("boomdoor2", "targetname");
muzzle2 = getent("tankboom2_origin", "targetname");
trig = getent("tank2_trig", "targetname");
trig waittill ("trigger", player);

{
bridge enablelinkto();
bridge linkto(bridgerotate);

trig delete();
bridgerotate rotateroll (-90,1);
wait 3.2;
PlayFX( level.flash_fx, muzzle2.origin );
wait 0.1;
PlayFX( level.end_fx, boom2.origin );
boomdoor2 delete();

}

trig delete();
}

actiarea1()
{
trig = getent("actiarea1_trig", "targetname");
area1 = getent("actiarea1_org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (area1.origin);
	}
}

actiarea2()
{
trig = getent("actiarea2_trig", "targetname");
area2 = getent("actiarea2_org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (area2.origin);
	}
}

actiarea2b()
{
trig = getent("actiarea2b_trig", "targetname");
area2b = getent("actiarea2b_org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (area2b.origin);
	}
}

actiarea3()
{
trig = getent("actiarea3_trig", "targetname");
area3 = getent("actiarea3_org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (area3.origin);
	}
}

sniper()
{		
		level.teleactorigin3 = getEnt("sniper_acti", "targetname");
		telejumporigin3 = getEnt("sniper_jump", "targetname");
		level.sniper_trigger = getEnt("sniper_trig", "targetname");
		level.jump_trigger = getent("jump_trig", "targetname");
		level.knife_trigger = getEnt("knife_trig", "targetname");
		level.rpg_trigger = getEnt("rpg_trig", "targetname");
		level.old_trigger = getent ( "old_trig", "targetname" );
		level.cyan_trigger = getent("cyan_trig", "targetname");

		
		while(1)
		{
		level.sniper_trigger waittill( "trigger", player );
		


		if( !isDefined( level.sniper_trigger ))
					return;
			if(level.firstenter==true)
				{
				level.jump_trigger delete();
				level.knife_trigger delete();
				level.rpg_trigger delete();
				level.old_trigger delete();
				level.cyan_trigger delete();
				level.firstenter=false;
				} 
				wait(0.05);
				
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("krissniper");		
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
		player thread iAmmo();
		level.activ setOrigin (level.teleactorigin3.origin);
		level.activ setPlayerAngles (level.teleactorigin3.angles);
		level.activ takeAllWeapons();
		level.activ.maxhealth = 100;
		level.activ giveWeapon( "m40a3_mp" );
		level.activ giveWeapon( "remington700_mp" );
		level.activ giveMaxAmmo("m40a3_mp");
		level.activ giveMaxAmmo( "remington700_mp" );
		wait (0.05);
		level.activ switchToWeapon("m40a3_mp");
		level.activ thread iAmmo();
		player freezeControls(true); 
		level.activ freezeControls(true);
		iPrintLnBold( " ^5" + player.name + " ^2 has entered the Sniper room!" );
		wait 2;
		player freezeControls(false); 
		level.activ freezeControls(false);
		
		player waittill( "death" );
		level.PlayerInRoom = false;

}

}

jump()
{	
		level.teleactorigin = getEnt("jump_acti", "targetname");
		telejumporigin = getEnt("jump_jump", "targetname");
		level.jump_trigger = getent("jump_trig", "targetname");
		level.sniper_trigger = getEnt("sniper_trig", "targetname");
		level.knife_trigger = getEnt("knife_trig", "targetname");
		level.rpg_trigger = getEnt("rpg_trig", "targetname");
		level.old_trigger = getent ( "old_trig", "targetname" );
		level.cyan_trigger = getent("cyan_trig", "targetname");

		
	
		
		while(1)
		{
		level.jump_trigger waittill( "trigger", player );
		
		
		if( !isDefined( level.jump_trigger ))
					return;
			if(level.firstenter==true)
				{
				level.sniper_trigger delete();
				level.knife_trigger delete();
				level.rpg_trigger delete();
				level.old_trigger delete();
				level.cyan_trigger delete();
				level.firstenter=false;
				} 
				wait(0.05);
				
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("krisjump");
		player setOrigin( telejumporigin.origin );
		player setPlayerAngles( telejumporigin.angles );
		player takeAllWeapons();
		player giveWeapon("knife_mp");
		wait (0.05);
		player switchToWeapon("knife_mp"); 
		wait (0.05);
		level.activ setOrigin (level.teleactorigin.origin);
		level.activ setPlayerAngles (level.teleactorigin.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon( "knife_mp" );
		wait (0.05);
		level.activ switchToWeapon("knife_mp");
		player freezeControls(true); 
		level.activ freezeControls(true);
		iPrintLnBold( " ^5" + player.name + " ^2 has entered the Jump room^2!" );
		wait 2;
		player freezeControls(false); 
		level.activ freezeControls(false); 
		
		player waittill( "death" );
		level.PlayerInRoom = false;
		}
}

knife()
{	
		level.teleactorigin2 = getEnt("knife_acti", "targetname");
		telejumporigin2 = getEnt("knife_jump", "targetname");
		level.jump_trigger = getent("jump_trig", "targetname");
		level.sniper_trigger = getEnt("sniper_trig", "targetname");
		level.knife_trigger = getEnt("knife_trig", "targetname");
		level.rpg_trigger = getEnt("rpg_trig", "targetname");
		level.old_trigger = getent ( "old_trig", "targetname" );
		level.cyan_trigger = getent("cyan_trig", "targetname");


		
	
		
		while(1)
		{
		level.knife_trigger waittill( "trigger", player );
		
		
		if( !isDefined( level.knife_trigger ))
					return;
			if(level.firstenter==true)
				{
				level.sniper_trigger delete();
				level.jump_trigger delete();
				level.rpg_trigger delete();
				level.old_trigger delete();
				level.cyan_trigger delete();
				level.firstenter=false;
				} 
				wait(0.05);
				
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("krisknife");
		player setOrigin( telejumporigin2.origin );
		player setPlayerAngles( telejumporigin2.angles );
		player takeAllWeapons();
		player giveWeapon("knife_mp");
		wait (0.05);
		player switchToWeapon("knife_mp"); 
		wait (0.05);
		level.activ setOrigin (level.teleactorigin2.origin);
		level.activ setPlayerAngles (level.teleactorigin2.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon( "knife_mp" );
		wait (0.05);
		level.activ switchToWeapon("knife_mp");
		player freezeControls(true); 
		level.activ freezeControls(true);
		iPrintLnBold( " ^5" + player.name + " ^2 has entered the Knife room^2!" );
		wait 2;
		player freezeControls(false); 
		level.activ freezeControls(false); 
		
		player waittill( "death" );
		level.PlayerInRoom = false;
		}
}

rpg()
{	
		level.teleactorigin4 = getEnt("rpg_acti", "targetname");
		telejumporigin4 = getEnt("rpg_jump", "targetname");
		level.jump_trigger = getent("jump_trig", "targetname");
		level.sniper_trigger = getEnt("sniper_trig", "targetname");
		level.knife_trigger = getEnt("knife_trig", "targetname");
		level.rpg_trigger = getEnt("rpg_trig", "targetname");
		level.old_trigger = getent ( "old_trig", "targetname" );
		level.cyan_trigger = getent("cyan_trig", "targetname");

		
	
		
		while(1)
		{
		level.rpg_trigger waittill( "trigger", player );
		
		
		if( !isDefined( level.rpg_trigger ))
					return;
			if(level.firstenter==true)
				{
				level.sniper_trigger delete();
				level.jump_trigger delete();
				level.knife_trigger delete();
				level.old_trigger delete();
				level.cyan_trigger delete();
				level.firstenter=false;
				} 
				wait(0.05);
				
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("krisrpg");		
		player setOrigin( telejumporigin4.origin );
		player setPlayerAngles( telejumporigin4.angles );
		player takeAllWeapons();
		player giveWeapon("rpg_mp");
		wait (0.05);
		player switchToWeapon("rpg_mp"); 
		wait (0.05);
		player thread iAmmo();
		level.activ setOrigin (level.teleactorigin4.origin);
		level.activ setPlayerAngles (level.teleactorigin4.angles);
		level.activ takeAllWeapons();
		level.activ.maxhealth = 100;
		level.activ giveWeapon( "rpg_mp" );
		wait (0.05);
		level.activ switchToWeapon("rpg_mp");
		level.activ thread iAmmo();
		player freezeControls(true); 
		level.activ freezeControls(true);
		iPrintLnBold( " ^5" + player.name + " ^2 has entered the RPG room^2!" );
		wait 2;
		player freezeControls(false); 
		level.activ freezeControls(false); 
		
		player waittill( "death" );
		level.PlayerInRoom = false;
		}
}

iAmmo()
{
self endon ( "disconnect" );
self endon ( "death" );
while ( 1 )
{
currentWeapon = self getCurrentWeapon();
if ( currentWeapon != "none" )
{
//self setWeaponAmmoClip( currentWeapon, 9999 );
self GiveMaxAmmo( currentWeapon );
}

currentoffhand = self GetCurrentOffhand();
if ( currentoffhand != "none" )
{
//self setWeaponAmmoClip( currentoffhand, 9999 );
self GiveMaxAmmo( currentoffhand );
}
wait 5;
}
}

sniper1()
{
trig = getent("sniptrig1", "targetname");
snip1 = getent("snipertrig1_org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (snip1.origin);
	}
}

sniper2()
{
trig = getent("sniptrig2", "targetname");
snip2 = getent("snipertrig2_org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (snip2.origin);
	}
}

bounce1()
{
trig = getent("jumptrig1", "targetname");
jump1 = getent("jumptrig1_org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (jump1.origin);
	}
}

bounce2()
{
trig = getent("jumptrig2", "targetname");
jump2 = getent("jumptrig2_org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (jump2.origin);
	}
}

bounceweap()
{
weapon = getent("giveweap", "targetname");
weapon sethintstring ("^2 Press &&1 for weapon!");

while(1)
{
weapon waittill ("trigger", player);
player giveWeapon ("m40a3_mp");
player giveMaxAmmo ("m40a3_mp");
player switchToWeapon ("m40a3_mp");
player iPrintLnBold ("^5 You got a sniper!");
}

}

cyanopen()
{
trig = getent("cyan_open", "targetname");
door = getent("cyan_door", "targetname");
enter = getent("cyan_trig", "targetname");

enter enablelinkto();
enter linkto(door);

trig waittill ("trigger", player);

door moveZ (320,1);

iprintLnBold ("^5Something cyany is going on ouuuuuuu :D ");
}

save1()
{
trig = getent("trig_save1", "targetname");
save1 = getent("org_save1","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player freezeControls(true); 
		player setOrigin (save1.origin);
		player iPrintLnBold ("^2Thank me for saving ur fat ass...");
		wait 0.5;
		player freezeControls(false); 
	}
}

save2()
{
trig = getent("trig_save2", "targetname");
save2 = getent("org_save2","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player freezeControls(true); 
		player setOrigin (save2.origin);
		player iPrintLnBold ("^2Thank me for saving ur fat ass...");
		wait 0.5;
		player freezeControls(false); 
	}
}

save3()
{
trig = getent("trig_save3", "targetname");
save3 = getent("org_save3","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player freezeControls(true); 
		player setOrigin (save3.origin);
		player iPrintLnBold ("^2Thank me for saving ur fat ass...");
		wait 0.5;
		player freezeControls(false); 
	}
	
}

ammo1()
{
weapon = getent("giveammo", "targetname");
weapon sethintstring ("^2 Press &&1 for ammo!");

while(1)
{
weapon waittill ("trigger", player);
player giveMaxAmmo ("rpg_mp");
player iPrintLnBold ("^5 You got ammo!");
}

}

ammo2()
{
weapon = getent("giveammo2", "targetname");
weapon sethintstring ("^2 Press &&1 for ammo!");

while(1)
{
weapon waittill ("trigger", player);
player giveMaxAmmo ("rpg_mp");
player iPrintLnBold ("^5 You got ammo!");
}

}

knifefun1()
{
plat1 = getent("knife1", "targetname");

while(1)
{
plat1 moveZ (304,2);
wait 2;
plat1 moveZ (-304,2);
wait 2;

}

}

knifefun2()
{
plat2 = getent("knife2", "targetname");

while(1)
{
plat2 moveZ (304,2);
wait 2;
plat2 moveZ (-304,2);
wait 2;

}

}

fucku()
{
trigurdead = getent("fucku_trig", "targetname");
	
	for(;;)
	{
		trigurdead waittill("trigger", player);
		player freezeControls(true); 
		player iPrintLnBold (" ^1NO. ");
		wait 1;
		player iPrintLnBold (" ^1FUCK U. ");
		wait 1;
		player iPrintLnBold (" ^1DONT DARE TO DO THAT EVER AGAIN. ");
		wait 1;
		player iPrintLnBold (" ^1NOW ACCEPT UR PUNISHMENT. ");
		PlayFX( level.boom_fx, player.origin );
		RadiusDamage( player.origin, 150, 150, 100);
		player freezeControls(false);
		
		
	}
	
}

helicaptur()
{
trig = getent("heli_trig", "targetname");
heli = getent ("heli", "targetname");
origin1 = getent("heliway1", "targetname");
origin2 = getent("heliway2", "targetname");
brush1 = getent("helibrush", "targetname");
brush2 = getent("helibrush2", "targetname");
trig waittill ("trigger", player);

{		
		trig delete();
		heli moveTo( origin1.origin, 1 );
		heli rotateTo( origin1.angles, 1 );
		wait 1.5;
		heli moveX (-600,1);
		wait 1;
		heli moveTo( origin2.origin, 1 );
		heli rotateTo( origin2.angles, 1 );
		heli rotateYaw(720, 1);
		wait 1;
		playFx( level.heli_fx, origin2.origin);
		playFx( level.end_fx, origin2.origin);
		Earthquake( 2, 1, origin2.origin, 1000 );
		brush1 delete();
		brush2 delete();
		heli delete();
}

}

migend()
{
trig = getent("migtrig", "targetname");
mig1 = getent ("mig1", "targetname");
mig2 = getent ("mig2", "targetname");
mig3 = getent ("mig3", "targetname");
mis1 = getent ("mis1", "targetname");
mis2 = getent ("mis2", "targetname");
mis3 = getent ("mis3", "targetname");
mis4 = getent ("mis4", "targetname");
mis5 = getent ("mis5", "targetname");
mis6 = getent ("mis6", "targetname");
endorg1 = getent("endorg1", "targetname");
endorg2 = getent("endorg2", "targetname");
endorg3 = getent("endorg2", "targetname");
end1 = getent("end1", "targetname");
end2 = getent("end2", "targetname");
end3 = getent("end3", "targetname");
end4 = getent("end4", "targetname");
end5 = getent("end5", "targetname");
end6 = getent("end6", "targetname");
trig waittill ("trigger", player);

{
trig delete();
mig1 moveX (-6560, 3);
mig2 moveX (-6560, 3);
mig3 moveX (-6560, 3);
mis1 moveTo( endorg1.origin, 2 );
mis2 moveTo( endorg1.origin, 2 );
mis3 moveTo( endorg2.origin, 2 );
mis4 moveTo( endorg2.origin, 2 );
mis5 moveTo( endorg3.origin, 2 );
mis6 moveTo( endorg3.origin, 2 );
wait 2;
playFx( level.end_fx, endorg1.origin);
playFx( level.end_fx, endorg2.origin);
playFx( level.end_fx, endorg3.origin);
end1 delete();
end2 delete();
end3 delete();
end4 delete();
end5 delete();
end6 delete();
mis1 delete();
mis2 delete();
mis3 delete();
mis4 delete();
mis5 delete();
mis6 delete();
wait 1;
mig1 delete();
mig2 delete();
mig3 delete();
}

}

cyan()
{
		level.teleactorigin5 = getEnt("cyan_acti", "targetname");
		telejumporigin5 = getEnt("cyan_jump", "targetname");
		level.rpg_trigger = getent("rpg_trig", "targetname");
		level.jump_trigger = getent("jump_trig", "targetname");
		level.knife_trigger = getent("knife_trig", "targetname");
		level.sniper_trigger = getEnt("sniper_trig", "targetname");
		level.cyan_trigger = getent("cyan_trig", "targetname");
		level.old_trigger = getEnt("old_trig", "targetname");
		boom9 = getent("fx_origin9", "targetname");
		boom10 = getent("fx_origin10", "targetname");

		
		while(1)
		{
		level.cyan_trigger waittill( "trigger", player );
		
		
		if( !isDefined( level.cyan_trigger ))
					return;
			if(level.firstenter==true)
				{
				level.sniper_trigger delete();
				level.knife_trigger delete();
				level.old_trigger delete();
				level.jump_trigger delete();
				level.rpg_trigger delete();
				level.firstenter=false;
				} 
				wait(0.05);
		
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("kriscyan");
		player setOrigin( telejumporigin5.origin );
		player setPlayerAngles( telejumporigin5.angles );
		player takeAllWeapons();
		player giveWeapon("uzi_reflex_mp");
		wait (0.05);
		player switchToWeapon("uzi_reflex_mp"); 
		wait (0.05);
		player thread iAmmo();
		level.activ setOrigin (level.teleactorigin5.origin);
		level.activ setPlayerAngles (level.teleactorigin5.angles);
		level.activ takeAllWeapons();
		level.activ.maxhealth = 100;
		level.activ giveWeapon( "uzi_reflex_mp" );
		wait (0.05);
		level.activ switchToWeapon("uzi_reflex_mp");
		level.activ thread iAmmo();
		player freezeControls(true); 
		level.activ freezeControls(true);
		iPrintLnBold( " ^5" + player.name + " ^2 has entered the ^5CYAN room^2!" );
		wait 2;
		player freezeControls(false); 
		level.activ freezeControls(false); 
		PlayFX( level.boom_fx, boom9.origin );
		PlayFX( level.boom_fx, boom10.origin );
		iPrintLn ("^0>> ^1Now playing: ^2 Headhunterz & Skytech - Kundalini   ^0<<");
		
		player waittill( "death" );
		level.PlayerInRoom = false;
		
		
		}
}


trap1()
{
trig = getent("trig_trap1", "targetname");
bounce1 = getent("trap1a", "targetname");
bounce2 = getent("trap1b", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

x=randomint(2);
if (x==0)
{
bounce1 notsolid();
}

if (x==1)
{
bounce2 notsolid();
}


}

trap2()
{
trig = getent("trig_trap2", "targetname");
plat = getent("trap2", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

while(1)
{
plat rotateYaw(360,3);
wait 0.1;
}

}

trap3()
{
trig = getent("trig_trap3", "targetname");
polea = getent("trap3a", "targetname");
poleb = getent("trap3b", "targetname");
polec = getent("trap3c", "targetname");
poled = getent("trap3d", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

while(1)
{
polea moveX (96,0.5);
poleb moveX (96,0.5);
polec moveX (-96,0.5);
poled moveX (-96,0.5);
wait 0.5;
polea moveX (-96,0.5);
poleb moveX (-96,0.5);
polec moveX (96,0.5);
poled moveX (96,0.5);
wait 0.5;
}
}

trap4()
{
trig = getent("trig_trap4", "targetname");
block1 = getent("trap4a", "targetname");
block2 = getent("trap4b", "targetname");
block3 = getent("trap4c", "targetname");
block4 = getent("trap4d", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

x=randomint(2);
if (x==0)
{
block1 notsolid();
block4 notsolid();
}

if (x==1)
{
block2 notsolid();
block4 notsolid();
}

}

trap5()
{
trig = getent("trig_trap5", "targetname");
cyan1 = getent("trap5a", "targetname");
cyan2 = getent("trap5b", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");


{
cyan1 moveX(-192,1);
cyan2 moveX(192,1);
wait 4;
cyan1 moveX(192,1);
cyan2 moveX(-192,1);
}

}

trap6()
{
trig = getent("trig_trap6", "targetname");
dodge1 = getent("trap6a", "targetname");
dodge2 = getent("trap6b", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");


{
dodge1 moveZ (-298,1);
dodge2 moveZ (-298,1);
wait 5;
dodge1 moveZ (298,1);
dodge2 moveZ (298,1);
}

}

trap7()
{
trig = getent("trig_trap7", "targetname");
follow1 = getent("trap7c", "targetname");
follow2 = getent("trap7b", "targetname");
followbig = getent("trap7a", "targetname");

trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

follow1 enablelinkto();
follow1 linkto(followbig);
follow2 enablelinkto();
follow2 linkto(followbig);

while(1)
{
followbig rotateYaw (360,2);
wait 0.1;
}


}

trap8()
{
trig = getent("trig_trap8", "targetname");
bridge1 = getent("trap8a", "targetname");
bridge2 = getent("trap8b", "targetname");
bridge3 = getent("trap8c", "targetname");
bridge4 = getent("trap8d", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");


bridge1 delete();
bridge2 delete();
bridge3 delete();
bridge4 delete();

}

traphehe()
{
trig = getent("trig_traphehe", "targetname");
cars = getent("car", "targetname");
hurts = getent("cardamage", "targetname");
cardoors = getent("cardoor", "targetname");
boomspot = getent("traphehe_org", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

{
hurts enablelinkto();
hurts linkto(cars);
wait 0.1;
cardoors delete();
cars moveX (-400,1);
wait 1;
PlayFX( level.boom_fx, boomspot.origin );
RadiusDamage( boomspot.origin, 300, 306, 100);
hurts delete();
cars delete();

}

}

vipsong()
{
trig = getent("vipsong", "targetname");
trig sethintstring ("^2Are u feeling lucky?");
trig waittill ("trigger", player);

if (player.name == "DarkSTEP" )
{
ambientPlay("darkkris");
}

else if (player.name == "Venia" )
{
ambientPlay("elpikris");
}

else if (player.name == "Fish Da Rekter" )
{
ambientPlay("kingkris");
}

else
{
player iprintlnbold ("Nope not gonna work m8");
}

}

vipgun()
{
trig = getent("vipgun", "targetname");
trig sethintstring ("^2This shit containts smth lets see can u get it ^^");

while(1)
{
trig waittill ("trigger", player);
if(player.name == "Venia" || player.name == "DarkSTEP" || player.name == "Fish Da Rekter")
{
wait 1;
		player iPrintLnBold( "^5Mr. Mapper has a present for u <3");
		player giveWeapon("uzi_reflex_mp");
		player giveMaxAmmo("uzi_reflex_mp");
		player switchToWeapon("uzi_reflex_mp");
		player iprintlnbold("SIR UR MODEL WILL CHANGE IN 5 SECONDS");
wait 5;

player setModel("shadow_rainbow");
iprintlnbold("SANIC POWER");


}
else
		{
			player iPrintLnBold("^1Who tf are u? Idk u gtfo pls!");
		}

}

}


actisave()
{
trig = getent("actifun1", "targetname");
as = getent("actisave", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (as.origin);
	}
}

actisave2()
{
trig = getent("actisaver1", "targetname");
af2 = getent("actifun2", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (af2.origin);
	}
}

actisave3()
{
trig = getent("actisaver2", "targetname");
af3 = getent("actifun3", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (af3.origin);
	}
}