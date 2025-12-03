main() {
    maps\mp\_load::main();
 
    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    
	ambientPlay("ambient3");
	
    thread music();
	thread startdoor();
	thread trap1();
	thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread trap7();

	thread snip();
	thread knife();
	
	addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap7");
}


addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
    
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

Music()
{
    wait 5;
    iPrintLn("^4---^1Around Made By sxzoR^4---");
	AmbientPlay( "ambient3" );
}

startdoor()
{
	door=getent("startdoor","targetname");
	trig=getent("startdoor_trig","targetname");

    if(getdvarint("dr_auto_open_door")) {
		door delete();
        trig delete();
	} else {
        trig waittill("trigger");
        trig delete();
        door movez(-179,10);
        wait 4;
        door delete();
	}
}	

trap1()
{
    trig = getEnt( "trig_trap1", "targetname" );
    object1 = getEnt( "trap1", "targetname" );
    killtrigger = getent ("trap1b" , "targetname");
 
    trig waittill ("trigger");
 
    killtrigger enablelinkto ();
    killtrigger linkto (object1);
 
    while(1)
    {
        object1 movex(-50, 0.2);
        object1 waittill ("movedone");
        object1 movex(50, 0.2);
        object1 waittill ("movedone");
		trig delete();
    }
}
 
trap3()
{
    trig = getEnt( "trig_trap3", "targetname" );
    object1 = getent("trap3","targetname");

    trig waittill ("trigger");
    trig delete();
	
     while(1)
    {
        object1 hide();
		wait 5;
		object1 show();
		wait 5;
    }
}
 
trap4()
{
    trig = getEnt( "trig_trap4", "targetname" );
    object1 = getent("trap4a","targetname");
    object2 = getent("trap4b","targetname");
 
 
    trig waittill ("trigger");
       
     while(1)
    {
        object1 rotateroll(-360, 3);
        object2 rotateroll(360, 3);
        wait 10;
        object1 rotateroll(360, 3);
        object2 rotateroll(-360, 3);
        wait 10;
		trig delete();
    }
}
 
trap5()
{
    trig = getEnt( "trig_trap5", "targetname" );
    object1 = getent("trap5","targetname");
 
    trig waittill ("trigger");
 
    {
        object1 delete();
		trig delete();
    }
}
 
trap6()
{
    trig = getEnt( "trig_trap6", "targetname" );
    object1 = getent("trap6a","targetname");
    object2 = getent("trap6b","targetname");
 
    trig waittill ("trigger");
    trig delete();
       
     while(1)
    {
        object1 rotateroll(-360, 3);
        object2 rotateroll(360, 3);
        wait 10;
        object1 rotateroll(360, 3);
        object2 rotateroll(-360, 3);
        wait 10;
    }
}
 
trap7()
{
    trig = getEnt( "trig_trap7", "targetname" );
    object1 = getent("trap7","targetname");
 
    trig waittill ("trigger");
 
    {
        object1 delete();
		trig delete();
    }
}


snip()
{
    level.mus_trig3 = getEnt( "sniproom", "targetname" );
    tele_jumper = getEnt( "snip", "targetname" );
	tele_activator = getEnt( "acti_snip", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig3 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
		
		AmbientPlay( "ambient2" );
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper FreezeControls(1);
        level.activ FreezeControls(1);
        wait 0.05;
        level.finalJumper finalroom( tele_jumper, "m40a3_mp", 100 );
        level.activ finalroom( tele_activator, "m40a3_mp", 100 );
       
               
        noti = SpawnStruct();
        noti.titleText = "Snip Fight";
        noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
        noti.glowcolor = (0,0.9,0.7);
        noti.duration = 4;
        players = getentarray("player", "classname");
        for(i=0;i<players.size;i++)
                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
        wait 3;
        level.finalJumper FreezeControls(0);
        level.activ FreezeControls(0);
 
 
 
    }
    // code never gets here
}

finalroom( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
    self.health = health;
 
}
 
 
knife()
{
    level.mus_trig2 = getEnt( "kniferoom", "targetname" );
    tele_activator = getEnt( "acti_knife", "targetname" );
    tele_jumper = getEnt( "knife", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig2 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
		
        AmbientPlay( "ambient1" );
 
        level.mus_trig1 delete();
        level.mus_trig3 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper FreezeControls(1);
        level.activ FreezeControls(1);
        wait 0.05;
        level.finalJumper finalroom( tele_jumper, "knife_mp", 100 );
        level.activ finalroom( tele_activator, "knife_mp", 100 );
       
               
        noti = SpawnStruct();
        noti.titleText = "Knife Fight";
        noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
        noti.glowcolor = (0,0.9,0.7);
        noti.duration = 4;
        players = getentarray("player", "classname");
        for(i=0;i<players.size;i++)
                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
        wait 3;
        level.finalJumper FreezeControls(0);
        level.activ FreezeControls(0);
    }
}

finalMonitor()
{
    self endon( "disconnect" );
    self thread monitorDisconnect();
 
    while( self.sessionstate == "playing" )
        wait 0.05;
    level.finalJumper = undefined;
}
 
 

monitorDisconnect()
{
    self waittill( "disconnect" );
    level.finalJumper = undefined;
}