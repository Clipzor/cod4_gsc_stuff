main()
{
maps\mp\_load::main();
maps\mp\mp_dr_idk_fx::main();
maps\createfx\mp_dr_idk_fx::main();
maps\mp\_teleport::main();
ambientPlay("em");
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread trap9();
thread music();
thread wall();
thread credit();
thread knife();
thread hide();
PreCacheItem("deserteaglegold_mp");
PreCacheItem("winchester1200_mp");
	PreCacheItem("skorpion_mp");
	PreCacheItem("remington700_mp");
	PreCacheItem("m4_mp");
	PreCacheItem("g3_mp");
	PreCacheItem("ak47_mp");
	PreCacheItem("rpd_mp");
thread hindi();
thread tele();
thread deagle_trigger();
addTriggerToList("t1");
addTriggerToList("t2");
addTriggerToList("t3");
addTriggerToList("t4");
addTriggerToList("t5");
addTriggerToList("t6");
addTriggerToList("t7");
addTriggerToList("t8");
addTriggerToList("t9");

}

trap1()
{
brush = getEnt ("b1", "targetname");
trig = getEnt ("t1", "targetname");
trig waittill ("trigger", player);
trig delete();
while(1)
{
brush moveZ (480,0.1);
}
}

music()
{
trig = getEnt ("s1", "targetname");
brush = getEnt ("sb1", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveX (111,1);
ambientStop();
ambientPlay("music");
}

}

hindi()
{
trig = getEnt ("s2", "targetname");
trig waittill ("trigger", player);
ambientStop();
ambientPlay("dil");
}

trap2()
{
brush = getEnt ("b2", "targetname");
trig = getEnt ("t2", "targetname");
trig waittill ("trigger", player);
trig delete();
while(1)
{
 brush rotateYaw (360,4);
 wait 5;
 }
 }
 
 trap3()
 {
  brush = getEnt ("b3", "targetname");
  trig = getEnt ("t3", "targetname");
  trig waittill ("trigger", player);
  trig delete();
  while(1)
  {
  brush rotateYaw (360,7);
  wait 5;
  }
  }
  
 trap4()
 {
   brush = getEnt ("b4", "targetname");
   trig = getEnt ("t4", "targetname");
   trig waittill ("trigger", player);
   trig delete();
   while(1)
   {
    brush moveY (300,1);
	wait 10;
	brush moveY (-300,1);
	wait 10;
	}
	}
	
 trap5()
 {
  brush = getEnt ("b5", "targetname");
   trig = getEnt ("t5", "targetname");
   trig waittill ("trigger", player);
   trig delete();
   while(1)
    {
	  brush moveZ(-5000,0.1);
	  wait 10;
	  brush moveZ(70,9);
	  wait 10;
	  }
}

trap6()
{
   b1 = getEnt ("b6a", "targetname");
   b2 = getEnt ("b6b", "targetname");
   trig = getEnt ("t6", "targetname");
   trig waittill ("trigger", player);
   trig delete();
   while(1)
   {
    b1 moveZ (500,4);
	b2 moveZ (-500,4);
	wait 0.1;
	b1 moveZ (-500,4);
	b2 moveX (500,4);
	wait 0.1;
	}
	}
	
	trap7()
	{
   brush = getEnt ("b7", "targetname");
   trig = getEnt ("t7", "targetname");
   trig waittill ("trigger", player);
   trig delete();
   while(1)
    {
	 brush moveY (-560,1);
	 wait 5;
	 brush moveY (560,1);
	 wait 5;
	 }
	 }
	 
	 trap8()
	{
   brush = getEnt ("b8", "targetname");
   trig = getEnt ("t8", "targetname");
   trig waittill ("trigger", player);
   trig delete();
   while(1)
   {
    brush rotateYaw (360,0.1);
	wait 0.1;
	}
	}
	
	trap9()
	{
   brush = getEnt ("b9", "targetname");
   trig = getEnt ("t9", "targetname");
   trig waittill ("trigger", player);
   trig delete();
   while(1)
   {
    brush rotateYaw (360,1);
	wait 1;
	}
	}
	
	deagle_trigger()
{
trigger = getEnt("trigger_deagle", "targetname");
precacheItem("deserteaglegold_mp");	
while(1)
{
trigger waittill("trigger", player);
player takeallweapons();
player GiveWeapon("deserteaglegold_mp");
player SwitchToWeapon( "deserteaglegold_mp" );
}
}

tele()
{
	entTransporter = getentarray( "u2", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter()
{
	entTarget = getEnt( self.target, "targetname" );
	while(true)
	{
		self waittill( "trigger", player );
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	}
}

knife()
{
    level.knife_trig = getEnt( "knife_room", "targetname");
	jump = getEnt( "final_jumper_teleport", "targetname" );
	acti = getEnt( "final_activator_teleport", "targetname");
    
    	while(1)
	{
		level.knife_trig waittill( "trigger", player );
		if( !isDefined( level.knife_trig ) )
			return;
		
		level.snip_trig delete();
                                 
                                     
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );		
		wait 0.05;
		player switchToWeapon( "tomahawk_mp" );
		level.activ SwitchToWeapon( "tomahawk_mp" );
		iPrintlnBold( " ^6" + player.name + " has chosen Knife room!" );		//change it as you wish 
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

wall()
{
    level.wall_trig = getEnt( "wall_room", "targetname");
	jump = getEnt( "wall_jump", "targetname" );
	acti = getEnt( "wall_acti", "targetname");
    
    	while(1)
	{
		level.wall_trig waittill( "trigger", player );
		if( !isDefined( level.wall_trig ) )
			return;
		
		level.snip_trig delete();
                                 
                                     
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );		
		wait 0.05;
		player switchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		iPrintlnBold( " ^6" + player.name + " has chosen hide room!" );		//change it as you wish 
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

hide()
{
    level.hide_trig = getEnt( "hide_room", "targetname");
	jump = getEnt( "hide_jump", "targetname" );
	acti = getEnt( "hide_acti", "targetname");
    
    	while(1)
	{
		level.hide_trig waittill( "trigger", player );
		if( !isDefined( level.hide_trig ) )
			return;
		
		level.snip_trig delete();
                                 
                                     
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );		
		wait 0.05;
		player switchToWeapon( "tomahawk_mp" );
		level.activ SwitchToWeapon( "tomahawk_mp" );
		iPrintlnBold( " ^6" + player.name + " has chosen Knife room!" );		//change it as you wish 
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

credit()
{
wait(10);
thread drawInformation( 800, 0.8, 1, "^1Map by ^2Morrison" );
wait(4);
thread drawInformation( 800, 0.8, 1, "^2I^2d^3K" );
wait(4);
thread drawInformation( 800, 0.8, 1, "^1All The ^3Best" );
wait(4);
thread drawInformation( 800, 0.8, 1, "^1xfire:^2freek80" );
wait(4);
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 60 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
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

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
} 