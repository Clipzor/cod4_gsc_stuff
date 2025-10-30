main()
{
    maps\mp\_load::main();
 
    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    // Map Logic
    thread startdoor();
    thread lift();
    thread creator();

    // Traps
    thread trap1();
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

    // Rooms	
    thread jump();
    thread knife();
    thread sniper();

    // Secret
    thread secret();
    thread secret_exit();
    thread secret_fail();
}			
		
startdoor()
{
    trig = getent("bn2_start_trig","targetname");
    door = getent("bn2_start_door","targetname");
    bn2 = getent("bn2_start","targetname");

    bn2 thread hover();

    trig sethintstring("^1Press ^0&&1 ^1to open the Startdoor");
    trig waittill("trigger");
    trig delete();

    door movez(-160,2);
    wait 2;
    door delete();

    while(isdefined(bn2))
    {
        bn2 rotateyaw(360,2);
        wait 2;
    }
}

lift()
{
    trig = getent("bn2_ele_trig","targetname");
    door = getent("bn2_ele_door","targetname");
    lift = getent("bn2_ele","targetname");

    trig waittill("trigger");
    trig delete();

    door movez(-160,2);
    wait 2;
    door delete();

    while(isdefined(lift))
    {
        lift movez(-656,2);
        wait 5;
        lift movez(656,2);
        wait 5;
    }
}

creator()
{
    level waittill("round_started");

    id = randomint(3);
    ambientplay("ambient"+id);

    wait 1;
    thread braxi\_mod::drawInformation( 800, 0.8, 1, "mp_dr_^0black^1night^02" );

    while(1)
    {
        iprintln("^1>>^7 Map made by ^5Blade^7 (1 Day Project)");
        wait 10;
        iprintln("^1>>^7 Version 1 made by ^5sixzoRRR'");
        wait 10;
        iprintln("^1>>^7 Discord: ^5Blade #6504");
        wait 10;
        iprintln("^1>>^7 Visit ^5vistic-clan.net");
        wait 30;
    }
}


hover()
{
    while(isdefined(self))
    {
        self movez(-15,2);
        wait 2;
        self movez(15,2);
        wait 2;
    }
}

trap1()
{
    trig = getent("trap1_trig","targetname");
    trapa = getent("trap1a","targetname");
    trapb = getent("trap1b","targetname");

    trig waittill("trigger");
    trig delete();

    trapa movex(64,1);
    trapb movex(-64,1);

    wait 1;

    while(isdefined(trapa) && isdefined(trapb))
    {
        trapa movex(-128,2);
        trapb movex(128,2);
        wait 2;
        trapa movex(128,2);
        trapb movex(-128,2);
        wait 2;
    }
}

trap2()
{
    trig = getent("trap2_trig","targetname");
    trap = getent("trap2","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap hide();
        trap notsolid();
        wait 5;
        trap show();
        trap solid();
        wait 5;
    }
}
 
trap3()
{
    trig = getent("trap3_trig","targetname");
    trapa = getent("trap3a","targetname");
    trapb = getent("trap3b","targetname");

    trig waittill("trigger");
    trig delete();

    trapa movez(75,1);
    trapb movez(-75,1);

    wait 1;

    while(isdefined(trapa) && isdefined(trapb))
    {
        trapa movez(-150,3);
        trapb movez(150,3);
        wait 3;
        trapa movez(150,3);
        trapb movez(-150,3);
        wait 3;
    }
}

trap4()
{
    trig = getent("trap4_trig","targetname");
    trap = getent("trap4","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotateroll(-360, 3);
        wait 6;
        trap rotateroll(360, 3);
        wait 6;
    }
}

trap5()
{
    trig = getent("trap5_trig","targetname");
    trapa = getent("trap5a","targetname");
    trapb = getent("trap5b","targetname");
    trapc = getent("trap5c","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb) && isdefined(trapc))
    {
        trapa movez(-300,3);
        wait 1.5;
        trapb movez(-300,3);
        wait 1.5;
        trapc movez(-300,3);
        wait 8;
        trapa movez(300,3);
        wait 1.5;
        trapb movez(300,3);
        wait 1.5;
        trapc movez(300,3);
        wait 8;
    }
}

trap6()
{
    trig = getent("trap6_trig","targetname");
    trapa = getent("trap6a","targetname");
    trapb = getent("trap6b","targetname");

    trig waittill("trigger");
    trig delete();

    trapa movez(-360,2);
    wait 2;
    trapa delete();

    while(isdefined(trapb))
    {
        trapb hide();
        trapb notsolid();
        wait 5;
        trapb show();
        trapb solid();
        wait 5;
    }
}

trap7()
{
    trig = getent("trap7_trig","targetname");
    trapa = getent("trap7a","targetname");
    trapb = getent("trap7b","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb))
    {
        trapa rotatepitch(360, 3);
        trapb rotatepitch(-360, 3);
        wait 8;
    }
}

trap8()
{
    trig = getent("trap8_trig","targetname");
    trap = getent("trap8","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotateyaw(360, 3);
        trap movez(-290, 2);
        wait 6;
        trap rotateyaw(-360, 3);
        trap movez(290, 2);
        wait 6;
    }
}

trap9()
{
    trig = getent("trap9_trig","targetname");
    trap = getent("trap9","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotatepitch(360, 3);
        wait 3;
    }
}

trap10()
{
    trig = getent("trap10_trig","targetname");
    trap = getent("trap10","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap hide();
        trap notsolid();
        wait 5;
        trap show();
        trap solid();
        wait 5;
    }
}

trap11()
{
    trig = getent("trap11_trig","targetname");
    trapa = getent("trap11a","targetname");
    trapb = getent("trap11b","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb))
    {
        trapa rotateyaw(360,2);
        trapb rotateyaw(-360,2);
        wait 2;
    }
}

trap12()
{
    trig = getent("trap12_trig","targetname");
    trap = getent("trap12","targetname");

    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotateyaw(-360, 3);
        trap movez(-290, 2);
        wait 6;
        trap rotateyaw(360, 3);
        trap movez(290, 2);
        wait 6;
    }
}

secret()
{
    brush = getent("secret","targetname");
    targ = getent("secret_targ","targetname");

    step1 = getent("step1","targetname");
    step2 = getent("step2","targetname");
    step3 = getent("step3","targetname");
    step4 = getent("step4","targetname");

    step1 waittill("trigger",who);
    who iprintlnbold("^1Secret Step 1");
    step2 waittill("trigger",who);
    who iprintlnbold("^1Secret Step 2");
    step3 waittill("trigger",who);
    who iprintlnbold("^1Secret Step 3");
    step4 waittill("trigger",who);
    who iprintlnbold("^1Secret Step 4");

    iprintlnbold("^1Secret opened!");
    brush movez(-176,2);
    wait 2;
    trig = getent("secret_trig","targetname");

    for(;;)
    {
        trig waittill("trigger",who);
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
    }
}

secret_exit()
{
    trig = getent("secret_exit","targetname");
    targ = getent("secret_targ2","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
    }
}

secret_fail()
{
    trig = getent("secret_fail","targetname");
    targ = getent("secret_targ","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        who setorigin(targ.origin);
        who setplayerangles(targ.angles);
    }
}

sniper()
{
    level.sniper = getent("sniper","targetname");
    jump = getent("snip_jump","targetname");
    acti = getent("snip_acti","targetname");

    level.sniper sethintstring("^1Press ^0&&1 ^1to enter Sniper");

    while(1)
    {
        level.sniper waittill("trigger",player);

        if(!isdefined(level.sniper))
            return; 

        if(!isdefined(level.room_selected))
        {
            level.room_selected = true;
            thread sniper_selected();
            thread snip_fail();

            level.jump delete();
            level.knife delete();
        }

        if(isdefined(level.activ))
        {
            player room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            level.activ room_setup(acti,"m40a3_mp","remington700_mp","yes",1);
            iprintlnbold("^1S^0niper ^1R^0oom");
            iprintlnbold("^1"+player.name+"^0 VS ^1"+level.activ.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^0has been killed");
    }
}

jump()
{
    level.jump = getent("jump","targetname");
    jump = getent("jump_jump","targetname");
    acti = getent("jump_acti","targetname");

    level.jump sethintstring("^1Press ^0&&1 ^1to enter Jump");

    while(1)
    {
        level.jump waittill("trigger",player);

        if(!isdefined(level.jump))
            return; 

        if(!isdefined(level.room_selected))
        {
            level.room_selected = true;
            thread jump_selected();
            thread jump_fail();

            level.sniper delete();
            level.knife delete();
        }

        thread jump_weapon();

        if(isdefined(level.activ))
        {
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ room_setup(acti,"knife_mp",undefined,"yes",1);
            iprintlnbold("^1J^0ump ^1R^0oom");
            iprintlnbold("^1"+player.name+"^0 VS ^1"+level.activ.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^0has been killed");
    }
}

knife()
{
    level.knife = getent("knife","targetname");
    jump = getent("knife_jump","targetname");
    acti = getent("knife_acti","targetname");

    level.knife sethintstring("^1Press ^0&&1 ^1to enter Knife");

    while(1)
    {
        level.knife waittill("trigger",player);

        if(!isdefined(level.knife))
            return; 

        if(!isdefined(level.room_selected))
        {
            level.room_selected = true;
            thread knife_selected();

            level.jump delete();
            level.sniper delete();
        }

        if(isdefined(level.activ))
        {
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ room_setup(acti,"knife_mp",undefined,"yes",1);
            iprintlnbold("^1K^0nife ^1R^0oom");
            iprintlnbold("^1"+player.name+"^0 VS ^1"+level.activ.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^0has been killed");
    }
}

sniper_selected()
{
    sphere = getent("snip_sphere","targetname");
    sphere thread hover();

    while(isdefined(sphere))
    {
        sphere rotateyaw(360,2);
        wait 2;
    }
}

knife_selected()
{
    sphere = getent("knife_sphere","targetname");
    sphere thread hover();

    while(isdefined(sphere))
    {
        sphere rotateyaw(360,2);
        wait 2;
    }
}

jump_selected()
{
    sphere = getent("jump_sphere","targetname");
    sphere thread hover();

    while(isdefined(sphere))
    {
        sphere rotateyaw(360,2);
        wait 2;
    }
}

jump_weapon()
{
    trig = getent("jump_weap","targetname");

    level.jump_weapon = true;
    for(;;)
    {
        trig waittill("trigger",who);
        if(level.jump_weapon)
        {
            level.jump_weapon = false;
            who giveweapon("remington700_mp");
            who givemaxammo("remington700_mp");
            who switchtoweapon("remington700_mp");
        }
    }
}

jump_fail()
{
    trig = getent("jump_fail","targetname");
    jump = getent("jump_jump","targetname");
    acti = getent("jump_acti","targetname");

    for(;;)
    {
        trig waittill("trigger",who);
        if(who.pers["team"] != "spectator")
        {
            if(who.pers["team"] == "allies")
            {
                who setorigin(jump.origin);
                who setplayerangles(jump.angles);
            }
            else
            {
                who setorigin(acti.origin);
                who setplayerangles(acti.angles);
            }
        }
    }
}

snip_fail()
{
    trig = getent("snip_fail","targetname");
    jump = getent("snip_jump","targetname");
    acti = getent("snip_acti","targetname");

    for(;;)
    {
        trig waittill("trigger",who);
        if(who.pers["team"] != "spectator")
        {
            if(who.pers["team"] == "allies")
            {
                who setorigin(jump.origin);
                who setplayerangles(jump.angles);
            }
            else
            {
                who setorigin(acti.origin);
                who setplayerangles(acti.angles);
            }
        }
    }
}

room_setup(targ,weap,weap2,health,freeze)
{
    self setorigin(targ.origin);
    self setplayerangles(targ.angles);

    self takeallweapons();
    self giveweapon(weap);
    self switchtoweapon(weap);
    self givemaxammo(weap);

    if(isdefined(weap2))
    {
        self giveweapon(weap2);
        self givemaxammo(weap2);
    }

    self freezecontrols(freeze);

    if( health == "yes")
    {
        if(self.health < self.maxhealth)
            self.health=self.maxhealth;
    }
}