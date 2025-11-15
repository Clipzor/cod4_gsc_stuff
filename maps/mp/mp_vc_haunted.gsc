//	/$$$$$$$$ /$$$$$$$  /$$$$$$ /$$   /$$
//	| $$_____/| $$__  $$|_  $$_/| $$  /$$/
//	| $$      | $$  \ $$  | $$  | $$ /$$/ 
//	| $$$$$   | $$$$$$$/  | $$  | $$$$$/  
//	| $$__/   | $$__  $$  | $$  | $$  $$  
//	| $$      | $$  \ $$  | $$  | $$\  $$ 
//	| $$$$$$$$| $$  | $$ /$$$$$$| $$ \  $$
//	|________/|__/  |__/|______/|__/  \__/

/*

Credits:

-Sheep Wizard-
-Mikey-
-Blade-
-Legend-
-Darkstep-
-Fox-
-Rotola-
*/

//print3d


main() {
	maps\mp\_load::main();
	//maps\mp\mp_vc_haunted\_cards::main();
	maps\mp\mp_vc_haunted\_rooms::main();

	
	//////Effects//////
	level.streetlights = loadFX("misc/insects_light_hunted"); 
	
	level.dust_room_a = loadFX("deathrun/dust_room_small"); 
	level.dust_room_b = loadFX("deathrun/dust_room_big"); 	
	level.dust_room_c = loadFX("deathrun/dust_room_large");

	level.fog_a = loadFX("deathrun/fog_a"); 
	level.fog_b = loadFX("deathrun/fog_b");  	

	level.dust_a = loadFX("deathrun/dust_a"); 
	level.dust_b = loadFX("deathrun/dust_b"); 
	level.dust_c = loadFX("deathrun/dust_c"); 
	level.dust_d = loadFX("deathrun/dust_back_a"); 

	level.gasline = loadFX("deathrun/gasline_fire");
	level.sparks = loadFX("deathrun/sparks");
	level.lightning = loadFX("deathrun/lightning");
	level.perkLight = loadFX("deathrun/perklight");
	level.trap_teleport = loadFX("deathrun/trap_teleport");
	
	//////Fog//////
	setExpFog(0, 75000, 0.15, 0.15, 0.15, 0);
	
	//////Game//////
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	//////Dvars//////
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	//////PreCacheShader//////
	PreCacheShader("bo2_vending_soh");
	PreCacheShader("bo2_vending_double_tap");
	PreCacheShader("bo2_vending_marathon");
	PreCacheShader("bo2_vending_jugger");

	//////Models//////
    PreCacheModel("com_laptop_generic_open");
    PreCacheModel("me_lightfluohang");
    PreCacheModel("me_lightfluohang_on");
    PreCacheModel("ghost_model");
    PreCacheModel("bo2_vending_soh");
    PreCacheModel("bo2_vending_double_tap");
    PreCacheModel("bo2_vending_marathon");
    PreCacheModel("bo2_vending_jugger");
    PreCacheModel("victoria_kanayeva");
	PreCacheModel("zom_avagadro_fb");
	PreCacheModel("tomb_dempsey_fb");
	PreCacheModel("stormtrooper");
	PreCacheModel("sam");

	//////Item//////
    //PreCacheItem("bo2_vending_marathon_mp");
    //PreCacheItem("bo2_vending_jugg_mp");
    //PreCacheItem("bo2_vending_soh_mp");
    //PreCacheItem("bo2_vending_revive_mp");
    //PreCacheItem("bo2_vending_doubletap_mp");	
	//PreCacheItem("gr_mp");
	//PrecacheItem("building_mp");	 
	
	thread credits();
	
	thread teleporter_thread();
	
	//thread start();
	thread start_brush();
	//thread grim();
	//thread perk_machine();
	thread booster();
	
	//thread trap_activation();
	thread trap1();
	thread trap2();
	thread trap2_1();
	thread trap2_2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();

	//Trigger-List
	addTriggerToList( "trap1_trigger" );
	addTriggerToList( "trap2_trigger" );
	addTriggerToList( "trap2_1_trigger" );
	addTriggerToList( "trap2_2_trigger" );
	addTriggerToList( "trap3_trigger" );
	addTriggerToList( "trap4_trigger" );
	addTriggerToList( "trap5_trigger" );
	addTriggerToList( "trap6_trigger" );
	addTriggerToList( "trap7_trigger" );
	addTriggerToList( "trap8_trigger" );
	addTriggerToList( "trap9_trigger" );
	addTriggerToList( "trap10_trigger" );
	
	
	//thread OnPlayerConnect();
	//thread playersAlive();

}

credits()
{
	level waittill("round_started");
	while(true)
	{
	wait 10;
	color_message("Credits to Sheep Wizard");
	wait 10;
	color_message("credits to Mikey");
	wait 10;
	color_message("Credits to Blade");
	wait 10;
	color_message("Credits to Fox");
	wait 10;
	color_message("Credits to Legend");
	wait 10;
	color_message("Credits to Rotola");
	wait 10;
	color_message("Credits to Zoro");
	wait 10;
	color_message("Credits to Glen");
	wait 10;
	color_message("Credits to Nitro");
	}	
}



color_message(message)
{
random_color = randomIntRange(0,9);
iprintln("^" + random_color + message);
}


////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

teleporter_thread()
{

	entTransporter= getentarray("teleport","targetname");
	if(isdefined(entTransporter))
 
		{
			for(lp=0; lp<entTransporter.size;lp=lp+1)
			entTransporter [lp] thread teleporter();
		}
}

teleporter()
{
  while(true)
  {
    self waittill("trigger",other);
    entTarget = getent(self.target, "targetname");

    wait(0.10);
    other setorigin(entTarget.origin);
    other setplayerangles(entTarget.angles);
    wait(0.10);

   }
}


start()
{
	wait 1;
	//SetExpFog(600, 1200, 0.05, 0.05, 0.05, 0.1);  
	
	AmbientPlay( "song1" );
	
	thread gasline_fire();
	thread light_flash();
	thread streetlight();
	thread dust_room_a();
	thread dust_room_b();
	thread dust_room_c();
	thread fog_a();
	thread fog_b();
	thread dust_a();
	thread dust_b();
	thread dust_c();
	thread dust_d();
	
	wait 1;
}

gasline_fire()
{
end = getEnt("ending_fx","targetname");
fxer = getEnt("ending_target","targetname");
orgi1 = getEnt("gasline01","targetname");
orgi2 = getEnt("gasline02","targetname");
orgi3 = getEnt("gasline03","targetname");
wait 1;
playfx(level.trap_teleport,end.origin);
playfx(level.trap_teleport,fxer.origin);
playfx(level.gasline,orgi1.origin);
playfx(level.gasline,orgi2.origin);
playfx(level.gasline,orgi3.origin);
}

start_brush()
{
trig = getEnt("start_bursh_trigger","targetname");
brush = getEnt("start_bursh_block","targetname");
model = getEnt("start_bursh_model","targetname");
orgy = getEnt("start_bursh_origin","targetname");


trig delete();
model delete();
brush delete();
	
}
	
light_flash()
{
brush = getentarray("flash_brush","targetname");
model = getentarray("flash_model","targetname");

time = RandomIntRange( 2, 5 );
numb = RandomIntRange( 2, 4 );
	for(;;)
	{
	wait 0.05;
		for(i=0;i<numb;i++)
		{
			for(i=0;i<brush.size;i++)
			{
			brush[i] moveZ(-36,0.05);
			}	
			for(i=0;i<model.size;i++)
			{
			model[i] setmodel("me_lightfluohang");
			}	
		wait 0.2;
			for(i=0;i<brush.size;i++)
			{
			brush[i] moveZ(-36,0.05);
			}
		wait 0.05;
			for(i=0;i<model.size;i++)
			{
			model[i] setmodel("me_lightfluohang_on");
			}	
		wait 0.2;
	}
	wait 1;
	}
	wait 0.05;
}

streetlight()
{
lamp=getentarray("ch_streetlight_02_FX_origin","targetname");
for(i=0;i<lamp.size;i++)
{
playfx(level.streetlights,lamp[i].origin);
wait 0.5;
}
}

dust_room_a()
{
dust=getentarray("dust_room_a","targetname");
for(i=0;i<dust.size;i++)
{
playfx(level.dust_room_a,dust[i].origin);
wait 0.5;
}
}

dust_room_b()
{
dust=getentarray("dust_room_b","targetname");
for(i=0;i<dust.size;i++)
{
playfx(level.dust_room_b,dust[i].origin);
wait 0.5;
}
}

dust_room_c()
{
dust=getentarray("dust_room_c","targetname");
for(i=0;i<dust.size;i++)
{
playfx(level.dust_room_c,dust[i].origin);
wait 0.5;
}
}

fog_a()
{
fog=getentarray("fog_a","targetname");
for(i=0;i<fog.size;i++)
{
playfx(level.fog_a,fog[i].origin);
wait 0.5;
}
}

fog_b()
{
fog=getentarray("fog_b","targetname");
for(i=0;i<fog.size;i++)
{
playfx(level.fog_b,fog[i].origin);
wait 0.5;
}
}

dust_a()
{
dust=getentarray("dust_a","targetname");
for(i=0;i<dust.size;i++)
{
playfx(level.dust_a,dust[i].origin);
wait 0.5;
}
}

dust_b()
{
dust=getentarray("dust_b","targetname");
for(i=0;i<dust.size;i++)
{
playfx(level.dust_b,dust[i].origin);
wait 0.5;
}
}

dust_c()
{
dust=getentarray("dust_c","targetname");
for(i=0;i<dust.size;i++)
{
playfx(level.dust_c,dust[i].origin);
wait 0.5;
}
}

dust_d()
{
dust=getentarray("dust_d","targetname");
for(i=0;i<dust.size;i++)
{
playfx(level.dust_d,dust[i].origin);
wait 0.5;
}
}

grim()
{	
trig = getEnt("grim_trigger","targetname");
	while(true)
	{
		trig waittill("trigger",player);
		player thread grim_player();
		wait 5.2;
	}
wait 0.05;
}

grim_player()
{
	self takeAllWeapons();
	wait 0.05;
	self giveWeapon("building_mp");
	self SetWeaponAmmoClip( "building_mp", 0 );
	wait 0.05;
	self switchToWeapon("building_mp");
	wait 5;
	self giveWeapon("gr_mp");
	self giveMaxAmmo("gr_mp");
	self takeWeapon("building_mp");
}


perk_machine()
{
    level.perk[0] = "bo2_vending_soh";
    level.perk[1] = "bo2_vending_double_tap";
    level.perk[2] = "bo2_vending_marathon";
    level.perk[3] = "bo2_vending_jugger";
	
	orgy = getEnt("perk_orgin","targetname");	
	model = getEnt("perk_model","targetname");
	trig = getEnt("perk_trigger","targetname");
	model hide();
	
	level waittill("round_started");
	model show();
	playfx(level.lightning,orgy.origin);
	orgy PlaySound("debris");
	model moveZ(-512,2.5,0,1);
	level.randomPerkChosen = randomInt(level.perk.size);
	for(i=0;i<5;i++)
		{
		model setModel(level.perk[randomInt(level.perk.size)]);
		wait 0.4;
		}
	model setModel(level.perk[level.randomPerkChosen]);
	wait 0.5;

	trig SetHintString("^7Press ^3[&&1] ^7for a Perk");
	trig SetCursorHint( "HINT_ACTIVATE" );
	perkName = level.perk[level.randomPerkChosen];
	playfx(level.perkLight,orgy.origin);
	thread Soundlooper(perkName);
	while(true)
	{
	trig waittill("trigger",owner);
	owner thread perk_addition(perkName);
	wait 0.05;
	}
wait 0.05;
}

Soundlooper(perkName)
{
	orgy = getEnt("perk_orgin","targetname");
	soundName = perkName;
	for(;;)
	{
	orgy PlaySound(soundName);
	wait 65;
	}
	wait 0.05;
}

perk_addition(Name)
{
self.perk = Name;
self.perkNumber++;
	if(self.perk == "bo2_vending_soh" && self.soh == false)
	{
	self.soh = true;
	self thread perkIcon(Name);
	self giveWeapon("bo2_vending_soh_mp");
	self switchToWeapon("bo2_vending_soh_mp");
	wait 2;
	self takeWeapon("bo2_vending_soh_mp");
	}
	if(self.perk == "bo2_vending_double_tap" && self.double_tap == false)
	{
	self.double_tap = true;
	self thread perkIcon(Name);
	self giveWeapon("bo2_vending_doubletap_mp");
	self switchToWeapon("bo2_vending_doubletap_mp");
	wait 2;
	self takeWeapon("bo2_vending_doubletap_mp");
	}
	if(self.perk == "bo2_vending_marathon" && self.marathon == false)
	{
	self.marathon = true;
	self thread perkIcon(Name);
	self giveWeapon("bo2_vending_marathon_mp");
	self switchToWeapon("bo2_vending_marathon_mp");
	wait 2;
	self takeWeapon("bo2_vending_marathon_mp");	
	}
	if(self.perk == "bo2_vending_jugger" && self.jugger == false)
	{
	self.jugger = true;
	self thread perkIcon(Name);
	self giveWeapon("bo2_vending_jugg_mp");
	self switchToWeapon("bo2_vending_jugg_mp");
	wait 2;
	self takeWeapon("bo2_vending_jugg_mp");
	}
	wait 0.05;
}

perkIcon(icon)
{
	if(self.perkNumber == 1)
	{
	self.perkImg1 = newHudElem();
	self.perkImg1.alignx = "left";
	self.perkImg1.alignY = "top";
    self.perkImg1.horzAlign = "left";
    self.perkImg1.vertAlign = "top";
	self.perkImg1.x = 10;
	self.perkImg1.y = 430;
	self.perkImg1 SetShader(icon, 40, 40);	
	}
	if(self.perkNumber == 2)
	{
	self.perkImg2 = newHudElem();
	self.perkImg2.alignx = "left";
	self.perkImg2.alignY = "top";
    self.perkImg2.horzAlign = "left";
    self.perkImg2.vertAlign = "top";
	self.perkImg2.x = 60;
	self.perkImg2.y = 430;
	self.perkImg2 SetShader(icon, 40, 40);	
	}
	if(self.perkNumber == 3)
	{
	self.perkImg3 = newHudElem();
	self.perkImg3.alignx = "left";
	self.perkImg3.alignY = "top";
    self.perkImg3.horzAlign = "left";
    self.perkImg3.vertAlign = "top";
	self.perkImg3.x = 110;
	self.perkImg3.y = 430;
	self.perkImg3 SetShader(icon, 40, 40);	
	}
	if(self.perkNumber == 4)
	{
	self.perkImg4 = newHudElem();
	self.perkImg4.alignx = "left";
	self.perkImg4.alignY = "top";
    self.perkImg4.horzAlign = "left";
    self.perkImg4.vertAlign = "top";
	self.perkImg4.x = 160;
	self.perkImg4.y = 430;
	self.perkImg4 SetShader(icon, 40, 40);	
	}
}

/////////////////////////////////////////////////////////////////////
/////////////////////Booster/////////////////////////////////////

booster()
{

    windtrigs = getentarray("boost_trigger", "targetname");
	for(i=0;i<windtrigs.size;i++)
	{
	windtrigs[i] thread booster_sub(); 
	}
	wait 0.5;
}

booster_sub()
{
	for(;;)
	{
	self waittill("trigger",player);
	player transmit(1000,12);
	wait 0.05;
	}
	wait 1;
}	


transmit(force,gravity)
{
self.origin = self getorigin();

self.bh += force;	

			bounceFrom = (self.origin - vector_scal( anglesToForward( self.angles ), gravity )) - (0,0,42);
			bounceFrom = vectorNormalize( self.origin - bounceFrom );
			self bouncezer( bounceFrom, self.bh );
			self bouncezer( bounceFrom, self.bh );
			self bouncezer( bounceFrom, self.bh ); 
			wait 0.1;
          
				
}

bouncezer( pos, power )
{
	oldhp = self.health;
	self.health = self.health + power;
	self finishPlayerDamage( self, self, power, 0, "MOD_PROJECTILE", "bh_mp", undefined, pos, "none", 0 );
	self.health = oldhp;
	
}

vector_scal(vec, scale) 
{
        vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
        return vec;
}

///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////TRAPS/////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
} 

trap_activation()
{
	tagger = getentarray( "trap_trigger", "targetname" );
	level waittill("round_started");

	for(i=0;i<tagger.size;i++)
	{
	tagger[i] thread trap_execute();
	}
	wait 1;
}

trap_execute()
{ 
    model = getent(self.target, "targetname");
    orgy = getent(model.target, "targetname");
	wait 0.5;
	self SetHintString("^7Press ^3[&&1] ^7To Activate");
	self waittill("trigger",player);
	orgy PlaySound("laugh");
	model setModel("com_laptop_generic_open");
	self SetHintString("^7Activated");
	wait 0.5;
}


trap1()
{
//	level waittill("round_started");

	trig=getent("trap1_trigger","targetname");	
	//fxer=getent("trap1_fx","targetname");	
	hurt1=getent("ghost1_hurt","targetname");
	hurt2=getent("ghost2_hurt","targetname");
	hurt3=getent("ghost3_hurt","targetname");
	hurt4=getent("ghost4_hurt","targetname");
	hurt5=getent("ghost5_hurt","targetname");
	model1=getent("ghost1_model","targetname");
	model2=getent("ghost2_model","targetname");
	model3=getent("ghost3_model","targetname");
	model4=getent("ghost4_model","targetname");
	model5=getent("ghost5_model","targetname");
	
	thread linker();
	trig waittill("trigger", player);
	{
	iPrintLn("^3[Room Selection Open]");
	wait 0.5;
	//playfx(level.ghost_spawn,fxer.origin);
	model3 moveZ(128,3);
	wait 1;
	model2 moveZ(128,3);
	model4 moveZ(128,3);
	wait 1;
	model1 moveZ(128,3);
	model5 moveZ(128,3);
	wait 1.5;
	model3 thread attackPlayer();
	hurt3 thread damangetaken(model3);
	wait 1;
	model2 thread attackPlayer();
	model4 thread attackPlayer();
	hurt2 thread damangetaken(model2);
	hurt4 thread damangetaken(model4);
	wait 1;
	model1 thread attackPlayer();
	model5 thread attackPlayer();
	hurt1 thread damangetaken(model1);
	hurt5 thread damangetaken(model5);
	}
	wait 0.5;
}

linker()
{
	hurt1=getent("ghost1_hurt","targetname");
	hurt2=getent("ghost2_hurt","targetname");
	hurt3=getent("ghost3_hurt","targetname");
	hurt4=getent("ghost4_hurt","targetname");
	hurt5=getent("ghost5_hurt","targetname");
	model1=getent("ghost1_model","targetname");
	model2=getent("ghost2_model","targetname");
	model3=getent("ghost3_model","targetname");
	model4=getent("ghost4_model","targetname");
	model5=getent("ghost5_model","targetname");
	
    hurt1 enablelinkto();
    hurt2 enablelinkto();
    hurt3 enablelinkto();
    hurt4 enablelinkto();
    hurt5 enablelinkto();
    hurt1 linkto(model1);
    hurt2 linkto(model2);
    hurt3 linkto(model3);
    hurt4 linkto(model4);
    hurt5 linkto(model5);	
}

damangetaken(model)
{
    //while(self.maxhealth > 0)
    //{
        self waittill("trigger");
		wait 0.5;
    iprintln("Hit");
        self waittill("trigger");
		wait 0.5;
    iprintln("Hit");
        self waittill("trigger");
		wait 0.5;
    iprintln("Hit");
        self waittill("trigger");
		wait 0.5;
    iprintln("Hit");
        self waittill("trigger");
		wait 0.5;
    iprintln("Hit");
        self waittill("trigger");
		wait 0.5;
    iprintln("Ghost Killed");
        wait 0.1;
    //}
    model delete();
    model notify("ghost_killed");
}

getAllPlayers()
{
	return getEntArray( "player", "classname" );
}


attackPlayer()
{
	self endon("ghost_killed");

    iprintlnbold("attackPlayer");
    players=getAllPlayers();
    maxplayers=0;
    for(i=0;i<players.size;i++)
        maxplayers++;

    rand = randomint(maxplayers);

    for(;;)
    {
        if(isdefined(players[rand]) && isalive(players[rand]) && players[rand].pers["team"] == "allies")
        {
            newLocation = players[rand] getorigin();
            currentLocation = self getorigin();

            dist = distance(currentLocation,newLocation);
            if(dist<150)
                radiusdamage(self.origin,150,35,15);

            self moveto(newLocation,(dist/150));
            self.angles =(vectortoangles((players[rand].origin)-(self.origin)));
        }
        wait 0.1;
    }
}

////////////////////////////////////////////////////////////
trap2()
{
trig	= getent("trap2_trigger","targetname");
tp_trig	= getent("trap2_teleport_trigger","targetname");
target	= getent("trap2_target","targetname");
fx1	= getent("trap2_exit_fx","targetname");
fx2	= getent("trap2_start_fx1","targetname");
fx3	= getent("trap2_start_fx2","targetname");

//level waittill("round_started");

trig waittill("trigger");
playfx(level.trap_teleport,target.origin);
playfx(level.trap_teleport,fx1.origin);
playfx(level.trap_teleport,fx2.origin);
playfx(level.trap_teleport,fx3.origin);

	for(;;)
	{
	tp_trig waittill("trigger",player);
	player SetPlayerAngles( target.angles );
	player setOrigin( target.origin );	
	wait 0.05;
	}
}


trap2_1()
{
trig	= getent("trap2_1_trigger","targetname");
brush1	= getent("trap2_1_brush1","targetname");
brush2	= getent("trap2_1_brush2","targetname");
//level waittill("round_started");

trig waittill("trigger");

brush1 moveZ(-100,3,1,1);
brush2 moveZ(-100,3,1,1);
wait 3;
brush2 moveZ(100,3,1,1);
wait 3;
	for(;;)
	{
	brush1 moveZ(100,3,1,1);
	brush2 moveZ(-100,3,1,1);
	wait 3;
	brush1 moveZ(-100,3,1,1);
	brush2 moveZ(100,3,1,1);
	wait 3;
	}
	wait 0.05;
}

trap2_2()
{
trig	= getent("trap2_2_trigger","targetname");
brush	= getent("trap2_2_brush","targetname");

//level waittill("round_started");

trig waittill("trigger");

brush moveY(75,3,1,1);
wait 3;
	for(;;)
	{
	brush moveY(-150,3,1,1);
	wait 3;
	brush moveY(150,3,1,1);
	wait 3;
	}
}
///////////////////////////////////////////////////////////////////////////////////////////
trap3()
{
trig	= getent("trap3_trigger","targetname");
randombrush = [];
randombrush[0]	= getent("trap3_brush1","targetname");
randombrush[1]	= getent("trap3_brush2","targetname");

//level waittill("round_started");

trig waittill("trigger",player);

	iprintlnbold("test");
	randombrush[randomInt(randombrush.size)] moveZ(-140,2,1);
	wait 1;
}

/*
trap3()
{
trig	= getent("trap3_trigger","targetname");

randomBrush1	= getent("trap3_brush1","targetname");
randomBrush2	= getent("trap3_brush2","targetname");

//level waittill("round_started");

trig waittill("trigger");

		x = randomint(2);
		switch(x)
		{
			case 0:
			randomBrush1 moveZ(-140,2,1);
			break;

			case 1:
			randomBrush2 moveZ(-140,2,1);
			break;

		}
	wait 1;
}
*/

trap4()
{
trig	= getent("trap4_trigger","targetname");
brush	= getent("trap4_brush","targetname");

//level waittill("round_started");

trig waittill("trigger");

	for(;;)
	{
	brush rotateyaw(360,2);
	wait 2;
	}
}

trap5()
{
trig	= getent("trap5_trigger","targetname");
brush	= getent("trap5_brush","targetname");
hurt	= getent("trap5_hurt","targetname");
//level waittill("round_started");

trig waittill("trigger");
hurt enableLinkTo();
hurt linkTo(brush);

	for(;;)
	{
	brush moveZ(-137,1.2,0.7);
	brush waittill("movedone");
	wait 0.05;
	brush moveZ(137,1,0.4);
	brush waittill("movedone");
	wait 0.5;
	}
}


trap6()
{
trig	= getent("trap6_trigger","targetname");
brush1	= getent("trap6_brush1","targetname");
brush2	= getent("trap6_brush2","targetname");
brush3	= getent("trap6_brush3","targetname");

//level waittill("round_started");

	trig waittill("trigger");
	brush1 rotatepitch(15,0.75,0.5,0.25);
	brush2 rotatepitch(-15,0.75,0.5,0.25);
	brush3 rotatepitch(15,0.75,0.5,0.25);
	wait 0.75;
	for(;;)
	{
	brush1 rotatepitch(-30,1.5,1,0.5);
	brush2 rotatepitch(30,1.5,1,0.5);
	brush3 rotatepitch(-30,1.5,1,0.5);
	wait 1.5;
	brush1 rotatepitch(30,1.5,1,0.5);
	brush2 rotatepitch(-30,1.5,1,0.5);
	brush3 rotatepitch(30,1.5,1,0.5);
	wait 1.5;
	}
	wait 1;
}

trap7()
{
trig	= getent("trap7_trigger","targetname");
brush1	= getent("trap7_brush1","targetname");
brush2	= getent("trap7_brush2","targetname");

//level waittill("round_started");

	trig waittill("trigger");
	for(;;)
	{
	brush1 rotatepitch(360,2.4);
	brush2 rotatepitch(360,2.4);
	wait 2.4;
	}
	wait 1;
}

trap8()
{
trig	= getent("trap8_trigger","targetname");
brush1	= getent("trap8_brush1","targetname");
brush2	= getent("trap8_brush2","targetname");

//level waittill("round_started");

	trig waittill("trigger");
brush1 moveX(64,0.75,0.5,0.25);
brush2 moveX(-64,0.75,0.5,0.25);
wait 0.75;
	for(;;)
	{
	brush1 moveX(-128,1.5,1,0.5);
	brush2 moveX(128,1.5,1,0.5);
	wait 1.5;
	brush1 moveX(128,1.5,1,0.5);
	brush2 moveX(-128,1.5,1,0.5);
	wait 1.5;
	}
}

trap9()
{
trig	= getent("trap9_trigger","targetname");
randombrusher = [];
randombrusher[0]	= getent("trap9_brush1","targetname");
randombrusher[1]	= getent("trap9_brush2","targetname");

//level waittill("round_started");

trig waittill("trigger",player);
	iprintlnbold("test");
	for(;;)
	{
	randombrusher[randomInt(randombrusher.size)] rotatepitch(-360,2);
	wait 2;
}
}

trap10()
{
trig	= getent("trap10_trigger","targetname");
brush	= getent("trap10_brush","targetname");
//level waittill("round_started");

trig waittill("trigger");

	brush moveZ(-60,0.6,0.3,0.3);
	for(;;)
	{
	brush moveZ(120,1.2,0.6,0.6);
	wait 1.2;
	brush moveZ(-120,1.2,0.6,0.6);
	wait 1.2;
	}
}

///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////CLIENTS/////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

OnPlayerConnect()
{
    level endon("game_ended");
	for(;;)
{
    level waittill("connected", player);
    player thread OnPlayerSpawned();
}
}

OnPlayerSpawned() 
{	
    self waittill("spawned_player");
	self.perkNumber = 0;
	self.soh = false;
	self.double_tap = false;
	self.marathon = false;
	self.jugger = false;
	self.perkImg1 Destroy();
	self.perkImg2 Destroy();
	self.perkImg3 Destroy();
	self.perkImg4 Destroy();
    self endon("disconnect");
    self thread screaming();
    self thread spawn_loop();
}


screaming()
{
while(true)
	{
	self waittill("death");
	self playsound("screaming");
	self.perkNumber = 0;
	self.soh = false;
	self.double_tap = false;
	self.marathon = false;
	self.jugger = false;
	self.perkImg1 Destroy();
	self.perkImg2 Destroy();
	self.perkImg3 Destroy();
	self.perkImg4 Destroy();
	wait 0.05;
	}
}

spawn_loop()
{
while(true)
	{
	self waittill("death");
	wait 0.5;
	self.perkNumber = 0;
	self.soh = false;
	self.double_tap = false;
	self.marathon = false;
	self.jugger = false;
	self.perkImg1 Destroy();
	self.perkImg2 Destroy();
	self.perkImg3 Destroy();
	self.perkImg4 Destroy();
	wait 0.05;
	}
}


playersAlive()
{
	level waittill("round_started");
//	level.ghost_spawns = 10;
	players = getentarray("player", "classname");
	level.ghost_spawns = 0;
	
	for(i=0;i<players.size;i++)
	{
	players[i] thread checkAlive();
	}
	wait 0.05;
}


checkAlive()
{
	if(IsAlive(self))
	{
	level.ghost_spawns++;
	self thread player_death();
	iprintlnbold(level.ghost_spawns);
	wait 0.05;
	}
}

player_death()
{
	self waittill("death");
	level.ghost_spawns--;
    iprintlnbold(level.ghost_spawns);
}