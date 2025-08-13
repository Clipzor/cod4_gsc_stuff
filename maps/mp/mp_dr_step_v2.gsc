#include braxi\_common;
#include common_scripts\utility;
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
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
	setdvar("g_speed","190");
//	setdvar("r_fullbright","1");
//	setdvar("bg_fallDamageMaxHeight","100");
    precacheShader("designer2d");
    precacheShader("foglia2d");
	level.firewall = LoadFx("deathrun/cessi");
	level.boom = LoadFx("explosions/default_explosion");
	level.music=[];
    level.music[0]["song"]    ="Never Gonna Hit Those Notes";
    level.music[0]["alias"]    ="song1";
    level.music[1]["song"]    ="AAAAAAAAAAAAAAAAAAAAAAAA";
    level.music[1]["alias"]    ="song2";
    level.music[2]["song"]    ="Eminem - Mom's Spaghetti";
    level.music[2]["alias"]    ="song3";
    level.music[3]["song"]    ="step V2 Anthem";
    level.music[3]["alias"]    ="song4";
	level.music[4]["song"]    ="Thomas The Tank Engine EARRAPE";
    level.music[4]["alias"]    ="song5";

    thread startdoor();
	thread messages();
	thread musicbox();
	thread sixzorr();
	thread bounces();
	thread tp1();
	thread tp2();
	thread sound1();
	thread end();
	thread elevator();
	thread hang();
	thread firewall();
	thread sound2();
    thread onPlayerConnect();
	thread vipcheck();
	thread addTestClients();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread acti1();
	thread acti2();
	thread acti3();
	thread acti2b();
	thread acti3b();
	thread acti4();
}	
	
addTestClients()
{
    setDvar("scr_testclients", "");
    wait 1;
    for(;;)
    {
        if(getdvarInt("scr_testclients") > 0)
            break;
        wait 1;
    }
    testclients = getdvarInt("scr_testclients");
    setDvar( "scr_testclients", 0 );
    for(i=0;i<testclients;i++)
    {
        ent[i] = addtestclient();

        if (!isdefined(ent[i]))
        {
            println("Could not add test client");
            wait 1;
            continue;
        }
        ent[i].pers["isBot"] = true;
        ent[i] thread TestClient("autoassign");
    }
    thread addTestClients();
}
TestClient(team)
{
    self endon( "disconnect" );

    while(!isdefined(self.pers["team"]))
        wait .05;
        
    self notify("menuresponse", game["menu_team"], team);
    wait 0.5;
}	
	
startdoor()
{
door = getEnt("startdoor", "targetname");
wait 15;
door moveZ(744, 8);
iprintlnbold("^6starT openUd :DdddDDDDCXXDDD");
wait 2;

}	

	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

messages()
{
wait 10;
iprintlnBold("^3Map by ^6Sr- ^1sixzoRR");
for(;;)
{
wait 35;
x=randomint(7);
if (x==0)
{
iPrintln("^4Map made by ^6Sr- ^1sixzoRR");
}

if (x==1)
{
iPrintln("Special thanks to TheLixfe for his awesome effects master tips :D");
}

if (x==2)
{
iPrintln("^5April Fool fags :P");
}

if (x==3)
{
iPrintln("^3xM# is the best! -raKy didn't pay me i (swear)");
}

if (x==4)
{
iPrintln("^4Steam: ^0dinac666");
}

if (x==5)
{
iPrintln("^3Feel free to report this map to WWF!");
}

if (x==6)
{
iPrintln("^2Map exclusively made for xM# server, pls do not steal :OOOOO");
}

}
}

musicbox()
{
    trig = getEnt("trig_musicbox","targetname");
    trig setHintString("Press ^1&&1^7 to select song");
    trig waittill("trigger",p);
	//p braxi\_rank::giveRankXP("", 50);
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
    self.hud_music[i] setShader( "designer2d", 320, 160 );
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "foglia2d", 306, 20 );
    self.hud_music[i].color=(1,1,0);
    
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("MLG Music Menu");
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else 
        self.hud_music[i].glowcolor=(0,1,1);
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 900;
    self.hud_music[i] setText("        Scroll: ^1[{+attack}] ^7| Select: ^1[{+activate}] ^7| Close: ^1[{+frag}]");
 
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
            self.hud_music[i].glowcolor=(0,0,1);
 
        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }
 
    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "foglia2d", 306, 17 );
    indicator.color=(0,1,0);
 
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
             iPrintLn("^2>>^1Now playing: ^5"+level.music[self.selection]["song"]+"^2<<");
			 
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

tp1()
{
	trig = getEnt("trig_tp1", "targetname");
	out = getEnt("o_tp1", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
		player SetOrigin(out.origin);
        player SetPlayerAngles(out.angles);
	}
}

tp2()
{
	trig = getEnt("trig_tp2", "targetname");
	out = getEnt("o_tp2", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
		player SetOrigin(out.origin);
        player SetPlayerAngles(out.angles);
	}
}
sixzorr()
{
	s = getEnt("sixzorr", "targetname");
	b1 = getEnt("body1", "targetname");
	b2 = getEnt("body2", "targetname");
	shaggy1 = getEnt("shaggy1", "targetname");
	shaggy2 = getEnt("shaggy2", "targetname");
	flag = getEnt("flag", "targetname");
	while(1)
    	{
        s rotateYaw (360, 4);
		b1 rotateYaw (360, 4);
		b1 rotateYaw (-360, 4);
		shaggy1 rotateYaw (720, 4);
		shaggy2 rotateYaw (-720, 4);
		flag rotateYaw(2160, 4);
		wait 4;
	}
}

sound1()
{
	trig = getEnt("trig_sound1", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
		player playSound("hi");
        wait 5;
	}
}

bounces()
{
	a = getEnt("bounces1", "targetname");
	b = getEnt("bounces2", "targetname");
	while(1)
    	{
        a rotateYaw (360, 4);
		b rotateYaw (-360, 4);
		wait 4;
	}
}

end()
{
     level.knife_trig = getEnt( "trig_end", "targetname");
     kjump = getEnt( "o_endj", "targetname" );
     kacti = getEnt( "o_enda", "targetname" );
	 j1 = getEnt( "o_j1", "targetname" );
     j2 = getEnt( "o_j2", "targetname" );
	 
	if( !isDefined( level.knife_trig ) )
         return;
		 
	 while(1)
	 {
		level.knife_trig waittill( "trigger", player );
		if( getTeamPlayersAlive("allies") == 1 )
		{
						level.activ freezeControls(1);
			player FreezeControls(1);
			
			player SetPlayerAngles( j1.angles );
			player setOrigin( j1.origin );
			level.activ setPlayerangles( j2.angles );
			level.activ setOrigin( j2.origin );
			level.activ TakeAllWeapons();
			player TakeAllWeapons();
			
			level.activ giveweapon( "m40a3_mp");
			player giveweapon( "m40a3_mp");
			player switchToWeapon( "m40a3_mp" );
			level.activ SwitchToWeapon( "m40a3_mp" );
			
			level.activ freezeControls(1);
			player FreezeControls(1);
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("1vs1");
			
					noti = SpawnStruct();
					noti.titleText = ("^11 VS 1");
					noti.notifyText = "^6" + level.activ.name + " ^1VS^6 " + player.name;
					noti.duration = 6;
					noti.glowcolor = (0, 0, 1.0);
					
					players = getEntArray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					
			wait 4.7;
			thread v();
			level.activ FreezeControls(0);
			player FreezeControls(0);
			
			wait 0.1;
                     
			while(isAlive(player))
				wait 1;
		}
		
		else 
		{
		if(!isdefined(level.firstenter))
			level.firstenter=false;
			
		if(level.firstenter==false)
		{
		 level.firstenter=true;
		}
			level.activ freezeControls(1);
			player FreezeControls(1);
			
			player SetPlayerAngles( kjump.angles );
			player setOrigin( kjump.origin );
			level.activ setPlayerangles( kacti.angles );
			level.activ setOrigin( kacti.origin );
			level.activ TakeAllWeapons();
			player TakeAllWeapons();
			
			level.activ giveweapon( "knife_mp");
			player giveweapon( "knife_mp");
			player switchToWeapon( "knife_mp" );
			level.activ SwitchToWeapon( "knife_mp" );
			
			level.activ freezeControls(1);
			player FreezeControls(1);
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("end");
			
					noti = SpawnStruct();
					noti.titleText = (player.name + " ^6is in ^1USSR!");
					noti.notifyText = "^6" + level.activ.name + " ^1VS^6 " + player.name;
					noti.duration = 6;
					noti.glowcolor = (0, 0, 1.0);
					
					players = getEntArray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					
			wait 5.5;
			visionSetNaked( "ussr", 0 );
			level.activ FreezeControls(0);
			player FreezeControls(0);
			
			wait 0.1;
                     
			while(isAlive(player))
				wait 1;
           }
		}
}

elevator()
{
level.firstele = true;
	trig = getEnt("trig_elevator", "targetname");
	m1 = getEnt("welcomemodel1", "targetname");
	m2 = getEnt("welcomemodel2", "targetname");
	m3 = getEnt("welcomemodel3", "targetname");
	m4 = getEnt("welcomemodel4", "targetname");
	m5 = getEnt("welcomemodel5", "targetname");
	m6 = getEnt("welcomemodel6", "targetname");
	b = getEnt("welcomebrush", "targetname");
	e = getEnt("welcomeelevator", "targetname");
	arrivo = getEnt("elevator", "targetname");
  for (;;) 
  {	
	trig waittill("trigger", player);
	if (level.firstele == true)
	{
	player playSound("welcome");
	wait 5;
	m1 rotateYaw(135,1);
	m2 rotateYaw(135,1);
	m3 rotateYaw(135,1);
	m4 rotateYaw(135,1);
	m5 rotateYaw(135,1);
	m6 rotateYaw(135,1);
	b rotateYaw(135,1);
	wait 1;
	m1 moveZ(640,2);
	m2 moveZ(640,2);
	m3 moveZ(640,2);
	m4 moveZ(640,2);
	m5 moveZ(640,2);
	m6 moveZ(640,2);
	b moveZ(640,2);
	e moveZ (640, 2);
	wait 2;
    arrivo moveZ (640, 2);
	wait 2;
	m1 moveX(-1654,2);
	m2 moveX(-1654,2);
	m3 moveX(-1654,2);
	m4 moveX(-1654,2);
	m5 moveX(-1654,2);
	m6 moveX(-1654,2);
	b moveX(-1654,2);
	wait 2;
	arrivo moveZ (-640, 2);
	wait 2;
	wait 2;
	level.firstele = false;
	}
	else 
	{
	wait 1;
	arrivo moveZ (640, 2);
	wait 2;
	wait 2;
	arrivo moveZ (-640, 2);
	wait 2;
	wait 2;
	}
  }
}

hang()
{
	trig = getEnt("trig_hang", "targetname");
	trig setHintString("^1Press F to hang yourself");
	trig waittill("trigger", player);
	trig delete();
	player iPrintLnBold ("^1The hang is too high, can't kill yourself");
	wait 2;
}

firewall()
{
	o_a = getEnt("o_firewall", "targetname");
	o_a2 = getEnt("o_firewall2", "targetname");
	o_a3 = getEnt("o_firewall3", "targetname");
	o_a4 = getEnt("o_firewall4", "targetname");
	o_a5 = getEnt("o_firewall5", "targetname");
	o_a6 = getEnt("o_firewall6", "targetname");
	o_a7 = getEnt("o_firewall7", "targetname");
	o_a8 = getEnt("o_firewall8", "targetname");
	
	for(;;)
	{
	PlayFX(level.firewall, o_a.origin);
	PlayFX(level.firewall, o_a2.origin);
	PlayFX(level.firewall, o_a3.origin);
	PlayFX(level.firewall, o_a4.origin);
	PlayFX(level.firewall, o_a5.origin);
	PlayFX(level.firewall, o_a6.origin);
	PlayFX(level.firewall, o_a7.origin);
	PlayFX(level.firewall, o_a8.origin);
	wait .1;
	}	
}

sound2()
{
	trig = getEnt("trig_akbar", "targetname");
	o = getEnt("o_akbar", "targetname");
        trig waittill("trigger", player);          
		o playSound("akbar");
        wait 1.5;
		o playSound("boom");
		PlayFX(level.boom, o.origin);
}

onPlayerConnect()
{
	level endon("game_ended");

	for(;;)
	{
		level waittill("connecting", player);

		player thread hud_website();
	}
}

hud_website()
{
v = "Map";
x = "by";
w = "Sr- sixzoRR";

	self.hud_web = newClientHudElem(self);
	self.hud_web.alignX = "center";
	self.hud_web.alignY = "top";
	self.hud_web.horzAlign = "center";
	self.hud_web.vertAlign = "top";
	self.hud_web.fontScale = 2;
	self.hud_web.sort = 10;
	self.hud_web.alpha = 1;
   	self.hud_web.color = ( 0, .1, .1);
   	self.hud_web.font = "objective";
   	self.hud_web.glowColor = (.1, .0, 1);
   	self.hud_web.glowAlpha = 1;
   	self.hud_web.hideWhenInMenu = true;	
	while(1)
	{
	self.hud_web setText("^5" + v + "^4 " + x + "^3 " + w + " ");
	wait ( 0.1 );
	self.hud_web setText("^4" + v + "^3 " + x + "^2 " + w + " ");
	wait ( 0.1 );
	self.hud_web setText("^3" + v + "^2 " + x + "^1 " + w + " ");
	wait ( 0.1 );
	self.hud_web setText("^2" + v + "^1 " + x + "^9 " + w + " ");
	wait ( 0.1 );
	self.hud_web setText("^1" + v + "^9 " + x + "^8 " + w + " ");
	wait ( 0.1 );
	self.hud_web setText("^9" + v + "^8 " + x + "^7 " + w + " ");
	wait ( 0.1	);
	self.hud_web setText("^8" + v + "^7 " + x + "^6 " + w + " ");
	wait ( 0.1 );
	self.hud_web setText("^7" + v + "^6 " + x + "^5 " + w + " ");
	wait ( 0.1 );
	self.hud_web setText("^6" + v + "^5 " + x + "^4 " + w + " ");
	wait ( 0.1 );
	}
}

vipcheck()
{
	trigger = getEnt ("vipcheck", "targetname");
	trigger setHintString ("^1Only 6 ^2MLG ^6ppl!");
for(;;)
{

	trigger waittill ("trigger", player);
gametag = player.name;
thread removeColorFromString(gametag);
	if ( gametag == "Sr- sixzoRR" || gametag == "sixzoRR" || gametag == "Fish Da Rekter" || gametag == "TheLixfe" || gametag == "TexM#RaKn" || gametag == "TeXM|BaKy" || gametag == "Pizza Delivery Guy #1" || gametag == "Ingloriousplayer" || gametag == "zSports Rotola" || gametag == "Cultist Leader" || gametag == "Pro Master" || gametag == "salman ali")  	                          
		{
	player iPrintLnBold("^5Wrong choice rip everyone now");
    wait 3;
	iPrintLnBold(player.name + " ^5just ^2killed ^1everyone ^5-because- ^7 he is ^6gay AHAHAHAHAH^0AH^2AHHA^3HA");	
    player braxi\_rank::giveRankXp( "", 10000);	
	players = getAllPlayers();
	for( i = 0; i < players.size; i++ )
	{
	players[i] suicide();
	}
       return;
	   }
	  
		else
		{
			player iPrintLnBold("^6KYS RETA^1R^2T^3D");
		}
	}
}	

v()
{
	 v1 = getEnt( "v1", "targetname");
	 v2 = getEnt( "v2", "targetname");
	 v3 = getEnt( "v3", "targetname");
	 v4 = getEnt( "v4", "targetname");
	 v5 = getEnt( "v5", "targetname");
	 v6 = getEnt( "v6", "targetname");
	 v7 = getEnt( "v7", "targetname");
	 v8 = getEnt( "v8", "targetname");
	 v1 hide();
	 v2 hide();
	 v3 hide();
	 v4 hide();
	 v5 show();
	 v6 hide();
	 v7 hide();
	 v8 hide(); 
	 for(;;)
	 {
	 visionSetNaked( "ussr", 0 );
	 v1 show();
	 v2 hide();
	 v3 hide();
	 v4 hide();
	 v5 hide();
	 v6 hide();
	 v7 hide();
	 v8 hide();
	 wait 0.1;
	 v1 hide();
	 v2 show();
	 v3 hide();
	 v4 hide();
	 v5 hide();
	 v6 hide();
	 v7 hide();
	 v8 hide();
	 wait 0.1;
	 visionSetNaked( "mp_dr_jungletemple", 0 );
	 v1 hide();
	 v2 hide();
	 v3 show();
	 v4 hide();
	 v5 hide();
	 v6 hide();
	 v7 hide();
	 v8 hide();
	 wait 0.1;
	 v1 hide();
	 v2 hide();
	 v3 hide();
	 v4 show();
	 v5 hide();
	 v6 hide();
	 v7 hide();
	 v8 hide();
	 wait 0.1;
	 visionSetNaked( "mp_dr_lava_world_night", 0 );
     v1 hide();
	 v2 hide();
	 v3 hide();
	 v4 hide();
	 v5 show();
	 v6 hide();
	 v7 hide();
	 v8 hide();
	 wait 0.1;
	 v1 hide();
	 v2 hide();
	 v3 hide();
	 v4 hide();
	 v5 hide();
	 v6 show();
	 v7 hide();
	 v8 hide();
	 wait 0.1;
	 visionSetNaked( "mp_dr_straight", 0 );
	 v1 hide();
	 v2 hide();
	 v3 hide();
	 v4 hide();
	 v5 hide();
	 v6 hide();
	 v7 show();
	 v8 hide();
	 wait 0.1;
	 v1 hide();
	 v2 hide();
	 v3 hide();
	 v4 hide();
	 v5 hide();
	 v6 hide();
	 v7 hide();
	 v8 show();
	 wait 0.1;
	 }
}

trap1()
{
trap1a = getent("trap1a", "targetname");
trap1b = getent("trap1b", "targetname");
trap1c = getent("trap1c", "targetname");
trap1d = getent("trap1d", "targetname");
toileta = getent("toilet1", "targetname");
toiletb = getent("toilet2", "targetname");
toiletc = getent("toilet3", "targetname");
trig = getent("trap1_trig", "targetname");
toilet1t = getent("toilet1t", "targetname");
toilet2t = getent("toilet2t", "targetname");
toilet3t = getent("toilet3t", "targetname");
trig sethintstring ("^3Pr^2EsS ^4&&1 ^1tO ^5ACt^6iVet");
trig waittill("trigger", player);

{

toilet1t enablelinkto();
toilet1t linkto(toileta);
toilet2t enablelinkto();
toilet2t linkto(toiletb);
toilet3t enablelinkto();
toilet3t linkto(toiletc);


trap1a moveZ (96, 0.1);
trap1b moveZ (96, 0.1);
trap1c moveZ (96, 0.1);
trap1d moveZ (96, 0.1);
toileta moveZ (120, 0.1);
toiletb moveZ (120, 0.1);
toiletc moveZ (120, 0.1);

wait 1;

toileta moveX(1296, 2);
wait 0.5;
toiletb moveX(1296, 2);
wait 0.5;
toiletc moveX(1296, 2);


}

}

trap2()
{
gianttoilet = getent("boomtoilet", "targetname");
gianttrigger = getent("boomtrigger", "targetname");
trig = getent("trap2_trig", "targetname");
trig sethintstring ("^3Pr^2EsS ^4&&1 ^1tO ^5ACt^6iVet");
trig waittill ("trigger", player);

gianttrigger enablelinkto();
gianttrigger linkto(gianttoilet);

x=randomint(3);
if (x==0)
{
gianttoilet moveZ (-4352,1);
playFX(level.boom, gianttoilet.origin);
iprintlnbold("j");
trig delete();
}

if (x==1)
{
gianttoilet moveX (464,0.1);
gianttoilet moveZ (-4352,1);
playFX(level.boom, gianttoilet.origin);
iprintlnbold("j");
trig delete();
}

if (x==2)
{
gianttoilet moveX (-464,0.1);
gianttoilet moveZ (-4352,1);
playFX(level.boom, gianttoilet.origin);
iprintlnbold("j");
trig delete();
}

}

trap3()
{
zakhaev = getent("zakhaev", "targetname");
zakhaevrip = getent("zakhaevrip", "targetname");
trig = getent("trap3_trig", "targetname");
trig sethintstring ("^3Pr^2EsS ^4&&1 ^1tO ^5ACt^6iVet");
trig waittill ("trigger", player);

player thread zakhaevripetti();

zakhaevrip enablelinkto();
zakhaevrip linkto(zakhaev);

x=randomint(3);
if (x==0)
{
zakhaev moveZ (848,1);
wait 5;
PlayFX( level.boom_fx, zakhaev.origin );
RadiusDamage(zakhaev.origin, 500, 500, 99, player);
wait 5;
zakhaevrip delete();
trig delete();

}

if (x==1)
{
zakhaev moveX (256,0.1);
zakhaev moveZ (848,1);
wait 5;
PlayFX( level.boom_fx, zakhaev.origin );
RadiusDamage(zakhaev.origin, 500, 500, 99, player);
wait 5;
zakhaevrip delete();
trig delete();
}

if (x==2)
{
zakhaev moveX(-256,0.1);
zakhaev moveZ (848,1);
wait 5;
PlayFX( level.boom_fx, zakhaev.origin );
RadiusDamage(zakhaev.origin, 500, 500, 99, player);
wait 5;
zakhaevrip delete();
trig delete();
}

}

zakhaevripetti()
{
trig = getent("zakhaevrip", "targetname");
trig waittill ("trigger", player);

while(1)
player freezeControls(true); 
}

trap4()
{
kaboom = getent("kaboom", "targetname");
trig = getent("trap4_trig", "targetname");
trig sethintstring ("^3Pr^2EsS ^4&&1 ^1tO ^5ACt^6iVet");
trig waittill ("trigger", player);

x=randomint(3);
if (x==0)
{
PlayFX( level.boom, kaboom.origin );
RadiusDamage(kaboom.origin, 500, 500, 99);
wait 3;
PlayFX( level.boom, kaboom.origin );
RadiusDamage(kaboom.origin, 500, 500, 99);
trig delete();
}

if (x==1)
{
PlayFX( level.boom, kaboom.origin );
RadiusDamage(kaboom.origin, 3500, 500, 99);
wait 3;
PlayFX( level.boom, kaboom.origin );
RadiusDamage(kaboom.origin, 3500, 500, 99);
trig delete();
}

if (x==2)
{
PlayFX( level.boom, kaboom.origin );
RadiusDamage(kaboom.origin, 20000, 500, 99);
iprintlnbold ("RIPETTI");
wait 3;
PlayFX( level.boom, kaboom.origin );
RadiusDamage(kaboom.origin, 20000, 500, 99);
trig delete();
}

}

acti2()
{
trig = getent("acti2trig", "targetname");
orig2 = getent("acti2org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (orig2.origin);
	}
}

acti2b()
{
trig = getent("acti2btrig", "targetname");
orig2b = getent("acti2borg","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (orig2b.origin);
	}
}

acti1()
{
trig = getent("acti1trig", "targetname");
orig1 = getent("acti1org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (orig1.origin);
	}
}

acti3()
{
trig = getent("acti3trig", "targetname");
orig3 = getent("acti3org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (orig3.origin);
	}
}


acti3b()
{
trig = getent("acti3btrig", "targetname");
orig3b = getent("acti3borg","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (orig3b.origin);
	}
}


acti4()
{
trig = getent("acti4trig", "targetname");
orig4 = getent("acti4org","targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (orig4.origin);
	}
}