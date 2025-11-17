/*Map Dedicated to my Beloved Vistic
 Map By CoMpy.
 /devmap mp_vc_mansion_v2


                                                                                                            
     ***** *      **           *****  *       *******      ****           *         *****  *       * ***    
  ******  *    *****        ******  *       *       ***   *  *************       ******  *       *  ****  * 
 **   *  *       *****     **   *  *       *         **  *     *********        **   *  *       *  *  ****  
*    *  **       * **     *    *  *        **        *   *     *  *            *    *  *       *  **   **   
    *  ***      *             *  *          ***           **  *  **                *  *       *  ***        
   **   **      *            ** **         ** ***            *  ***               ** **      **   **        
   **   **      *            ** **          *** ***         **   **               ** **      **   **        
   **   **     *           **** **            *** ***       **   **             **** **      **   **        
   **   **     *          * *** **              *** ***     **   **            * *** **      **   **        
   **   **     *             ** **                ** ***    **   **               ** **      **   **        
    **  **    *         **   ** **                 ** **     **  **          **   ** **       **  **        
     ** *     *        ***   *  *                   * *       ** *      *   ***   *  *         ** *      *  
      ***     *         ***    *          ***        *         ***     *     ***    *           ***     *   
       *******           ******          *  *********           *******       ******             *******    
         ***               ***          *     *****               ***           ***                ***      
                                        *                                                                   
                                         **                                                                 
                                                                                                            

*/

main() {
    maps\mp\_load::main();

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    setdvar("g_speed" ,"210");
    thread patch();
    thread forcefullbright();
    thread music();
    thread startcylinder();
    thread vc360();
    thread vclogo2();
    thread endmap_trig();
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
    thread trap12();
    thread trap13();
    thread trap14();
    thread trap15();
    thread trap16();
    thread move1();
    thread sniproom();
    thread weaponroom();
    thread kniferoom();
    thread smallvisticend();//small vistic rotating in room sele
    thread startdoor();
    thread messages();
    thread squares();

     
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

}

patch()
{
	trig = spawn("trigger_radius",(2957.24, 826.202, 198.787), 0, 110, 90);
	trig.radius = 110;

	for(;;)
	{
		trig waittill("trigger",player);

		player Suicide();

	}
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
    
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

forcefullbright()
{
    level waittill("round_started");
    while(1)
    {
        players = getEntArray( "player", "classname" );
        for(i = 0; i < players.size; i++){
            players[i] setClientDvar("r_fullbright", 0);
        }
        wait 1;
    }
}

music()
{

  f1 = getEnt("f1", "targetname");
  f2 = getEnt("fy2", "targetname");
  f3 = getEnt("f3", "targetname");
  f4 = getEnt("f4", "targetname");
  f5 = getEnt("f5", "targetname");

  maps\mp\_fx::loopfx("effect_1", (f1.origin), 1);
  maps\mp\_fx::loopfx("effect_1", (f2.origin), 1);
  maps\mp\_fx::loopfx("effect_1", (f3.origin), 1);
  maps\mp\_fx::loopfx("effect_1", (f4.origin), 1);
  maps\mp\_fx::loopfx("effect_1", (f5.origin), 1);

    level.music = randomint(1);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "perfect" );
     break;
   }
}

startcylinder()
{
 mover = getent("culunder1","targetname");                            
  for(;;) 
  {
   mover rotateYaw (360,5);
   wait 1;
  }
      
}

vc360()//rotating vistic
{
 vc = getent("vistic360","targetname");  //stairs
 vc1 = getent("vc1","targetname");       //cylinder route
 vc2 = getent("vc23","targetname");        //snip                    
  for(;;) 
  {
     vc rotateyaw (360, 3);
     vc1 rotateyaw (360, 3);
     vc2 rotateyaw (360, 3);
     vc moveZ (100, 3);
     vc1 moveZ (100, 3);
     vc2 moveZ (100, 3);
     wait 3;
     vc rotateyaw (360, 3);
     vc1 rotateyaw (360, 3);
     vc2 rotateyaw (360, 3);
     vc moveZ (-100, 3);
     vc1 moveZ (-100, 3);
     vc2 moveZ (-100, 3);
     wait 3;
  }
      
}

vclogo2()
{
 vc = getent("vclogo2","targetname");    
 vc2 = getent("vclogo3","targetname");                            
  for(;;) 
  {
     vc rotateyaw (360, 5);
     vc2 rotateyaw (360, 5);
     vc moveZ (200, 5);
     vc2 moveZ (200, 5);
     wait 5;
     vc rotateyaw (360, 5);
     vc2 rotateyaw (360, 5);
     vc moveZ (-200, 5);
     vc2 moveZ (-200, 5);
     wait 5;
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

trap1()
{
     plat1 = getent("trap1","targetname");
     plat2 = getent("trap1a","targetname");
     plat3 = getent("trap1b","targetname");
     trig = getent("trigger_trap1", "targetname");
     trig setHintString("T1: Rotate the 3 circles");
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

trap2()
{
     plankt1 = getent("trap2","targetname");
     trig = getent("trigger_trap2", "targetname");
     trig setHintString("T2: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

trap3()
{
 part1 = getentarray("trap3","targetname");
 part2 = getentarray("trap3a","targetname");
 part3 = getentarray("trap3b","targetname");
 part4 = getentarray("trap3c","targetname");
 trig = getent("trigger_trap3","targetname");
 trig  setHintString("T3: Unstable 2 squares.");
 trig waittill("trigger" , user );
 if(user.pers["team"] != "axis")
{
	wait 0.2;
}
 else if(level.trapsdisabled)
{

}
 else
 trig delete();
 trig SetHintString("^7Activated");
 random = randomint(2);
	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				part2[randomInt(part3.size)] notsolid();
				break;
				
		case 1:	
				part3[randomInt(part2.size)] notsolid();
				part4[randomInt(part4.size)] notsolid();
                break;
				
		default: return;
	}
}

trap4()
{
     plankt1 = getent("trap4","targetname");
     trig = getent("trigger_trap4", "targetname");
     trig setHintString("T4: Rotate cylinder");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

trap5()
{
 part1 = getentarray("trap5","targetname");
 part2 = getentarray("trap5a","targetname");
 part3 = getentarray("trap5b","targetname");
 trig = getent("trigger_trap5","targetname");
 trig  setHintString("T5: Unstable 1 line of piles.");
 trig waittill("trigger" , user );
 if(user.pers["team"] != "axis")
{
	wait 0.2;
}
 else if(level.trapsdisabled)
{

}
 else
 trig delete();
 trig SetHintString("^7Activated");
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
				part3[randomInt(part3.size)] notsolid();
                break;
				
		default: return;
	}
}

trap6()
{
    platform = getent("trap6", "targetname");
    trig = getent("trigger_trap6", "targetname");
    trig setHintString("T6: Unstable half of the platform.");
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

trap7()
{
     plankt1 = getent("trap7","targetname");
     trig = getent("trigger_trap7", "targetname");
     trig setHintString("T7: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

trap8()
{
     plat1 = getent("trap8","targetname");
     plat2 = getent("trap8a","targetname");
     plat3 = getent("trap8b","targetname");
     trig = getent("trigger_trap8", "targetname");
     trig setHintString("T8:Rotate 3 circles.");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(-360,3);
     wait 5;
   }
      
}

trap9()
{
     plankt1 = getent("trap9","targetname");
     trig = getent("trigger_trap9", "targetname");
     trig setHintString("T9: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

trap10()
{
     plat1 = getent("trap10","targetname");
     plat2 = getent("trap10a","targetname");
     trig = getent("trigger_trap10", "targetname");
     trig setHintString("T10: Rotate 2 cylinders.");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateroll(360,3);
     plat2 rotateroll(-360,3);
     wait 5;
   }
      
}

trap11()
{
     plat1 = getent("trap11","targetname");
     plat2 = getent("trap11a","targetname");
     trig = getent("trigger_trap11", "targetname");
     trig setHintString("T11: Rotate 2 cylinders.");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateroll(360,3);
     plat2 rotateroll(-360,3);
     wait 5;
   }
      
}

trap12()
{
     plat1 = getent("trap12","targetname");
     plat2 = getent("trap12a","targetname");
     trig = getent("trigger_trap12", "targetname");
     trig setHintString("T12: Rotate 2 cylinders.");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateroll(360,3);
     plat2 rotateroll(-360,3);
     wait 5;
   }
      
}

trap13()
{
     plat1 = getent("trap13","targetname");
     plat2 = getent("trap13a","targetname");
     trig = getent("trigger_trap13", "targetname");
     trig setHintString("T13: Rotate the 2 circles");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     wait 5;
   }
      
}

trap14()
{
     plankt1 = getent("trap14","targetname");
     trig = getent("trigger_trap14", "targetname");
     trig setHintString("T14: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

trap15()
{
     plankt1 = getent("trap15","targetname");
     trig = getent("trigger_trap15", "targetname");
     trig setHintString("T15: Rotate bounce below");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

trap16()
{
     plat1 = getent("trap16","targetname");
     plat2 = getent("trap16a","targetname");
     plat3 = getent("trap16b","targetname");
     trig = getent("trigger_trap16", "targetname");
     trig setHintString("T16: Rotate 3 squares below");
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

move1()//Move to next area acti
{
   trig = getent("trigger_acti1", "targetname");
   tele1 = getent ("origin_acti1", "targetname");
   trig setHintString ("Move to other area");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
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
    scope = getent("trigger_sniproom","targetname");
    weapon = getent("trigger_weaponroom","targetname");
    knife = getent("trigger_kniferoom","targetname");
    scope thread maps\mp\_utility::triggerOff();
    weapon thread maps\mp\_utility::triggerOff();
    knife thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    scope thread maps\mp\_utility::triggerOn();
    weapon thread maps\mp\_utility::triggerOn();
    knife thread maps\mp\_utility::triggerOn();
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
        //player.maxhealth = 100;
        

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("" + player.name + " died in scope room");
    }
}

weaponroom()
{
   level.trigger_weapon = getEnt ("trigger_weaponroom", "targetname");

    jumperk = getEnt ("origin_jumperweap", "targetname");
    actik = getEnt ("origin_actiweap", "targetname");

   for(;;)
    {
       level.trigger_weapon setHintString ("Press [&&1] to enter Deagle Room");
        level.trigger_weapon waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        activator giveWeapon("deserteagle_mp");
        player giveMaxAmmo("deserteagle_mp");
        activator giveMaxAmmo("deserteagle_mp");
        player switchToWeapon("deserteagle_mp");
        activator switchToWeapon("deserteagle_mp");
         //player.maxhealth = 100;

            while(isDefined(player) && isAlive(player))
              wait .05;
        
        iPrintLnBold ("^7" + player.name + " ^7has died in Deagle room.");
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
        //player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
        
        iPrintLnBold ("" + player.name + " has died in Knife Room");
    }
}

smallvisticend()
{
  end2 = getEnt("end2","targetname");
  end1 = getEnt("endy","targetname");
  end3 = getEnt("endy1","targetname");

	while(1)
	{
  	     end2 moveZ(-20, 2, 0.5, 0.5);
        end1 moveZ(-20, 2, 0.5, 0.5);
        end3 moveZ(-20, 2, 0.5, 0.5);
        end2 rotateYaw(180, 2);
        end1 rotateYaw(180, 2);
        end3 rotateYaw(180, 2);
      
		 wait 2;
        end2 moveZ(20, 2, 0.5, 0.5);
        end1 moveZ(20, 2, 0.5, 0.5);
        end3 moveZ(20, 2, 0.5, 0.5);
		  end2 rotateYaw(180, 2);
        end1 rotateYaw(180, 2);
        end3 rotateYaw(180, 2);
		wait 2;
	}
}

startdoor()
{
 startdoor = getent("startdoor", "targetname");

 wait 15;

 startdoor moveZ(-350, 5);

 wait 15;
}

messages()
{    

    wait 10;
     
     iprintln ("^7Diskord ^5[CIR] eG0sxs#1823 / clanlesscompy.");

    
}

squares()
{
     square1 = getent("square1","targetname");    
     square2 = getent("square2","targetname");  
     square3 = getent("square3","targetname");  
     square4 = getent("square4","targetname");  
     square5 = getent("square5","targetname");  
     square6 = getent("square6","targetname");  
     square7 = getent("square7","targetname");  
     square8 = getent("square8","targetname");    
     square9 = getent("square9","targetname");     
     square10 = getent("square10","targetname");  //dgl r
     square11 = getent("square11","targetname");  //dgl r
     square12 = getent("square12","targetname");  //dgl r
     square13 = getent("square13","targetname");  //dgl r        
  for(;;) 
  {
   square1 rotateYaw (360,15);
   square2 rotateYaw (-360,15);
   square3 rotateYaw (-360,15);
   square4 rotateYaw (360,15);
   square5 rotateYaw (-360,15);
   square6 rotateYaw (360,15);
   square7 rotateYaw (-360,15);
   square8 rotateYaw (360,15);
   square9 rotateYaw (360,15);
   square10 rotateYaw (360,15);
   square11 rotateYaw (-360,15);
   square12 rotateYaw (360,15);
   square13 rotateYaw (360,15);

   wait 15;
  }
}