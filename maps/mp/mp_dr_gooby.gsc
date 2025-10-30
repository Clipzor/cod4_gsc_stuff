main()
{

maps\mp\_load::main();

game["allies"] = "marines";
game["axis"] = "opfor";
game["attackers"] = "axis";
game["defenders"] = "allies";
game["allies_soldiertype"] = "desert";
game["axis_soldiertype"] = "desert";

trigger = spawn( "trigger_radius", (239.342, 1021.27, -271.875), 0, 185, 150 );
trigger.targetname = "endmap_trig";
trigger.radius = 185; 

precacheItem("m40a3_mp");
precacheItem("deserteagle_mp");
precacheItem("m4_reflex_mp");
precacheItem("rpg_mp");
precacheItem("winchester1200_grip_mp");
precacheItem("remington700_mp");
precacheItem("knife_mp");
precacheItem("ak47_reflex_mp");
precacheItem("m14_acog_mp");
precacheItem("skorpion_silencer_mp");
precacheItem("g36c_silencer_mp");
precacheItem("rpd_acog_mp");
precacheItem("m40a3_acog_mp");

setdvar( "r_specularcolorscale", "1" );
setdvar("r_glowbloomintensity0",".25");
setdvar("r_glowbloomintensity1",".25");
setdvar("r_glowskybleedintensity0",".3");
setdvar("compassmaxrange","1800");
    
	thread hud();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7a();
	thread trap7b();
	thread sniper_tele();
	thread weapon_tele();
	thread weapon_room_gun();
	thread jump_tele();
	thread jump_wep();
	
	addTriggerToList( "trap1_trig" );
    addTriggerToList( "trap2_trig" );
    addTriggerToList( "trap3_trig" );
    addTriggerToList( "trap4_trig" );
    addTriggerToList( "trap5_trig" );
    addTriggerToList( "trap6_trig" );
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
	thread hud_set_2("Mp_Dr_Gooby | Map 4/5! [Speed:190]");
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

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


trap1()
{
    trig1 = getEnt("trap1_trig", "targetname");
    trap1a = getEnt("trap1a", "targetname");
    trap1b = getEnt("trap1b", "targetname");
    trap1c = getEnt("trap1c", "targetname");

    trig1 waittill("trigger");
    trig1 delete();

}

trap2()
{
trap2a = getent ("trap2a", "targetname");
trap2b = getent ("trap2b", "targetname");
trig2 = getent ("trap2_trig", "targetname");

trig2 waittill ("trigger");
trig2 delete();

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

	
}

trap5()
{
trap5a = getent ("trap5a", "targetname");
trap5b = getent ("trap5b", "targetname");
trig5 = getent ("trap5_trig", "targetname");

trig5 waittill ("trigger");
trig5 delete();


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

	
trap7b delete();		
	
}

sniper_tele()
{
weapontrig = getent ("weapon_trigger", "targetname");
snipertrig = getent ("sniper_trigger", "targetname");
sniperactitele = getent ("sniper_acti_tele", "targetname");
sniperjumpertele = getent ("sniper_jumper_tele", "targetname");
jumptrig = getent ("jump_trigger", "targetname");

	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );

snipertrig waittill("trigger", player);
weapontrig delete();
jumptrig delete();
wait(0.05);

player SetOrigin (sniperjumpertele.origin);
player setplayerangles (sniperjumpertele.angles);
player TakeAllWeapons();
player GiveWeapon ("m40a3_mp"); 
player GiveWeapon ("remington700_mp"); 
wait(0.05);

level.activ SetOrigin (sniperactitele.origin);
level.activ setplayerangles (sniperactitele.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon ("m40a3_mp");
level.activ GiveWeapon ("remington700_mp");
player GiveWeapon ("m40a3_mp"); 
player GiveWeapon ("remington700_mp"); 
wait(0.05);

player switchToWeapon ("m40a3_mp");
level.activ SwitchToWeapon ("m40a3_mp");
iPrintLnBold(player.name+ "^4 has entered the ^1Sniper Room");
wait 0.4;

player thread onDeath_sniper();
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

onDeath_sniper()
{
	self endon("disconnect");
	
	self waittill("death");
	thread sniper_tele();
}

weapon_tele()
{
snipertrig = getent ("sniper_trigger", "targetname");
weapontrig = getent ("weapon_trigger", "targetname");
weaponactitele = getent ("weapon_acti_tele", "targetname");
weaponjumpertele = getent ("weapon_jumper_tele", "targetname");
jumptrig = getent ("jump_trigger", "targetname");

	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );

weapontrig waittill ("trigger", player);
snipertrig delete();
jumptrig delete();
wait 0.05;
player SetOrigin (weaponjumpertele.origin);
player setplayerangles (weaponjumpertele.angles);
level.activ SetOrigin (weaponactitele.origin);
level.activ setplayerangles (weaponactitele.angles);
iPrintLnBold(player.name+ "^4 has entered the ^1Weapon Room");
wait 0.01;
thread weapon_room_gun();
thread onDeath_weapon();
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

Weapon_room_gun()
{
weapon = getent ("weapon_trigger" , "targetname");
weapon waittill("trigger", player);
weaponactitele = getent ("weapon_acti_tele", "targetname");
weaponjumpertele = getent ("weapon_jumper_tele", "targetname");

self endon("death");
self endon( "disconnect" );	
self endon( "joined_team" );
self endon( "joined_spectators" );

player SetOrigin (weaponjumpertele.origin);
player setplayerangles (weaponjumpertele.angles);
level.activ SetOrigin (weaponactitele.origin);
level.activ setplayerangles (weaponactitele.angles);
wait 0.01;

x = 1+RandomInt(3);
gun = GetRandomWeapon( x );

player TakeAllWeapons();
level.activ TakeAllWeapons();
player GiveWeapon( gun );
level.activ GiveWeapon( gun );
wait 0.1;
player SwitchToWeapon( gun );
level.activ SwitchToWeapon( gun );
wait 0.01;
thread onDeath_weapon();
thread weapon_tele();
wait 0.01;
}

GetRandomWeapon( num )

{
	if( num == 2 )
		return "winchester1200_grip_mp";
	else
	{
		x = RandomInt( 51 );
		if( x < 10 )
			return "winchester1200_grip_mp";
		if( x > 9 && x < 20 )
			return "skorpion_silencer_mp";
		if( x > 20 && x < 30 )
			return "m4_reflex_mp";
		if( x > 30 && x < 40 )
			return "g36c_silencer_mp";
		if( x > 40 && x < 50 )
			return "ak47_reflex_mp";
		if( x == 50 )
			return "m14_acog_mp";
	}
}

onDeath_weapon()
{
	self endon("disconnect");
	
	self waittill("death");
	thread weapon_tele();
	thread weapon_room_gun();
}

jump_tele()
{
weapontrig = getent ("weapon_trigger", "targetname");
snipertrig = getent ("sniper_trigger", "targetname");
knifetrig = getent ("old_trigger", "targetname");
jumptrig = getent ("jump_trigger", "targetname");
jumpactitele = getent ("jump_acti_tele", "targetname");
jumpjumpertele = getent ("jump_jumper_tele", "targetname");

self endon("death");
self endon( "disconnect" );	
self endon( "joined_team" );
self endon( "joined_spectators" );

jumptrig waittill("trigger", player);
snipertrig delete();
weapontrig delete();
wait(0.05);
player SetOrigin (jumpjumpertele.origin);
player setplayerangles (jumpjumpertele.angles);
player TakeAllWeapons();
player GiveWeapon ("knife_mp"); 
wait(0.05);
level.activ SetOrigin (jumpactitele.origin);
level.activ setplayerangles (jumpactitele.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon ("knife_mp");
wait(0.05);
player switchToWeapon ("knife_mp");
level.activ SwitchToWeapon ("knife_mp");
iPrintLnBold(player.name+ "^4 has entered the ^1Jump Room");
wait 0.4;
player thread onDeath_jump();
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

onDeath_jump()
{
	self endon("disconnect");
	
	self waittill("death");
	thread jump_tele();
}

	
jump_wep()
{
trigger = getent ("give_wep_trig", "targetname");
trigger waittill ("trigger", user);
trigger delete();
user iPrintLnBold(user.name+ "^4 has gotten the Jump Room ^1weapon!");
wait 0.01;
user giveWeapon ("m40a3_acog_mp");
wait 0.1;
user switchToWeapon ("m40a3_acog_mp");

}