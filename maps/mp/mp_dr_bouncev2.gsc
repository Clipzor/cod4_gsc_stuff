main()
{
        maps\mp\_load::main();
        setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1200");
        precacheItem("rpg_mp");
        PreCacheItem("deserteaglegold_mp");
        PreCacheItem("winchester1200_mp");
        PreCacheItem("skorpion_mp");
        PreCacheItem("remington700_mp");
	ambientPlay("rock");

        end = spawn("trigger_radius",(1171,1007,236),0,100,200);
        end.radius = 100;
        end.targetname = "endmap_trig";

        thread first_door();

        thread tele_setup();

        thread move();
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
        thread jackpot();
        thread sniper_room();
        thread jump_room();
        thread knife_room();
        thread givexp();

        addTriggerToList( "t1" );
        addTriggerToList( "t2" );
        addTriggerToList( "t3" );
        addTriggerToList( "t4" );
        addTriggerToList( "t5" );
        addTriggerToList( "t6" );
        addTriggerToList( "t7" );
        addTriggerToList( "t8" );
        addTriggerToList( "t9" );
        addTriggerToList( "t10" );
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

jackpot()
{
trig = getEnt ("dafaq" , "targetname");
trig waittill ("trigger", player);
trig delete();

     iPrintlnBold( "^1OoOOooO ^2ASomeone ^3Just found a jackpot!" );   
	 }
	 
trap1()
{
trig = getEnt ("t1", "targetname");
b = getEnt ("b1", "targetname");
trig waittill ("trigger", player);
trig delete();

b moveZ (500,1);
wait 3;
b moveZ (-500,1);
wait 3;
}

trap2()
{
trig = getEnt ("t2", "targetname");
b = getEnt ("b2", "targetname");
trig waittill ("trigger", player);
trig delete();

b moveZ (100,1);
wait 3;
b moveZ (-100,1);
wait 3;
b moveZ (100,1);
wait 3;
b moveZ (-100,1);
wait 3;
}


trap3()
{
trig = getEnt ("t3", "targetname");
b = getEnt ("b3", "targetname");
trig waittill ("trigger", player);
trig delete();
while(1)
{
b moveZ (-300,1);
wait 3;
b moveZ (300,1);
wait 3;
}
}


 trap4()
{
   trig = getEnt ("t4" , "targetname");
   spikes = getEnt ("b4" ,"targetname" );
   hurt = getEnt ("hurtspike" , "targetname");
   hurt2= getEnt ("hurtspike2" , "targetname");
   trig waittill ("trigger", player);  
   trig delete();  
   
   hurt enablelinkto();
   hurt linkto (spikes);
   hurt2 enablelinkto();
   hurt2 linkto (spikes);
   
        spikes moveZ (20,1); 
        wait 5;
         spikes moveZ (-20,1); 
        wait 5;
    
}


trap5()
{
trig = getEnt ("t5", "targetname");
b = getEnt ("b5", "targetname");
trig waittill ("trigger", player);
trig delete();

b moveZ (-900,1);
wait 3;
}

trap6()
{
trig = getEnt ("t6", "targetname");
b = getEnt ("b6a", "targetname");
b2 = getEnt ("b6b", "targetname");
trig waittill ("trigger", player);
trig delete();


b moveZ (-300,1);
b2 moveZ (300,1);
wait 1;
b moveZ (300,1);
b2 moveZ (-300,1);
wait 1;
}


trap7()
{
trig = getEnt ("t7", "targetname");
b = getEnt ("b7", "targetname");
trig waittill ("trigger", player);
trig delete();

b rotateRoll (-360,1);
wait 1;
}


trap8()
{
trig = getEnt ("t8", "targetname");
b = getEnt ("b8a", "targetname");
b2 = getEnt ("b8b", "targetname");
trig waittill ("trigger", player);
trig delete();


b moveY (-190,1);
b2 moveY (190,1);
wait 1;
b moveY (190,1);
b2 moveY (-190,1);
wait 1;
}

trap9()
{
trig = getEnt("t9","targetname");
trap = getEnt("b9","targetname");
trig waittill("trigger");
trig delete();

while(1)
{
trap RotatePitch (360,2);
wait 5;
}
}

 trap10()
{
   trig = getEnt ("t10" , "targetname");
   spikes = getEnt ("b10" ,"targetname" );
   hurt = getEnt ("hurtlast" , "targetname");
   trig waittill ("trigger", player);  
   trig delete();  
   
   hurt enablelinkto();
   hurt linkto (spikes);
   
        spikes moveZ (240,1); 
        wait 10;
         spikes moveZ (-240,1); 
        wait 10;
    
}


tele_setup()
{
        entTransporter = getentarray( "easy", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter();
        entTransporter = getentarray( "starttele", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter();
        entTransporter = getentarray( "wtf", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter();
        entTransporter = getentarray( "lol", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter(true);
        entTransporter = getentarray( "last", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter();
        entTransporter = getentarray( "jump3", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter();
        entTransporter = getentarray( "jump2", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter();
}
 
transporter(hard)
{
        entTarget = getEnt( self.target, "targetname" );
        for(;;)
        {
                self waittill( "trigger", player );
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
                if(isdefined(hard))
                        iPrintlnBold( "^10ooo0 my ^0God " + player.name + " ^3Completed ^1Hard" ); 
        }
}



move()
{
brush = getent ("movea", "targetname");
brush2 = getent ("moveb", "targetname");
while(1)
{
brush moveX (432,3);
brush2 moveX (-432,3);
wait 1;
brush moveX (-432,3);
brush2 moveX (432,3);
wait 1;
}
}

first_door()
{

	trig = getEnt("opendoor","targetname");
	brush = getEnt("openbrush","targetname");
	button = getEnt("button_door","targetname");
	
	trig waittill("trigger", user);
	trig delete();
	
	button moveY(8,2);
	wait 2;
	brush moveZ(-340,2);
	brush waittill("movedone");
	brush delete();
	
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "bottom";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "bottom";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = -150;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1.5;
	hud_clock.glowcolor = (1,1,0);
	hud_clock.label = &"Map by: Freek";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 8;
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "bottom";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "bottom";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = -150;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1.5;
	hud_clock.glowcolor = (0,1,0);
	hud_clock.label = &"Map dedicated to RS and spartans clan";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 6;
}

sniper_room()
{
    level.sniper_trig = getEnt( "sniper_room", "targetname");
        jump = getEnt( "sniper_jump", "targetname" );
        acti = getEnt( "sniper_acti", "targetname");
   
        while(1)
        {
                level.sniper_trig waittill( "trigger", player );
                if( !isDefined( level.sniper_trig ) )
                        return;
                level.jump_trig delete();
                level.knife_trig delete();
                                 
                                     
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
                iPrintlnBold( " ^6LoL" + player.name + " ^4 has chosen ^1snipe room!" );                //change it as you wish
                while( isDefined( player ) && isAlive( player ) )
                        wait 1;
        }
}              

knife_room()
{
    level.knife_trig = getEnt( "knife_room", "targetname");
        jump = getEnt( "knife_jump", "targetname");
        acti = getEnt( "knife_acti", "targetname");
   
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                        return;
                level.sniper_trig delete();
                level.jump_trig delete();
                                 
                                     
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
                iPrintlnBold( " ^6LoL" + player.name + " ^3has chosen ^1knife room" );                //change it as you wish
                while( isDefined( player ) && isAlive( player ) )
                        wait 1;
        }
}

jump_room()
{
    level.jump_trig = getEnt( "jump_room", "targetname");
        jump = getEnt( "jump_jump", "targetname");
        acti = getEnt( "jump_acti", "targetname");
   
        while(1)
        {
                level.jump_trig waittill( "trigger", player );
                if( !isDefined( level.jump_trig ) )
                        return;
                level.sniper_trig delete();
                level.knife_trig delete();
                                 
                                     
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
                iPrintlnBold( " ^6 LoL" + player.name + " ^3has chosen ^1Jump room" );                //change it as you wish
                while( isDefined( player ) && isAlive( player ) )
                        wait 1;
        }
}

givexp()
{
	trig = getent("givexp", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		trig delete();
		if(!isDefined(player.gotCherryXP))
		{
			player braxi\_rank::giveRankXP("", 200);
			 iprintlnbold ( player.name + "^3got^1xp!!!" );
			player.gotCherryXP = true;
		}
	}

	}
	
	