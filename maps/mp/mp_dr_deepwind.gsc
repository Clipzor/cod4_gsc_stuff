/*


 ___      ___ ___  ________  _________  ___  ________          ________  ___       ________  ________
|\  \    /  /|\  \|\   ____\|\___   ___\\  \|\   ____\        |\   ____\|\  \     |\   __  \|\   ___  \
\ \  \  /  / | \  \ \  \___|\|___ \  \_\ \  \ \  \___|        \ \  \___|\ \  \    \ \  \|\  \ \  \\ \  \
 \ \  \/  / / \ \  \ \_____  \   \ \  \ \ \  \ \  \            \ \  \    \ \  \    \ \   __  \ \  \\ \  \
  \ \    / /   \ \  \|____|\  \   \ \  \ \ \  \ \  \____        \ \  \____\ \  \____\ \  \ \  \ \  \\ \  \
   \ \__/ /     \ \__\____\_\  \   \ \__\ \ \__\ \_______\       \ \_______\ \_______\ \__\ \__\ \__\\ \__\
    \|__|/       \|__|\_________\   \|__|  \|__|\|_______|        \|_______|\|_______|\|__|\|__|\|__| \|__|
                     \|_________|


 ___  __    ________  ___       ___  ________   ________
|\  \|\  \ |\   __  \|\  \     |\  \|\   ___  \|\   ____\
\ \  \/  /|\ \  \|\  \ \  \    \ \  \ \  \\ \  \ \  \___|
 \ \   ___  \ \  \\\  \ \  \    \ \  \ \  \\ \  \ \  \  ___
  \ \  \\ \  \ \  \\\  \ \  \____\ \  \ \  \\ \  \ \  \|\  \
   \ \__\\ \__\ \_______\ \_______\ \__\ \__\\ \__\ \_______\
    \|__| \|__|\|_______|\|_______|\|__|\|__| \|__|\|_______|


Project Started 5th of July 2018
Project When Into Playtesting 24th of July 2018
Projects First Public Release 29th of July 2018
Projects First Big Update 19th of March 2019

Special Thanks To Vistic Blade, Vistic Asunarry and Vistic ERIK for helping
*/

main()
{
    maps\mp\_load::main();
  	maps\mp\_music_deepwind::main();

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    setdvar("g_speed",210);
    setdvar("dr_jumpers_speed" ,"1.2");
    /*setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".1");
    setdvar("r_glowbloomintensity1",".1");
    setdvar("r_glowskybleedintensity0",".1");*/

    level.rainbow_funken = loadfx("vistic/rainbow_funken");

    precacheitem("ak47_mp");
    precacheitem("ak74u_mp");
    precacheitem("ak47_mp");
    precacheitem("ak47u_mp");

  thread startdoor();
  thread opensecret();
  thread secret();
  thread secretout();
  thread hard_secretout();
  thread entsecret_respawn();
  thread acti_secret();
  thread koling_mover();
  thread koling_mover2();
  thread mapby();
  thread logomovers();
  thread end_elevator();

   thread traps();
   thread rooms();

}
startdoor()
{
  door = getEnt("startdoor","targetname");
	if(getdvarint("dr_auto_open_door")) {
		door delete();
	}
    else{
        level waittill("round_started");
        wait 7;
        door delete();
    }
}
auto_open_secret() {
    stairs = getEnt("secret_stairs","targetname");
    ladder = getEnt("secret_ladder","targetname");
    stairs movey(64,1);
    ladder movex(3,0.05);
    level waittill("round_started");
    iPrintln("^5Secret Open");
}
opensecret()
{
    if(isdefined(getdvarint("dr_auto_open_secret"))) {
        thread auto_open_secret();
        return;
    }
  trig = getEnt("trig_opensecret","targetname");
  stairs = getEnt("secret_stairs","targetname");
  ladder = getEnt("secret_ladder","targetname");

  trig waittill("trigger",who);
  stairs movey(64,1);
  ladder movex(3,0.05);
  iPrintln("^5Secret Open");


}
secret()
  {
      trig=getent("trig_secret","targetname");
      targ=getent("secret","targetname");

      while(1)
      {
      trig waittill("trigger",who);
      who freezecontrols(1);
      who setorigin(targ.origin);
      who setplayerangles(targ.angles);
      who freezecontrols(0);
      }
  }
secretout()
  {
      trig=getent("trig_secretout","targetname");
      targ=getent("secretout","targetname");

      while(1)
      {
      trig waittill("trigger",who);

      who freezecontrols(1);
      wait 0.05;
      who setorigin(targ.origin);
      who setplayerangles(targ.angles);
      who freezecontrols(0);
      who GiveWeapon("ak74u_mp");
      who GiveMaxAmmo("ak74u_mp");
      who SwitchToWeapon("ak74u_mp");
      }
  }
  hard_secretout()
    {
        trig=getent("trig_hard_secretout","targetname");
        targ=getent("hard_secretout","targetname");

        while(1)
        {
        trig SetHintString("^5Return to Map");
        trig waittill("trigger",player);

        player freezecontrols(1);
        wait 0.05;
        player setorigin(targ.origin);
        player setplayerangles(targ.angles);
        player freezecontrols(0);
        player GiveWeapon("ak74u_mp");
        player GiveMaxAmmo("ak74u_mp");
        player SwitchToWeapon("ak74u_mp");

        iprintlnbold("^5"+player.name+"^7 Has Completed Hard Secret^5!");
        }
    }
entsecret_respawn()
  {
      trig=getent("trig_entsecret_respawn","targetname");
      targ=getent("entsecret_respawn","targetname");

      while(1)
      {
      trig waittill("trigger",who);

      who freezecontrols(1);
      wait 0.05;
      who setorigin(targ.origin);
      who setplayerangles(targ.angles);
      who freezecontrols(0);
      who iPrintLnBold("Try Again!");
      }
  }
acti_secret()
{
  trig = getEnt("trig_acti_secret","targetname");

  trig waittill("trigger",player);
  player giveWeapon("ak47_mp");
  player switchtoweapon("ak47_mp");
  player iPrintLnBold("^5Spetsnaz Chicken Gave You AK47");
}
koling_mover()
{
    mover = getent("mover","targetname");

    wait 1; // just a wait so map can loadup
    while(isdefined(mover)) // means it runs only if the mover really exists
    {
        mover movey(-600,4);
        wait 4;
        mover movey(600,4);
        wait 4;
    }
}
koling_mover2(){
    mover = getent( "mover2", "targetname");
    x1=700;
    y1=-4193;
    z1=175;
    x2=1782;
    y2=-4193;
    z2=-450;

    trig = getent("trig_mover2","targetname");
    trig waittill("trigger",who);
    wait 0.5;

    while(1) //1 mean true
    {
        mover moveto((x1,y1,z1), 2);
        mover waittill( "movedone" ); //will wait till it is finished moving
        wait 1.5;
        mover moveto((x2,y2,z2), 2);
        mover waittill( "movedone" ); //will wait till it is finished moving
        wait 1.5;
    }

}
mapby()
{
  level waittill("round_started");
  iprintlnbold("^5Welcome ^7To ^5Deepwind");
  wait 2;
  iPrintlnBold("Special Thanks to ^5Vistic Blade^7, ^5Vistic Asunarry ^7and ^5Vistic ERIK^7!");
  while(1)
  {
    iPrintln("Map By ^5Koling");
    wait 40;
  }
}
logomovers()
{
  secretlogo = getent("secret_logo","targetname");
  logo1 = getent("trap1_logo","targetname");
  logo2 = getent("trap2_logo","targetname");
  logo3 = getent("trap3_logo","targetname");
  logo4 = getent("trap4_logo","targetname");
  logo5 = getent("trap5_logo","targetname");
  logo6 = getent("trap6_logo","targetname");
  logo7 = getent("trap7_logo","targetname");
  logo8 = getent("trap8_logo","targetname");
  logo9 = getent("trap9_logo","targetname");

  while(1)
  {
  secretlogo movez(100,3);
  logo1 movez(10,3);
  logo2 movez(10,3);
  logo3 movez(10,3);
  logo4 movez(10,3);
  logo5 movez(10,3);
  logo6 movez(10,3);
  logo7 movez(10,3);
  logo8 movez(10,3);
  logo9 movez(10,3);
  wait 3.2;
  secretlogo movez(-100,3);
  logo1 movez(-10,3);
  logo2 movez(-10,3);
  logo3 movez(-10,3);
  logo4 movez(-10,3);
  logo5 movez(-10,3);
  logo6 movez(-10,3);
  logo7 movez(-10,3);
  logo8 movez(-10,3);
  logo9 movez(-10,3);
  wait 3.2;
  }
}
end_elevator()
{
  elevator = getent("end_elevator","targetname");
  trig = getent("trig_end_elevator","targetname");
  trig waittill("trigger",who);
  wait 0.5;

  while(1)
  {
  elevator movez(500,4);
  wait 5;
  elevator movez(-500,4);
  wait 5;
  }
}

traps()
{
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread trap7();
    thread trap8();
    thread trap9();

    addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
    addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
    addTriggerToList("trig_trap6");
    addTriggerToList("trig_trap7");
    addTriggerToList("trig_trap8");
    addTriggerToList("trig_trap9");
}

addTriggerToList(name)
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];

    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()
{
    trig = getent("trig_trap1","targetname");
    part1 = getent("trap1_part1","targetname");
    part2 = getent("trap1_part2","targetname");
    part3 = getent("trap1_part3","targetname");
    part4 = getent("trap1_part4","targetname");

    trig SetHintString("^5Shift The Platforms!");
    trig waittill("trigger");
    trig delete();

    part4 movey(250,0.5);
    part3 movey(-250,0.5);
    part2 movey(250,0.5);
    part1 movey(-250,0.5);

    wait 5;
    while(isdefined(part1) && isdefined(part2) && isdefined(part3) && isdefined(part4))
    {
        part4 movey(-500,1);
        part3 movey(500,1);
        part2 movey(-500,1);
        part1 movey(500,1);
        wait 5;
        part4 movey(500,1);
        part3 movey(-500,1);
        part2 movey(500,1);
        part1 movey(-500,1);
        wait 5;
    }
}

trap2()
{
    trig = getent("trig_trap2","targetname");
    trap = getent("trap2","targetname");

    trig SetHintString("^5Rotate The Bounce!");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotateyaw(360,2);
        wait 5;
    }
}

trap3()
{
    trig = getent("trig_trap3","targetname");
    trap = getent("trap3","targetname");

    trig SetHintString("^5Delete Part Of The Bounce!");
    trig waittill("trigger");

    trig delete();
    trap delete();
}

trap4()
{
    trig = getent("trig_trap4","targetname");
    trap = getent("trap4","targetname");

    trig SetHintString("^5Delete Part Of The Bounce!");
    trig waittill("trigger");

    trig delete();
    trap delete();
}

trap5()
{
    trig = getent("trig_trap5","targetname");
    trap = getent("mover","targetname");

    trig SetHintString("^5Rotate The Platform!");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotateyaw(360,4);
        wait 4;
    }
}

trap6()
{
    trig = getent("trig_trap6","targetname");
    trap = getent("trap6","targetname");

    trap hide();
    trap notsolid();

    trig SetHintString("^5Block The Path!");
    trig waittill("trigger");
    trig delete();

    trap show();
    trap solid();
    wait 3;
    trap delete();
}

trap7()
{
    trig = getent("trig_trap7","targetname");
    part1 = getEnt("trap7_part1","targetname");
    part2 = getEnt("trap7_part2","targetname");

    trig SetHintString("^5Rotate Sticks!");
    trig waittill("trigger");
    trig delete();

    while(isdefined(part1) && isdefined(part2))
    {
        part1 rotatepitch(360,1.5);
        part2 rotatepitch(-360,1.5);
        wait 1.5;
    }
}

trap8()
{
    trig = getent("trig_trap8","targetname");
    trap = getEnt("trap8","targetname");

    trig SetHintString("^5Move Bounce!");
    trig waittill("trigger");
    trig delete();

    trap movey(-60,1);
    while(isdefined(trap))
    {
        trap movey(120,2);
        wait 2;
        trap movey(-120,2);
        wait 2;
    }
}

trap9()
{
    trig = getent("trig_trap9","targetname");
    part1 = getEnt("trap9_part1","targetname");
    part2 = getEnt("trap9_part2","targetname");

    part2 hide();
    part2 notsolid();

    trig SetHintString("^5Delete Platforms!");
    trig waittill("trigger");
    trig delete();

    part1 delete();
    part2 show();
    part2 solid();
}

rooms()
{
    thread sniperroom();
    thread bounceroom();
    thread oldroom();
    thread weaproom();
}

sniperroom()
{
    level.sniper_trigger = getEnt( "trig_sniperroom", "targetname" );
    jump = getEnt( "sniper_jumper", "targetname" );
    acti = getEnt( "sniper_activator", "targetname" );

    for(;;)
    {
        level.sniper_trigger SetHintString("^5Press &&1 To Enter The ^7Sniper ^5Room.");
        level.sniper_trigger waittill("trigger",player);
        if(!isdefined(level.sniper_trigger))
            return;

        if(!isdefined(level.firstenter))
        {
            level.firstenter = true;
            iprintlnbold("^5"+player.name+"^7 has chosen the Sniper Room^5!");

            thread sniper_jumper_respawn();
            thread sniper_activator_respawn();

            level.bounce_trigger delete();
            level.old_trigger delete();
            level.weapon_trigger delete();
        }

        if(isdefined(level.activ))
        {
            player create_room_setup(jump,"remington700_mp","m40a3_mp",100,1);
            level.activ create_room_setup(acti,"remington700_mp","m40a3_mp",100,1);

            wait 4;

            player iPrintlnBold( "Fight!" );
            level.activ iPrintlnBold( "Fight!" );
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else
        {
            player create_room_setup(jump,"remington700_mp","m40a3_mp",100,1);

            wait 4;

            player iPrintlnBold( "Fight!" );
            player freezecontrols(0);
        }
        player waittill( "death" );
    }
}

sniper_jumper_respawn()
{
    trig=getent("trig_sniper_jumper_respawn","targetname");
    targ=getent("sniper_jumper","targetname");

    while(1)
    {
        trig waittill("trigger",who);
        who freezecontrols(1);
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
        who freezecontrols(0);
    }
}

sniper_activator_respawn()
{
    trig=getent("trig_sniper_activator_respawn","targetname");
    targ=getent("sniper_activator","targetname");

    while(1)
    {
        trig waittill("trigger",who);
        who freezecontrols(1);
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
        who freezecontrols(0);
    }
}

bounceroom()
{
    level.bounce_trigger = getEnt( "trig_bounceroom", "targetname" );
    jump = getEnt( "bounce_jumper", "targetname" );
    acti = getEnt( "bounce_activator", "targetname" );

    for(;;)
    {
        level.bounce_trigger SetHintString("^5Press &&1 To Enter The ^7Bounce ^5Room.");
        level.bounce_trigger waittill("trigger",player);
        if(!isdefined(level.bounce_trigger))
            return;

        if(!isdefined(level.firstenter))
        {
            level.firstenter = true;
            iprintlnbold("^5"+player.name+"^7 has chosen the Bounce Room^5!");

            thread bounce_jumper_respawn();
            thread bounce_activator_respawn();
            thread bounce_weapon();

            level.sniper_trigger delete();
            level.old_trigger delete();
            level.weapon_trigger delete();
        }

        if(isdefined(level.activ))
        {
            player create_room_setup(jump,"knife_mp",undefined,100,1);
            level.activ create_room_setup(acti,"knife_mp",undefined,100,1);

            wait 4;

            player iPrintlnBold( "Jump!" );
            level.activ iPrintlnBold( "Jump!" );
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else
        {
            player create_room_setup(jump,"knife_mp",undefined,100,1);

            wait 4;

            player iPrintlnBold( "Jump!" );
            player freezecontrols(0);
        }
        player waittill( "death" );
    }
}

bounce_jumper_respawn()
{
    trig=getent("trig_bounce_jumper_respawn","targetname");
    targ=getent("bounce_jumper","targetname");

    while(1)
    {
        trig waittill("trigger",who);

        who freezecontrols(1);
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
        who freezecontrols(0);
    }
}

bounce_activator_respawn()
{
    trig=getent("trig_bounce_activator_respawn","targetname");
    targ=getent("bounce_activator","targetname");

    while(1)
    {
        trig waittill("trigger",who);

        who freezecontrols(1);
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
        who freezecontrols(0);
    }
}

bounce_weapon()
{
    trig=getent("trig_bounce_wep","targetname");

        trig waittill("trigger",who);

        who giveweapon("remington700_mp");
        who givemaxammo("remington700_mp");
        who switchtoweapon("remington700_mp");
}

oldroom()
{
    level.old_trigger = getEnt( "trig_oldroom", "targetname" );
    door = getEnt("door_oldroom","targetname");

    level.old_trigger SetHintString("^5Press &&1 To Enter The ^7Old ^5Way.");
    level.old_trigger waittill("trigger",player);

    iprintlnbold("^5"+player.name+"^7 has chosen the Old Way^5!");

    door delete();
    level.old_trigger delete();
    level.sniper_trigger delete();
    level.bounce_trigger delete();
    level.weapon_trigger delete();
}

weaproom()
{
    level.weapon_trigger = getEnt("trig_weaproom", "targetname" );
    jump = getEnt( "weap_jumper", "targetname" );
    acti = getEnt( "weap_activator", "targetname" );

    for(;;)
    {
        level.weapon_trigger SetHintString("^5Press &&1 To Enter The ^7Weapon ^5Room.");
        level.weapon_trigger waittill("trigger",player);
        if(!isdefined(level.weapon_trigger))
            return;

        if(!isdefined(level.firstenter))
        {
            level.firstenter = true;
            iprintlnbold("^5"+player.name+"^7 has chosen the Weapon Room^5!");

            thread weaproom_ak47();
            thread weaproom_ak47_acti();
            thread weaproom_ak74u();
            thread weaproom_ak74u_acti();
            thread weaproom_m4();
            thread weaproom_m4_acti();
            thread weaproom_p90();
            thread weaproom_p90_acti();

            level.sniper_trigger delete();
            level.old_trigger delete();
            level.bounce_trigger delete();
        }

        if(isdefined(level.activ))
        {
            player create_room_setup(jump,undefined,undefined,100,1);
            level.activ create_room_setup(acti,undefined,undefined,100,1);

            player iPrintlnBold("Grab A Weapon!");
            level.activ iPrintlnBold("Grab A Weapon!");

            wait 4;

            player iPrintlnBold( "Fight!" );
            level.activ iPrintlnBold( "Fight!" );
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else
        {
            player create_room_setup(jump,"knife_mp",undefined,100,1);
            player iPrintlnBold("Grab A Weapon!");

            wait 4;

            player iPrintlnBold( "Fight!" );
            player freezecontrols(0);
        }
        player waittill( "death" );
    }
}

create_room_setup(target,weap,weap2,health,freeze)
{
    self setorigin(target.origin);
    self setplayerangles(target.angles);
    self takeallweapons();

    if(isdefined(weap))
    {
        self takeallweapons();
        self giveweapon(weap);
        self givemaxammo(weap);
        self switchtoweapon(weap);
    }

    if(isdefined(weap2))
    {
        self giveweapon(weap2);
        self givemaxammo(weap2);
    }

    self.health = 100;
    self freezecontrols(freeze);
}

weaproom_ak47()
{
  trig_ak47 = getEnt("pickup_ak47","targetname");
  trig_ak47 SetHintString("Press ^1&&1^7 To Pickup AK47");

  while(1)
  {
  trig_ak47 waittill("trigger",player);
  player takeallweapons();
  player giveweapon("ak47_mp");
  player GiveMaxAmmo("ak47_mp");
  player switchtoweapon("ak47_mp");
  }
}
weaproom_ak47_acti()
{
  trig_ak47_acti = getEnt("pickup_ak47_acti","targetname");
  trig_ak47_acti SetHintString("Press ^1&&1^7 To Pickup AK47");

  while(1)
  {
  trig_ak47_acti waittill("trigger",player);
  player takeallweapons();
  player giveweapon("ak47_mp");
  player GiveMaxAmmo("ak47_mp");
  player switchtoweapon("ak47_mp");
  }
}
weaproom_ak74u()
{
  trig_ak74u = getEnt("pickup_ak74u","targetname");
  trig_ak74u SetHintString("Press ^1&&1^7 To Pickup AK74u");

  while(1)
  {
  trig_ak74u waittill("trigger",player);
  player takeallweapons();
  player giveweapon("ak74u_mp");
  player GiveMaxAmmo("ak74u_mp");
  player switchtoweapon("ak74u_mp");
  }
}
weaproom_ak74u_acti()
{
  trig_ak74u_acti = getEnt("pickup_ak74u_acti","targetname");
  trig_ak74u_acti SetHintString("Press ^1&&1^7 To Pickup AK74u");

  while(1)
  {
  trig_ak74u_acti waittill("trigger",player);
  player takeallweapons();
  player giveweapon("ak74u_mp");
  player GiveMaxAmmo("ak74u_mp");
  player switchtoweapon("ak74u_mp");
  }
}
weaproom_m4()
{
  trig_m4 = getEnt("pickup_m4","targetname");
  trig_m4 SetHintString("Press ^1&&1^7 To Pickup M4");

  while(1)
  {
  trig_m4 waittill("trigger",player);
  player takeallweapons();
  player giveweapon("ak47_mp");
  player GiveMaxAmmo("ak47_mp");
  player switchtoweapon("ak47_mp");
  }
}
weaproom_m4_acti()
{
  trig_m4_acti = getEnt("pickup_m4_acti","targetname");
  trig_m4_acti SetHintString("Press ^1&&1^7 To Pickup M4");

  while (1)
  {
  trig_m4_acti waittill("trigger",player);
  player takeallweapons();
  player giveweapon("ak47_mp");
  player GiveMaxAmmo("ak47_mp");
  player switchtoweapon("ak47_mp");
  }
}
weaproom_p90()
{
  trig_p90 = getEnt("pickup_p90","targetname");
  trig_p90 SetHintString("Press ^1&&1^7 To Pickup P90");

  while(1)
  {
  trig_p90 waittill("trigger",player);
  player takeallweapons();
  player giveweapon("ak47u_mp");
  player GiveMaxAmmo("ak47u_mp");
  player switchtoweapon("ak47u_mp");
  }
}
weaproom_p90_acti()
{
  trig_p90_acti = getEnt("pickup_p90_acti","targetname");
  trig_p90_acti SetHintString("Press ^1&&1^7 To Pickup P90");

  while (1)
  {
  trig_p90_acti waittill("trigger",player);
  player takeallweapons();
  player giveweapon("ak47u_mp");
  player GiveMaxAmmo("ak47u_mp");
  player switchtoweapon("ak47u_mp");
  }
}
