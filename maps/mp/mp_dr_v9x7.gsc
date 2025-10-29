//Map and Script by Seven
//Nothing that great in here, i found everything online tbh
//Death check the bottom - I knew you would be here :)


main()
{
	maps\mp\_load::main();
 
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
 
	setdvar("bg_falldamageminheight" , "99999");
	setdvar("bg_falldamagemaxheight" , "99999");
	setdvar("r_specular" , "0");
	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");


	thread thanks();
	thread musictrig();
	thread v9x7();
	thread startdoor();
	thread teleport1();
	thread teleport2();
	thread teleport3();
	thread messages();
	thread actitele1();
	thread actitele2();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread knife();
	thread sniper();
	
	addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
	addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap7");
	addTriggerToList("trig_trap8");
	addTriggerToList("trig_trap9");
	
	if(!isdefined(level.music))
	level.music=[];
	level.music[0]["song"]    ="East Socket";
	level.music[0]["alias"]    ="song1";
	level.music[1]["song"]    ="Clyde Sui";
	level.music[1]["alias"]    ="song2";
	level.music[2]["song"]    ="Snowy Jar";
	level.music[2]["alias"]    ="song3";
	level.music[3]["song"]    ="Ron Artest";
	level.music[3]["alias"]    ="song4";
	level.music[4]["song"]    ="Trap House";
	level.music[4]["alias"]    ="song5";
	level.music[5]["song"]    ="Fall Out Boy - Sugar";
	level.music[5]["alias"]    ="song6";

}
addTriggerToList( name ) 
{

   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
thanks() 
{
    while(1) 
	{
        iPrintln("^6Map Made and Scripted by ^5Seven");
        wait 8;
        iPrintln("^6Thanks to anyone who might have helped me fix some things <3");
        wait 8;
        iPrintln( "^6Thanks to ^5TheSolaceOne ^6for endroom trigger textures" );
        wait 8;
    }
}
musicMenu()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "spawned" );
	self endon( "joined_spectators" );
	self endon( "music thread terminated" );

	self thread onmusicDeath();
	self thread onDisconnect();

	self.hud_music = [];
	self.selection = 0;

    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 100, 2, "left", "top", 4.5 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "black", 320, 160 );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 317, 104, 0.70, "center", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("^5Seven's ^6Music");
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
    self.hud_music[i].glowcolor=level.randomcolor;
    else
    self.hud_music[i].glowcolor=(131,0,131);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 257, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;
    self.hud_music[i] setText("^5Scroll: ^6[{+attack}] ^5| Select: ^6[{+activate}] ^5| Exit: ^6[{+frag}]");

    for( j = 0; j < level.music.size; j++ )
    {
    	i++;
    	self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 130+(j*16), 0.93, "left", "top", 1.4 );
    	self.hud_music[i].sort = 882;
    	self.hud_music[i].font = "objective";
    	self.hud_music[i].glowalpha=1;
    	if(isdefined(level.randomcolor))
    	self.hud_music[i].glowcolor=level.randomcolor;
    	else
    	self.hud_music[i].glowcolor=(0,0,1);

    	entry = level.music[j];
    	self.hud_music[i] setText(entry["song"]);
    }

    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 130, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );

    while(self.sessionstate == "playing")
    {
    	wait 0.1;

    	if(self attackButtonPressed())
    	{
    		self.hud_music[3+self.selection].alpha = 0.93;

    		self.selection++;
    		if( self.selection >= level.music.size )
    		self.selection = 0;

    		item = self.hud_music[3+self.selection];
    		item.alpha = 1;
    		indicator.y = item.y;
    	}
    	else if(self useButtonPressed())
    	{
    		iprintln("^7Now playing: ^1"+level.music[self.selection]["song"]);
    		ambientPlay(level.music[self.selection]["alias"]);
    		self freezecontrols(0);
    		break;
    	}
    	else if(self fragButtonPressed())
    	{
    		self freezecontrols(0);
    		break;
    	}
    }

    self cleanUp();
}

musictrig()
{
	trig = getEnt ("musictrigger", "targetname");
	trig setHintString("Press ^1[^5USE^1]^7: ^1Play ^1Song");

	trig waittill("trigger",player);
	player freezecontrols(1);
	trig delete();
	player musicMenu();
}

onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}

onmusicDeath()
{
	self endon( "disconnect" );
	self endon( "music thread terminated" );
	self waittill( "death" );
	self cleanUp();
}

cleanUp()
{
	if( !isDefined( self ) )
	return;



	if( isDefined( self.hud_music ) )
	{
		for( i = 0; i < self.hud_music.size; i++ )
		{
			if( isDefined( self.hud_music[i] ) )
			self.hud_music[i] destroy();
		}
	}
	self notify( "music thread terminated" );
}
v9x7()
{
	level.xxxx = newHudElem(); 
	level.xxxx.x = 375;      
	level.xxxx.y = -220;   
	level.xxxx.horzAlign = "left"; 
	level.xxxx.vertAlign = "middle";
	level.xxxx.alignX = "left";
	level.xxxx.alignY = "middle";
	level.xxxx.sort = 102; 
	level.xxxx.foreground = 1;     
	level.xxxx.archived = true;    
	level.xxxx.alpha = 1;  
	level.xxxx.fontScale = 1.5;
	level.xxxx.hidewheninmenu = false;     
	level.xxxx.color = (255,128,0);
	level.xxxx.glowColor = (131, 0, 131);
	level.xxxx.glowAlpha = 1;
	while(1)
	{
		
		level.xxxx FadeOverTime(0.3);
		level.xxxx.color = (0,255,0);
		level.xxxx.label = &"Long Live V9X7";  

		wait .3;
		level.xxxx FadeOverTime(0.3);
		level.xxxx.color = (1,0,0);
		level.xxxx.label = &"Long Live V9X7";    
		wait .3;
		level.xxxx FadeOverTime(0.3);
		level.xxxx.color = (131,0,131);
		level.xxxx.label = &"Long Live V9X7";    
		wait .3;
		
	}
}
startdoor()
{
	door = getEnt("startdoor","targetname");
	level waittill("round_started");
	wait 7;
	IPrintLnBold("^6Start Door Opened!");
	door Delete();
}

teleport1()
{
	trig = getEnt("trigger_teleport1", "targetname");
	tele1 = getEnt("origin_teleport1", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin(tele1.origin);
		player giveWeapon("intervention_mp");
		player switchToWeapon("intervention_mp");
		player iprintlnBold("^6sick cut innit, have a triton ^5:)");
	}
}
teleport2()
{
	trig = getEnt("trigger_teleport2", "targetname");
	tele1 = getEnt("origin_teleport1", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin(tele1.origin);
	}
}
teleport3()
{
	trig = getEnt("trigger_teleport3", "targetname");
	tele3 = getEnt("origin_teleport3", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin(tele3.origin);
	}
}
messages()
{
	wait 2;
	iprintlnBold("^6WELCOME TO ^5V9X7 ^6BY ^5SEVEN");
	wait 1;
}
actitele1()
{
	trig = getEnt("trigger_actitele1", "targetname");
	actitel1 = getEnt("origin_actitele1", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin(actitel1.origin);
	}
}
actitele2()
{
	trig = getEnt("trigger_actitele2", "targetname");
	actitel2 = getEnt("origin_actitele2", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin(actitel2.origin);
	}
}
trap1()
{
	trig = getEnt("trig_trap1", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
trap2()
{
	trig = getEnt("trig_trap2", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
trap3()
{
	trig = getEnt("trig_trap3", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
trap4()
{
	trig = getEnt("trig_trap4", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
trap5()
{
	trig = getEnt("trig_trap5", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
trap6()
{
	trig = getEnt("trig_trap6", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
trap7()
{
	trig = getEnt("trig_trap7", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
trap8()
{
	trig = getEnt("trig_trap8", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
trap9()
{
	trig = getEnt("trig_trap9", "targetname");
	trig SetHintString("^6Free ^5XP");
	trig waittill("trigger", player);
	
	trig delete();
}
knife()
{
	level.knife_trigger = getEnt("trig_knife", "targetname");
	level.sniper_trigger = getEnt("trig_sniper", "targetname");
	level.teleactorigin = getEnt("knife_activator", "targetname");
	telejumporigin = getEnt("knife_jumper", "targetname");
  
	while(1)
		{
			level.knife_trigger waittill( "trigger", player );

			if( !isDefined( level.knife_trigger ) )
			return;
			if(!isdefined(level.firstenter))
		{
		level.sniper_trigger delete();
		level.firstenter=false;
		} 
		wait(0.05);
  
		player SetOrigin( telejumporigin.origin );
		player setplayerangles( telejumporigin.angles );
		player TakeAllWeapons();
		player GiveWeapon("knife_mp");  
		wait(0.05);
		level.activ SetOrigin (level.teleactorigin.origin);
		level.activ setplayerangles (level.teleactorigin.angles);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );
		wait .05;
		iPrintlnBold( "^5" + player.name + " ^6has entered the Knife room!");   
		wait(0.05);
		player switchToWeapon( "knife_mp" );
		level.activ SwitchToWeapon( "knife_mp" );
		player freezecontrols(1);
		level.activ freezecontrols(1);
		wait 3;
		player freezecontrols(0);
		level.activ freezecontrols(0);
		
  
		player waittill( "death" );
		level.PlayerInRoom = false;

		}
}
	
sniper()
{
	level.sniper_trigger = getEnt("trig_sniper", "targetname");
	level.knife_trigger = getEnt("trig_knife", "targetname");
	level.teleactorigin = getEnt("sniper_activator", "targetname");
	telejumporigin = getEnt("sniper_jumper", "targetname");
  
	while(1)
		{
			level.sniper_trigger waittill( "trigger", player );

			if( !isDefined( level.sniper_trigger ) )
			return;
			if(!isdefined(level.firstenter))
		{
		level.knife_trigger delete();
		level.firstenter=false;
		} 
		wait(0.05);
  
		player SetOrigin( telejumporigin.origin );
		player setplayerangles( telejumporigin.angles );
		player TakeAllWeapons();
		player GiveWeapon("m40a3_mp");
		player GiveWeapon( "remington700_mp" ); 
		player GiveMaxAmmo("m40a3_mp");
		player GiveMaxAmmo( "remington700_mp" );
		wait(0.05);
		level.activ SetOrigin (level.teleactorigin.origin);
		level.activ setplayerangles (level.teleactorigin.angles);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "m40a3_mp" );
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveMaxAmmo("m40a3_mp");
		level.activ GiveMaxAmmo( "remington700_mp" );
		wait .05; 
		iPrintlnBold( " ^5" + player.name + " ^6has entered the Sniper room!" );   
		player switchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		player freezecontrols(1);
		level.activ freezecontrols(1);
		wait 3;
		player freezecontrols(0);
		level.activ freezecontrols(0);
  
		player waittill( "death" );
		level.PlayerInRoom = false;

		}
}





/////////////// Death You Fucking Pussy Why are you reading my scripts you fucking faggot im not a genius there is nothing here for you to see. Since you took the time out of your day to extract my .ff files, how about you spend that time adding the fucking secrets back into the maps and also take out that stupid ass anti fucking ele plugin that shit is gay as fuck just like you.
/////////////// Fuck you 