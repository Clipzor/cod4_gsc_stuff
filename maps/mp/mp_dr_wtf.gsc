main()//Made by Phill580
{
    maps\mp\_load::main();

	trig = spawn("trigger_radius",(553, -611, 92),0,300,150);
	trig.radius = 300;
	trig.targetname = "endmap_trig";

    PreCacheItem("brick_blaster_mp");
         
          
	thread patch();
	thread music();
    thread crush();
    thread fan();
    thread squares();
    thread impossible();
    thread trap5();
    thread Tunnel();
    thread drawbridge_open ();
    thread trap7();          
    thread Gladiator();

	thread WatchSniper();
	thread watchKnife();

    addTriggerToList("trig1");
    addTriggerToList("trig2");
    addTriggerToList("trig3");
    addTriggerToList("trig4");
    addTriggerToList("trig5");
    addTriggerToList("trig6");
    addTriggerToList("lower_bridge");
    addTriggerToList("trig7");

}

patch()
{
	trig = spawn("trigger_radius",(244.764, 1481.52, 176.125), 0, 1365, 150);
	trig.radius = 1365;

	for(;;)
	{
	trig waittill("trigger",player);

        player Suicide();
	}
}

music() {
    wait 1;
    ambientPlay("ambient_wtf");
    wait 1;
}

WatchSniper()
{
	level.snip_trig = getEnt( "trigger_sniper", "targetname");
	jump = getEnt( "sniper_jumper", "targetname" );
	acti = getEnt( "sniper_activator", "targetname" );
	
	while( 1 )
	{
		level.snip_trig waittill( "trigger", player );

	
		if( !isDefined( level.snip_trig ) )
			return;
		
		level.knife_trig delete();
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "m40a3_mp" );
		player giveMaxAmmo( "m40a3_mp" );
		player GiveWeapon( "remington700_mp" );
		player giveMaxAmmo( "remington700_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "m40a3_mp" );
		level.activ GiveMaxAmmo( "m40a3_mp" );
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
		wait 0.05;
		player switchToWeapon( "m40a3_mp" );
		level.activ SwitchToWeapon( "m40a3_mp" );
		iPrintlnBold( "^1>> ^2" + player.name + " has chosen sniper room!" );
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

WatchKnife()
{
	level.knife_trig = getEnt( "trigger_knife", "targetname");
	jump = getEnt( "knife_jumper", "targetname" );
	acti = getEnt( "knife_activator", "targetname" );
	
	while( 1 )
	{
		level.knife_trig waittill( "trigger", player );
	
		if( !isDefined( level.knife_trig ) )
			return;
		
		level.snip_trig delete();
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWEapon( "knife_mp" );
		player giveMaxAmmo( "knife_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );
		level.activ GiveMaxAmmo( "knife_mp" );
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ SwitchToWeapon( "knife_mp" );
		iPrintlnBold( "^1>> ^2" + player.name + " has chosen knife room!" );
		while( isDefined( player ) && isAlive( player ) )
			wait 1;
	}
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
crush()
{
           trig = getEnt("trig1","targetname");
           brush1 = getEnt("trap1.1","targetname");
           brush2 = getEnt("trap1.2","targetname");
           hurt1 = getEnt("trap1_hurt","targetname");
           hurt2 = getEnt("trap1_hurt2","targetname");

           hurt1 enablelinkto();
           hurt2 enablelinkto();
           hurt1 linkto(brush1);
           hurt2 linkto(brush2);

           trig waittill("trigger");
           {
              brush1 moveX(240,2);
              brush2 moveX(-240,2);
              wait 2;
              brush1 moveX(-240,2);
              brush2 moveX(240,2);
              wait 2;
            }
             trig waittill("trigger");
             trig delete();
           {
              brush1 moveX(240,2);
              brush2 moveX(-240,2);
              wait 2;
              brush1 moveX(-240,2);
              brush2 moveX(240,2);
              wait 2;
            }
}
fan()
{     
         trig = getEnt("trig2","targetname");
          brush = getEnt("trap2","targetname");
          hurt = getEnt("trap2_hurt","targetname");

          hurt enablelinkto();
          hurt linkto(brush);

          trig waittill("trigger");
          trig delete();

          while(true)
          {
                 brush rotatePitch(360,3);
                 wait 1;
          }
}
squares()
{
                   trig = getEnt( "trig3", "targetname" );
	brushGroup1 = getEntArray( "trap3.1", "targetname" );
	brushGroup2 = getEntArray( "trap3.2", "targetname" );
                   brushGroup3 = getEntArray( "trap3.3", "targetname" );
	brushGroup4 = getEntArray( "trap3.4", "targetname" );

	trig waittill("trigger");
	brushGroup1[randomInt(brushGroup1.size)] delete();

                  trig waittill("trigger");
	brushGroup2[randomInt(brushGroup1.size)] delete();

                  trig waittill("trigger");
	brushGroup3[randomInt(brushGroup1.size)] delete();

                  trig waittill("trigger");
                  trig delete();
	brushGroup4[randomInt(brushGroup1.size)] delete();	
}
impossible()
{
                      trig = GetEnt("trig4","targetname");
                      brush1 = GetEnt("trap4.1","targetname");
                      brush2 = GetEnt("trap4.2","targetname");
                      brush3 = GetEnt("trap4.3","targetname");

                      trig waittill("trigger");
                      trig delete();

                      while(true)
                     {
                              brush1 rotateYaw(360,1);
                              brush2 rotateRoll(-360,3);
                              brush3 rotatePitch(360,3);
                              wait 1;
                     }
}
trap5()
{
            trig = getEnt("trig6","targetname");
            brush = getEnt("trap6","targetname");

            trig waittill("trigger");
            trig delete();
            {
                        brush moveY(144,1);
                        wait 5;
                        brush moveY(-144,1);
            }
}                        
Tunnel()
{
            trig = getEnt("trig5","targetname");
            brush = getEnt("trap5","targetname");
            
            trig waittill("trigger");
            trig delete();

            while(true)
                     {
                              brush rotatePitch(360,4);
                              wait 1;
                     }
}
drawbridge_open() 
{ 
	drawbridge = getent( "drawbridge", "targetname" ); 
	trig = getent( "lower_bridge", "targetname" ); 
 
while(true) 
{ 
	trig waittill ("trigger"); 
	drawbridge rotateto( (-90,0,0),1); 
	drawbridge waittill ("rotatedone"); 
	wait 1; 
	trig waittill ("trigger"); 
	drawbridge rotateto( (0,0,0),1); 
	drawbridge waittill ("rotatedone"); 
	} 
}
trap7()
{
    trig = GetEnt("trig7","targetname");
    brush = GetEnt("trap7","targetname");
    hurt = getEnt("hurt_7","targetname");

    hurt enablelinkto();
    hurt linkto(brush);

    trig waittill("trigger",player);
    trig delete();
    
    while(1)
    {
        brush moveX(-976,3);
        wait 3;
        brush moveX(976,3);
        wait 3;
    }
}
Gladiator()
{
    trig = getEnt("Gladiator","targetname");

    trig waittill("trigger",players);
    trig delete();

	iprintln("Map Made By Phill580");
    wait 1;
	iprintln("Lossy Helped with Script");
    wait 1;
	iprintln("Phaedrean Helped with Mini Games");
}