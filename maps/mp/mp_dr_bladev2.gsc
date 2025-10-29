// __/\\\________/\\\_______________________________________________________________________/\\\\\\\\\__/\\\\\\_________________________________        
//  _\/\\\_______\/\\\____________________________________________________________________/\\\////////__\////\\\_________________________________       
//   _\//\\\______/\\\___/\\\__________________/\\\_______/\\\___________________________/\\\/______________\/\\\_________________________________      
//   __\//\\\____/\\\___\///___/\\\\\\\\\\__/\\\\\\\\\\\_\///______/\\\\\\\\____________/\\\________________\/\\\_____/\\\\\\\\\_____/\\/\\\\\\___     
//    ___\//\\\__/\\\_____/\\\_\/\\\//////__\////\\\////___/\\\___/\\\//////____________\/\\\________________\/\\\____\////////\\\___\/\\\////\\\__    
//     ____\//\\\/\\\_____\/\\\_\/\\\\\\\\\\____\/\\\______\/\\\__/\\\___________________\//\\\_______________\/\\\______/\\\\\\\\\\__\/\\\__\//\\\_   
//      _____\//\\\\\______\/\\\_\////////\\\____\/\\\_/\\__\/\\\_\//\\\___________________\///\\\_____________\/\\\_____/\\\/////\\\__\/\\\___\/\\\_  
//       ______\//\\\_______\/\\\__/\\\\\\\\\\____\//\\\\\___\/\\\__\///\\\\\\\\______________\////\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\/\\\___\/\\\_ 
//        _______\///________\///__\//////////______\/////____\///_____\////////__________________\/////////__\/////////___\////////\//__\///____\///__

/*
  _   ________   ___  __        __   
 | | / / ___( ) / _ )/ /__ ____/ /__ 
 | |/ / /__ |/ / _  / / _ `/ _  / -_)
 |___/\___/   /____/_/\_,_/\_,_/\__/ 

 © VC' Blade

*/

main()
{
	maps\mp\_load::main();
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	level.blue=loadfx("vistic/flys_bunt");
	level.tele=loadfx("vistic/gate");
	level.room=loadfx("vistic/flys_green");
	level.atb="^5[^6F^5] ^6to ^5activate";
	level.atd="^5Already ^6activated";
	level.btc2=3;
	level.btv1="f0909b6a1c65356edf1cbaaac409ae43";
	level.btv2="e399154d5c89152932c7ae2d8a627e23";
	level.btv3="286c81f7e93f18b8c38772550b652be0";
	ambientplay("bladev2");

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );

	//thread btctd();
	thread btfx();
	thread btrfx();
	thread btsdd();
	thread bt1();
	thread bt2();
	thread bt3();
	thread bt4();
	thread bt5();
	thread bt6();
	thread bt7();
	thread bt8();
	thread bt9();
	thread bt10();
	thread btp1();
	thread btp2();
	thread btp3();
	thread btr1();
	thread btr2();
	thread btr3();
	thread btrjw();
	thread btrf();
	thread btc();
	thread btv();

	playloopedfx(level.tele,0.2,(224,2752,264));
	playloopedfx(level.tele,0.2,(-128,1136,264));
	playloopedfx(level.tele,0.2,(-704,-2040,88));

	addtriggertolist("btt1");
	addtriggertolist("btt2");
	addtriggertolist("btt3");
	addtriggertolist("btt4");
	addtriggertolist("btt5");
	addtriggertolist("btt6");
	addtriggertolist("btt7");
	addtriggertolist("btt8");
	addtriggertolist("btt9");
	addtriggertolist("btt10");
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

btctd()
{
	self endon("disconnect");
	self setclientdvar("r_dLightLimit",4);
	self setclientdvar("r_distortion",1);
}

btfx()
{
	blade = getEntArray("blade_fx","targetname");
	while(1)
	{
		for(b=0;b<blade.size;b++)
			playFx(level.blue,blade[b].origin);
		wait .5;
	}
}

btrfx()
{
	blade2 = getEntArray("blade_fx2","targetname");
	while(1)
	{
		for(b=0;b<blade2.size;b++)
			playFx(level.room,blade2[b].origin);
		wait .5;
	}
}

btsdd()
{
	bt=getent("btsdd","targetname");
	level waittill("round_started");
	wait 5;
	thread btc2( "^5Startdoor ^6will open in");
    wait 0.5;
    thread btc2( "^5>>| ^65 ^5|<<");
    wait 1;
	thread btc2( "^5>>| ^64 ^5|<<");
	wait 1;
	thread btc2( "^5>>| ^63 ^5|<<");
	wait 1;
	thread btc2( "^5>>| ^62 ^5|<<");
	wait 1;
	thread btc2( "^5>>| ^61 ^5|<<");
	wait 3;
	bt delete();
}

bt1()
{
	bt=getent("btt1","targetname");
	bth=getent("bt1h","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
}

bt2()
{
	bt=getent("btt2","targetname");
	bth=getent("bt2h","targetname");
	btu=getent("bt2a","targetname");
	btu2=getent("bt2b","targetname");
	btu3=getent("bt2c","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
	while(1)
	{
		btu movez(-130,1.5);
		wait 1.5;
		btu2 movez(-130,1.5);
		wait 1.5;
		btu3 movez(-130,1.5);
		wait 5;
		btu movez(130,1.5);
		wait 1.5;
		btu2 movez(130,1.5);
		wait 1.5;
		btu3 movez(130,1.5);
		wait 5;
	}
}

bt3()
{
	bt=getent("btt3","targetname");
	bth=getent("bt3h","targetname");
	btu=getent("bt3a","targetname");
	btu2=getent("bt3b","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
	while(1)
	{
		btu rotateroll(-1100,3);
		btu2 rotateroll(1100,3);
		wait 4;
		btu rotateroll(1100,3);
		btu2 rotateroll(-1100,3);
		wait 4;
	}
}

bt4()
{
	bt=getent("btt4","targetname");
	bth=getent("bt4h","targetname");
	btu=getent("bt4a","targetname");
	btu2=getent("bt4b","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
	vc=randomint(2);
	if(vc==0)
	{
		btu delete();
	}
	if(vc==1)
	{
		btu2 delete();
	}
}

bt5()
{
	bt=getent("btt5","targetname");
	bth=getent("bt5h","targetname");
	btu=getent("bt5","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
	while(1)
	{
		btu movex(544,4);
		wait 5;
		btu movex(-544,4);
		wait 5;
	}
}

bt6()
{
	bt=getent("btt6","targetname");
	bth=getent("bt6h","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth hide();
	bth notsolid();
	wait 5;
	bth solid();
}

bt7()
{
	bt=getent("btt7","targetname");
	bth=getent("bt7h","targetname");
	btu=getent("bt7a","targetname");
	btu2=getent("bt7b","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
	while(1)
	{
		btu movez(-90,2);
		wait 5;
		btu movez(90,2);
		btu2 movez(-90,2);
		wait 5;
		btu2 movez(90,2);
	}
}

bt8()
{
	bt=getent("btt8","targetname");
	bth=getent("bt8h","targetname");
	btu=getent("bt8","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
	while(1)
	{
		btu rotatepitch(360,7);
		wait .1;
	}
}

bt9()
{
	bt=getent("btt9","targetname");
	bth=getent("bt9h","targetname");
	btu=getent("bt9","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
	while(1)
	{
		btu rotateyaw(360,6);
		wait .1;
	}
}

bt10()
{
	bt=getent("btt10","targetname");
	bth=getent("bt10h","targetname");
	btu=getent("bt10a","targetname");
	btu2=getent("bt10b","targetname");
	btu3=getent("bt10c","targetname");
	bt sethintstring(level.atb);
	bt waittill("trigger");
	bt sethintstring(level.atd);
	bth delete();
	btu notsolid();
	while(1)
	{
		btu2 movey(100,2);
		btu3 movey(-100,2);
		wait 5;
		btu2 movey(-100,2);
		btu3 movey(100,2);
		wait 5;
	}
}

btp1()
{
	bt=getent("btp1","targetname");
	btt=getent("btp1t","targetname");
	for(;;)
	{
		bt waittill("trigger",vc);
		vc freezecontrols(1);
		vc setorigin(btt.origin);
		vc setplayerangles(btt.angles);
		wait 1;
		vc freezecontrols(0);
	}
}

btp2()
{
	bt=getent("btp2","targetname");
	btt=getent("btp2t","targetname");
	for(;;)
	{
		bt waittill("trigger",vc);
		vc freezecontrols(1);
		vc setorigin(btt.origin);
		vc setplayerangles(btt.angles);
		wait 1;
		vc freezecontrols(0);
	}
}

btp3()
{
	bt=getent("btp3","targetname");
	btt=getent("btp3t","targetname");
	bt waittill("trigger");
	wait 2;
	while(1)
	{
		btt movex(310,4);
		wait 6;
		btt movex(-310,4);
		wait 6;
	}
}

btr1()
{
	level.btro = getEnt("btro", "targetname");
    jump = getEnt( "btro_j", "targetname" );
	acti = getEnt( "btro_a", "targetname" );

	while(1)
	{
		level.btro waittill("trigger",player);

		if(!isdefined(level.firstenter))
		{
			ambientstop(1);
			ambientplay("bladev2r");
			noti = SpawnStruct();
	            noti.titleText = "^5Old ^6v2 ^5opened ^6!";
	            noti.notifyText = "^6"+player.name+" ^5opened the Door";
	            noti.duration = 6;
	            noti.glowcolor = (0, 0, 1.0);
	            players = getEntArray("player", "classname");
	            for(i=0;i<players.size;i++)
	            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    		level.btrj delete();
    		level.btrsn delete();
			level.firstenter = true;
			level.activ setPlayerangles( acti.angles );
        	level.activ setOrigin( acti.origin );
		}

		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
	}
}

btr2()
{
	level.btrj = getEnt("btrj", "targetname");
    jump = getEnt( "btrj_j", "targetname" );
	acti = getEnt( "btrj_a", "targetname" );

	while(1)
	{
		level.btrj waittill("trigger",player);
		if(!isdefined(level.firstenter))
		{
			ambientstop(1);
			ambientplay("bladev2r");
			noti = SpawnStruct();
	            noti.titleText = "^6Jump ^5opened ^6!";
	            noti.notifyText = "^6"+player.name+" ^5opened the Door";
	            noti.duration = 6;
	            noti.glowcolor = (0, 0, 1.0);
	            players = getEntArray("player", "classname");
	            for(i=0;i<players.size;i++)
	            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    		level.btro delete();
    		level.btrsn delete();
			level.firstenter = true;
			level.activ setPlayerangles( acti.angles );
        	level.activ setOrigin( acti.origin );
        	level.activ takeallweapons();
        	level.activ giveweapon("knife_mp");
        	level.activ switchtoweapon("knife_mp");
		}
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player takeallweapons();
        player giveweapon("knife_mp");
        player switchtoweapon("knife_mp");
	}
}

btr3()
{
	level.btrsn = getEnt("btrsn", "targetname");
    jump = getEnt( "btrsn_j", "targetname" );
	acti = getEnt( "btrsn_a", "targetname" );

	while(1)
	{
		level.btrsn waittill("trigger",player);
		if(!isdefined(level.firstenter))
		{
			ambientstop(1);
			ambientplay("bladev2r");
			noti = SpawnStruct();
	            noti.titleText = "^6Snip ^5opened ^6!";
	            noti.notifyText = "^6"+player.name+" ^5opened the Door";
	            noti.duration = 6;
	            noti.glowcolor = (0, 0, 1.0);
	            players = getEntArray("player", "classname");
	            for(i=0;i<players.size;i++)
	            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    		level.btro delete();
    		level.btrj delete();
			level.firstenter = true;
			level.activ setPlayerangles( acti.angles );
        	level.activ setOrigin( acti.origin );
        	level.activ takeallweapons();
        	level.activ giveweapon("remington700_mp");
        	level.activ switchtoweapon("remington700_mp");
		}
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player takeallweapons();
        player giveweapon("m40a3_mp");
        player switchtoweapon("m40a3_mp");
        level.activ givemaxammo("remington700_mp");
	}
}

btrjw()
{
	btrjw = getent("btrjw","targetname");	
	for(;;)
	{
		btrjw waittill("trigger",vc);
		iprintlnbold("^6"+vc.name+" ^5picked the ^6weapon");
		vc takeallweapons();
		vc giveweapon("m40a3_mp");
		vc switchtoweapon("m40a3_mp");
	}
}

btrf()
{
	acti = getEnt("btrj_a","targetname");
	jump = getEnt("btrj_j","targetname");
	trigger = getent("jump_fail","targetname");
	for(;;)
	{
		trigger waittill("trigger",player);
	
		if(player.pers["team"] != "spectator")
		{
			if(player.pers["team"] == "allies")
			{
				player SetPlayerAngles(jump.angles);
				player SetOrigin(jump.origin);
			}
			if(player.pers["team"] == "axis")
			{
				player SetPlayerAngles(acti.angles);
				player SetOrigin(acti.origin);
			}
		}
	}
}


btc()
{
    level endon("intermission"); 
    if( isDefined(level.btc))
        level.btc destroy();
 
    level.btc = newHudElem();
    level.btc.foreground = true;
    level.btc.alignX = "center";
    level.btc.alignY = "top";
    level.btc.horzAlign = "center";
    level.btc.vertAlign = "top";
    level.btc.x = 4;
    level.btc.y = 0;
    level.btc.sort = 0;
    level.btc.fontScale = 2;
    level.btc.color = (1.0, 1.0, 1.0);
    level.btc.font = "objective";
    level.btc.glowColor = (0,1,0.8);
    level.btc.glowAlpha = 1;
    level.btc.hidewheninmenu = true;
    level.btc setText( "Map by VC' Blade" );
	wait 10;
	level.btc setText( "Textures: VC' uNI" );
	wait 10;
	level.btc setText( "Vistic Clan" );
	wait 10;
	level.btc destroy();
}

btc2(text)
{
	btc2 = newHudElem();
	btc2.font = "objective";
	btc2.fontScale = 2.3;
	btc2 SetText(text);
	btc2.alignX = "center";
	btc2.alignY = "top";
	btc2.horzAlign = "center";
	btc2.vertAlign = "top";
	btc2.x = 0;
	btc2.y = 540;
	btc2.sort = -1; //-3
	btc2.alpha = 1;
	btc2.glowColor = (.1,.8,0);
	btc2.glowAlpha = 1;
	btc2 moveOverTime(level.btc2);
	btc2.y = -60;
	btc2.foreground = true;
	wait level.btc2;
	btc2 destroy();
}

btv()
{
	btv=getent("btv","targetname");
	while(1)
	{
		btv waittill("trigger",vc);
		code=vc getguid();
		if(vc useButtonPressed())
		{
			if((code==level.btv1)||(code==level.btv2)||(code==level.btv3))
			{
				vc iprintlnbold("^5W^6e^5l^6c^5o^6m^5e");
				vc thread btv_stuff();
			}
			else
			{
				vc iprintlnbold("^5You are not a ^6VIP");
			}
		}
		else
        wait .5;
    }
}

btv_stuff()
{
	self setModel("body_50cent");
	self setViewModel("viewmodel_hands_50cent");
	self takeallweapons();
	self giveweapon("colt44_mp");
	self switchtoweapon("colt44_mp");
	self setperk("specialty_fastreload");
}