/*
[WARNING!!!]
[ASK FIRST FOR PERMISSON TO COPY OR USE SCRIPTS!]
Steam: bossmadlion - Madlion
*/
main()
{

//level._effect[ "teleport" ] = loadfx( "misc/ui_pickup_available" );

maps\mp\_load::main();
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";


	addTriggerToList( "trig_1" );
	addTriggerToList( "trig_2" );
	addTriggerToList( "trig_3" );
	addTriggerToList( "trig_4" );
	addTriggerToList( "trig_5" );
	addTriggerToList( "trig_6" );
	addTriggerToList( "trig_7" );
	addTriggerToList( "trig_8" );
	addTriggerToList( "trig_9" );
	addTriggerToList( "trig_10" );
	addTriggerToList( "trig_11" );

    //playLoopedFX (level._effect[ "teleport" ], 1, (400, 520, 296));
    thread music();
	thread creatorstext();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread port();
	thread port2();	
	thread startdoor();
	thread knife();
	thread deagle();	
	thread sniproom();	
	//thread gap();	
	//thread gaploader();	
	//thread old();	
	thread printcredits();
	setdvar("bg_falldamagemaxheight" , 99999);
	setdvar("bg_falldamageminheight" , 99998);
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

music() {
    wait 1;
    ambientPlay( "mapsong" );
    wait 1;
}

startdoor()
{
    start = getent("startdoor","targetname");

    start delete();

    //TODO check how this is in original script
}

creatorstext()
{
while( 1 )
{
wait 50;
iprintln("^5Map made by: ^7MadLion(bossmadlion) & Ps1HoP4T!?");
}
}

trap1()
{
	part1 = getentarray ("trap1_a" ,"targetname");
	part2 = getentarray ("trap1_b" ,"targetname");
	part3 = getentarray ("trap1_c" ,"targetname");
	trig = getent ("trig_1" , "targetname");

	trig sethintstring("Press ^1[USE]^7 To Activate");
 	trig waittill( "trigger"); 
	trig delete();
	random = randomint(3);

	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				break;
				
		case 1:	
				part2[randomInt(part2.size)] notsolid();
                break;

        case 2:	

				part1[randomInt(part3.size)] notsolid();
                break;	
			
				
		default: return;
	}
}

trap2()
{
rotator_a = getent("trap2_a","targetname");
rotator_b = getent("trap2_b","targetname");
trig = getent("trig_2","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
rotator_a rotatepitch(360, 3);
rotator_b rotatepitch(360, 3);
wait 3.1;
rotator_b rotatepitch(360, 3);
wait 3.1;
rotator_a rotatepitch(360, 3);
wait 3.1;
}
}

trap3()
{
rotator = getent("trap3","targetname");
trig = getent("trig_3","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
rotator rotateyaw(360, 3);
wait 3;
rotator rotateyaw(-360, 3);
wait 3;
}
}


trap4()
{
rotator_a = getent("trap4_a","targetname");
rotator_b = getent("trap4_b","targetname");
trig = getent("trig_4","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
rotator_a rotatepitch(-360, 3);
rotator_b rotatepitch(360, 3);
wait 3.1;
rotator_b rotatepitch(-360, 3);
wait 3.1;
rotator_a rotatepitch(360, 3);
wait 3.1;
}
}


trap5()
{
rotator = getent("trap5","targetname");
trig = getent("trig_5","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
rotator rotateyaw(360, 3);
wait 3;
}
}

trap6()
{
spikes2 = getent("trap6","targetname");
trig = getent("trig_6","targetname");
traphurt1 = getent("trap6_hurt","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
{
traphurt1 enablelinkto ();
traphurt1 linkto (spikes2);
spikes2 movez(192, 1);
wait 5;
spikes2 movez(-192, 3);
}
}

trap7()
{
block_a = getent("trap7_a","targetname");
block_b = getent("trap7_b","targetname");
trig = getent("trig_7","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
block_a movez(128, 3);
block_b movez(-128, 3);
wait 3;
block_a movez(-256, 6);
block_b movez(256, 6);
wait 6;
block_a movez(128, 3);
block_b movez(-128, 3);
wait 3;
}
}

trap8()
{
rotator_a = getent("trap8_a","targetname");
rotator_b = getent("trap8_b","targetname");
rotator_c = getent("trap8_c","targetname");
trig = getent("trig_8","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
rotator_a rotateyaw(360, 3);
rotator_b rotateyaw(-360, 3);
rotator_c rotateyaw(360, 3);
wait 3;
rotator_a rotateyaw(-360, 3);
rotator_b rotateyaw(360, 3);
rotator_c rotateyaw(-360, 3);
wait 3;
}
}

trap9()
{
spikes = getent("trap_9","targetname");
traphurt = getent("trap9_hurt","targetname");
trig = getent("trig_9","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
traphurt enablelinkto ();
traphurt linkto (spikes);
spikes movey(340, 3);
wait 3;
spikes movey(-340, 3);
wait 3;
}
}

trap10()
{
bounce = getent("trap_10","targetname");
trig = getent("trig_10","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
bounce movey(-256, 3);
wait 3;
bounce movey(256, 3);
wait 3;
}
}

trap11()
{
trap11_a = getent("trap_11_a","targetname");
trap11_b = getent("trap_11_b","targetname");
trig = getent("trig_11","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill( "trigger"); 
trig delete();
while(1)
{
trap11_a rotateroll(-360, 3);
trap11_b rotateroll(360, 3);
wait 3;
trap11_a rotateroll(360, 3);
trap11_b rotateroll(-360, 3);
wait 3;
}
}

port()
{
  trig = getEnt( "teleport_1", "targetname"); 
  target = getEnt( "teleported_1", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

port2()
{
  trig = getEnt( "teleport_2", "targetname"); 
  target = getEnt( "teleported_2", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

sniproom()
{
    level.sniper=getent("snip_trig","targetname");
    jumper=getent("snip_jumper","targetname");
    activator=getent("snip_activator","targetname");
    while(1)
    {
        level.sniper waittill("trigger",player);
        if(!isdefined(level.activ)){ player iprintln("^1No Activator Detected"); continue; }

		if( !isDefined( level.sniper ) )
			return;

        if(!isdefined(level.ngisungsgs)) {
            level.ngisungsgs = true;
            level.knife delete();
            level.deagle delete();		
            level.old delete();		
            level.gap delete();	
        }
		
        player thread finalroom(1,jumper,"m40a3",100);
        level.activ thread finalroom(1,activator,"m40a3",100);
        thread roommsg("Sniper Room",level.activ.name,player.name);
        wait 3;
        player freezecontrols(0);
        level.activ freezecontrols(0);

        while(isalive(player)&&isdefined(player))
            wait 1;
        iprintln("^5"+player.name+"^4 has been killed");
    }
}


knife()
{
    level.knife=getent("knife_trig","targetname");
    jumper=getent("knife_jumper","targetname");
    activator=getent("knife_activator","targetname");
    while(1)
    {
        level.knife waittill("trigger",player);
        if(!isdefined(level.activ)){ player iprintln("^1No Activator Detected"); continue; }


		if( !isDefined( level.knife ) )
			return;

        if(!isdefined(level.ngisungsgs)) {
            level.ngisungsgs = true;
            level.sniper delete();
            level.deagle delete();
            level.old delete();		
            level.gap delete();			
        }	

        player thread finalroom(1,jumper,"knife",100);
        level.activ thread finalroom(1,activator,"knife",100);
        thread roommsg("Knife Room",level.activ.name,player.name);
        wait 3;
        player freezecontrols(0);
        level.activ freezecontrols(0);

        while(isalive(player)&&isdefined(player))
            wait 1;
        iprintln("^5"+player.name+"^4 has been killed");
    }
}

gap()
{
    level.gap=getent("jump_trig","targetname");
    jumper=getent("gapjumper","targetname");
    activator=getent("gapactivator","targetname");
    while(1)
    {
        level.gap waittill("trigger",player);
        if(!isdefined(level.activ)){ player iprintln("^1No Activator Detected"); continue; }

		if( !isDefined( level.gap ) )
			return;

        if(!isdefined(level.ngisungsgs)) {
            level.ngisungsgs = true;
            level.sniper delete();
            level.deagle delete();
            level.old delete();			
            level.knife delete();			
        }	
			

        player thread finalroom(1,jumper,"knife",100);
        level.activ thread finalroom(1,activator,"knife",100);
        thread roommsg("Weapon GAP Room",level.activ.name,player.name);
        wait 3;
        player freezecontrols(0);
        level.activ freezecontrols(0);

        while(isalive(player)&&isdefined(player))
            wait 1;
        iprintln("^5"+player.name+"^4 has been killed");
		//thread gaploader();
    }
}


deagle()
{
    level.deagle=getent("deagle_trig","targetname");
    jumper=getent("snip_jumper","targetname");
    activator=getent("snip_activator","targetname");
    while(1)
    {
        level.deagle waittill("trigger",player);
        if(!isdefined(level.activ)){ player iprintln("^1No Activator Detected"); continue; }

		if( !isDefined( level.deagle ) )
			return;
		
        if(!isdefined(level.ngisungsgs)) {
            level.ngisungsgs = true;
            level.sniper delete();
            level.knife delete();		
            level.old delete();		
            level.gap delete();			
        }

        player thread finalroom(1,jumper,"deserteagle",100);
        level.activ thread finalroom(1,activator,"deserteagle",100);
        thread roommsg("Pistol Fight",level.activ.name,player.name);
        wait 3;
        player freezecontrols(0);
        level.activ freezecontrols(0);

        while(isalive(player)&&isdefined(player))
            wait 1;
        iprintln("^5"+player.name+"^4 has been killed");
    }
}

old()
{
    level.old=getent("old_trig","targetname");
    target = getEnt( "old_port", "targetname");	
        level.old waittill("trigger",player);

		level.sniper delete();
		level.knife delete();		
		level.deagle delete();	
		level.gap delete();		

	
     //player SetOrigin(target.origin);
     //player SetPlayerAngles( target.angles );	
	way = getent( "wall", "targetname" );
	iprintlnbold( "Player ^5"+ player.name +" ^7select classic way." );
	way movez( -350, 3 );
}

/*gapjumper1()
{
trig = getent("trigknifeweap","targetname");
jumper=getent("snip_jumper","targetname");
{
trig waittill("trigger",player);
player thread finalroom(0,jumper,"knife",100);
iprintlnbold( "Player ^5"+ player.name +" ^1Failed ^7on 1st GAP." );
iprintln( ""+ player.name +" got a ^5Knife." );
}
}*/

gapactivator1()
{
trig = getent("trigknifeacti","targetname");
activator=getent("snip_activator","targetname");
 {
 trig waittill ("trigger", player);   
player thread finalroom(0,activator,"knife",100);
iprintlnbold( "^5Activator ^1Failed ^7on 1st GAP." );
iprintln( "Activator got a ^5Knife." );
      }
}

gapjumper2()
{
trig = getent("trigm9weap","targetname");
jumper=getent("snip_jumper","targetname");
  {
  trig waittill ("trigger", player);  
player thread finalroom(0,jumper,"beretta",100);
iprintlnbold( "Player ^5"+ player.name +" ^1Failed ^7on 2nd GAP." );
iprintln( ""+ player.name +" got a ^5Beretta." );
      }
}	

gapactivator2()
{
trig = getent("trigm9acti","targetname");
activator=getent("snip_activator","targetname");

  {
  trig waittill ("trigger", player);  
player thread finalroom(0,activator,"beretta",100);
iprintlnbold( "^5Activator ^1Failed ^7on 2nd GAP." );
iprintln( "Activator got a ^5Beretta." );
      }
}

gapjumper3()
{
trig = getent("trigdeagleweap","targetname");
jumper=getent("snip_jumper","targetname");

  {
  trig waittill ("trigger", player);  
player thread finalroom(0,jumper,"deserteagle",100);
iprintlnbold( "Player ^5"+ player.name +" ^1Failed ^7on 3rd GAP." );
iprintln( ""+ player.name +" got a ^5Deagle." );
      }
}	

gapactivator3()
{
trig = getent("trigdeagleacti","targetname");
activator=getent("snip_activator","targetname");
  {
  trig waittill ("trigger", player);  
player thread finalroom(0,activator,"deserteagle",100);
iprintlnbold( "^5Activator ^1Failed ^7on 3rd GAP." );
iprintln( "Activator got a ^5Deagle." );
      }
}

gapjumper4()
{
trig = getent("trigm40a3weap","targetname");
jumper=getent("snip_jumper","targetname");

  {
  trig waittill ("trigger", player);  
player thread finalroom(0,jumper,"m40a3",100);
iprintlnbold( "Player ^5"+ player.name +" ^1Failed ^7on 4th GAP." );
iprintln( ""+ player.name +" got a ^5M40A3." );
      }
}	

gapactivator4()
{
trig = getent("trigm40a3acti","targetname");
activator=getent("snip_activator","targetname");
  {
  trig waittill ("trigger", player);  
player thread finalroom(0,activator,"m40a3",100);
iprintlnbold( "^5Activator ^1Failed ^7on 4th GAP." );
iprintln( "Activator got a ^5M40A3." );
      }
}

gapjumper5()
{
trig = getent("trigakweap","targetname");
jumper=getent("snip_jumper","targetname");
  {
  trig waittill ("trigger", player);  
player thread finalroom(0,jumper,"ak47",100);
iprintlnbold( "Player ^5"+ player.name +" ^5ended whole GAP stage." );
iprintln( ""+ player.name +" got a ^5AK47." );
      }
}	

gapactivator5()
{
trig = getent("trigakacti","targetname");
activator=getent("snip_activator","targetname");
  {
  trig waittill ("trigger", player);  
player thread finalroom(0,activator,"ak47",100);
iprintlnbold( "^5Activator ^5ended whole GAP stage." );
iprintln( "Activator got a ^5AK47." );
      }
}

/*gaploader()
{
{
	thread gapjumper1();
	wait 0.1;
    thread gapjumper2();
	wait 0.1;	
	thread gapjumper3();
	wait 0.1;	
	thread gapjumper4();
	wait 0.1;	
    thread gapjumper5();	
	wait 0.1;	
	thread gapactivator1();
	wait 0.1;	
    thread gapactivator2();
	wait 0.1;	
	thread gapactivator3();
	wait 0.1;	
	thread gapactivator4();
	wait 0.1;	
    thread gapactivator5();	
	wait 0.1;	
}
}*/



finalroom(freeze,targ,weapon,health)
{
	self freezecontrols(freeze);
	self setplayerangles(targ.angles);
	self setorigin(targ.origin);

	self.health=health;
	self takeallweapons();
	self giveweapon(weapon+"_mp");
	self givemaxammo(weapon+"_mp");
	self switchtoweapon(weapon+"_mp");
}


roommsg(text,acti,jump)
{
	noti=SpawnStruct();
	noti.titleText=text;
	noti.notifyText=acti+" ^5vs^7 "+jump;
	noti.glowcolor=(1,0,0);
	noti.glowalpha=1;
	noti.duration=4;

	players=getentarray("player","classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(noti);
}



printcredits()
    {
            if( isDefined( self.logoText ) )
                    self.logoText destroy();
     
            self.logoText = newHudElem();
            self.logoText.y = 10;
            self.logoText.alignX = "center";
            self.logoText.alignY = "middle";
            self.logoText.horzAlign = "center_safearea";
     
            self.logoText.alpha = 0;
            self.logoText.sort = -3;
            self.logoText.fontScale = 1.6;
            self.logoText.archieved = true;
     
            for(;;)
            {
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3Map made by MadLion & Ps1HoP4T!?^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3steam: bossmadlion^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;					
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3Shadow V2^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;

		}
	
	}