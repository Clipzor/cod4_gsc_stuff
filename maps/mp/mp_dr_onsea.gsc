main()
{	
       	maps\mp\_load::main();
      
	  //ambientPlay("ambient_12");
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar("r_specularcolorscale","1");
    setdvar("r_glowbloomintensity0",".1");
    setdvar("r_glowbloomintensity1",".1");
    setdvar("r_glowskybleedintensity0",".1");
	level.firstenter=true;
	level.exp_fx = LoadFx("explosions/jeepride_bridge_explosion");
	precacheItem("m40a3_mp");
	
	 entTransporter = getentarray("enter","targetname");
  if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter();
   }  
       
	  entTransporter2 = getentarray("goin","targetname"); 
  if(isdefined(entTransporter2)) 
  { 
    for(lp=0;lp<entTransporter2.size;lp=lp+1) 
      entTransporter2[lp] thread Transporter2(); 
  }  
	 
	 entTransporter3 = getentarray("getin","targetname"); 
  if(isdefined(entTransporter3)) 
  { 
    for(lp=0;lp<entTransporter3.size;lp=lp+1) 
      entTransporter3[lp] thread Transporter3(); 
  } 
  
  entTransporter4 = getentarray("tele","targetname");
  if(isdefined(entTransporter4))
  {
    for(lp=0;lp<entTransporter4.size;lp=lp+1)
      entTransporter4[lp] thread Transporter4();
   }
    thread staratGame();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
    thread trap10();
	thread fail1();
	thread fail2();
	thread fail3();
	thread ammo();
	thread songs();
	thread transporter();
	thread Transporter2();
	thread Transporter3();
	thread Transporter4();
	thread elevator();
	thread elevator10();
	thread creator();
	thread sniper();
	thread weapons();
	thread jumproom();
	
	addTriggerToList( "trap1_trigger" );
	addTriggerToList( "trap2_trigger" );
	addTriggerToList( "trap3_trigger" );
	addTriggerToList( "trap4_trigger" );	
	addTriggerToList( "trap5_trigger" );
	addTriggerToList( "trap6_trigger" );
	addTriggerToList( "trap7_trigger" );
	addTriggerToList( "trap10_trigger" );
	addTriggerToList( "text_trigger" );
	addTriggerToList( "secretdoor_trigger" );
	
}


addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

staratGame()
{
	thread sometraps();
}

sometraps()
{
	level.trapTriggers[0] = GetEnt("sniperammo_trig", "targetname");
	level.trapTriggers[1] = GetEnt("trap8_trigger", "targetname");
	level.trapTriggers[2] = GetEnt("trap9_trigger", "targetname");
	level.trapTriggers[3] = GetEnt("fov_trig", "targetname");
	level.trapTriggers[4] = GetEnt("normalfov_trig", "targetname");
	
	level.trapTriggers[0] thread ammo();
	level.trapTriggers[1] thread trap8();
	level.trapTriggers[2] thread trap9();
	level.trapTriggers[3] thread fovscale();
	level.trapTriggers[4] thread fovscale2();
}
	
	
trap1() 

   {
    trigger = getent( "trap1_trigger", "targetname" );
	rock01 = getent( "rock1", "targetname" );
	rock02 = getent( "rock2", "targetname" );
	rock03 = getent( "rock3", "targetname" );
	rock04 = getent( "rock4", "targetname" );
	rock05 = getent( "rock5", "targetname" );
		
	trigger waittill("trigger", player);
	trigger delete();
	
	while(1)
	{
	rock04 rotateYaw( 720, 3 ); 
	rock05 rotateYaw( 720, 3 );
	rock01 movez (160,3);
	rock02 movez(-152,3);
	rock03 movez(168,3);
	wait 3;
	rock04 rotateYaw( 720, 3 ); 
	rock05 rotateYaw( 720, 3 );
	rock01 movez (-160,3);
	rock02 movez(152,3);
	rock03 movez(-168,3);
	wait 3;
	}
   }
   
 trap2() 
   {
  trigger = getent( "trap2_trigger", "targetname" );
  st = getent( "stick", "targetname" );   

  trigger waittill("trigger", player);
  trigger delete();
  
  st rotateroll(80,2);
  wait 1;
  st rotateroll(-145,3.5);
  wait 2;
  st rotateroll(90,1.5);
  wait 2;
  st rotateroll(-80,2);
  wait 2;
  st rotateroll(30,2);
   }  
 
 trap3() 
   {
    trigger = getent( "trap3_trigger", "targetname" );
    cir1 = getEnt("circul1", "targetname");
	cir2 = getEnt("circul2", "targetname");
	cir3 = getEnt("circul3", "targetname");
	cir4 = getEnt("circul4", "targetname");
	cir5 = getEnt("circul5", "targetname");
	cir6 = getEnt("circul6", "targetname");
	
	trigger waittill("trigger", player);
	trigger delete();
	
	while(1)
 {
    cir1 RotateYaw( 360, 1);
	wait 0.05;
	cir2 RotateYaw( -360, 2);
	wait 0.05;
	cir3 RotateYaw( 360, 1);
	wait 0.05;
	cir4 RotateYaw( -360, 2);
	wait 0.05;
	cir5 RotateYaw( 360, 1);
	wait 0.05;
	cir6 RotateYaw( -360, 2);
	wait 0.05;
 }
  }
  
 trap4() 
   {
    trigger = getent( "trap4_trigger", "targetname" );
    bounce = getEnt("bouncemove", "targetname");
	spike = getEnt("spikes", "targetname");
	hurt02 = getEnt("hurt2", "targetname");
	
	hurt02 enableLinkTo();
	hurt02 linkTo( spike );
	trigger waittill("trigger", player);
	trigger delete();
	
	spike movez(82,2);
	wait 2;
	spike movez(-82,2);
    wait 2;
	
	while(1)
 {
    bounce movex(276,2);
    bounce waittill ("movedone");
	wait 0.5;
	bounce movex(-276,2);
	bounce waittill ("movedone");
	wait 0.5;
 }	 
  }
  
  trap5() 
   {
    trigger = getent( "trap5_trigger", "targetname" );
    rocka01 = getEnt("rocka1", "targetname");
	rocka02 = getEnt("rocka2", "targetname");
	rocka03 = getEnt("rocka3", "targetname");
	rocka04 = getEnt("rocka4", "targetname");
	rocka05 = getEnt("rocka5", "targetname");
	rock011 = getEnt("rock11", "targetname");
	rock022 = getEnt("rock22", "targetname");
	rock033 = getEnt("rock33", "targetname");
	rock044 = getEnt("rock44", "targetname");
	rock055 = getEnt("rock55", "targetname");
	plate01 = getEnt("plate1", "targetname");
	plate02 = getEnt("plate2", "targetname");
	
	trigger waittill("trigger", player);
	trigger delete();
	
	while(1)
 {
    rocka01 movex( -260, 3);
	rocka02 movex( 260, 2);
	rocka03 movex( -260, 3.5);
	rocka04 movex( 260, 2.5);
	rocka05 movex( -260, 3);
	rock011 movex( -260, 3.5);
	rock022 movex( 260, 2.5);
	rock033 movex( -260, 3);
	rock044 movex( 260, 3.5);
	rock055 movex( -260, 3);
	plate01 movez( 96, 2);
	plate02 movez( -96, 3);
	wait 3;
    rocka01 movex( 260, 3);
	rocka02 movex( -260, 2);
	rocka03 movex( 260, 3.5);
	rocka04 movex( -260, 2.5);
	rocka05 movex( 260, 3);
	rock011 movex( 260, 3.5);
	rock022 movex( -260, 2.5);
	rock033 movex( 260, 3);
	rock044 movex( -260, 3.5);
	rock055 movex( 260, 3);
	plate01 movez( -96, 2);
	plate02 movez( 96, 3);
	wait 3;
 }
  }
 
trap6() 
   {
    trigger = getent( "trap6_trigger", "targetname" );
    plate1 = getEnt("plate90", "targetname");
	plate2 = getEnt("plate91", "targetname");
	plate3 = getEnt("plate92", "targetname");

	trigger waittill("trigger", player);
	trigger delete();
	
	plate1 movez( 64, 2);
	plate3 movez( 40, 2);
	
	while(1)
 {
    plate1 movez( -120, 2);
	plate2 movez( 50, 2);
	plate3 movez( -80, 2);
	wait 2;
	plate1 movez( 120, 2);
	plate2 movez( -50, 2);
	plate3 movez( 80, 2);
	wait 2;
 }
	}
	
trap7() 
   {
    trigger = getent( "trap7_trigger", "targetname" );
    a = getEnt("a1", "targetname");
	b = getEnt("b1", "targetname");
	c = getEnt("c1", "targetname");
	d = getEnt("d1", "targetname");
	e = getEnt("e1", "targetname");
	f = getEnt("f1", "targetname");
	j = getEnt("j1", "targetname");
	h = getEnt("h1", "targetname");
	
	trigger waittill("trigger", player);
	trigger delete();
	
	a rotatePitch (90, 3);
	b rotatePitch (90, 3);
	c rotatePitch (90, 3);
	d rotatePitch (90, 3);
	e rotatePitch (90, 3);
	f rotatePitch (90, 3);
	j rotatePitch (90, 3);
	h rotatePitch (90, 3);
	wait 5;
	a rotatePitch (270, 3);
	b rotatePitch (270, 3);
	c rotatePitch (270, 3);
	d rotatePitch (270, 3);
	e rotatePitch (270, 3);
	f rotatePitch (270, 3);
	j rotatePitch (270, 3);
	h rotatePitch (270, 3);
	wait 3;
	}


trap8()
{
    trig = getEnt( "trap8_trigger", "targetname" );
	fall01 = getEnt( "fall1", "targetname" );
	hurt1 = getEnt ("fall01_hurt", "targetname");
	origin = getEnt ("fall_origin", "targetname");
	fall02 = getEnt( "fall2", "targetname" );
	hurt2 = getEnt ("fall02_hurt", "targetname");
	origin2 = getEnt ("fall2_origin", "targetname");
	fall03 = getEnt( "fall3", "targetname" );
	hurt3 = getEnt ("fall03_hurt", "targetname");
	origin3 = getEnt ("fall3_origin", "targetname");
	fall04 = getEnt( "fall4", "targetname" );
	hurt4 = getEnt ("fall04_hurt", "targetname");
	origin4 = getEnt ("fall4_origin", "targetname");
	
	hurt1 enableLinkTo();
	hurt1 linkTo( fall01 );
	hurt2 enableLinkTo();
	hurt2 linkTo( fall02 );
	hurt3 enableLinkTo();
	hurt3 linkTo( fall03 );
	hurt4 enableLinkTo();
	hurt4 linkTo( fall04 );
	for(;;)
	{
	    trig waittill ("trigger", player);
		trig delete();
		
		fall01 moveTo( origin.origin, 1 );
		fall01 rotateTo( origin.angles, 1 );
		wait 0.5;
		origin PlaySound("mrk_rockexplosion_layer");
		wait 0.5;
		Earthquake( 2, 1, origin.origin, 500 );
		wait 1;
		fall01 delete();
		wait 0.5;
		hurt1 delete();
		fall04 moveTo( origin4.origin, 1 );
		fall04 rotateTo( origin4.angles, 1 );
		wait 0.5;
		origin4 PlaySound("mrk_rockexplosion_layer");
		wait 0.5;
		Earthquake( 2, 1, origin4.origin, 500 );
		wait 1;
		fall04 delete();
		wait 0.5;
		hurt4 delete();
		fall02 moveTo( origin2.origin, 1 );
		fall02 rotateTo( origin2.angles, 1 );
		wait 0.5;
		origin2 PlaySound("mrk_rockexplosion_layer");
		wait 0.5;
		Earthquake( 2, 1, origin2.origin, 500 );
		wait 1;
		fall02 delete();
		wait 0.5;
		hurt2 delete();
		fall03 moveTo( origin3.origin, 1 );
		fall03 rotateTo( origin3.angles, 1 );
		wait 0.5;
		origin3 PlaySound("mrk_rockexplosion_layer");
		wait 0.5;
		Earthquake( 2, 1, origin3.origin, 1000 );
		wait 1;
		fall03 delete();
		wait 0.5;
		hurt3 delete();
		break;
	}
}

trap9()
{
    exp01 = getEnt("expl1","targetname");
	origin1 = getEnt ("exp1_origin","targetname");
	exp02 = getEnt ("exp2","targetname");
	origin2 = getEnt("exp2_origin","targetname");
	exp03 = getEnt("exp3","targetname");
	origin3 = getEnt ("exp3_origin","targetname");
	dmg1 = getEnt("damage1","targetname");
	dmg2 = getEnt("damage2","targetname");
	dmg3 = getEnt("damage3","targetname");
	
	self waittill ("trigger", player);
	self delete();
	
    origin1 PlaySound ("exp");
	wait 0.1;
	PlayFX( level.exp_fx, origin1.origin );
	wait 0.1;
	RadiusDamage( dmg1.origin, 135, 150, 70);
	wait 0.1;
	Earthquake( 2, 1, origin1.origin, 250 );
    wait 0.1;
    exp01 delete();
	wait 1;
	origin2 PlaySound ("exp");
	wait 0.1;
	PlayFX( level.exp_fx, origin2.origin );
	wait 0.1;
	RadiusDamage( dmg2.origin, 135, 150, 200);
	wait 0.1;
	Earthquake( 2, 1, origin2.origin, 250 );
    wait 0.1;
    exp02 delete();
	wait 1;
	origin3 PlaySound ("exp");
	wait 0.1;
	PlayFX( level.exp_fx, origin3.origin );
	wait 0.1;
	RadiusDamage( dmg3.origin, 135, 150, 70);
	wait 0.1;
	Earthquake( 2, 1, origin3.origin, 250 );
    wait 0.1;
    exp03 delete();
}	
	
trap10() 
   {
    trigger = getent( "trap10_trigger", "targetname" );
	
	trigger waittill("trigger", player);
	trigger delete();
	
	if ( randomInt(99)%2 == 0 )
    thread t10_2();
    else
    thread t10_1();
	}
	
t10_2()	
	{
	remove1 = getEnt("move1", "targetname");
	remove1 delete();
	}
	
t10_1()	
	{
	remove2 = getEnt("move2", "targetname");
	remove2 delete();
	}
   	
fail1()
{
    trig = getEnt ("rf1_trigger", "targetname");
    rf01 = getEnt ("auto56", "targetname");

    
    while(1)
    {
        trig waittill ("trigger", player);  
        player SetOrigin(rf01.origin);
        player SetPlayerAngles( rf01.angles );
	}
}

fail2()
{
    trig = getEnt ("rf2_trigger", "targetname");
    rf02 = getEnt ("auto57", "targetname");

    
    while(1)
    {
        trig waittill ("trigger", player);  
        player SetOrigin(rf02.origin);
        player SetPlayerAngles( rf02.angles );
	}
}

fail3()
{
    trig = getEnt ("secretres_trig", "targetname");
    rf03 = getEnt ("auto58", "targetname");

    
    while(1)
    {
        trig waittill ("trigger", player);  
        player SetOrigin(rf03.origin);
        player SetPlayerAngles( rf03.angles );
	}
}

fovscale()
	{	
	self waittill ("trigger", other);
	
	other setClientDvar( "cg_fovscale", "1.25" );	
	//other.used = true;
   }

 fovscale2()
	{
	self waittill ("trigger", other);
	
	other setClientDvar( "cg_fovscale", "1" );
	//other.used = true;
   }
   
ammo() 
   {
	self waittill("trigger", player);
	wait 4;
	player giveMaxammo("m40a3_mp");
	}
	
creator()
   {
     say = getent("mapby", "targetname");
	 
	 trigger = getent( "mapby_trig", "targetname" );
	 
	 trigger waittill("trigger", player);
	 
	 wait 10;
	iPrintLnBold("^2Map by ^5IceOps|*V*");
	}

songs()
{
	wait 5;
	musicplay = randomIntRange(0,8);
	
	if(musicplay == 1)
	{
		ambientPlay("ambient_2");
	}
	
	if(musicplay == 0)
	
	{
		ambientPlay("ambient_0");
	}
	
	if(musicplay == 2)
	
	{
		ambientPlay("ambient_3");
	}
	
	if(musicplay == 3)
	
	{
		ambientPlay("ambient_2");
	}
	
	if(musicplay == 4)
	{
		ambientPlay("ambient_0");
	}
	
	if(musicplay == 5)
	{
		ambientPlay("ambient_4");
	}
	
	if(musicplay == 6)
	{
		ambientPlay("ambient_3");
	}
	
	if(musicplay == 7)
	{
		ambientPlay("ambient_4");
	}
	
	if(musicplay == 8)
	{
		ambientPlay("ambient_0");
	}
	
	if(musicplay == 9)
	{
		ambientPlay("ambient_2");
	}
	
	if(musicplay == 10)
	{
		ambientPlay("ambient_3");
	}
	
}	
	
elevator()	
{
ele0 = getEnt( "ele", "targetname" );

 while(1)
  {
    ele0 movez(425,4.5);
	wait 4.5;
	ele0 movez(-425,4.5);
    wait 4.5;	
   }
}

elevator10()
   {
elevator1 = getEnt("moveplate", "targetname"); 
hurt1 = getEnt("hurt", "targetname"); 
trigger = getEnt("moveplate_trig", "targetname");
trigger waittill("trigger", player);

hurt1 enablelinkto ();
hurt1 linkto (elevator1);

while(1)
{
wait(0.05);
elevator1 movez(547, 0.6);
elevator1 waittill("movedone");
wait(1);
elevator1 movez(-547, 5);
elevator1 waittill("movedone");
wait(2);
} 
  }


  
transporter()
 {
  while(true)
  {
   self waittill("trigger",other);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   other playsound("mp_enemy_obj_captured");
   iprintlnbold("^3" + other.name + " ^5Has Found Secret^1!");
   wait(0.10);
  }
 } 
 
 Transporter2() 
{ 
  while(true) 
  { 
    self waittill("trigger",other); 
    entTarget = getent(self.target, "targetname"); 

    wait(0.10); 
    other setorigin(entTarget.origin); 
    other setplayerangles(entTarget.angles);
    other playsound("mp_enemy_obj_captured");
    iprintlnbold("^3" + other.name + " ^5Has Finished The Secret^1!");	
    wait(0.10); 
  } 
} 

Transporter3() 
{ 
  while(true) 
  { 
    self waittill("trigger",other); 
    entTarget = getent(self.target, "targetname"); 

    wait(0.10); 
    other setorigin(entTarget.origin); 
    other setplayerangles(entTarget.angles); 
    other playsound("mp_enemy_obj_captured");
	iprintlnbold("^7" + other.name + " Has Found a Shortcut");
    wait(0.10); 
  } 
} 

Transporter4() 
{ 
  while(true) 
  { 
    self waittill("trigger",other); 
    entTarget = getent(self.target, "targetname"); 

    wait(0.10); 
    other setorigin(entTarget.origin); 
    other setplayerangles(entTarget.angles); 
	other playsound("mp_enemy_obj_captured");
    wait(0.10); 
  } 
 } 
 

sniper()
{ 
    level.snipe_trig = getEnt("sniper_trig", "targetname");
    jump = getEnt( "jumps", "targetname" ); 
    acti = getEnt( "actis", "targetname" ); 
	 

        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
        return;
		if(level.firstenter==true)
		{
		level.weapon_trig delete();
		level.jumps_trig delete();
		level.firstenter=false;
		}
		
	 player.health = player.maxhealth;
     level.activ.health = level.activ.maxhealth;		
     player SetPlayerAngles( jump.angles );
	 player setOrigin( jump.origin );
	 level.activ setPlayerangles( acti.angles );
	 level.activ setOrigin( acti.origin );
	 level.activ TakeAllWeapons();
	 player TakeAllWeapons();
	 level.activ giveweapon( "m40a3_mp");
	 level.activ GiveWeapon( "remington700_mp" );
	 player giveweapon( "m40a3_mp");
	 player GiveWeapon( "remington700_mp" );
	 wait 0.05;
	 player switchToWeapon( "m40a3_mp" );
	 level.activ SwitchToWeapon( "m40a3_mp" );
	 iPrintLnBold(player.name+ "^1 has entered the sniper room");
	 level.activ freezeControls(1);
	 player FreezeControls(1);
	 wait 3;
	 level.activ FreezeControls(0);
	 player FreezeControls(0);
     player thread class_sniper();
     wait 0.1;
       
     for(;;)
     {
         wait .1;               
         while(isAlive(player))
         {
             wait 1;
            }
               
     }
}

class_sniper()
{
     self endon("disconnect");
     self waittill("death");
     thread sniper();
}


weapons()
{ 
    level.weapon_trig = getEnt( "weapons_trigger", "targetname");
    jump = getEnt( "jumpg", "targetname" ); 
    acti = getEnt( "actig", "targetname" ); 
	 
	level.weapon_trig waittill( "trigger", player );
        if( !isDefined( level.weapon_trig ) )
        return;
		if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.jumps_trig delete();
		level.firstenter=false;
		}
		
	 player.health = player.maxhealth;
     level.activ.health = level.activ.maxhealth;			
     player SetPlayerAngles( jump.angles );
	 player setOrigin( jump.origin );
	 level.activ setPlayerangles( acti.angles );
	 level.activ setOrigin( acti.origin );
	 level.activ TakeAllWeapons();
	 player TakeAllWeapons();
	 player giveweapon( "ak74u_mp");
	 level.activ giveweapon( "ak74u_mp");
	 player giveMaxAmmo( "ak74u_mp");
	 level.activ giveMaxAmmo( "ak74u_mp");
	 wait 0.05;
	 player switchToWeapon( "ak74u_mp", 100 );
	 level.activ SwitchToWeapon( "ak74u_mp", 100 );
	 iPrintLnBold(player.name+ "^1 has entered the weapon room");
	 level.activ freezeControls(1);
	 player FreezeControls(1);
	 wait 3;
	 level.activ FreezeControls(0);
	 player FreezeControls(0);
     player thread class_weapon();
     wait 0.1;
       
     for(;;)
     {
         wait .1;               
         while(isAlive(player))
         {
             wait 1;
            }
               
     }
}

class_weapon()
{
     self endon("disconnect");
     self waittill("death");
     thread weapons();
}


jumproom()
{
    level.jumps_trig = getEnt( "jump_trig", "targetname"); 
    jump = getEnt( "jumpj", "targetname" ); 
    acti = getEnt( "actij", "targetname" ); 
	 

        level.jumps_trig waittill( "trigger", player );
        if( !isDefined( level.jumps_trig ) )
        return;
		if(level.firstenter==true)
		{
		level.weapon_trig delete();
		level.snipe_trig delete(); 
		level.firstenter=false;
		}
		
	 player.health = player.maxhealth;
     level.activ.health = level.activ.maxhealth;	
     player SetPlayerAngles( jump.angles );
	 player setOrigin( jump.origin );
	 level.activ setPlayerangles( acti.angles );
	 level.activ setOrigin( acti.origin );
	 level.activ TakeAllWeapons();
	 player TakeAllWeapons();
	 level.activ giveweapon( "knife_mp");
	 player giveweapon( "knife_mp");
	 wait 0.05;
	 player switchToWeapon( "knife_mp" );
	 level.activ SwitchToWeapon( "knife_mp" );
	 iPrintLnBold(player.name+ "^1 has entered jump room");
	 level.activ freezeControls(1);
	 player FreezeControls(1);
	 wait 3;
	 level.activ FreezeControls(0);
	 player FreezeControls(0);
     player thread class_jumproom();
     wait 0.1;
       
     for(;;)
     {
         wait .1;               
         while(isAlive(player))
         {
             wait 1;
            }
               
     }
}

class_jumproom()
{
     self endon("disconnect");
     self waittill("death");
     thread jumproom();
}
