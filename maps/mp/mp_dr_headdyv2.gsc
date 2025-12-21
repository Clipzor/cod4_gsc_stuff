 main()
{
 maps\mp\_load::main();
 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	
	thread startdoor();
	thread trap1();
	thread mover1();
	thread old();
	thread sniper();
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
	thread credits();
	thread teleport1();
	thread teleport2();
	thread teleport3();
	thread teleport4();
	thread teleport5();
	thread musicbox();
	
	level.firstenter=true;

	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	
	level.music=[];
    level.music[0]["song"]    ="Arizona Zervas - 24";
    level.music[0]["alias"]    ="song1";
    level.music[1]["song"]    ="DVBBS & Sondr - Swim";
    level.music[1]["alias"]    ="song2";
    level.music[2]["song"]    ="Quinn XCII - Am I High Rn";
    level.music[2]["alias"]    ="song3";
    level.music[3]["song"]    ="Glass Animals - Heat Waves";
    level.music[3]["alias"]    ="song4";
    level.music[4]["song"]    ="Trevor Daniel - Past Life";
    level.music[4]["alias"]    ="song5";
    level.music[5]["song"]    ="Lauv - Modern Loneliness";
    level.music[5]["alias"]    ="song6"; //if you need more songs copypaste 2 lines and increase the number in the [] by 1
 
}

credits()
{
wait 20;
iprintln("^1Map edited by pintired");
iprintln("^4Special thanks to Elpredatore");
wait 1;

}

startdoor()
{

lootje = getent("startdoor","targetname");
if(getdvarint("dr_auto_open_door")) {
		lootje delete();
}
else
{
wait 10;
lootje moveZ(-400, 5);
wait 2;
}
}

trap1()
{
	platform = getent("trap1", "targetname");
	trig = getent("trig_trap1", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



mover1() 
{ 
	mover = getent( "mover1", "targetname" ); 
	while(true) 
	{ 
	mover moveX(450, 3); //Moves the mover 20 grid cells in X direction within 2 seconds
	wait 3; //wait 3 seconds
	mover moveX(-450, 3); //Moves the mover back 20 grid cells in -X direction within 2 seconds
	wait 3; //wait 3 seconds
	}
}



old()
{
		level.old_trigger = getent ( "oldroom", "targetname" );
		door = getent ( "actidoor", "targetname" );
		level.old_trigger waittill ( "trigger", player );
		
		{
		
		level.old_trigger delete();
		level.sniper_trigger delete();
		
		iprintln( "Door is open now!" );
		door moveZ (-176, 2);
		wait 1;
		}
}



sniper()
{
level.sniper_trigger = getEnt("trig_sniper","targetname");
level.old_trigger = getEnt("oldroom","targetname");
level.teleactorigin = getEnt("sniper_activator", "targetname");
telejumporigin = getEnt("sniper_jumper", "targetname");
  
while(1)
{
level.sniper_trigger waittill( "trigger", player );

if( !isDefined( level.sniper_trigger ) )
return;
if(level.firstenter==true)
{
level.old_trigger delete();
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
wait .05;
player SwitchToWeapon("m40a3_mp");  
wait(0.05);
level.activ SetOrigin (level.teleactorigin.origin);
level.activ setplayerangles (level.teleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "m40a3_mp" );
level.activ GiveWeapon( "remington700_mp" );
level.activ GiveMaxAmmo("m40a3_mp");
level.activ GiveMaxAmmo( "remington700_mp" );
wait .05;
level.activ SwitchToWeapon("m40a3_mp");
iprintln( "^2KILLLLLL" );  
wait(0.05);
player switchToWeapon( "m40a3_mp" );
level.activ SwitchToWeapon( "m40a3_mp" );
  
  
player waittill( "death" );
level.PlayerInRoom = false;

}
}



addTriggerToList( name, positionOfIconAboveTrap )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

    if( !isDefined( level.icon_origins ) )
        level.icon_origins = [];
    level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
}



trap2()
{
	platform = getent("trap2", "targetname");
	trig = getent("trig_trap2", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap3()
{
	platform = getent("trap3", "targetname");
	trig = getent("trig_trap3", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap4()
{
	platform = getent("trap4", "targetname");
	trig = getent("trig_trap4", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap5()
{
	platform = getent("trap5", "targetname");
	trig = getent("trig_trap4", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap6()
{
	platform = getent("trap6", "targetname");
	trig = getent("trig_trap4", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap7()
{
	platform = getent("trap7", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap8()
{
	platform = getent("trap8", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap9()
{
	platform = getent("trap9", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap10()
{
	platform = getent("trap10", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap11()
{
	platform = getent("trap11", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}



trap12()
{
	platform = getent("trap12", "targetname");
	trig = getent("trig_trap5", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	platform delete();
	
	trig delete();
}

trap13()
{
	circle = getent("trap13", "targetname");
	trig = getent("trig_trap6", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	{
	wait 0.01;
	circle rotatepitch(1440, 4);
	wait 0.01;
	}
	
	trig delete();
	
}



trap14()
{
	circle = getent("trap14", "targetname");
	trig = getent("trig_trap7", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	{
	wait 0.01;
	circle rotateYaw(1440, 4);
	wait 0.01;
	}
	
	trig delete();
	
}



trap15()
{
	circle = getent("trap15", "targetname");
	trig = getent("trig_trap8", "targetname");
	trig SetHintString("Press ^1[^2Use^1] ^4To activate!");
	trig waittill ("trigger", player);
	
	{
	wait 0.01;
	circle rotateYaw(1440, 4);
	wait 0.01;
	}
	
	trig delete();
	
}



teleport1()
{
trig = getEnt("trigger_teleport1","targetname");
tele1 = getEnt("origin_teleport1","targetname");

for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele1.origin);


   }
}



teleport2()
{
trig = getEnt("trigger_teleport2","targetname");
tele1 = getEnt("origin_teleport2","targetname");

for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele1.origin);


   }
}



teleport3()
{
trig = getEnt("trigger_teleport3","targetname");
tele1 = getEnt("origin_teleport3","targetname");

for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele1.origin);


   }
}



teleport4()
{
trig = getEnt("trigger_teleport4","targetname");
tele1 = getEnt("origin_teleport4","targetname");

for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele1.origin);


   }
}



teleport5()
{
trig = getEnt("trigger_teleport5","targetname");
tele1 = getEnt("origin_teleport5","targetname");

for(;; )
   {
    trig waittill("trigger", player);
    player setOrigin(tele1.origin);


   }
}



musicbox()
{
    trig = getEnt("musictrigger","targetname");
    trig setHintString("Press ^1&&1^7 to select song");
    trig waittill("trigger",p);
    p braxi\_rank::giveRankXP("", 50); //remove this if you still got braxi issues
    trig delete();
    p freezeControls(1);
    p musicmenu();
}



musicmenu()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );
    self endon( "music thread terminated" );
 
    self.hud_music = [];
    self.selection = 0;
 
    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
    self.hud_music[i].sort = 879;
    self.hud_music[i] setShader( "white", 320, 160 ); //background image
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 ); //should be bar image, i suggest to not change cuz your texture will be stretched
    self.hud_music[i].color=(1,0,0);
    
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("Lava World Music Menu"); //title
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else 
        self.hud_music[i].glowcolor=(1,0,0); //title text color
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 900;
    self.hud_music[i] setText("                                   Scroll: ^1[{+attack}] ^7| Select: ^1[{+activate}] ^7| Close: ^1[{+frag}]"); //just change numbers of colors here if you need different ones
 
    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
        self.hud_music[i].glowalpha=1;
        if(isdefined(level.randomcolor))
            self.hud_music[i].glowcolor=level.randomcolor;
        else 
            self.hud_music[i].glowcolor=(1,0,0);
 
        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }
 
    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 ); //another bar image that will most likely stretch, i suggest to only change colors
    indicator.color=(1,0,0);
 
    while(self.sessionstate == "playing")
    {
        wait 0.1;
 
        if(self attackButtonPressed())
        {
            self.hud_music[4+self.selection].alpha = 0.93;
 
            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;
 
            item = self.hud_music[4+self.selection];
            item.alpha = 1;
            indicator.y = item.y;
        }
        else if(self useButtonPressed())
        {
             iPrintLn("^2>>^1Now playing: ^5"+level.music[self.selection]["song"]+"^2<<"); //text that appears after picking a song
             
            ambientPlay(level.music[self.selection]["alias"]);
            self freezeControls(0);
            break;
        }
        else if(self fragButtonPressed())
        {
            self freezeControls(0);
           break;
        }
    }
    
    if(!isdefined(self))
        return;
    if(isdefined(self.hud_music))
    {
        for(i=0;i<self.hud_music.size;i++)
        {
            if(isdefined(self.hud_music[i]))
                self.hud_music[i] destroy();
        }
    }
    self notify( "music thread terminated" );
}


