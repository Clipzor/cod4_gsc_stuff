main()
{

maps\mp\_load::main();

	ambientPlay("default");
 
	game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
	setdvar("r_specularcolorscale","1");
	setdvar("compassmaxrange","1600");
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 20000000 );
	setDvar("bg_falldamageminheight", 15000000 );
	setDvar("r_filmUseTweaks", "1");
	setDvar("r_lightMap", "2");
	setDvar("dr_activator_freerun", "0");
	
	level.disableRoomPlugin = true;

	//visionSetNaked("mp_dr_easy_hard",0);
	visionSetNaked("mp_vacant",0);

	//SetExpFog( 768, 1500, 123/255, 155/255, 175/255, 3 );
	
	thread onPlayerSpawned();
    thread end();
	thread addTestClients();
	thread giveM9();

	
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

onPlayerSpawned() 
{
    self endon("disconnect");

    self waittill("player_spawned");
    self setClientDvar("r_filmTweakContrast", "2");
	self setClientDvar("r_filmTweakBrightness", "0.05");
}

end()
{
	trig = getEnt("trig_winner", "targetname");
	door = getEnt("endoor", "targetname");
	trig waittill("trigger", player);
	trig delete();
	level.disableRoomPlugin = true;
	jumpers = getEntArray("player", "classname");
	if(player.pers["team"] == "axis")
	{
		iPrintLnBold("^1Activator won!");
		for(z = 0; z < jumpers.size; z++)
		{
			jumpers[z] freezeControls(1);
		}
		wait 2;		
		for(i = 0; i < jumpers.size; i++)
		{
			if(jumpers[i].pers["team"] == "allies")
			{
				jumpers[i] freezeControls(0);
				jumpers[i] finishPlayerDamage( player, player, 1000, 0, "MOD_PROJECTILE_SPLASH", "none", self.origin, self.origin, "none", 0 );				
			}
		}
	}
	else {
		iPrintLnBold("^2Jumpers won!");
		for(i = 0; i < jumpers.size; i++)
		{
			jumpers[i] takeAllWeapons();
			jumpers[i] giveWeapon("knife_mp");
			jumpers[i] switchToWeapon("knife_mp");
			jumpers[i] thread gunChecker();
		}
		wait 1.5;
		door moveZ(-520,2);
		wait 2;
	}
}

gunChecker()
{
	for(;;)
	{
	wait .5;
	self.gun = self getCurrentWeapon();
		if (isAlive(self) && self.gun != "knife_mp")
		{
			self takeAllWeapons();
			self giveWeapon("knife_mp");
			self switchToWeapon("knife_mp");
		}
	}
}

giveM9()
{
	trig = getEnt("trig_beretta", "targetname");
	trig waittill("trigger", player);
	trig delete();	
	player takeAllWeapons();
	player giveWeapon("beretta_mp");
	player switchToWeapon("beretta_mp");
}