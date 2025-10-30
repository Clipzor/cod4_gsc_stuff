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
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
    setdvar("compassmaxrange","1800");
	

	thread randommusic();
	thread hud();
	thread acti();
	thread acti2();
	thread platform();
	thread trap1a();
	thread trap1b();
	thread trap2_rotating();
	thread trap3_pushers();
	thread jump();
	thread jump2();
	thread trap4();
	thread trap5();
	thread trap6();
	thread acti_jump();
	thread trap7();
	thread trap8();
	//thread secret_unlock();
	//thread secret_back();
	thread trap9();
	thread platforms2();
	thread end_boom();
	thread Jumper_move_end();
	
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
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
	thread hud_set_2("Mp_Dr_Wicked | Final Map 5/5! [Speed:190]");
	wait 0.95;
	thread hud_set_3("Activating Traps and Secrets are disabled !");
	
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

secret_unlock()
{
unlock = getEnt ("secret_unlock", "targetname");

unlock waittill ("trigger");

thread secret_enter();
}
secret_enter()
{
	tele = getEnt ( "secret_enter", "targetname" );
	target = getEnt ("secret2", "targetname");
	for(;;)
{
		tele waittill ("trigger", player);
		player iprintlnbold ("You have entered the secret room, Enjoy^1!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
}
}
secret_back()
{
	tele = getEnt ( "secret_back", "targetname" );
	target = getEnt ("air3", "targetname");
	glow = getEnt ("secretglow", "targetname");
	for(;;)
{
		tele waittill ("trigger", player);
		player iprintlnbold ("You have been teleported back!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
}
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.8, 1.0, 0.8);
	hud.font = "objective";
	hud.glowColor = (0.3, 0.6, 0.3);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}


acti()
{
	tele = getEnt ( "acti_enter", "targetname" );
	target = getEnt ("acti_gohere", "targetname");
	glow = getEnt ("glow2", "targetname");
	for(;;)
	{
		tele waittill ("trigger", player);
		player iprintlnbold ("You have been teleported");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		
}
}

acti2()
{
	tele = getEnt ( "acti_tele2", "targetname" );
	target = getEnt ("acti_gohere2", "targetname");
	glow = getEnt ("acti_teleglow2", "targetname");
	for(;;)
	{
		tele waittill ("trigger", player);
		player iprintlnbold ("You have been teleported");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		
}
}

platform()
{

platform = getEnt ("moving1", "targetname");

while(true)
{

platform moveX (-590, 2);
wait 2;
platform moveX (590, 2);
wait 2;
}
}


trap1a()
{
trap1a = getEnt ("trap1a", "targetname");
hurta = getEnt ("trap1a_hurt", "targetname");

hurta EnableLinkTo();
hurta LinkTo(trap1a);

}

trap1b()
{
trap1b = getEnt ("trap1b", "targetname");
hurtb = getEnt ("trap1b_hurt", "targetname");

hurtb EnableLinkTo();
hurtb Linkto(trap1b);

}

platforms2()
{
pf1 = getEnt ("endplatform1", "targetname");
pf2 = getEnt ("endplatform2", "targetname");
trig = getEnt ("platforms2", "targetname");

trig waittill ("trigger");
trig delete();

}
trap2_rotating()
{

trap = getEnt ("trap2", "targetname");
trig = getEnt ("trap2_trig", "targetname");

trig waittill ("trigger", user);
trig delete();


}

trap3_pushers()
{

trapa = getEnt ("trap3a", "targetname");
trapb = getEnt ("trap3b", "targetname");
trapc = getEnt ("trap3c", "targetname");
trig = getEnt ("trap3_trig", "targetname");

trig waittill ("trigger", user);
trig delete();


}

jump()
{
	jumpx = getent ("jump","targetname");
	glow = getent ("glow","targetname");
	air1 = getent ("air1","targetname");
	air2 = getent ("air2","targetname");
	air3 = getent ("air3","targetname");

	for(;;)
{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air3.origin, time);
			user unlink();
}
}
}

jump2()
{
	jump2 = getent ("jump2","targetname");
	glow = getent ("glow3","targetname");
	air1 = getent ("air4","targetname");
	air2 = getent ("air5","targetname");
	air3 = getent ("air6","targetname");


	time = .5;
	for(;;)
{
		jump2 waittill ("trigger",user);
		if (user istouching(jump2))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air3.origin, time);
			user unlink();

}
}
}
acti_jump()
{
	jumpx = getent ("a_jump","targetname");
	glow = getent ("a_glow","targetname");
	air1 = getent ("a_air1","targetname");
	air2 = getent ("a_air2","targetname");
	air3 = getent ("a_air3","targetname");


	time = .5;
	for(;;)
{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air3.origin, time);
			user unlink();
}
}
}


trap4()
{

pusher = getEnt ("trap4_pusher", "targetname");
trig = getEnt ("trap4_trig", "targetname");

trig waittill ("trigger");


}

trap5()
{
platforms1 = getEnt ("trap5_1", "targetname");
platforms2 = getEnt ("trap5_2", "targetname");
platforms3 = getEnt ("trap5_3", "targetname");
platforms4 = getEnt ("trap5_4", "targetname");
trig = getEnt ("trap5_trig", "targetname");

trig waittill ("trigger");
trig delete();

}

trap6()
{

trigger = getEnt ("trap6_trig", "targetname");

trigger waittill ("trigger");
trigger delete();

}

trap7()
{
    trig = getEnt("trap7_trig", "targetname");
    trapa = getEnt("brushes1", "targetname");
    trapb = getEnt("brushes2", "targetname");

    trig waittill("trigger");
    trig delete();

}

trap8()
{
wall1 = getEnt ("trap8_1", "targetname");
wall2 = getEnt ("trap8_2", "targetname");
boom1_2 = getEnt ("wall1_2", "targetname");
trig = getEnt ("trap8_trig", "targetname");


trig waittill ("trigger");
trig delete();


}
trap9()
{

spinner = getEnt ("trap9", "targetname");
trig = getEnt ("trap9_trig", "targetname");

trig waittill ("trigger");


}

end_boom()
{

trig = getEnt ("endboom_trig", "targetname");
wall = getEnt ("endwall", "targetname");
acti = getEnt ("end_acti", "targetname");

trig waittill ("trigger", user);
iPrintlnBold( " ^1" + user.name + " ^7 Has Reached The End!" ); 
trig delete();

thread activator();
}

activator()
{
	

	acti = undefined;

	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	
	
moveacti = getEnt ("end_acti", "targetname");

if( GetTeamPlayersAlive("axis") == 1)
{
acti setOrigin( moveacti.origin );
acti setPlayerangles( moveacti.angles );
acti TakeAllWeapons();
acti GiveWeapon( "tomahawk_mp" );
wait 0.05;
acti SwitchToWeapon( "tomahawk_mp" );
wait 1;

}
}
Jumper_move_end()
{

	jumpx = getent ("endmap_trig","targetname");
	glow = getent ("endglow","targetname");
	air1 = getent ("e_air1","targetname");
	air2 = getent ("e_air2","targetname");
	air3 = getent ("e_air3","targetname");
	air4 = getent ("e_air4","targetname");
	air5 = getent ("e_air5","targetname");


	time = 0.5;
	for(;;)
{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait 0.5;
			air moveto (air2.origin, time);
			wait 0.5;
			air moveto (air3.origin, time);
			wait 0.5;
			air moveto (air4.origin, time);
			wait 0.25;
			air moveto (air5.origin, time);
			wait 0.25;
			user unlink();
			user TakeAllweapons();
			user GiveWeapon( "tomahawk_mp" );
			wait 0.05;
			user SwitchToWeapon( "tomahawk_mp" );
			wait 1;
}
}
}
