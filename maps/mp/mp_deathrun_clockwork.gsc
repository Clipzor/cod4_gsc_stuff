main() {
	maps\mp\_load::main();
	ambientPlay("tacos");
	
	level.bjump1 = getEnt( "jb1", "targetname" );
	level.bacti1 = getEnt( "ab1", "targetname" );
	
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
	thread Sniper();
	thread Knife();
	thread Bounce();
	thread Clock();
	thread jumpreset1();
	
}

trap1()
{
	act1 = getEnt ("trap1_acti", "targetname");
	rotate1 = getEnt ("trap1_trap", "targetname");
	
	act1 waittill ("trigger");
	act1 delete();
	
	while (1) //makes it always rotate
		{
			rotate1 rotatepitch (360, 5); //rotateroll rotateyaw rotatepitch
			wait 2; //same speed brush rotates
		}
}

trap2()
{
	act1 = getEnt ("trap2_acti", "targetname");
	rotate1 = getEnt ("trap2_trap", "targetname");
	
	act1 waittill ("trigger");
	act1 delete();
	
	while (1) //makes it always rotate
		{
			rotate1 rotateroll (360, 2); //rotateroll rotateyaw rotatepitch
			wait 2; //same speed brush rotates
		}
}

trap3()
{
    trig = getEnt ("trap3_acti", "targetname"); 
    
    trig waittill ("trigger", who);
    trig delete();
    
    if (randomInt(2) == 0)
        thread kill1();
    else
        thread kill2();
}


kill1()
{
    trig = getEnt ("trap3_kill1", "targetname");
    
    for(;;)
    {
        trig waittill ("trigger", who);
        who suicide();
        wait 0.5;
    }
}    

kill2()
{
    trig = getEnt ("trap3_kill2", "targetname");
    
    for(;;)
    {
        trig waittill ("trigger", who);
        who suicide();
        wait 0.5;
    }
}

trap4()
{
	act1 = getEnt ("trap4_acti", "targetname");
	rotate1 = getEnt ("trap4_trap", "targetname");
	
	act1 waittill ("trigger");
	act1 delete();
	
	while (1) //makes it always rotate
    {
        rotate1 rotateroll (360, 2); //rotateroll rotateyaw rotatepitch
        wait 2; //same speed brush rotates
    }
}

trap5()
{	
    trig = getEnt ("trap5_trig", "targetname");	
    hurt = getEnt ("trap5_spikehurt", "targetname");	
    spikes = getEnt ("trap5_spike", "targetname"); 

    hurt enablelinkto(); 
    hurt linkto (spikes); 

    trig waittill ("trigger");
    { 
        spikes moveZ (-244,2);
        wait 5;
        spikes moveZ(244,2);
    }
}

trap6()
{
	trig = getEnt ("trap6_acti" , "targetname"); 
	trap = getEnt ("trap6_trap" , "targetname"); 
	
	trig waittill ("trigger"); 
	trig delete(); 
	
	trap moveY (368,0.4); 
	wait 5; 
	trap moveY (-368,0.4); 
}
	
 trap7()
{
	act1 = getEnt ("trap7_acti", "targetname");
	rotate1 = getEnt ("trap7_trap", "targetname");
	
	act1 waittill ("trigger");
	act1 delete();
	
    rotate1 rotateroll (360, 2); //rotateroll rotateyaw rotatepitch
    wait 2; //same speed brush rotates
    rotate1 rotateroll (360, 2); //rotateroll rotateyaw rotatepitch
    wait 2; //same speed brush rotates
    rotate1 rotateroll (360, 2); //rotateroll rotateyaw rotatepitch
    wait 2; //same speed brush rotates
    rotate1 rotateroll (360, 2); //rotateroll rotateyaw rotatepitch
    wait 2; //same speed brush rotates
}

trap8()
{
	act1 = getEnt ("trap8_acti", "targetname");
	rotate1 = getEnt ("trap8_trap", "targetname");
	rotate2 = getEnt ("trap8_trap2" , "targetname");
	rotate3 = getEnt ("trap8_trap3" , "targetname");
	rotate4 = getEnt ("trap8_trap4" , "targetname");
	
	act1 waittill ("trigger");
	act1 delete();
	
	while (1)
    {
        rotate1 rotateyaw (180, 1);
        wait 0.1;
        rotate2 rotateyaw (-180, 1);
        wait 0.1;
        rotate3 rotateyaw (-180, 1);
        wait 0.1;
        rotate4 rotateyaw (180, 1);
    }
}

 trap9()
{
    trap1 = getent("trap9_trap1", "targetname");
    trap2 = getent("trap9_trap2", "targetname");
    trap3 = getent("trap9_trap3", "targetname");
    trap4 = getent("trap9_trap4", "targetname");
    trap5 = getent("trap9_trap5", "targetname");
    trig = getEnt ("trap9_acti", "targetname"); 
    
    trig waittill ("trigger");
    trig delete();
    
    while(1)
    {
        trap1 movez(-128,2);
        trap2 movez(128,2);
        trap3 movez(-128,2);
        trap4 movez(128,2);
        trap5 movez(-128,2);
        trap1 waittill("movedone");
        trap2 movez(-128,2);
        trap3 movez(128,2);
        trap4 movez(-128,2);
        trap5 movez(128,2);
        trap1 movez(128,2);
        trap1 waittill("movedone");
    }
}

trap10()
{
	act1 = getEnt ("trap10_acti", "targetname");
	rotate1 = getEnt ("trap10_trap", "targetname");
	spikes = getEnt ("spikes" , "targetname");
	spikes2 = getEnt ("spikes2" , "targetname");
	
	spikes enablelinkto(); 
    spikes linkto (rotate1); 
	
	spikes2 enablelinkto(); 
    spikes2 linkto (rotate1); 
	
	act1 waittill ("trigger");
	act1 delete();
	
	while (1) //makes it always rotate
    {
        rotate1 rotateyaw (-360, 2); //rotateroll rotateyaw rotatepitch
        wait 2; //same speed brush rotates
    }
}

Sniper()
{
    
    sniper_trig = getEnt( "sniper_trig", "targetname" );
    sniper_origin = getEnt ("snipe_orig", "targetname");
    sniperacti = getEnt ("snipe_acti", "targetname");
    knife_trig = getEnt ("knife_trig", "targetname");
    bounce_trig = getEnt ("bounce_trig", "targetname");
    
    for(;;) {
        sniper_trig waittill ("trigger", player);

        if(!isdefined(level.ogmsokgsgs)) {
            level.ogmsokgsgs = true;
            bounce_trig delete();
            knife_trig delete();
        }
        
        acti = GetActivator();
        
        iprintlnbold (player.name + " chose sniper!");

        player FreezeControls (1);
        acti FreezeControls (1);

        player SetOrigin(sniper_origin.origin);       
        player SetPlayerAngles( sniper_origin.angles );
        acti SetOrigin(sniperacti.origin);
        acti SetPlayerAngles( sniperacti.angles );
        
        player TakeAllWeapons();
        acti TakeAllWeapons();
        player GiveWeapon("remington700_mp");
        acti GiveWeapon("remington700_mp");
        wait 0.05;
        player SwitchToWeapon("remington700_mp");
        acti SwitchToWeapon("remington700_mp");
        
        wait 2;
        player FreezeControls (0);
        acti FreezeControls (0);
        iPrintlnbold ("Go!");
         
        while(isAlive(player))
        {
            wait 1;
        }          
    }
}


Knife()
{   
    knife_trig = getEnt( "knife_trig", "targetname" );
    knife_origin = getEnt ("knife_orig", "targetname");
    sniper_trig = getEnt ("sniper_trig", "targetname");
    bounce_trig = getEnt ("bounce_trig", "targetname");
    knifeacti = getEnt ("knife_acti", "targetname");

    for(;;) {
        knife_trig waittill ("trigger", player);

        if(!isdefined(level.ogmsokgsgs)) {
            level.ogmsokgsgs = true;
            sniper_trig delete();
            bounce_trig delete();
        }
    
        iprintlnbold (player.name + " chose Knife!");

        acti = GetActivator();
    
        player FreezeControls (1);
        acti FreezeControls (1);
        player SetOrigin(knife_origin.origin);       
        acti SetOrigin(knifeacti.origin);       
        player SetPlayerAngles( knife_origin.angles );
        acti SetPlayerAngles( knifeacti.angles );
    
        player TakeAllWeapons();
        acti TakeAllWeapons();
        player GiveWeapon("tomahawk_mp");
        acti GiveWeapon("tomahawk_mp");
        wait 0.01;
        player SwitchToWeapon("tomahawk_mp");
        acti SwitchToWeapon("tomahawk_mp");
    
        wait 2;
        player FreezeControls (0);
        iPrintlnbold ("Go!");
        
        while(isAlive(player))
        {
            wait 1;
        }
    }
}


Bounce()
{       
    bounce_trig = getEnt( "bounce_trig", "targetname" );
    bounce_origin = getEnt ("bounce_orig", "targetname");
    sniper_trig = getEnt ("sniper_trig", "targetname");
    bounceacti = getEnt ("bounce_acti", "targetname");
    knife_trig = getEnt ("knife_trig", "targetname");

    for(;;) {
        bounce_trig waittill ("trigger", player);
        
        if(!isdefined(level.ogmsokgsgs)) {
            level.ogmsokgsgs = true;
            sniper_trig delete();
            knife_trig delete();
        }

        acti = getactivator();
       
        iprintlnbold (player.name + " chose Bounce!");

        player FreezeControls (1);
        acti FreezeControls (1);
        player SetOrigin(bounce_origin.origin);       
        acti SetOrigin(bounceacti.origin);       
        player SetPlayerAngles( bounce_origin.angles );
        acti SetPlayerAngles( bounceacti.angles );
       
        player TakeAllWeapons();
        acti TakeAllWeapons();
        player GiveWeapon("tomahawk_mp");
        acti GiveWeapon("tomahawk_mp");
        wait 0.01;
        player SwitchToWeapon("tomahawk_mp");
        acti SwitchToWeapon("tomahawk_mp");
       
        wait 2;
        player FreezeControls (0);
        acti FreezeControls (0);
        iPrintlnbold ("Go!");

        while(isAlive(player))
        {
            wait 1;
        }
               
    }
}



Clock()
{
	act1 = getEnt ("trigger_clock", "targetname");
	rotate1 = getEnt ("clockarrow", "targetname");
	rotate2 = getEnt ("clocksmall" , "targetname");
	
	act1 waittill ("trigger" , player );
	act1 delete();
	
	while (1) //makes it always rotate
		{
		    wait 0.1;
			rotate1 rotatepitch (-360, 15); 
			wait 0.1;
			rotate2 rotatepitch (-30,15);
			wait 0.1;
			
		}
}

jumpreset1(port_allies,port_axis)
{
    trig = getent("jumpfail", "targetname");
    
    for(;;)
    {
        trig waittill( "trigger", player );
        if(player.pers["team"] == "axis")
        {
            player setPlayerangles( level.bacti1.angles );
            player setOrigin( level.bacti1.origin );
        }
        if(player.pers["team"] == "allies")
        {
            player setplayerangles( level.bjump1.angles, 3 );
            player setorigin( level.bjump1.origin, 3 );
        }
    }
}

GetActivator()
{
    players = getentarray( "player", "classname" );
    for( i = 0 ; i < players.size ; i++)
    {
        player = players[i];
        if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis")
        return player;
    }
    return undefined;
}