/*Map Dedicated to my Beloved Vistic
 Map By CoMpy.
 /devmap mp_vc_ethereal2


                                                                                                            
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
    maps\mp\mp_vc_ethereal2_fx::main();

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    setdvar("g_speed" ,"210");

    thread music();
    thread vistic();
    thread endmap_trig();
    thread kniferoom();
    thread sniproom();
    thread sniperfail();
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
    thread move1(); 
    thread move2();

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

}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
    
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

music()
{
     fireb1 = getEnt("fireb1", "targetname");
     fireb2 = getEnt("fireb2", "targetname");
     purplesnow1 = getEnt("purplesnow1", "targetname");
     firea1 = getEnt("firea1", "targetname");
     firea2 = getEnt("firea2", "targetname");

     maps\mp\_fx::loopfx("effect_2", (fireb1.origin), 1);
     maps\mp\_fx::loopfx("effect_2", (fireb2.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (purplesnow1.origin), 10);
     maps\mp\_fx::loopfx("effect_3", (firea1.origin), 1);
     maps\mp\_fx::loopfx("effect_3", (firea2.origin), 1);

    level.music = randomint(2);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "surrender" );
     break;

     case 1:
     AmbientPlay( "surrender2" );
     break;
   }
}

vistic()
{
 vc = getent("vcrotayte","targetname");
 vc1 = getent("vcrotaytee","targetname");
  vcunder = getent("under","targetname");
 vcunder1 = getent("under1","targetname");
	                                  
  for(;;) 
  {
  vc rotateYaw (360,7);
  vc1 rotateYaw (360,7);
  vcunder rotateYaw (360,7);
  vcunder1 rotateYaw (-360,7);
  wait 1;
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
    knife = getent("trigger_kniferoom","targetname");
    scope thread maps\mp\_utility::triggerOff();
    knife thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    scope thread maps\mp\_utility::triggerOn();
    knife thread maps\mp\_utility::triggerOn();
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

sniperfail()//respawn in siniper sroom
{
   trigb = getent("trigger_failer1", "targetname");
   teleb = getent ("origin_failer1", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

trap1()
{
     plat1 = getent("trap1","targetname");
     plat2 = getent("trap1a","targetname");
     trig = getent("trigger_trap1", "targetname");
     trig setHintString("T1: Rotate 2 squares");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateyaw(360,3);
     plat2 rotateyaw(-360,3);
     wait 5;
   }
      
}

trap2()
{
     plat1 = getent("trap2","targetname");
     plat2 = getent("trap2a","targetname");
     trig = getent("trigger_trap2", "targetname");
     trig setHintString("T2: Rotate 2 cylinders");
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

trap3()
{
     plankt1 = getent("trap3","targetname");
     plankt2 = getent("trap3a","targetname");
     trig = getent("trigger_trap3", "targetname");
     trig setHintString("T3: Unstable 2 bounces for 7 sec");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
	 plankt1 notsolid();
     plankt2 notsolid();
	 wait 5;
	 plankt1 solid();
     plankt2 solid();
	wait 2000;
   }
}

trap4()
{
   plata = getent("trap4", "targetname");
   platb = getent("trap4a", "targetname");
   platc = getent("trap4b", "targetname");
   platd = getent("trap4c", "targetname");
   plate = getent("trap4e", "targetname");
   platf = getent("trap4f", "targetname");

   trig = getent("trigger_trap4", "targetname");

   trig setHintString("T4: Move up n down the 6 platforms");
   trig waittill ("trigger");
   trig setHintString("^7Activated");
  for(;;)
	{
	   plata moveZ (50,3);
     platb moveZ (50,3);
     platc moveZ (-50,3);
     platd moveZ (-50,3);
     plate moveZ (50,3);
     platf moveZ (50,3);

     wait 3;

     plata moveZ (-50,3);
     platb moveZ (-50,3);
     platc moveZ (50,3);
     platd moveZ (50,3);
     plate moveZ (-50,3);
     platf moveZ (-50,3);
     wait 3;
	 }
}

trap5()
{
     plankt1 = getent("trap5","targetname");
     plankt2 = getent("trap5a","targetname");
     trig = getent("trigger_trap5", "targetname");
     trig setHintString("T5: Unstable 2 bounces for 7 sec");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
	 plankt1 notsolid();
     plankt2 notsolid();
	 wait 5;
	 plankt1 solid();
     plankt2 solid();
	wait 2000;
   }
}

trap6()
{
     plat1 = getent("trap6","targetname");
     trig = getent("trigger_trap6", "targetname");
     trig setHintString("T6: Rotate 1 platform");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateyaw(360,3);
     wait 5;
   }
}

trap7()
{
   plata = getent("trap7", "targetname");
   platb = getent("trap7a", "targetname");
   platc = getent("trap7b", "targetname");
   platd = getent("trap7c", "targetname");
   plate = getent("trap7e", "targetname");

   trig = getent("trigger_trap7", "targetname");

   trig setHintString("T7: Move up n down the 5 platforms");
   trig waittill ("trigger");
   trig setHintString("^7Activated");
  for(;;)
	{
	 plata moveZ (50,3);
     platb moveZ (50,3);
     platc moveZ (-50,3);
     platd moveZ (-50,3);
     plate moveZ (50,3);

     wait 3;

     plata moveZ (-50,3);
     platb moveZ (-50,3);
     platc moveZ (50,3);
     platd moveZ (50,3);
     plate moveZ (-50,3);
     wait 3;
	 }
}

trap8()
{
     plat1 = getent("trap8","targetname");
     plat2 = getent("trap8a","targetname");
     trig = getent("trigger_trap8", "targetname");
     trig setHintString("T8: Rotate the 2 squares");
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

trap9()
{
     plat1 = getent("hulundert02","targetname");
     trig = getent("trigger_trap9", "targetname");
     trig setHintString("T9: Rotate rotator");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plat1 rotateyaw(360,4);
     wait 0.1;
   }
      
}

trap10()
{
   plata = getent("eth1", "targetname");
   platb = getent("eth2", "targetname");
   platc = getent("eth3", "targetname");

   trig = getent("trigger_trap10", "targetname");

   trig setHintString("T10: Move up n down the 3 platforms");
   trig waittill ("trigger");
   trig setHintString("^7Activated");
  for(;;)
	{
	   plata moveZ (-50,2);
     platb moveZ (50,2);
     platc moveZ (-50,2);

     wait 2;

     plata moveZ (50,2);
     platb moveZ (-50,2);
     platc moveZ (50,2);
     wait 2;
	 }
}

move1()//Move to next area acti
{
   trig = getent("trigger_move1", "targetname");
   tele1 = getent ("origin_move1", "targetname");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

move2()//Move to next area acti
{
   trig = getent("trigger_move2", "targetname");
   tele1 = getent ("origin_move2", "targetname");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}