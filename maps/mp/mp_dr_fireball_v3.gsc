main()
{
	maps\mp\_load::main();

// FX \\
	precacheFX();
	spawnFX();
	
// Misc \\
	thread onPlayerConnect();
	thread onServer();
	thread credits();
	thread pxg();
	thread jynx();
//	thread move();
	thread spin();
	thread dickrock();
	thread dickstable();
	thread rotaterum();
	thread acti_2();
	thread acti_1();
	
//Doors\\
	thread d1_a();
	thread d1_b();
	
//Music Menu\\
	thread initMusic();
	thread musictrig();
// Traps \\
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9_a();
	thread trap9_b();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();
	thread trap15();
	thread trap16();
	
// Secret \\
	thread secret_tele();
	thread tele1();
	thread tele2();
	thread tele3();
	thread back2map();
	thread rpg();
	thread rpg2();
	
// End Rooms \\
	thread games();
	thread died();
	thread sniper();
	thread knife();
	thread jump();
	thread jump_respawn();
	thread jump_Weapon();
	thread old();
	thread weapon();


	precacheModel( "playermodel_baa_joker" );
	precacheShader ("mtl_plr_baa_joker_head");
	precacheShader ("mtl_plr_baa_joker_hair");
	precacheShader ("mtl_plr_baa_joker_body");
	precacheModel ("playermodel_BotS_50cent");
	precacheModel ("viewhands_BotS_50cent");
	
	precacheItem ("ak74u_mp");
	precacheItem ("rpg_mp");
	//precacheItem ("brick_blaster_mp");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("compassmaxrange","1600");
	
	addTriggerToList ("t1_s");
	addTriggerToList ("t2_s");
	addTriggerToList ("t3_s");
	addTriggerToList ("t4_s");
	addTriggerToList ("t5_s");
	addTriggerToList ("t6_s");
	addTriggerToList ("t7_s");
	addTriggerToList ("t8_s");
	addTriggerToList ("t9_s");
	addTriggerToList ("t10_s");
	addTriggerToList ("t11_s");
	addTriggerToList ("t12_s");
	addTriggerToList ("t13_s");
	addTriggerToList ("t14_s");
	addTriggerToList ("t15_s");
	addTriggerToList ("t16_s");
//	addTriggerToList ("secret_s_2");
}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
// -------------------------- FX -------------------------- \\
precacheFX()
{
	level._effect["fire"] = loadfx("deathrun/drfirebv3");
	level._effect["fireball"] = loadfx("deathrun/fireball");
}	
spawnFX()
{
	playLoopedFx(level._effect["fire"], 4, (-472,-160,80), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (-472,160,80), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (-72,-256,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (-72,256,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	
	playLoopedFx(level._effect["fire"], 4, (56,-256,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (56,256,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (184,384,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (184,832,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	
	playLoopedFx(level._effect["fire"], 4, (2872,-288,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (2872,288,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	
	playLoopedFx(level._effect["fire"], 4, (5942,1456,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (6632,1456,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (5942,976,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (6632,976,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	
	playLoopedFx(level._effect["fire"], 4, (6644,2128,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (6232,2128,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (6232,1568,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
	playLoopedFx(level._effect["fire"], 4, (6644,1568,0), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
}
// -------------------------- MISC -------------------------- \\
spawn_message()
{
	self waittill("spawned_player");

	wait 2;

	for(Idx = 0;Idx < 5;Idx++)
		self IPrintLn(" ");

	self iPrintLn("^7->xFire - ^1pun1sh3r99^7*");
	self iPrintLn("^7->Map Created By - ^1pXg| JynX^7*");
	self iPrintLn("^7->Website - ^1www.pxg.me^7*");
}
onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		player thread spawn_message();
		
	}
}
onServer()
{
	guid2 = "ea4c8b0d4ac809dc05684336b6090cf2"; // JynX
		guidtrig = getent("jynx_guid","targetname");
	while (1)
	{
		guidtrig waittill ("trigger", player );
		tempGuid = player getGUID();
		if((tempGuid == guid2))
		{

			//iprintlnbold ("^1pXg| JynX ^7is on the ^1Server."); 
                       
			player.vip = 1;
       
			player takeAllWeapons();

			player giveweapon("deserteaglegold_mp");
			player giveweapon("m40a3_mp");
			player switchtoweapon("deserteaglegold_mp");      
			player giveMaxAmmo("deserteaglegold_mp");
			player giveMaxAmmo("m40a3_mp");
			player switchtoweapon ("m40a3_mp");



			player.hud = newClientHudElem(player);
			player.hud.sort = 99990;
			player.hud.x = 25;
			player.hud.y = 400;
			player.hud.alignX = "center";
			player.hud.alignY = "middle";
			player.hud.fontScale = 1.5;
			player.hud.font = "objective";
			player.hud.color = (255, 250, 250);
			player.hud.glowColor = (0, 0, 255);
			player.hud.glowAlpha = 1;	
			player.hud.label = &"^4";
			player.hud setplayernamestring(player);
			player.hud.hideWhenInMenu = true;
		}
			else
			{
	
				player iprintlnbold ("^1A^7ccess ^1D^7enied^1.");

				wait 2;

			}	
	}
}
credits()
{
	trig = getEnt ("credits", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger");
		trig delete();
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &"^1Map Fireball ^7by ^1pXg| JynX";
		hud_clock SetPulseFX( 40, 5400, 200 );	
		wait 6;
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &"^1Thank you Vise Fouyt Bad and Strider!";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 6;
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &"^1Visit the website ^7-> ^1www.pxg.me";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 300;
	}
}
pxg()
{
	t = getEnt ("pxg_rotate","targetname");
	spins = 999;
	
	while(1)
	{
		t rotateYaw (360*spins,10*spins);
		t waittill ("rotatedone");
		wait 0.1;
	}
}
jynx()
{
	j = getEnt ("jynx_rotate","targetname");
	spins = 999;
	
	while(1)
	{
		j rotateYaw (360*spins,10*spins);
		j waittill ("rotatedone");
		wait 0.1;
	}
}
spin()
{
	level.move_sign = getEnt ("pxg_move","targetname");
	spins = 999;
	
	while(1)
	{
		level.move_sign rotateYaw (360*spins,3*spins);
		level.move_sign waittill ("movedone");
	}
}
move()
{
	
	while(1)
	{
		level.move_sign moveZ (-25,3);
		level.move_sign waittill ("movedone");
		level.move_sign moveZ (25,3);
		level.move_sign waittill ("movedone");
		wait 0.1;
	}
}
dickrock()
{
	level.dick = getEnt ("move_plat","targetname");
	
	while(1)
	{
		level.dick moveX (-400,3);
		level.dick waittill ("movedone");
		wait 2;
		level.dick moveX (400,3);
		level.dick waittill ("movedone");
		wait 2;
	}
}
dickstable()
{
	level.dick2 = getEnt ("plat_2","targetname");
	
	while(1)
	{
		level.dick2 moveX (-400,3);
		level.dick2 waittill ("movedone");
		wait 2;
		level.dick2 moveX (400,3);
		level.dick2 waittill ("movedone");
		wait 2;
	}
}
rotate1()
{
	rotate_obj = getentarray("rotate1","targetname");	
	if(isdefined(rotate_obj))
		for(i=0;i<rotate_obj.size;i++)
			rotate_obj[i] thread ra_rotate1();
}
ra_rotate1()
{
	if (!isdefined(self.speed))
		self.speed = 10;
	if (!isdefined(self.script_noteworthy))
		self.script_noteworthy = "z";
 
	for(;;)
	{
		while(1)
		{
			// rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
			if (self.script_noteworthy == "z")
				self rotateYaw(360,self.speed);
			else if (self.script_noteworthy == "x")
				self rotateRoll(360,self.speed);
			else if (self.script_noteworthy == "y")
				self rotatePitch(360,self.speed);
			wait (self.speed-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
			// self waittill("rotatedone");
		}
	}
}
rotate2()
{
	rotate_obj = getentarray("rotate2","targetname");	
	if(isdefined(rotate_obj))
		for(i=0;i<rotate_obj.size;i++)
			rotate_obj[i] thread ra_rotate2();
}
ra_rotate2()
{
	if (!isdefined(self.speed))
		self.speed = 10;
	if (!isdefined(self.script_noteworthy))
		self.script_noteworthy = "z";
 
	for(;;)
	{
		while(1)
		{
			// rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
			if (self.script_noteworthy == "z")
				self rotateYaw(360,self.speed);
			else if (self.script_noteworthy == "x")
				self rotateRoll(360,self.speed);
			else if (self.script_noteworthy == "y")
				self rotatePitch(360,self.speed);
			wait (self.speed-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
			// self waittill("rotatedone");
		}
	}
}
rotate3()
{
	rotate_obj = getentarray("rotate3","targetname");	
	if(isdefined(rotate_obj))
		for(i=0;i<rotate_obj.size;i++)
			rotate_obj[i] thread ra_rotate3();
}
ra_rotate3()
{
	if (!isdefined(self.speed))
		self.speed = 10;
	if (!isdefined(self.script_noteworthy))
		self.script_noteworthy = "z";
 
	for(;;)
	{
		while(1)
		{
			// rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
			if (self.script_noteworthy == "z")
				self rotateYaw(360,self.speed);
			else if (self.script_noteworthy == "x")
				self rotateRoll(360,self.speed);
			else if (self.script_noteworthy == "y")
				self rotatePitch(360,self.speed);
			wait (self.speed-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
			// self waittill("rotatedone");
		}
	}
}
rotaterum()
{
	r = getEnt ("rotate_rem","targetname");
	spins = 999;
	
	while(1)
	{
		r rotateYaw (360*spins,4*spins);
		r waittill ("rotatedone");
		wait 0.1;
	}
}
acti_2()
{
	entTransporter = getentarray("nextroom","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter7();
  }
}
transporter7()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		wait(0.10);
	}
}
acti_1()
{
	entTransporter = getentarray("back2room","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter71();
  }
}
transporter71()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		wait(0.10);
	}
}
// -------------------------- DOORS -------------------------- \\
d1_a()
{
	d = getEnt ("d1_a","targetname");
	wait 5;
	d moveY (144,3);
	d waittill ("movedone");
	d delete();
}
d1_b()
{
	d = getEnt ("d1_b","targetname");
	wait 5;
	d moveY (-144,3);
	d waittill ("movedone");
	d delete();
}
// -------------------------- MUSIC -------------------------- \\
initMusic()
{
		level.music = [];
 
        i = 0;
		level.music[i]["artist"] = "Wiz Khalifa Ft Iggy Azalea";
		level.music[i]["title"] = "Go Hard or Go Home";
		level.music[i]["alias"] = "sound1";
		
		i++;
		level.music[i]["artist"] = "Various Artists";
		level.music[i]["title"] = "Ride Out";
		level.music[i]["alias"] = "sound2";
		
		i++;
		level.music[i]["artist"] = "Roscoe Dash ft Soulja Boy";
		level.music[i]["title"] = "All The Way Turnt Up";
		level.music[i]["alias"] = "sound3";
		
		i++;
		level.music[i]["artist"] = "Pitbull";
		level.music[i]["title"] = "Fireball";
		level.music[i]["alias"] = "sound4";
		
		i++;
		level.music[i]["artist"] = "Butch Clancy";
		level.music[i]["title"] = "Russian Lullaby";
		level.music[i]["alias"] = "sound5";
 
 
        //precacheShader( "bladeuni" ); sind meine eigenen :D
        //precacheShader( "rainbow" );

		precacheShader( "black" );
		precacheShader( "white" );
}
musicMenu()
{
	
	self endon( "death" );
 
	self thread onDeath();
	self thread onDisconnect();
 
	self.hud_music = [];
	self.selection = 0;
 
	i = 0;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.35, "left", "top", 2 );
	self.hud_music[i].sort = 880;
	self.hud_music[i] setShader( "black", 320, 160 );
	
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 180, 1, "left", "top", 1.8 );
	self.hud_music[i].sort = 883;
	self.hud_music[i] setText( "^7<<< ^1Music Menu ^7>>>" );
	
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText( "<<< ^1Select a Song ^7>>>" );
 
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
	self.hud_music[i].sort = 885;
	self.hud_music[i] setText( "Press ^1[^7USE^1]^7: Play Song" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText( "^7<<< ^1Precision Gaming ^7>>>" );
 
	for( j = 0; j < level.music.size; j++ )
	{
		i++;
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";
 
		entry = level.music[j];
		self.hud_music[i] setText( entry["artist"] + " ^1-^7 " + entry["title"] );
	}
 
	i++;
	self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
	self.hud_music[i].sort = 881;
	indicator = self.hud_music[self.hud_music.size-1];
	indicator setShader( "white", 306, 17 );
 
	while( self.sessionstate == "playing" )
	{
		wait 0.1;
 
		if( self attackButtonPressed() )
		{
			self.hud_music[5+self.selection].alpha = 0.93;
 
			self.selection++;
			if( self.selection >= level.music.size )
				self.selection = 0;
 
			item = self.hud_music[5+self.selection];
			item.alpha = 1;
			indicator.y = item.y;
		}
		else if( self useButtonPressed() )
		{
			iPrintln( "^1Now playing: ^7" + level.music[self.selection]["artist"]+" - ^1" +level.music[self.selection]["title"] );
 
			ambientPlay( level.music[self.selection]["alias"], 3 );
			self freezeControls(0);
			level notify ( "song_picked" );
			self braxi\_rank::giveRankXp( "", 25 );
			break;
		}
		else if( self meleeButtonPressed() )
		{
			self freezeControls(0);
			break;
		}
	}
 
	self cleanUp();
}
musictrig()
{
	trigger = getEnt ( "music_menu", "targetname" );
	trigger setHintString( "Press ^1[^7USE^1] ^7to choose Music" );
 
	trigger waittill( "trigger", player );
	trigger delete();
	level endon ( "song_picked" );
	player thread musicMenu();
	player freezeControls(1);
}
onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}
onDeath()
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
// -------------------------- TRAPS -------------------------- \\
trap1()
    {
            trig = getEnt ("t1_s", "targetname");
            trap01_a  = getEnt ("t1_a ", "targetname");
            trap01_b = getEnt ("t1_b","targetname");
            trap01_c = getEnt ("t1_c","targetname");
            trap01_d = getEnt ("t1_d","targetname");
           
        trig waittill ("trigger", player);
           
            trig delete();
           
            x = RandomInt( 4 );
             
            if (x==1)
            {
                    trap01_a notSolid();
                    trap01_d notSolid();
            }
                   
            else if (x==2)
            {
                    trap01_b notSolid();
                    trap01_c notSolid();
            }
                   
            else if (x==3)
            {
                    trap01_c notSolid();
                    trap01_a notSolid();
            }
                   
            else
            {
                    trap01_b notSolid();
                    trap01_d notSolid();
            }
    }
trap2()
    {
            trig = getEnt ("t2_s","targetname");
            trap02_a  = getEnt ("t2_a","targetname");
            trap02_b = getEnt ("t2_b","targetname");
           
        trig waittill ("trigger", player);
           
            trig delete();
           
            x = RandomInt( 2 );
             
            if (x==1)
            {
                    trap02_a notSolid();
            }
                   
            else
            {
                    trap02_b notSolid();
            }
    }
trap3()
{
	t = getEnt ("t3","targetname");
	tr = getEnt ("t3_s","targetname");
	tr waittill ("trigger", player);
		tr delete();
	wait 0.1;
	t delete();
}
trap4()
{
	t = getEnt ("t4","targetname");
	tr = getEnt ("t4_s","targetname");
	tr waittill ("trigger", player);
		tr delete();
	wait 0.1;
	spins = 999;
	
	while(1)
	{
		t rotateYaw (360*spins,3*spins);
		t waittill ("rotatedone");
		wait 0.1;
	}
}
trap5()
{
	t = getEnt ("t5","targetname");
	tr = getEnt ("t5_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	wait 0.1;
	spins = 999;
	
	while(1)
	{
		t rotatePitch (360*spins,3*spins);
		t waittill ("rotatedone");
		wait 0.1;
	}
}
trap6()
{
	t = getEnt ("t6_spikes","targetname");
	h = getEnt ("t6_hurt","targetname");
	tr = getEnt ("t6_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	
	h enableLinkto();
	h linkto (t);
	wait 0.1;
	t moveZ (-208,1);
	t waittill ("movedone");
	wait 0.1;
	t moveZ (500,3);
	t waittill ("movedone");
	t delete();
}
trap7()
{
	t = getEnt ("t7_s","targetname");
	t waittill ("trigger", player);
	t delete();
	wait 0.1;
	level.dick notsolid();
	wait 5;
	level.dick solid();
}
trap8()
{
	t = getEnt ("t8","targetname");
	tr = getEnt ("t8_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	wait 0.1;
	t moveZ (-240,2);
	t waittill ("movedone");
	t delete();
}
trap9_a()
{
	t = getEnt ("t9_a","targetname");
	hurt = getEnt ("t9_hurt_1","targetname");
	level.t9 = getEnt ("t9_s","targetname");
	level.t9 waittill ("trigger", player);
	level.t9 delete();
	wait 0.1;
	
	hurt enableLinkTo();
	hurt linkto(t);
	
	while(1)
	{
		t moveZ (-160,2);
		t waittill ("movedone");
		t moveZ (160,2);
		t waittill ("movedone");
		wait 0.1;
	}
}
trap9_b()
{
	t = getEnt ("t9_b","targetname");
	hurt = getEnt ("t9_hurt_2","targetname");
	level.t9 waittill ("trigger", player);
	level.t9 delete();
	wait 0.1;
	
	hurt enableLinkTo();
	hurt linkto(t);
	
	while(1)
	{
		t moveZ (160,2);
		t waittill ("movedone");
		t moveZ (-160,2);
		t waittill ("movedone");
		wait 0.1;
	}
}
trap10()
{
	t = getEnt ("t10","targetname");
	tr = getEnt ("t10_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	wait 0.1;
	t delete();
}
trap11()
{
	t = getEnt ("t11","targetname");
	tr = getEnt ("t11_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	wait 0.1;
	t moveZ (-70,2);
	t waittill ("movedone");
	t delete();
}
trap12()
{
	t = getEnt ("t12_s","targetname");
	t waittill ("trigger", player);
	t delete();
	wait 0.1;
	thread rotate1();
	thread rotate2();
	thread rotate3();
}
trap13()
{
	t = getEnt ("t13","targetname");
	tr = getEnt ("t13_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	wait 0.1;
	t delete();
}
trap14()
{
	t = getEnt ("t14","targetname");
	tr = getEnt ("t14_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	wait 0.1;
	t moveZ (-420,1);
	t waittill ("movedone");
	t moveZ (420,1);
	t waittill ("movedone");
}
trap15()
{
	t = getEnt ("t15","targetname");
	tr = getEnt ("t15_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	wait 0.1;
	
	while(1)
	{
		t moveY (144,2);
		t waittill ("movedone");
		t moveY (-144,2);
		t waittill ("movedone");
		wait 0.1;
	}
}
trap16()
{
	t = getEnt ("t16_hurt","targetname");
	t1 = getEnt ("t16_link","targetname");
	effect = getEnt ("t16_origin","targetname");
	tr = getEnt ("t16_s","targetname");
	tr waittill ("trigger", player);
	tr delete();
	playFx (level._effect["fireball"], effect.origin);
	
	t enablelinkto();
	t linkto (t1);
	
	while(1)
	{
		t1 moveZ (192,1);
		t1 waittill ("movedone");
		wait 5;
		t1 moveZ (-192,1);
		t1 waittill ("movedone");
		wait 1;
	}
}
// -------------------------- SECRET -------------------------- \\
secret_tele()
{
	entTransporter = getentarray("secret","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter();
  }
}
transporter()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		player braxi\_rank::giveRankXP("", 10);
		player iprintln ("^1You have found the secret^7!");
		wait(0.10);
	}
}
tele1()
{
	entTransporter = getentarray("teleport1","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter1();
  }
}
transporter1()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		wait(0.10);
	}
}
tele2()
{
	entTransporter = getentarray("teleport2","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter2();
  }
}
transporter2()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		wait(0.10);
	}
}
tele3()
{
	entTransporter = getentarray("teleport3","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter3();
  }
}
transporter3()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		wait(0.10);
	}
}
back2map()
{
	entTransporter = getentarray("back2map","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter4();
  }
}
transporter4()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		player braxi\_rank::giveRankXP("", 500);
		iprintlnbold ("^1" + player.name + " ^7has finished the secret^1!");
		wait(0.10);
	}
}
rpg()
{
	tse_4 = getent("rpg","targetname");
	while(true)
	{
		tse_4 waittill ("trigger", user);
		user thread give_weap(3);
		wait 5;
	}
}
rpg2()
{
	tse4 = getent("rpg_2","targetname");
	while(true)
	{
		tse4 waittill ("trigger", user);
		user thread give_weap(3);
		wait 5;
	}
}
give_weap(weapon)
{
	self iprintlnbold("^1P^7lease ^1W^7ait^1...");
	weap="";
	wait 0.05;
	switch(weapon)
	{
		case 1:	weap="deserteagle_mp"; break;
		case 2:	weap="deserteaglegold_mp"; break;
		case 3:	weap="rpg_mp"; break;
		case 4:	weap="remington700_mp"; break;
	}
	self switchToWeapon(weap);
	wait 1;
	currentweapon = self GetCurrentWeapon();
	if(currentweapon != weap)
	{
		self giveWeapon(weap);
		self switchToWeapon(weap);
		self giveMaxammo(weap);
		self iprintlnbold("^1W^7eapon ^1S^7elected^1!");
	}
	else
	{
		self giveMaxammo(weap);
		self iprintlnbold("^1A^7mmo ^1R^7efilled^1!");
	}
}
// -------------------------- END ROOMS -------------------------- \\
games()
{
     	level.games_trig = getEnt( "minigames", "targetname");
     	games = getEnt( "minigames_ori", "targetname" );
     
     	while(1)
     	{
         	level.games_trig waittill( "trigger", player );
         	if( !isDefined( level.games_trig ) )
         	return;


         	player SetPlayerAngles( games.angles );
         	player setOrigin( games.origin );
	 	iPrintlnBold( " ^1" + player.name + " ^7 has ^1entered the ^7games section^1!" );
         	player TakeAllWeapons();
			player giveWeapon ("deserteagle_mp");
			player giveMaxAmmo ("desertealge_mp");
			player switchtoweapon("deserteagle_mp");  
	 	player died();
	
	             
         	while( isAlive( player ) && isDefined( player ) )
		if( isDefined( level.activ ) && isAlive( level.activ ) )
             	wait 1;
     	}
}
died()
{
	self endon("disconnect");

	self waittill("death");
	iPrintlnBold("^1"+self.name+"^7 has ^1died^7!");
	iPrintlnBold("^1The Minigames Section is now ^7OPEN^1.");
}
knife()
{
     	level.knife_trig = getEnt( "knife", "targetname");
     	jump = getEnt( "knife_jumper", "targetname" );
     	acti = getEnt( "knife_acti", "targetname" );
     
     	while(1)
     	{
         	level.knife_trig waittill( "trigger", player );
         	if( !isDefined( level.knife_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "knife_mp" );
	 	player givemaxammo( "knife_mp" );      
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "knife_mp" );
	 	level.activ givemaxammo( "knife_mp" );
		iPrintlnBold( " ^1" + player.name + " ^7 has ^1entered ^7KNIFE^1!" );         		
		wait 0.05;
         	player switchToWeapon( "knife_mp" );
         	level.activ SwitchToWeapon( "knife_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^1[ ^73 ^1]" );
		level.activ iPrintlnBold( "^1[ ^73 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^72 ^1]" );
		level.activ iPrintlnBold( "^1[ ^72 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^71 ^1]" );
		level.activ iPrintlnBold( "^1[ ^71 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		level.activ iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);        
     	}
}
sniper()
{
     	level.snip_trig = getEnt( "snipe", "targetname");
     	jump = getEnt( "snipe_jumper", "targetname" );
     	acti = getEnt( "snipe_acti", "targetname" );
     
     	while(1)
     	{
         	level.snip_trig waittill( "trigger", player );
         	if( !isDefined( level.snip_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "remington700_mp" );
	 	player givemaxammo( "remington700_mp" );  
		player GiveWeapon( "deserteagle_mp" );	
		player setWeaponAmmoClip( "deserteagle_mp", 0 );
		player setweaponammostock( "deserteagle_mp", 0 );		
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "remington700_mp" );
	 	level.activ givemaxammo( "remington700_mp" );
		level.activ GiveWeapon( "deserteagle_mp" );	
		level.activ setWeaponAmmoClip( "deserteagle_mp", 0 );
		level.activ setweaponammostock( "deserteagle_mp", 0 );
		iPrintlnBold( " ^1" + player.name + " ^7 has entered the ^1Sniper room^7!" );         		
		wait .5;
         	player switchToWeapon( "remington700_mp" );
         	level.activ SwitchToWeapon( "remington700_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^1[ ^73 ^1]" );
		level.activ iPrintlnBold( "^1[ ^73 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^72 ^1]" );
		level.activ iPrintlnBold( "^1[ ^72 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^71 ^1]" );
		level.activ iPrintlnBold( "^1[ ^71 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		level.activ iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);        
     	}
}
jump()
{
     	level.bounce_trig = getEnt( "bounce", "targetname");
     	level.jumper_respawn = getEnt( "bounce_jumper", "targetname" );
     	level.acti_respawn = getEnt( "bounce_acti", "targetname" );
     
     	while(1)
     	{
         	level.bounce_trig waittill( "trigger", player );
         	if( !isDefined( level.bounce_trig ) )
         	return;

         	player SetPlayerAngles( level.jumper_respawn.angles );
         	player setOrigin( level.jumper_respawn.origin );
         	player TakeAllWeapons();
		player giveweapon( "knife_mp" );     
         	level.activ setPlayerangles( level.acti_respawn.angles );
         	level.activ setOrigin( level.acti_respawn.origin );
         	level.activ TakeAllWeapons();
		level.activ giveweapon( "knife_mp" ); 
		iPrintlnBold( " ^1" + player.name + " ^7 has ^1entered ^7Bounce^1!" );         		
		wait 0.05;
         	player switchToWeapon( "knife_mp" );
         	level.activ SwitchToWeapon( "knife_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^1[ ^73 ^1]" );
		level.activ iPrintlnBold( "^1[ ^73 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^72 ^1]" );
		level.activ iPrintlnBold( "^1[ ^72 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^71 ^1]" );
		level.activ iPrintlnBold( "^1[ ^71 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		level.activ iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);        
     	}
}
jump_respawn()
{
	trigger = getent ( "jump_respawn", "targetname" );
	for(;;)
	{
		trigger waittill ( "trigger", player );
	
		if( player.pers[ "team" ] != "spectator" )
		{
			if( player.pers[ "team" ] == "allies" )
			{
				player SetPlayerAngles ( level.jumper_respawn.angles );
				player SetOrigin ( level.jumper_respawn.origin );
			}
			if( player.pers[ "team" ] == "axis" )
			{
				player SetPlayerAngles ( level.acti_respawn.angles );
				player SetOrigin ( level.acti_respawn.origin );
			}
		}
	}
}
jump_Weapon()
{
	tse4 = getent("weapon_bounce","targetname");
	while(true)
	{
		tse4 waittill ("trigger", user);
		user thread give_weap(4);
		wait 5;
	}
}
old()
{
     	level.old_trig = getEnt( "old", "targetname");
     	jump = getEnt( "old_jumper", "targetname" );
     	acti = getEnt( "old_acti", "targetname" );
     
     	while(1)
     	{
         	level.old_trig waittill( "trigger", player );
         	if( !isDefined( level.bounce_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
		player giveweapon( "knife_mp" );     
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
		level.activ giveweapon( "knife_mp" ); 
		iPrintlnBold( " ^1" + player.name + " ^7 has ^1entered ^7Old^1!" );         		
		wait 0.05;
         	player switchToWeapon( "knife_mp" );
         	level.activ SwitchToWeapon( "knife_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^1[ ^73 ^1]" );
		level.activ iPrintlnBold( "^1[ ^73 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^72 ^1]" );
		level.activ iPrintlnBold( "^1[ ^72 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^71 ^1]" );
		level.activ iPrintlnBold( "^1[ ^71 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		level.activ iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);        
     	}
}
weapon()
{
     	level.weapon_trig = getEnt( "weapon", "targetname");
     	jump = getEnt( "weap_jump", "targetname" );
     	acti = getEnt( "weap_acti", "targetname" );
     
     	while(1)
     	{
         	level.weapon_trig waittill( "trigger", player );
         	if( !isDefined( level.weapon_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "ak74u_mp" );
	 	player givemaxammo( "ak74u_mp" );  
		player GiveWeapon( "deserteagle_mp" );	
		player setWeaponAmmoClip( "deserteagle_mp", 7 );
		player setweaponammostock( "deserteagle_mp", 42 );		
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "ak74u_mp" );
	 	level.activ givemaxammo( "ak74u_mp" );
		level.activ GiveWeapon( "deserteagle_mp" );	
		level.activ setWeaponAmmoClip( "deserteagle_mp", 7 );
		level.activ setweaponammostock( "deserteagle_mp", 42 );
		iPrintlnBold( " ^2" + player.name + "^7 has entered the ^2Weapon room^7!" );         		
		wait .5;
         	player switchToWeapon( "ak74u_mp" );
         	level.activ SwitchToWeapon( "ak74u_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^2[ ^73 ^2]" );
		level.activ iPrintlnBold( "^2[ ^73 ^2]" );
		wait 1;
		player iPrintlnBold( "^2[ ^72 ^2]" );
		level.activ iPrintlnBold( "^2[ ^72 ^2]" );
		wait 1;
		player iPrintlnBold( "^2[ ^71 ^2]" );
		level.activ iPrintlnBold( "^2[ ^71 ^2]" );
		wait 1;
		player iPrintlnBold( "^2[ ^7Good Luck! ^2]" );
		level.activ iPrintlnBold( "^2[ ^7Good Luck! ^2]" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);        
     	}
}