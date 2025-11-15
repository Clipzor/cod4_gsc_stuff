//Map by CM'Death
//Discord:Death#7416
main() {
 maps\mp\_load::main();
 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"]= "desert";
 
	setdvar("g_speed" ,"210");
	setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998);

    precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("knife_mp");
	precacheItem("ak74u_mp");
    precacheItem("ak47_mp");
     
    level.firstenter = true;

    thread messages();
    thread music();
    thread sun();
	thread freexp();
    thread save_load_logic();
    thread something();
    thread somethingnoob();
    thread somethingpro();
	thread endele();
	thread finishdoor();
	thread endtpa();
	thread endtpb();
	thread actitpa();
	thread actitpb();
	thread cuta();
	thread cutb();
	thread cutc();
	thread cutd();
	thread roomselection();
	thread kniferoom();
	thread sniperroom();
	thread weaponroom();
	thread jumproom();
	thread jump_room_weapon();
	thread jumproomrespawnacti();
	thread jumproomrespawnjumper();
    thread trap1ab();
    thread trap1cd();
    thread trap2abcd();
    thread trap2efgh();
    thread trap3a();
    thread trap3b();
    thread trap4a();
    thread trap4b();
	
}	

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

addTextHud( who, x, y, alpha, alignX, alignY, fontScale )
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	return hud;
}

createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    hud = NewHudElem();
    hud.x = x;
    hud.y = y;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzalign = alignX;
    hud.vertalign = alignY;
    hud.alpha = alpha;
    hud.font = font;
    hud.fontscale = fontScale;
    hud.glowalpha = 1;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
}

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return undefined;
}


removeTextActivator()
{
    if( isDefined( self.hud_textacti) )
    {
        self.hud_textacti destroy();
    }
} 

endTimerRun(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.endTimerHUD setText("^0" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
		//self iPrintLnBold(text);
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}

DoorHUD(messages)
{
    self notify("newFhud");
    self endon("newFhud");

    waitTime = 4; //s
    offset = 200; //ms

    if (isDefined(level.hud_door)) level.hud_door destroy();
	if (isDefined(level.hud_door2)) level.hud_door2 destroy();

    level.hud_door = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_door setText("^0Poolv3");
    level.hud_door setPulseFX( 40, waitTime*1000-offset, offset );
    
	level.hud_door2 = createHUD( 0, 100, "center", "middle", 1, "objective", 1.5 );
    level.hud_door2 setText("^0Map by ^5CM'Death");
    level.hud_door2 setPulseFX( 40, waitTime*1000-offset, offset );
	
    wait waitTime;
    if (isDefined(level.hud_door)) level.hud_door destroy();
	if (isDefined(level.hud_door2)) level.hud_door2 destroy();
}

fightHUD(room, jumper, activ)
{
    self notify("newFhud");
    self endon("newFhud");

    if (!isDefined(room))
        room = "undefined";
    if (!isDefined(jumper))
        jumper = "undefined";
    else
        jumper = jumper.name;
    if (!isDefined(activ))
        activ = "undefined";
    else
        activ = activ.name;

    waitTime = 3; //s
    offset = 200; //ms

    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

    level.hud_fight = createHUD( 0, 85, "center", "top", 1, "objective", 1.5 );
    level.hud_fight setText("^5" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^5" + jumper + " ^3VS^3 " + "^5" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

messages()
{
   wait 1;
   thread DoorHUD("^messages");
   wait 3;
   for(;;)
{  
   wait 8;
 x = randomintrange(0,6);
   if (x==0)
{
   iPrintln("^0Map made by ^5CM'Death");
}

   if (x==1)
{
   iPrintln("^0Visit: ^5teamcmdr^0.^5clanwebsite");
}

   if (x==2)
{
   iPrintln("^5CM'^0Deathrun ^7IP^0: ^5cm^7-^5clan^7.^5com^7:^528960");
}

if (x==3)
{
   iPrintln("^5Feel free to report any bugs.");
}

if (x==4)
{
   iPrintln("^0Discord: ^5Death#7416");
}

if (x==5)
{
   iPrintln("^0Credits to ^5Patrick ^0for the ^5first ^0version");
}

if (x==6)
{
   iPrintLn("^5Map speed: ^5[^0"+getDvar("g_speed")+"^5]");
}

}
}

//RANDOM MUSIC
music()
{
	wait 1;
	songs = randomintrange (0,5);
	switch (songs) 
    {
		case 0:
		{
            thread musicandhud("s1","Nelly- Ride Wit Me");
			break;
		}
		case 1: 
		{
            thread musicandhud("s2","Timbaland - Morning After Dark ft. Nelly Furtado, Soshy");
			break;
		}
		case 2:
		{
            thread musicandhud("s3","6ix9ine & Nicki Minaj - TROLLZ");
			break;
		}
		case 3: 
		{
            thread musicandhud("s4","Girls Have Fun Remix - Tyga, Eminem, Chris Brown, Joyner Lucas, G-Eazy, Rich The Kid ");
			break;
		}
		case 4: 
		{
            thread musicandhud("s5","Plug Walk Remix - Rich The Kid, Eminem, G-Eazy, Gucci Mane, 2Chainz");
			break;
		}
		case 5: 
		{
            thread musicandhud("s6","Eminem - Without Me ");
			break;
		}
	}
}

musicandhud(song,text)
{
	if(!isdefined(song) || !isdefined(text))
		return;

	ambientstop();
	ambientplay(song);

	level.musichud=newhudelem();
	level.musichud.alignx="left";
	level.musichud.aligny="center";
	level.musichud.horzalign="left";
	level.musichud.vertalign="center";
	level.musichud.alpha=1;
	level.musichud.x=-400;
	level.musichud.y=400;
	level.musichud.font = "default";
	level.musichud.fontscale=1.5;	
	level.musichud.glowalpha=1;
	if(isdefined(level.randomcolor))
		level.musichud.glowcolor=level.randomcolor;
	else 
		level.musichud.glowcolor=(0,0,0);
	
	level.musichud settext("^5Music: ^7"+text);
	wait .1;
	level.musichud moveovertime(1);
	level.musichud.x=7;
}



sun()
{
   block = getent("sun","targetname");
    
	for(;;)
   { 
   wait 0.1;
   block rotateYaw (-360,8);
   wait 0.1;
   }
      
} 

freexp()
{ 
trig = getent("trig_freexp", "targetname");
tele = getent("xp_back", "targetname");

trig setHintString ("^7Press ^3[&&1]^7 to gain ^3XP^7!");

while(1)
{ 
trig waittill("trigger", player);

player braxi\_rank::giveRankXP("", 500);
iPrintLn("^5" + player.name + " ^0got some ^5XP^0!");

player setOrigin(tele.origin);
player setPlayerAngles(tele.angles);


trig delete();
}

}

//SECRET ENTRANCE
something()
{
   trig = getent("trig_something", "targetname");
   tele1 = getent ("origin_something", "targetname");

  for(;;) 
    {   
     trig setHintString ("^5Give me the hand by pressing ^3[&&1]");
     trig waittill("trigger", player);
     player thread secret_timer();
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player.sc_pos = 0;
     player.insec = true;
     player iPrintLn("^5" + player.name + " ^0has entered in ^5Secret Room!");
   }
}

//SECRET TIMER
secret_timer()
{
	self endon("secret_done");
	self endon("death");
	self endon("round_ended");
	self thread destroyOnDeath();
	
	if(isdefined(self.secretTimer))
	self.secretTimer destroy();

	self.secretTimer = newclienthudelem(self);
	self.secretTimer.foreground = true;
	self.secretTimer.alignX = "center";
	self.secretTimer.alignY = "bottom";
	self.secretTimer.horzAlign = "center";
	self.secretTimer.vertAlign = "bottom";
	self.secretTimer.x = 0;
	self.secretTimer.y = -7;
	self.secretTimer.sort = 5;
	self.secretTimer.fontScale = 1.4;
	self.secretTimer.font = "default";
	self.secretTimer.glowAlpha = 0;
	self.secretTimer.hidewheninmenu = true;
	self.secretTimer.label = &"^5Time left: ^7&&1";
	if(isdefined(level.randomcolor))
	self.secretTimer.glowColor = level.randomcolor;
	else 
	self.secretTimer.glowColor = (1,0,0);

	time = 120; 
	for(i=0;i<time;i++)
		{
			self.secretTimer setvalue(time-i);
			wait 1;
		}
		self.secretTimer setvalue(0);
		self suicide();

		if(isdefined(self.secretTimer))
		self.secretTimer destroy();
}

destroyOnDeath()
{

	self waittill("death");

	if(isDefined(self.secretTimer))

	self.secretTimer destroy();
}

//SAVE/LOAD POSITION
save_load_logic()
{
    fail_trigger = getent("trig_fail","targetname");
    save_triggers = GetEntArray("save_triggers","targetname");
    
    for(i=0;i<save_triggers.size;i++)
        thread save_pos(save_triggers[i],i);

    while(1)
    {
        fail_trigger waittill("trigger",player);
        player SetOrigin( save_triggers[player.sc_pos].origin+(0,0,50) );
    }
}

save_pos(trig,pos)
{
    while(1)
    {
        trig waittill("trigger",player);
        
        if(!IsDefined(player.sc_pos))
            player.sc_pos = pos;

        else if(IsDefined(player.sc_pos) && player.sc_pos < pos)
        {
            player.sc_pos = pos;
            //IPrintLnBold(pos+" save");
        }

        wait 0.1;
    }
}

//SECRET EXIT
somethingnoob()
{
   trig = getent("trig_ezfinish", "targetname");
   tele1 = getent ("origin_somethingfinishnoob", "targetname");

   for(;;)
    {   
    trig waittill("trigger", player);
    player notify("secret_done");
	player.secretTimer destroy();
	player setOrigin(tele1.origin);
    player setPlayerAngles(tele1.angles);
    player.sc_pos = 0;
    player.insec = false;
    iPrintLnBold ("^5" + player.name + " ^0has finished ^2Easy ^5Secret Room^0!");
    player braxi\_rank::giveRankXP("", 500);
    }
}

somethingpro()
{
   trig = getent("trig_somethingfinishpro", "targetname");
   tele1 = getent ("origin_somethingfinishpro", "targetname");

   for(;;)
    {   
    trig waittill("trigger", player);
    player notify("secret_done");
	player.secretTimer destroy();
    player playlocalSound("n1");
	player setOrigin(tele1.origin);
    player setPlayerAngles(tele1.angles);
    player.sc_pos = 0;
    player.insec = false;
    iPrintLnBold ("^5" + player.name + " ^0has finished ^1Hard ^5Secret Room ^0!");
    player braxi\_rank::giveRankXP("", 500);
    }
}

endele()
{

   movingplatform = getent("endele", "targetname");
   movingplatform_trigger = getent("trig_endele", "targetname");
   
   
   while(1)
   {
   
   movingplatform_trigger waittill ("trigger");

   movingplatform moveZ (1250,5,1,1);
   movingplatform waittill ("movedone");
   movingplatform moveZ (-1250,5,1,1);
   movingplatform waittill ("movedone");
   
   }
}   

finishdoor()
{
   finishdoora = getent("finaldoora", "targetname");
   finishdoorb = getent("finaldoorb", "targetname");
   finishdoor_trigger = getent("trig_finaldoor", "targetname");
   
   while(1)
   {

   finishdoor_trigger waittill ("trigger", player);
   player playlocalSound("container_door");
   finishdoora moveX (-512,3,1,1);
   finishdoorb moveX (512,3,1,1);
   iprintlnBOld ("^5Final doors ^7are opened^5!");   

   finishdoor_trigger delete();   
   }
}

//TELEPORTS
endtpa()
{
   trig = getent("trig_endtpa", "targetname");
   tele1 = getent ("origin_end", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	   player playlocalSound("tp");
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

endtpb()
{
   trig = getent("trig_endtpb", "targetname");
   tele1 = getent ("origin_end", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player playlocalSound("tp");
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

actitpa()
{
   trig = getent("trig_actitp1", "targetname");
   tele1 = getent ("origin_actitp", "targetname");

   for(;;)
    {   
      trig setHintString ("^7Press ^3[&&1]^7 to go outside!");
      trig waittill("trigger", player);
	  player playlocalSound("tp");
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

actitpb()
{
   trig = getent("trig_actitpback", "targetname");
   tele1 = getent ("origin_tpback", "targetname");

   for(;;)
    {   
      trig setHintString ("^7Tired of fresh air? Press ^3[&&1]^7 to go back inside!");
      trig waittill("trigger", player);
	  player playlocalSound("tp");
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

cuta()
{
   trig = getent("trig_cuta", "targetname");
   tele1 = getent ("origin_cuta", "targetname");

   for(;;)
    {   
    trig waittill("trigger", player);
	player playlocalSound("tp");
	player setOrigin(tele1.origin);
    player setPlayerAngles(tele1.angles);
    player braxi\_rank::giveRankXP("", 500);
    }
}

cutb()
{
   trig = getent("trig_cutb", "targetname");
   tele1 = getent ("origin_cutb", "targetname");

   for(;;)
    {   
    trig waittill("trigger", player);
	player playlocalSound("tp");
	player setOrigin(tele1.origin);
    player setPlayerAngles(tele1.angles);
    player braxi\_rank::giveRankXP("", 500);
    }
}

cutc()
{
   trig = getent("trig_cutc", "targetname");
   tele1 = getent ("origin_cutc", "targetname");

   for(;;)
    {   
    trig waittill("trigger", player);
	player playlocalSound("tp");
	player setOrigin(tele1.origin);
    player setPlayerAngles(tele1.angles);
    player braxi\_rank::giveRankXP("", 500);
    }
}

cutd()
{
   trig = getent("trig_cutd", "targetname");
   tele1 = getent ("origin_cutd", "targetname");

   for(;;)
    {   
    trig waittill("trigger", player);
	player playlocalSound("tp");
	player setOrigin(tele1.origin);
    player setPlayerAngles(tele1.angles);
    player braxi\_rank::giveRankXP("", 500);
    }
}

roomselection() 
{
level.room_trig = getEnt( "trig_roomselection", "targetname");
room = getEnt( "origin_roomselection", "targetname" );
level.room_trig setHintString ("^7Press ^3[&&1]^7 to enter ^5Room Selection^7!");

for(;;)
{
level.room_trig waittill( "trigger", player );
if( !isDefined( level.room_trig ) )
return;

iPrintlnBold( " ^5" + player.name + " ^7is picking a ^5room^7!" );
acti = GetActivator();
if(!isdefined(level.firstenter))
{
	acti freezeControls(1);
	acti iPrintLnBold("^1Player is picking room so don't move^0!");
	level notify("acti_antiglitch");
	level.firstenter = false;
}
player SetPlayerAngles( room.angles );
player setOrigin( room.origin );
player TakeAllWeapons();
player antiglitcher();
}
}

antiglitcher() 
{
level.activator1 = GetActivator();
level.activ = GetActivator();  
self common_scripts\utility::waittill_any("death","disconnect");

	if(isDefined(self))
	{
		self notify("matchend");
	}
	else
	{
		level waittill("actiKill");
		//wait 3;
		self notify("matchend");
	}
self freezeControls(0);
level.activ notify("matchend");

	iPrintlnBold("^5"+self.name+" ^0died^7!"); 
	wait 0.2; 
	iPrintlnBold("^5Room selection opened^0!");
}


//ROOMS
kniferoom()
{
   level.trigger_knife = getEnt ("trig_knife", "targetname");

    jumperk = getEnt ("origin_knifejumper", "targetname");
    actik = getEnt ("origin_knifeacti", "targetname");

    while (1)
    {
        level.trigger_knife waittill ("trigger", player);
		iPrintLn ("^5" + player.name + " ^0has entered in ^5Knife Room!");

        player thread removeTextActivator();
		player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimerRun("^5Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ thread removeTextActivator();
            level.activ setOrigin (actik.origin);
            level.activ setPlayerAngles (actik.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            //level.activ thread endTimerKnife("^5Let's Go !", 3, 0);
        }
        thread fightHUD("Knife Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLn ("^5" + player.name + " ^0has died in ^5Knife Room!");
    }
}

sniperroom()
{
    level.trigger_scope = getEnt ("trig_sniper", "targetname");

    jumpersc = getEnt ("origin_sniperjumper", "targetname");
    actisc = getEnt ("origin_sniperacti", "targetname");

    while (1)
    {
        level.trigger_scope waittill ("trigger", player);
		iPrintLn ("^5" + player.name + " ^0has entered in ^5Sniper Room!");

        player thread removeTextActivator();
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);
        player takeAllWeapons();
        player giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimerRun("^5Let's Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ thread removeTextActivator();
            level.activ setOrigin (actisc.origin);
            level.activ setPlayerAngles (actisc.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("remington700_mp");
            level.activ giveMaxAmmo("remington700_mp");
            level.activ giveWeapon("m40a3_mp");
            level.activ giveMaxAmmo("m40a3_mp");
            level.activ switchToWeapon("m40a3_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimerRun("^5Let's Go !", 3, 0);
        }
        thread fightHUD("Sniper Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLn ("^5" + player.name + " ^0has died in ^5Sniper Room!");
    }
}

weaponroom()
{
    level.trigger_scope = getEnt ("trig_weapon", "targetname");

    jumperw = getEnt ("origin_weaponjumper", "targetname");
    actiw = getEnt ("origin_weaponacti", "targetname");

    while (1)
    {
        level.trigger_scope waittill ("trigger", player);
		iPrintLn ("^5" + player.name + " ^0has entered in ^5Weapon Room!");

        player thread removeTextActivator();
        player setOrigin (jumperw.origin);
        player setPlayerAngles (jumperw.angles);
        player takeAllWeapons();
        player giveWeapon("ak74u_mp");
        player giveMaxAmmo("ak74u_mp");
        player giveWeapon("ak47_mp");
        player giveMaxAmmo("ak47_mp");
        player switchToWeapon("ak74u_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimerRun("^5Let's Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ thread removeTextActivator();
            level.activ setOrigin (actiw.origin);
            level.activ setPlayerAngles (actiw.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("ak74u_mp");
            level.activ giveMaxAmmo("ak74u_mp");
            level.activ giveWeapon("ak47_mp");
            level.activ giveMaxAmmo("ak47_mp");
            level.activ switchToWeapon("ak74u_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimerRun("^5Let's Go !", 3, 0);
        }
        thread fightHUD("Sniper Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLn ("^5" + player.name + " ^0has died in ^5Sniper Room!");
    }
}

jumproom()
{
    level.trigger_scope = getEnt ("trig_jump", "targetname");

    jumperb = getEnt ("origin_jumpacti", "targetname");
    actib = getEnt ("origin_jumpjumper", "targetname");

    while (1)
    {
        level.trigger_scope waittill ("trigger", player);
        iPrintLn ("^5" + player.name + " ^0has entered in ^5Bounce Room!");

        player thread removeTextActivator();
        player setOrigin (jumperb.origin);
        player setPlayerAngles (jumperb.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimerRun("^5Let's Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ thread removeTextActivator();
            level.activ setOrigin (actib.origin);
            level.activ setPlayerAngles (actib.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimerRun("^5Let's Go !", 3, 0);
        }
        thread fightHUD("Bounce Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLn ("^5" + player.name + " ^0has died in ^5Sniper Room!");
    }
}

jump_room_weapon()
{
    trig = getEnt ("trig_jumpsniper", "targetname");
    trig setHintString ("^7Press ^3[&&1]^7 to get a ^3Sniper");
    while (1)
    {
        trig waittill ("trigger", player);
        player takeAllWeapons();
        player giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
		player giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        player switchToWeapon("m40a3_mp");
    }
}

//JUMP ROOM LOAD POSITION
jumproomrespawnacti()
{
   trigb = getent("trig_actibtp", "targetname");
   teleb = getent ("origin_jumpfail", "targetname");

   for(;;)
    {   
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

jumproomrespawnjumper()
{
   triga = getent("trig_jumperbtp", "targetname");
   telea = getent ("origin_jumpfailb", "targetname");

   for(;;)
    {   
      triga waittill("trigger", player);
	  player setOrigin(telea.origin);
	  player setPlayerAngles (telea.angles);
    }
}

//TRAPS

trap1ab()
{
   plata = getent("trap1a", "targetname");
   platb = getent("trap1b", "targetname");
   trig = getent("trig_trap1a", "targetname");
   trig setHintString("^1Disapear some of platforms!");
   trig waittill ("trigger");
   trig setHintString("^1Activated.");
   
   for(;;)
    { 

    randomitem = randomint(2);

    if (randomitem == 0)
    {
    plata notsolid();
    plata hide();
    platb solid();
    platb show();
	wait 6;
	plata notsolid();
    plata hide();
    platb solid();
    platb show();
	wait 6;
    }
    if (randomitem == 1)
    {
    plata solid();
    plata show();
    platb notsolid();
    platb hide();
	wait 6;
	plata solid();
    plata show();
    platb notsolid();
    platb hide();
	wait 6;   
       
    }

    }
}


trap1cd()
{
   platc = getent("trap1c", "targetname");
   platd = getent("trap1d", "targetname");
   trig = getent("trig_trap1cd", "targetname");
   trig setHintString("^1Disapear some of platforms!");
   trig waittill ("trigger");
   trig setHintString("^1Activated.");
   
   for(;;)
    { 

    randomitem = randomint(2);

    if (randomitem == 0)
    {
    platc notsolid();
    platc hide();
    platd solid();
    platd show();
	wait 8;
    platc solid();
    platc show();
    platd notsolid();
    platd hide();
	wait 8;
    }
    if (randomitem == 1)
    {
    platc solid();
    platc show();
    platd notsolid();
    platd hide();
	wait 8;
    platc notsolid();
    platc hide();
    platd solid();
    platd show();
	wait 8; 
       
    }

    }
}

trap2abcd()
{

   plat1 = getent("trap2aa", "targetname");
   plat2 = getent("trap2bb", "targetname");
   plat3 = getent("trap2cc", "targetname");
   plat4 = getent("trap2dd", "targetname");
   trig = getent("trig_trap2ab", "targetname");
   trig setHintString("^1Rotate some of platforms!"); 
   trig waittill ("trigger");
   trig setHintString("^1Activated.");
   
   for(;;)
  { 
   plat1 rotateRoll (-360,0.5);
   plat2 rotateRoll (360,0.5);
   plat3 rotateRoll (-360,0.5);
   plat4 rotateRoll (360,0.5);
   wait 1.5;
   plat1 rotateRoll (360,0.5);
   plat2 rotateRoll (-360,0.5);
   plat3 rotateRoll (360,0.5);
   plat4 rotateRoll (-360,0.5);
   wait 1.5;
   }
}   

trap2efgh()
{

   plat1 = getent("trap2ee", "targetname");
   plat2 = getent("trap2ff", "targetname");
   plat3 = getent("trap2gg", "targetname");
   plat4 = getent("trap2hh", "targetname");
   trig = getent("trig_trap2cd", "targetname");
   trig setHintString("^1Rotate some of platforms!"); 
   trig waittill ("trigger");
   trig setHintString("^1Activated.");
   
   for(;;)
  { 
   plat1 rotateRoll (-360,0.5);
   plat2 rotateRoll (360,0.5);
   plat3 rotateRoll (-360,0.5);
   plat4 rotateRoll (360,0.5);
   wait 1.5;
   plat1 rotateRoll (360,0.5);
   plat2 rotateRoll (-360,0.5);
   plat3 rotateRoll (360,0.5);
   plat4 rotateRoll (-360,0.5);
   wait 1.5;
   }
}   

trap3a()
{
    platform = getent("trap3a", "targetname");
    trig = getent("trig_trap3a", "targetname");
    trig setHintString("^1Crush them down!");
	trig waittill("trigger", player);
	trig setHintString("^1Activated.");
    
	for(;;)
	{
	platform moveZ (-256,2);
	wait 5;
	platform moveZ (256,2);
	wait 5;
	}
}

trap3b()
{
    platform = getent("trap3b", "targetname");
    trig = getent("trig_trap3b", "targetname");
    trig setHintString("^1Crush them down!");
	trig waittill("trigger", player);
	trig setHintString("^1Activated.");
    
	for(;;)
	{
	platform moveZ (-256,2);
	wait 5;
	platform moveZ (256,2);
	wait 5;
	}
}

trap4a()
{
   platforma = getent("trap4a", "targetname");
   trig = getent("trig_trap4a", "targetname");
   trig setHintString("^1Drop the Shovel!");
   trig waittill("trigger", player);
   trig setHintString("^1Activated.");
   
    for(;;)
   {
   platforma rotateroll(90,6);
   wait 7;
   platforma rotateroll(-90,6);
   wait 7;

   }
}

trap4b()
{
   platforma = getent("trap4b", "targetname");
   trig = getent("trig_trap4b", "targetname");
   trig setHintString("^1Drop the Shovel!");
   trig waittill("trigger", player);
   trig setHintString("^1Activated.");
   
    for(;;)
   {
   platforma rotateroll(-90,6);
   wait 7;
   platforma rotateroll(90,6);
   wait 7;

   }
}