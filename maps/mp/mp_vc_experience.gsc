//Map Dedicated to my Beloved Vistic.
//Map By CoMpy.
// /devmap mp_vc_experience

main()
{
 maps\mp\_load::main();
 maps\mp\mp_vc_experience_fx::main();

  game["allies"] = "marines";
  game["axis"] = "opfor";
  game["attackers"] = "axis";
  game["defenders"] = "allies";
  game["allies_soldiertype"] = "desert";
  game["axis_soldiertype"] = "desert";
  
  setdvar("g_speed" ,"210");

  thread vistic();
  thread door();
  thread vistic2();
  thread vistic3();
  thread music();
  thread vistic4();
  thread vistic5();
  thread vistic6();
  thread vistic7();
  thread vistic8();
  thread area1();
  thread area2();
  thread return1();
  thread area11();
  thread area22();
  thread return2();
  thread trap1();
  thread trap2();
  thread trap4();
  thread trap5();
  thread trap6();
  thread sniproom();
  thread vistic42();
  thread trap7();
  thread trap8();
  thread trap9();
  thread kniferoom();
  thread visticmax();
  thread actideagle();
  thread messages();
  thread vistic41();
  thread jumproom();
  thread bounceactif();
  thread jumperfailb();
  thread givesniper();
  thread bounceactig();
  thread jumperfaila();
  thread visticvcbc();
  thread visticvcbc2();
  thread vistic65();
  thread vistic61();
  thread vistic18();
  thread jumperarea1();
  thread corneliadoor();
  thread roomselection();
  thread vistic300();
  thread jumperarea2();//deutera area cornelia
  thread endmap_trig();
  thread vistic301();
  thread trap10();//cornelia
  thread trap11();//cornelia
  thread trap12();//cornelia
  thread trap13();//cornelia
  thread trap14();//cornelia
  thread cornelia1();//acti area in cornelia
  thread cornelia2();//acti area with 1 trap in cornelia
  thread return3();//cornelia
  thread cornelia123();//cornelia
  thread trap15();//cornelia
  thread return4();//cornelia
  thread trap16();//cornelia
  thread trap17();//cornelia
  thread trap18();//cornelia
  thread return5();//cornelia
  thread area2aktiv();//cornelia
  thread visticas();//cornelia
  thread hartvc();

  addTriggerToList( "trigger_trap1" );
  addTriggerToList( "trigger_trap2" );
  addTriggerToList( "trigger_trap3" );
  addTriggerToList( "trigger_trap4" );
  addTriggerToList( "trigger_trap5" );
  addTriggerToList( "trigger_trap6" );
  addTriggerToList( "trigger_trap7" );
  addTriggerToList( "trigger_trap8" );
  addTriggerToList( "trigger_trap9" );
  addTriggerToList( "trigger_trap10" );
  addTriggerToList( "trigger_trap11" );
  addTriggerToList( "trigger_trap12" );
  addTriggerToList( "trigger_trap13" );
  addTriggerToList( "trigger_trap14" );
  addTriggerToList( "trigger_trap15" );
  addTriggerToList( "trigger_trap16" );
  addTriggerToList( "trigger_trap17" );
  addTriggerToList( "trigger_trap18" );

}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
    
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

vistic()//start house
{
 vistic_logo = getent("unvistic","targetname");                               
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

door()
{
    paper1 = getEnt("paper1", "targetname");
    paper2 = getEnt("paper2", "targetname");
    paper3 = getEnt("paper3", "targetname");
    paper4 = getEnt("paper4", "targetname");
    paper5 = getEnt("paper5", "targetname");
    paper6 = getEnt("paper6", "targetname");
    paper7 = getEnt("paper7", "targetname");
    paper8 = getEnt("paper8", "targetname");
    paper9 = getEnt("paper9", "targetname");
    paper10 = getEnt("paper10", "targetname");
    exitdoor1 = getEnt("exitdoor1", "targetname");
    exitdoor2 = getEnt("exitdoor2", "targetname");
    red1 = getEnt("red1", "targetname");
    red2 = getEnt("red2", "targetname");
    red3 = getEnt("red3", "targetname");
    red4 = getEnt("red4", "targetname");
    red5 = getEnt("red5", "targetname");
    red6 = getEnt("red6", "targetname");
    red7 = getEnt("red7", "targetname");
    red8 = getEnt("red8", "targetname");
    red9 = getEnt("red9", "targetname");
    red10 = getEnt("red10", "targetname");
    red11 = getEnt("red11", "targetname");
    red12 = getEnt("red12", "targetname");
    red13 = getEnt("red13", "targetname");
    red14 = getEnt("red14", "targetname");
    red15 = getEnt("red15", "targetname");
    red16 = getEnt("red16", "targetname");

    maps\mp\_fx::loopfx("effect_1", (red1.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red2.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red3.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red4.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red5.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red6.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red7.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red8.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red9.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red10.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red11.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red12.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red13.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red14.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red15.origin), 1);
    maps\mp\_fx::loopfx("effect_1", (red16.origin), 1);
    maps\mp\_fx::loopfx("effect_2", (paper1.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper2.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper3.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper4.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper5.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper6.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper7.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper8.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper9.origin), 0.1);
    maps\mp\_fx::loopfx("effect_2", (paper10.origin), 0.1);
    maps\mp\_fx::loopfx("effect_3", (exitdoor1.origin), 0.1);
    maps\mp\_fx::loopfx("effect_3", (exitdoor2.origin), 0.1);

  door = getent("door","targetname");
  wait 15;
  door moveZ(-350, 5);
}

vistic2()//inside cave
{
 vistic_logo = getent("vistikot","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

vistic3()//outside cave NE
{
 vistic_logo = getent("visticx2","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

music()
{
  
    level.music = randomint(3);
    wait 3;
    switch(level.music)
    {
     case 0:
     AmbientPlay( "eyes6" );
     break;
     case 1:
     AmbientPlay( "eyes7" );
     break;
     case 2:
     AmbientPlay( "eyes5" );
     break;
  }  
}
vistic4()//sw of exit cave
{
 vistic_logo = getent("holyvistic","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

vistic5()//special sand
{
 vistic_logo = getent("victic","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

vistic6()//2nd cave
{
 vistic_logo = getent("vccavey","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

vistic7()
{
 vistic_logo = getent("vistic0","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

vistic8()
{
 vistic_logo = getent("pistacio","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

area1()//acti 1 area
{
   trig = getent("trigger_area1", "targetname");
   tele1 = getent ("origin_area1", "targetname");
   trig setHintString ("Move to first acti area");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

area2()//acti 2 area
{
   trig = getent("trigger_area2", "targetname");
   tele1 = getent ("origin_area2", "targetname");
   trig setHintString ("Move to second acti area");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

return1()//return to acti spawn
{
   trig = getent("trigger_return1", "targetname");
   tele1 = getent ("origin_return1", "targetname");
   trig setHintString ("Move to spawn area");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

area11()//acti 2 area
{
   trig = getent("trigger_area11", "targetname");
   tele1 = getent ("origin_area11", "targetname");
   trig setHintString ("Move to second part");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

area22()//acti 2 area
{
   trig = getent("trigger_area22", "targetname");
   tele1 = getent ("origin_area22", "targetname");
   trig setHintString ("Move to second part");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

return2()//return to acti spawn
{
   trig = getent("trigger_return2", "targetname");
   tele1 = getent ("origin_return2", "targetname");
   trig setHintString ("Move back to spawn");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

trap1()//rotate bounce flashy area
{
     plankt1 = getent("trap1","targetname");
     trig = getent("trigger_trap1", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,6);
     wait 10;
   }
      
}

trap2()//rotate bounce flashy area
{
     plankt1 = getent("trap2","targetname");
     trig = getent("trigger_trap2", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,6);
     wait 10;
   }
      
}

trap4()
{
    platform = getent("trap4", "targetname");
    trig = getent("trigger_trap4", "targetname");
    trig setHintString("Unstable bounce for 7sec");
    trig waittill ("trigger");
    trig setHintString("^7Activated");

   
   for(;;)
	{
	 platform notsolid();
	 wait 7;
	 platform solid();
	wait 2000;
	}
}

trap5()
{
    platform = getent("trap5", "targetname");
    trig = getent("trigger_trap5", "targetname");
    trig setHintString("Unstable plat for 7 sec");
    trig waittill ("trigger");
    trig setHintString("^7Activated");

   
   for(;;)
	{
	 platform notsolid();
	 wait 7;
	 platform solid();
	wait 2000;
	}
}

trap6()
{
     plankt1 = getent("trap6","targetname");
     trig = getent("trigger_trap6", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,6);
     wait 10;
   }
      
}

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return undefined;
}

waitdead()
{
    activator = GetActivator();
    scope = getent("trig_scope","targetname");
    jump = getent("trig_jump","targetname");
    scope thread maps\mp\_utility::triggerOff();
    jump thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    scope thread maps\mp\_utility::triggerOn();
    jump thread maps\mp\_utility::triggerOn();
}

sniproom()
{
    
    level.trigger_scope = getEnt ("trigger_sniproom", "targetname");

    jumpersc = getEnt ("origin_sniperjumper", "targetname");
    actisc = getEnt ("origin_sniperacti", "targetname");

    for(;;)
    {   
        level.trigger_scope setHintString ("Press [&&1] to enter Sniper Room");
        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);    
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("remington700_mp");
        activator giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        activator giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        activator giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        activator giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        activator switchToWeapon("m40a3_mp");   
        player.maxhealth = 100;
        

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("" + player.name + " died in scope room");
    }
}

vistic42()//snip room
{
 vistic_logo = getent("visticwhite","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

trap7()//rotate rotation
{
     plat1 = getent("plat1","targetname");
     plat2 = getent("plat2","targetname");
     plat3 = getent("plat3","targetname");
     trig = getent("trigger_trap7", "targetname");
     trig setHintString("Rotate x platforms");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(360,3);
     wait 5;
   }
      
}

trap8()
{
     plankt1 = getent("trap8","targetname");
     trig = getent("trigger_trap8", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,4);
     wait 10;
   }
      
}

trap9()//rotate rotation
{
     plat1 = getent("pplat1","targetname");
     plat2 = getent("pplat2","targetname");
     plat3 = getent("pplat3","targetname");
     trig = getent("trigger_trap9", "targetname");
     trig setHintString("Rotate x platforms");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(360,3);
     wait 5;
   }
      
}

kniferoom()
{
   
   level.trigger_knife = getEnt ("trigger_kniferoom", "targetname");

    jumperk = getEnt ("origin_knifejumper", "targetname");
    actik = getEnt ("origin_knifeacti", "targetname");

   for(;;)
    {
        level.trigger_knife setHintString ("Press [&&1] to enter Knife Room.");
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
        
        iPrintLnBold ("" + player.name + " has died in Knife Room");
    }
}

visticmax()//knaf
{
 vistic_logo = getent("visticmax","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

actideagle()//BONUS!! UNINTENDED
{
 givedgl = getEnt("trigger_please","targetname");
 givedgl setHintString("take a deagle cuz i have no script for that trap");

	for (;;)
	{
		givedgl waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("deserteagle_mp");
		player switchtoweapon("deserteagle_mp");
		player givemaxammo("deserteagle_mp");
	}
}

messages()
{    
    wait 15;

     iprintln ("^7Map Dedicated to my forever Beloved ^6Vistic.");

    wait 10;
     
     iprintln ("^7Discord ^5[CIR] eG0sxs#1823");
}

vistic41()
{
 vistic_logo = getent("valuedvistic","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

jumproom()
{
   level.trigger_jump = getEnt ("trigger_bounceroom", "targetname");

    jumperk = getEnt ("origin_bouncejumper", "targetname");
    actik = getEnt ("origin_bounceactif", "targetname");

  for(;;)
    {
        level.trigger_jump setHintString ("Press [&&1] to enter JumpRoom");
        level.trigger_jump waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
        
        iPrintLnBold ("" + player.name + " has died in Jump Room");
    }
}

bounceactif()//ejw
{
   trigb = getent("trigger_bounceactif", "targetname");
   teleb = getent ("origin_bounceactif", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

jumperfailb()//ejw
{
   trigb = getent("trigger_jumperf", "targetname");
   teleb = getent ("origin_bouncejumper", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

givesniper()
{
givesnip = getEnt("givesnip_trig","targetname");

	for (;;)
	{
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("deserteagle_mp");
		player giveweapon("m40a3_mp");
		player switchtoweapon("deserteagle_mp");
		player givemaxammo("deserteagle_mp");
		player givemaxammo("m40a3_mp");
	}
}

bounceactig()//mesa
{
   trigb = getent("trigger_bounceactig", "targetname");
   teleb = getent ("origin_bounceactig", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

jumperfaila()//mesa
{
   trigb = getent("trigger_jumperg", "targetname");
   teleb = getent ("origin_bouncejumpf", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

visticvcbc()//bounce vistic
{
 vistic_logo = getent("bouncevc","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

visticvcbc2()//bounce vistic x2
{
 vistic_logo = getent("bouncevc2","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

vistic65()//mesa spulia
{
 vistic_logo = getent("2vistic","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}
vistic61()//deutero apton spawn
{
 vistic_logo = getent("vistic","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

vistic18()// spawn cornelia
{
 vistic = getent("vistico","targetname");

     wait 0.1;

     vistic moveZ(400,15);

     wait 15;

     for(;;)
     {
     vistic rotateYaw (360,7);
     wait 1;

     }
}

jumperarea1()//cornelia
{
   trig = getent("trigger_jumperarea1", "targetname");
   tele1 = getent ("origin_jumperarea1", "targetname");
   trig setHintString ("next floor");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
   }
}

corneliadoor()//cornelia
{
 
   lift=getent("fencedoor","targetname");
   lift_trigger=getent("trigger_corneliadoor","targetname");
   lift_trigger setHintString ("F to open");

	{
	 lift_trigger waittill ("trigger");
	 wait 5;
	}
		{
	  	lift movez (241,4,1,1);
		 wait 2;
		}
}

roomselection()
{
   trig = getent("roomselection_trig", "targetname");
   tele1 = getent ("origin_roomselection", "targetname");
   trig setHintString ("^0Press ^4[&&1]^0 to enter ^4Room Selection^0!");
   
   while(1)
    {   
     trig waittill ("trigger", player);
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     while (isDefined(player) && isAlive(player))
        wait .05;
    }
}

vistic300()
{
 vistic_logo = getent("selfcontrol","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

jumperarea2()//cornelia
{
   trig = getent("trigger_jumperarea2", "targetname");
   tele1 = getent ("origin_jumperarea2", "targetname");
   trig setHintString ("next floor");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
   }
}

endmap_trig()
{ 
	trig = getEnt("endmap_trig", "targetname"); 	
	trig waittill ("trigger",player );
	firstPlace = newHudElem();
	firstPlace.foreground = true;
	firstPlace.alpha = 1;
	firstPlace.alignX = "left";
	firstPlace.alignY = "middle";
	firstPlace.horzAlign = "left";
	firstPlace.vertAlign = "middle"; 
	firstPlace.x = -400;
	firstPlace.y = 0;
	firstPlace.sort = 0;
	firstPlace.font = "default";
	firstPlace.fontScale = 1.4;
	firstPlace.hidewheninmenu = false;
	firstPlace.glowAlpha = 1;
	firstPlace.glowColor = (.3,.0,3);
	firstPlace settext("^6"+ player.name+ " ^7Finished ^7First");
	firstPlace moveOverTime(2); 
	firstPlace.x = 5;
	wait 5;
	firstPlace moveOverTime(2); 
	firstPlace.x = -500;
	wait 7;
	firstPlace destroy(); 
}

vistic301()
{
 vistic_logo = getent("survive","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}

trap10()//cornelia kk
{
     plat1 = getent("silly1","targetname");
     plat2 = getent("silly2","targetname");
     plat3 = getent("silly3","targetname");
     plat4 = getent("silly4","targetname");
     trig = getent("trigger_trap10", "targetname");
     trig setHintString("Rotate");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(360,3);
     plat4 rotateYaw(-360,3);
     wait 5;
   }
      
}

trap11()//cornelia kk
{
     plat1 = getent("shilly1","targetname");
     plat2 = getent("shilly2","targetname");
     plat3 = getent("shilly3","targetname");
     trig = getent("trigger_trap11", "targetname");
     trig setHintString("Rotate");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(360,3);
     wait 5;
   }
      
}

trap12()//cornelia
{
     plankt1 = getent("bounce12","targetname");
     trig = getent("trigger_trap12", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,6);
     wait 10;
   }
      
}

trap13()//cornelia kk
{
     plankt1 = getent("bounce13","targetname");
     trig = getent("trigger_trap13", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 6;
   }
      
}

trap14()//cornelia kk
{
     plankt1 = getent("bounce14","targetname");
     trig = getent("trigger_trap14", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,6);
     wait 10;
   }
      
}

cornelia1()//cornelia kk
{
   trig = getent("trigger_cornelia1", "targetname");
   tele1 = getent ("origin_cornelia1", "targetname");
   trig setHintString ("Go to cornelia acti area");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
   }
}

cornelia2()//cornelia kk
{
   trig = getent("trigger_cornelia2", "targetname");
   tele1 = getent ("origin_cornelia2", "targetname");
   trig setHintString ("Go 1 floor below");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
   }
}

return3()//return to acti spawn
{
   trig = getent("trigger_return111", "targetname");
   tele1 = getent ("origin_return111", "targetname");
   trig setHintString ("Return to original spawn");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

cornelia123()//go 2nd trap below cornelia
{
   trig = getent("trigger_move123", "targetname");
   tele1 = getent ("origin_move123", "targetname");
   trig setHintString ("Go to other area");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

trap15()//cornelia
{
     plankt1 = getent("bounce15","targetname");
     trig = getent("trigger_trap15", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,6);
     wait 10;
   }
      
}

return4()//return to acti spawn
{
   trig = getent("trigger_return2023", "targetname");
   tele1 = getent ("origin_return2023", "targetname");
   trig setHintString ("Return to original spawn");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

trap16()
{
     plankt1 = getent("bounceyz1","targetname");
     trig = getent("trigger_trap16", "targetname");
     trig setHintString("Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,6);
     wait 10;
   }
      
}

trap17()
{
    platform = getent("midplat1", "targetname");
    trig = getent("trigger_trap17", "targetname");
    trig setHintString("Unstable middle plat");
    trig waittill ("trigger");
    trig setHintString("^7Activated");

   
   for(;;)
	{
	 platform notsolid();
	 wait 2000;
	 platform solid();
	wait 2000;
	}
}

trap18()
{
     plat1 = getent("culunda1","targetname");
     plat2 = getent("culunda2","targetname");
     trig = getent("trigger_trap18", "targetname");
     trig setHintString("Rotate  the cylinders");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateYaw(360,6);
     plat2 rotateYaw(-360,6);
     wait 10;
   }
      
}

return5()//return to acti spawn
{
   trig = getent("trigger_return2024", "targetname");
   tele1 = getent ("origin_return2024", "targetname");
   trig setHintString ("Return to original spawn");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

area2aktiv()//cornelia
{
   trig = getent("trigger_area2aktiv", "targetname");
   tele1 = getent ("origin_area2aktiv", "targetname");
   trig setHintString ("next floor");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
   }
}

visticas()
{
 vistic_logo = getent("activatespawn","targetname");
	                                  
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
}

hartvc()
{
 vistic_logo = getent("hart","targetname");                               
  for(;;) 
  {
   vistic_logo rotateYaw (360,7);
   wait 1;
  }
      
}