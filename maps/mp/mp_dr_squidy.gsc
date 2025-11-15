// __/\\\________/\\\_______________________________________________________________________/\\\\\\\\\__/\\\\\\_________________________________        
//  _\/\\\_______\/\\\____________________________________________________________________/\\\////////__\////\\\_________________________________       
//   _\//\\\______/\\\___/\\\__________________/\\\_______/\\\___________________________/\\\/______________\/\\\_________________________________      
//   __\//\\\____/\\\___\///___/\\\\\\\\\\__/\\\\\\\\\\\_\///______/\\\\\\\\____________/\\\________________\/\\\_____/\\\\\\\\\_____/\\/\\\\\\___     
//    ___\//\\\__/\\\_____/\\\_\/\\\//////__\////\\\////___/\\\___/\\\//////____________\/\\\________________\/\\\____\////////\\\___\/\\\////\\\__    
//     ____\//\\\/\\\_____\/\\\_\/\\\\\\\\\\____\/\\\______\/\\\__/\\\___________________\//\\\_______________\/\\\______/\\\\\\\\\\__\/\\\__\//\\\_   
//      _____\//\\\\\______\/\\\_\////////\\\____\/\\\_/\\__\/\\\_\//\\\___________________\///\\\_____________\/\\\_____/\\\/////\\\__\/\\\___\/\\\_  
//       ______\//\\\_______\/\\\__/\\\\\\\\\\____\//\\\\\___\/\\\__\///\\\\\\\\______________\////\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\/\\\___\/\\\_ 
//        _______\///________\///__\//////////______\/////____\///_____\////////__________________\/////////__\/////////___\////////\//__\///____\///__

main() {
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

    level.roomEntered=false;
	
 
    // Traps
    thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();

    // Rooms
    thread old();
    thread sniper();
    thread knife();
    thread bounce();

    // General
    thread messages();
    thread credits();
    thread startdoor();
    thread secret();
	thread initMusic();
    thread musictrig();
	thread sniperplat();


    // Anti Freerun
    addTriggerToList("trap1_trig");
    addTriggerToList("trap2_trig");
    addTriggerToList("trap3_trig");
    addTriggerToList("trap4_trig");
    addTriggerToList("trap5_trig");
    addTriggerToList("trap6_trig");
    addTriggerToList("trap7_trig");
    addTriggerToList("trap8_trig");
    
	
	
}

initMusic()
{
        level.music = [];
 
        i = 0;
        level.music[i]["artist"] = "Skrillex";
        level.music[i]["title"] = "Promises";
        level.music[i]["alias"] = "radio1";
 
        i++;
        level.music[i]["artist"] = "Unlike Pluto";
        level.music[i]["title"] = "Waiting For You";
        level.music[i]["alias"] = "squidy3";
 
        i++;
        level.music[i]["artist"] = "Lil Wayne (Ft. Flow)";
        level.music[i]["title"] = "Off Day";
        level.music[i]["alias"] = "radio3";
 
        i++;
        level.music[i]["artist"] = "Lil Wayne";
        level.music[i]["title"] = "CoCo (Freestyle)";
        level.music[i]["alias"] = "radio4";
 
        i++;
        level.music[i]["artist"] = "Lil Wayne (Ft. Future, Yo Gotti)";
        level.music[i]["title"] = "Cross Me";
        level.music[i]["alias"] = "radio5";
 
        //precacheShader( "deathrun" );
        precacheShader( "black" );
        precacheShader( "white" );
}
musicMenu()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );
    self endon( "music thread terminated" );
 
    self thread onDeath();
    self thread onDisconnect();
 
    self.hud_music = [];
    // self cleanUp();
    self.selection = 0;
 
    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.35, "left", "top", 2 );    // Background
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "black", 320, 160 );
    
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 180, 1, "left", "top", 1.8 );
    self.hud_music[i].sort = 883;
    self.hud_music[i] setText( "^3-^7 Select Music ^3-^7" );
    
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText( "Artist ^3-^7 Title ^3-^7 Length" );
 
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
    self.hud_music[i].sort = 885;
    self.hud_music[i] setText( "Press ^3[LMB]^7: Next Song    Press ^3[USE]^7: Play Song    Press ^3[Nade]^7: Close Menu" );
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;
    self.hud_music[i] setText( "^4Squidy Radio" ); //fixed by lossy cuz braxi is a nub
 
    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        // Artist - Title [lenght]
        ////////////////////braxi\_mod::addTextHud(self, x, y, transparency, "x allignment", "y allignment", size(can't go below 1.3))
        self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
 
        entry = level.music[j];
        self.hud_music[i] setText( entry["artist"] + " ^3-^7 " + entry["title"] );
    }
 
    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );    // Selection indicator
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );
 
    while( self.sessionstate == "playing" )
    {
        wait 0.1;
 
        if( self attackButtonPressed() )    /* select next song */
        {
            self.hud_music[5+self.selection].alpha = 0.93; //unfocus previous item
 
            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;
 
            item = self.hud_music[5+self.selection];
            item.alpha = 1;
            indicator.y = item.y; // change indicator position
        }
        else if( self useButtonPressed() )    /* play selected song */
        {
            iPrintln( "^7Now playing: ^5" + level.music[self.selection]["artist"]+"^3 " +level.music[self.selection]["title"] );
 
            ambientPlay( level.music[self.selection]["alias"], 3 );
            break;
        }
        else if( self fragButtonPressed() )    /* close menu */
        {
            break; // close menu
        }
    }
 
    self cleanUp();
}
 
musictrig()
{
    trig = getEnt ("musictrig", "targetname");
    trig setHintString("Press [^5USE^7] to choose Music");
 
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        player musicMenu();
    }
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

addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers))
        level.trapTriggers=[];
    level.trapTriggers[level.trapTriggers.size]=getEnt(name,"targetname");
}

startdoor()
{
    squidy=getent("startdoor","targetname");
    level waittill("round_started");
	
    
    wait 5;
    iprintlnbold("^1Welcome to squidy's playhouse!");
    wait 5;
    iprintlnbold("^8Start door Opened!");
    squidy delete();
}

messages()
{
    for(;;)
    {
        wait 10;
        iprintln("^1Map made by ^8squidy");
        wait 10;
        iprintln("^1Thanks for playing ^8"+getdvar("mapname"));
        wait 10;
        iprintln("^1Thanks So Much To Blade and Wingzor!");
		wait 10;
    }
}

credits()
{
    level endon("intermission");

    if(isDefined(level.topcredits))
        level.topcredits destroy();
 
    level.topcredits = newHudElem();
    level.topcredits.foreground = true;
    level.topcredits.alignX = "center";
    level.topcredits.alignY = "top";
    level.topcredits.horzAlign = "center";
    level.topcredits.vertAlign = "top";
    level.topcredits.x = 4;
    level.topcredits.y = 0;
    level.topcredits.sort = 0;
    level.topcredits.fontScale = 1.8;
    level.topcredits.glowColor = (1,0,0);
    level.topcredits.glowAlpha = 1;
    level.topcredits.hidewheninmenu = true;
    level.topcredits setText("Made by squidy");
    wait 5;
    level.topcredits setText("Thanks to Blade and Wingzor");
    wait 5;
    level.topcredits setText("Map made for Vistic Clan");
    wait 5;
    level.topcredits.alpha=0;
    level.topcredits destroy();
}

trap1()
{
    trig=getent("trap1_trig","targetname");
    trap=getent("trap1","targetname");

    trig sethintstring("^1Press [^8&&1^1] to Activate");
    trig waittill("trigger");
    trig delete();

    trap hide();
    trap notsolid();
    wait 5;
    trap show();
    trap solid();
}

trap2()
{
    trig=getent("trap2_trig","targetname");
    trap=getent("trap2","targetname");

    trig sethintstring("^1Press [^8&&1^1] to Activate");
    trig waittill("trigger");
    trig delete();

    while(1)
    {
        trap rotateroll(360,4);
        wait 6;
    }
}

trap3()
{
    trig=getent("trap3_trig","targetname");
    trap=getent("trap3","targetname");

    trig sethintstring("^1Press [^8&&1^1] to Activate");
    trig waittill("trigger");

    trig delete();
    trap delete();
}

trap4()
{
    trig=getent("trap4_trig","targetname");
    trap=getent("trap4","targetname");
	

	
    trig sethintstring("^1Press [^8&&1^1] to Activate");
    trig waittill("trigger");
    trig delete();
    
	
	
	
    while(1)
    {
        trap rotateyaw(360,4);
        wait 4+randomint(4);
		
    }
}
 
trap5()
{
    trig=getent("trap5_trig","targetname");
    trap=getent("trap5","targetname");
	
	
	

    trig sethintstring("^1Press [^8&&1^1] to Activate");
    trig waittill("trigger");
    trig delete();
   
    trap movex(300,1);
    wait 5;
    trap movex(-300,1);
}

trap6()
{
    trig=getent("trap6_trig","targetname");
    trapa=getent("trap6a","targetname");
    trapb=getent("trap6b","targetname");

    trig sethintstring("^1Press [^8&&1^1] to Activate");
    trig waittill("trigger");
    trig delete();

    while(1)
    {
        trapa movey(240,2);
        trapb movey(-240,2);
        wait 2;
        trapa movey(-240,2);
        trapb movey(240,2);
        wait 2;
    }
}

trap7()
{
    trig=getent("trap7_trig","targetname");
    trap=getent("trap7","targetname");

    trap hide();
    trap notsolid();

    trig sethintstring("^1Press [^8&&1^1] to Activate");
    trig waittill("trigger");
    trig delete();

    trap show();
    trap solid();

    while(1)
    {
        trap movez(192,2);
        wait 3;
        trap movez(-192,2);
        wait 3;
    }
}

trap8()
{
    trig=getent("trap8_trig","targetname");
    trapa=getent("trap8a","targetname");
    trapb=getent("trap8b","targetname");

    trig sethintstring("^1Press [^8&&1^1] to Activate");
    trig waittill("trigger");
    trig delete();

    while(1)
    {
        trapa movez(50,2);
        trapb movez(-50,2);
        wait 2;
        trapa movez(-50,2);
        trapb movez(50,2);
        wait 2;
    }
}

old()
{
    level.old=getent("old","targetname");
    olda=getent("old_acti","targetname");
    oldb=getent("old_jump","targetname");
	
	level.old sethintstring("^1Press [^8&&1^1] to enter Old Way");
    level.old waittill("trigger",who);
    iprintlnbold("^8"+who.name+"^1 opened Old Way");

	level.old delete();
    level.knife delete();
    level.sniper delete();
    level.bounce delete();

    olda delete();
    oldb movez(140,2);
}

sniper()
{
    level.sniper=getent("sniper","targetname");
    acti=getent("sniper_acti","targetname");
    jump=getent("sniper_jump","targetname");


 
	level.sniper sethintstring("^1Press [^8&&1^1] to enter Sniper Way");
    while(1)
    {
		level.sniper sethintstring("^1Press [^8&&1^1] to enter Sniper Way");
        level.sniper waittill("trigger",who);
		ambientplay("squidy");
        if(!isdefined(level.sniper))
            return;

        if(!level.roomEntered)
        {
            level.roomEntered=true;
            iprintlnbold("^8"+who.name+"^1 opened Sniper Way");
            level.knife delete();
            level.old delete();
            level.bounce delete();
        }

        who endroomsetup(jump.origin,jump.angles,"m40a3_mp","remington700_mp",1);
        level.activ endroomsetup(acti.origin,acti.angles,"m40a3_mp","remington700_mp",1);
        wait 1;
        who countdown();
        level.activ countdown();

        while(isalive(who)&&isdefined(who))
            wait 1;

        iprintlnbold("^8"+who.name+"^1 has been killed");
    }
}

knife()
{
    level.knife=getent("knife","targetname");
    acti=getent("knife_acti","targetname");
    jump=getent("knife_jump","targetname");

	level.knife sethintstring("^1Press [^8&&1^1] to enter Knife Way");
    while(1)
    {
		level.knife sethintstring("^1Press [^8&&1^1] to enter Knife Way");
        level.knife waittill("trigger",who);
        if(!isdefined(level.knife))
            return;

        if(!level.roomEntered)
        {
			ambientplay("squidy6");
            level.roomEntered=true;
            iprintlnbold("^8"+who.name+"^1 opened Knife Way");
            level.sniper delete();
            level.old delete();
            level.bounce delete();
        }

        who endroomsetup(jump.origin,jump.angles,"knife_mp",undefined,1);
        level.activ endroomsetup(acti.origin,acti.angles,"knife_mp",undefined,1);
        wait 1;
        who countdown();
        level.activ countdown();

        while(isalive(who)&&isdefined(who))
            wait 1;

        iprintlnbold("^8"+who.name+"^1 has been killed");
    }
}

bounce()
{
    level.bounce=getent("bounce","targetname");
    acti=getent("bounce_acti","targetname");
    jump=getent("bounce_jump","targetname");
    gun=getent("bouncegun", "targetname");
	
	level.bounce sethintstring("^1Press [^8&&1^1] to enter Bounce Way");
    while(1)
    {
		level.bounce sethintstring("^1Press [^8&&1^1] to enter Bounce Way");
        level.bounce waittill("trigger",who);
        if(!isdefined(level.bounce))
            return;

        if(!level.roomEntered)
        {
		    ambientplay("squidy5");
			gun braxi\_common::loadWeapon("m40a3_mp","remington700_mp",1);
            level.roomEntered=true;
            iprintlnbold("^8"+who.name+"^1 opened Bounce Way");
            thread bounce_antifail();
            level.sniper delete();
            level.old delete();
            level.knife delete();
        }

        who endroomsetup(jump.origin,jump.angles,"knife_mp",undefined,1);
        level.activ endroomsetup(acti.origin,acti.angles,"knife_mp",undefined,1);
        wait 1;
        who countdown();
        level.activ countdown();

        while(isalive(who)&&isdefined(who))
            wait 1;

        iprintlnbold("^8"+who.name+"^1 has been killed");
    }
}

endroomsetup(origin,angles,weap,weap2,freeze)
{
    self setorigin(origin);
    self setplayerangles(angles);

    self takeallweapons();
    self giveweapon(weap);
    if(isdefined(weap2))
        self giveweapon(weap2);
    self switchtoweapon(weap);

    self freezecontrols(freeze);
}

countdown()
{
    self iprintlnbold("^33");
    wait 1;
    self iprintlnbold("^22");
    wait 1;
    self iprintlnbold("^11");
    wait 1;
    for(i=0;i<5;i++)
    self iprintlnbold("");
    self freezecontrols(0);
}

bounce_antifail()
{
    fail=getent("bounce_fail","targetname");
    acti=getent("bounce_acti","targetname");
    jump=getent("bounce_jump","targetname");
    for(;;)
    {
        fail waittill("trigger",player);
        
        if(player.pers["team"]!="spectator")
        {
            if(player.pers["team"]=="allies")
            {
                player setplayerangles(jump.angles);
                player setorigin(jump.origin);
            }
            if(player.pers["team"]=="axis")
            {
                player setplayerangles(acti.angles);
                player setorigin(acti.origin);
            }
        }
    }
}

secret()
{
    s1trig=getent("secret_1","targetname");
    s2trig=getent("secret_2","targetname");
    s3trig=getent("secret_3","targetname");
    s4trig=getent("secret_4","targetname");
    s5trig=getent("secret_5","targetname");
    sbrush=getent("secret_brush","targetname");

    s1trig waittill("trigger");
    iprintln("^1Secret Step: ^81/4");
    s2trig waittill("trigger");
    iprintln("^1Secret Step: ^82/4");
    s3trig waittill("trigger");
    iprintln("^1Secret Step: ^83/4");
    s4trig waittill("trigger");
    iprintln("^1Secret Step: ^84/4");
    s5trig waittill("trigger");
    iprintln("^1Secret Step: ^8opened");
    sbrush delete();
	

    thread secret_in();
    thread secret_out();
}

secret_in()
{
    trig=getent("secret_in_trig","targetname");
    targ=getent("secret_in","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
        iprintlnbold("^8"+who.name+"^1 entered the Secret");
    }
}

secret_out()
{
    trig=getent("secret_out_trig","targetname");
    targ=getent("secret_out","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
		ambientplay("squidy4");
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
        who braxi\_rank::giverankxp(undefined,150);
        iprintlnbold("^8"+who.name+"^1 finished the Secret");
    }
}

sniperplat()
{
	plat=getent("sniperplat", "targetname");
	plat2=getent("sniperplat2", "targetname");


for(;;)
{
plat moveZ(175, 3);
	plat2 moveZ(175, 3);
	wait 4;
	plat moveZ(-175, 3);
	plat2 moveZ(-175, 3);
	wait 4;
	}
}