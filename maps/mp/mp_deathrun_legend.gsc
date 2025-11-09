main()
{

	maps\mp\_load::main();

	trigger = spawn( "trigger_radius", (1981.1, -1723.11, 16.125), 0, 255, 150 );
    trigger.targetname = "endmap_trig";
    trigger.radius = 255; 

	AmbientPlay("song_1");
    

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	entTransporter = getentarray( "enter1", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter1();

	entTransporter = getentarray( "enter2", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter2();		

    thread trap1();
	//thread rotate();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread endoor();
	thread Jumproom();
	thread sniperoom();
	thread kniferoom();

	addTriggerToList( "trigger_trap1" );
	addTriggerToList( "trigger_rotate" );
	addTriggerToList( "trigger_trap3" );
	addTriggerToList( "trigger_trap4" );
	addTriggerToList( "trigger_t1_" );
	addTriggerToList( "trigger_trap1" );
	addTriggerToList( "trigger_trap6" );
	addTriggerToList( "trigger_trap7" );


}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

transporter1()
{
	entTarget = getEnt( self.target, "targetname" );
	for(;;)
	{
		self waittill( "trigger", player );
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	}
}


transporter2()
{
	entTarget = getEnt( self.target, "targetname" );
	for(;;)
	{
		self waittill( "trigger", player );
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	}
}


trap1()
{
trigger = getent("trigger_trap1","targetname");
object = getent("trap1","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object moveY(-560, 0.1);
object waittill("movedone");
wait(3);
object moveY(560, 1);
object waittill("movedone");
wait(0.1);
}
}

rotate()
{     
trig = getEnt("trigger_rotate","targetname");
brush = getEnt("rotate","targetname");

trig waittill("trigger");
trig delete();
while(true)
{
brush rotatePitch(360,3);
wait 1;
}
}

trap3()
{
trigger = getent("trigger_trap3","targetname");
object = getent("trap3","targetname");
killtrigger = getent ("killtrig" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger enablelinkto ();
killtrigger linkto (object);
object moveX(-208, 1);
object waittill("movedone");
wait(1.5);
object moveX(208, 3);
object waittill("movedone");
wait(0.1);
}
}

trap4()
{
trigger = getent("trigger_trap4","targetname");
object = getent("trap4","targetname");
killtrigger = getent ("killtrig1" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger enablelinkto ();
killtrigger linkto (object);
object moveY(-304, 1);
object waittill("movedone");
wait(2);
object moveY(304, 3);
object waittill("movedone");
wait(0.1);
}
}

trap5()
{
        trigger = getent("trigger_t1_","targetname");
	object = getent("t1_","targetname");
        trigger waittill ("trigger" , player );
        trigger delete();
	a = getent("t1a","targetname");
	b = getent("t1b","targetname");
	c = getent("t1c","targetname");
	d = getent("t1d","targetname");
	e = getent("t1e","targetname");
	f = getent("t1f","targetname");
	
	while(1)
	{
		a moveX(-64,0.5);
		b moveX(64,0.5);
		c moveX(-64,0.5);
		d moveX(64,0.5);
		e moveX(-64,0.5);
		f moveX(64,0.5);
		wait 1.5;
		a moveX(64,0.5);
		b moveX(-64,0.5);
		c moveX(64,0.5);
		d moveX(-64,0.5);
		e moveX(64,0.5);
		f moveX(-64,0.5);
		wait 1.5;
	}
}

trap6()
{
trigger = getent("trigger_trap6","targetname");
object = getent("trap6","targetname");
object1 = getent("door1","targetname");
object2 = getent("door2","targetname");
killtrigger = getent ("killtrig2" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger enablelinkto ();
killtrigger linkto (object);
object1 moveZ(224, 1);
object2 moveZ(224, 1);
wait(1.5);
object movez(80, 1);
object waittill("movedone");
wait(0.5);
object movez(-80, 1);
object1 moveZ(-224, 1);
object2 moveZ(-224, 1);
object waittill("movedone");
object1 waittill("movedone");
object2 waittill("movedone");
wait(0.1);
}
}

trap7()
{     
          trigger = getEnt("trigger_trap7","targetname");
          brush = getEnt("trap7","targetname");

          trigger waittill("trigger");
          trigger delete();

          while(true)
          {
                 brush rotateYaw(360,1);
                 wait 1;
          }
}

endoor()
{
level.oldtrigger = getent("trigger_endoor","targetname");
object  = getent("endoor","targetname");
level.oldtrigger waittill ("trigger" , player );
level.oldtrigger delete();
level.knife_trig delete();
level.jump_trig delete();
level.snipe_trig delete();
{
iprintlnbold (" ^7" + player.name + " ^4Open ^3Finall ^4Door!");
object movex(192, 1);
object waittill("movedone");
wait(1);
}
}

Jumproom()
{
    level.jump_trig = getEnt( "Jump", "targetname");
    jump = getEnt( "jumper_enter_jumproom", "targetname" );
    acti = getEnt( "activator_enter_jumproom", "targetname" );
    while(1)
    {
        level.jump_trig waittill( "trigger", player );
        if(level.firstenter==true)
		{
                level.snipe_trig delete();
                level.oldtrigger delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^4" + player.name + " ^2 picked ^9JUMP^7!" );
		wait 0.1;
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
    }
}

sniperoom()
{
    level.snipe_trig = getEnt( "sniperoom", "targetname");
    jump = getEnt( "jumpsnipe", "targetname" );
    acti = getEnt( "actisnipe", "targetname" );

    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
                level.oldtrigger delete();
		level.jump_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
        iPrintlnBold( " ^5" + player.name + " ^2 picked ^9SNIPER^4!" );
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        player TakeAllWeapons();
	level.activ TakeAllWeapons();
	wait 0.1;
        player GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "remington700_mp" );
	wait 0.1;
	player GiveWeapon( "M40A3_mp" );
	level.activ GiveWeapon( "M40A3_mp" );
	wait 0.1;
	player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
    }
}

kniferoom()
{
    level.knife_trig = getEnt( "Knife", "targetname");
    jump = getEnt( "jumper_enter_kniferoom", "targetname" );
    acti = getEnt( "activator_enter_kniferoom", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
                level.snipe_trig delete();
                level.oldtrigger delete();
 		level.jump_trig delete();
		level.firstenter=false;
		}
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^4" + player.name + " ^2 picked ^9KNIFE^7!" );
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
    }
}