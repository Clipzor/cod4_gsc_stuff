
main()
{
    maps\mp\_load::main();
	


    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    
    setDvar("r_gamma","1");
    setDvar("r_specularcolorscale", "1");
    setDvar("r_glowbloomintensity0","1");
    setDvar("compassmaxrange","1800");
    setDvar("bg_fallDamageMaxHeight", "99999");
    setDvar("bg_fallDamageMinHeight", "99998");
	
	thread text();
	thread raky1();
	thread sounds();
	
	
	//thread speedrun\_way_name::create_normal_way("Nonce");
 
	precacheModel("plr_terry_shrek");
}





text()  
{
	level waittill("round_started");
	while(1)
	{
	iPrintLn("^0rAKy Smells Little Kids Feet");
	wait 25;
	iPrintLn("^0rAKy Been Grooming Kids Since 2012");
	wait 25;
	iPrintLn("^1Map By : Slowz");
	wait 25;                                            
	iPrintLn("^2Thanks To Pipe Bomb and Cam");                      
	}                                                  	                                                   
}    

raky1()
{
	trig = getEnt("raky", "targetname");
	trig  setHintString("Rakys such a nonce");
	for(;;)
	{
	trig waittill ("trigger", player);
	iPrintLnBold("Test");
	ambientPlay( "song1" );
	wait 60;
	}
}

sounds()
{
	thread song1();
	thread song2();
	thread song3();
	thread song4();
	thread song5();
	thread effect1();
	thread effect2();
}

song1()
{
	trig = getEnt("song1", "targetname");
	for(;;)
	{
	trig waittill ("trigger", player);
	ambientstop();
	iPrintLnBold("^1Rakys Locks Kids In His Basement");
	iPrintLn("^0Songs Locked");
	ambientPlay("song1");
	wait 120;
	}
}
song2()
{
	trig = getEnt("song2", "targetname");
	for(;;)
	{
	trig waittill ("trigger", player);
	ambientstop();
	iPrintLnBold("^1Rakys Smells Little Kids Feet");
	iPrintLn("^0Songs Locked");
	ambientPlay( "song2" );
	wait 120;
	}
}

song5()
{
	trig = getEnt("song5", "targetname");
	for(;;)
	{
	trig waittill ("trigger", player);
	ambientstop();
	iPrintLnBold("^1This is for you raky");
	iPrintLn("^0Songs Locked");
	ambientPlay( "song5" );
	wait 120;
	}
}
effect1()
{
	trig = getEnt("effect1", "targetname");
	for(;;)
	{
	trig waittill ("trigger", player);
	ambientstop();
	iPrintLn("^0Effects Locked");
	ambientPlay( "effect1" );
	wait 60;
	}
}
effect2()
{
	trig = getEnt("effect2", "targetname");
	for(;;)
	{
	trig waittill ("trigger", player);
	ambientstop();
	iPrintLn("^0Effects Locked");
	ambientPlay( "effect2" );
	wait 100;
	}
}

song3()
{
	trig = getEnt("song3", "targetname");
	for(;;)
	{
	trig waittill ("trigger", player);
	ambientstop();
	iPrintLnBold("^1Rakys Touches Kids");
	iPrintLn("^0Songs Locked");
	ambientPlay( "song3" );
	wait 60;
	}
}

song4()
{
	trig = getEnt("song4", "targetname");
	for(;;)
	{
	trig waittill ("trigger", player);
	ambientstop();
	iPrintLnBold("^1Rakys Been Grooming Kids Since 2012");
	iPrintLn("^0Songs Locked");
	ambientPlay( "song4" );
	wait 60;
	}
}
