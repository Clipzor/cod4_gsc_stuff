//__/\\\\\\\\\\\\\\\______________________________/\\\_______________        
// _\/\\\///////////___________________________/\\\\\\\_______________       
//  _\/\\\_____________________________________\/////\\\_______________      
//  _\/\\\\\\\\\\\____/\\\\\\\\___/\\/\\\\\\_______\/\\\__/\\\____/\\\_     
//    _\/\\\///////___/\\\/////\\\_\/\\\////\\\______\/\\\_\///\\\/\\\/__    
//     _\/\\\_________/\\\\\\\\\\\__\/\\\__\//\\\_____\/\\\___\///\\\/____   
//      _\/\\\________\//\\///////___\/\\\___\/\\\_____\/\\\____/\\\/\\\___  
//       _\/\\\_________\//\\\\\\\\\\_\/\\\___\/\\\_____\/\\\__/\\\/\///\\\_ 
//        _\///___________\//////////__\///____\///______\///__\///____\///__
//

main() {

 maps\mp\_load::main();
 
 
 level.fire = loadFX("fenix/fire");
 level.vatra = loadFX("fire/firelp_vhc_med_pm_noDlight");
 level.oil = loadFX("fire/oil_field_fire");
 level.blue = loadFX("fire/firelp_vhc_lrg_pm_farview");
 level.fog = loadFX("weather/village_cloud_far");
 level.room = loadFX("fenix/pikap");
 level.java = loadFX("explosions/belltower_explosion"); 
 level.tanker = loadFX("tanker_explosion"); 
 level.pyromaniac = loadFX("fenix/pyromaniac");
 level.chicken_fx = LoadFx("explosions/default_explosion");
  
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
 
    setdvar( "r_specularcolorscale", "1" );
    setdvar( "r_glowbloomintensity0", ".25" );
    setdvar( "r_glowbloomintensity1", ".25" );
    setdvar( "r_glowskybleedintensity0", ".3" );
    setdvar( "compassmaxrange", "1800" );
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );
	
	
	playLoopedFX(level.vatra, 0.5, (320, -128, 48));
	playLoopedFX(level.vatra, 0.5, (64, -128, 48));
	playLoopedFX(level.vatra, 0.5, (-1088, -128, 48));
	playLoopedFX(level.vatra, 0.5, (-1344, -128, 48));
	playLoopedFX(level.vatra, 0.5, (-176, 3096, 120));
	playLoopedFX(level.vatra, 0.5, (816, 1840, 56));
	playLoopedFX(level.vatra, 0.5, (800, 1568, 48));
	playLoopedFX(level.vatra, 0.5, (-5848, -7180, -968));
	playLoopedFX(level.vatra, 0.5, (-5848, -6988, -968));
	playLoopedFX(level.vatra, 0.5, (-4856, -6896, -968));
	playLoopedFX(level.vatra, 0.5, (-4856, -7280, -968));
	playLoopedFX(level.vatra, 0.5, (-3864, -7184, -968));
	playLoopedFX(level.vatra, 0.5, (-3864, -6992, -968));
	playLoopedFX(level.vatra, 0.5, (10672, 4976, -968));
	playLoopedFX(level.vatra, 0.5, (10480, 4976, -968));
	playLoopedFX(level.vatra, 0.5, (10480, 6960, -968));
	playLoopedFX(level.vatra, 0.5, (10672, 6960, -968));
	playLoopedFX(level.blue, 0.5, (2664, -1024, 360));
	playLoopedFX(level.blue, 0.5, (1432, -1024, 360));
    playLoopedFX(level.fire, 0.5, (-48, -992, 24));
	playLoopedFX(level.fire, 0.5, (-976, -992, 24));
	playLoopedFX(level.fire, 0.5, (-976, -32, 24));
	playLoopedFX(level.fire, 0.5, (-48, -32, 24));
	playLoopedFX(level.fire, 0.5, (-160, -2128, -512));
	playLoopedFX(level.fire, 0.5, (-864, -2128, -512));
	playLoopedFX(level.oil, 0.5, (4960, -3904, 264));
	playLoopedFX(level.room, 0.5, (2432, -1024, 8));
	playLoopedFX(level.room, 0.5, (2048, -1024, 8));
	playLoopedFX(level.room, 0.5, (1664, -1024, 8));

	

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
    thread hard_mode();
	thread hard_way();
	thread hard_way1();
	thread hard_way2();
	thread hard_way3();
	thread hard_way4();
	thread hard_way5();
	thread hard_way6();
	thread hard_way7();
	thread hard_way8();
	thread hard_way9();
	thread hard_way10();
	thread hard_way11();
	thread teleport();
	thread teleport1();
	thread teleport2();
	thread teleport3();
	thread teleport4(); 
	thread teleport5();
	thread teleport6();
	thread teleport7();
	thread teleport8();
	thread teleport9();
	thread teleport10();
	thread teleport11();
	thread teddy1();
	thread teddy2();
	thread teddy3();
	thread teddy4();
	thread teddy5();
	thread teddy6();
	thread teddy7();
	thread teddy8();
	thread platform(); 
	thread sniper();
	thread knife();
	thread jump();
	thread jump_sniper();
	thread start();
	
 addTriggerToList( "trap1_trig" );
 addTriggerToList( "trap2_trig" );
 addTriggerToList( "trap3_trig" );
 addTriggerToList( "trap4_trig" );
 addTriggerToList( "trap5_trig" ); 
 addTriggerToList( "trap6_trig" ); 
 addTriggerToList( "trap7_trig" ); 
 addTriggerToList( "trap8_trig" ); 
 addTriggerToList( "trap9_trig" ); 
 addTriggerToList( "trap10_trig" ); 
 addTriggerToList( "trap11_trig" ); 
 addTriggerToList( "trap12_trig" ); 

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

hard_mode()
{
	trig = getEnt( "hard_trigger", "targetname" );
	brush1 = getent("hard_brush1", "targetname");
    brush2 = getent("hard_brush2", "targetname");
	doors = getent("doors", "targetname");
	origin1 = getent("hard_origin", "targetname");

{	
	trig waittill ("trigger", player);

	Earthquake( 2.6, 3, origin1.origin, 600 );
	wait 0.3;
	doors moveZ(-136,1);
	brush1 delete();
	origin1 playsound("explo");
	playFx(level.java, origin1.origin);
	brush2 delete();
}
}

hard_way()
{
trig = getEnt( "hard_trig", "targetname" );
laser1 = getent("hard_laser1", "targetname");
laser2 = getent("hard_laser2", "targetname");	
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
	while(1)
	{
	laser1 movex(-88,1);
	laser2 movex(88,1);
	wait 1;
	laser1 movex(88,1);
	laser2 movex(-88,1);
	wait 1;
	laser1 movex(-88,1);
	laser2 movex(88,1);	
	wait 1;
	laser1 movex(88,1);
	laser2 movex(-88,1);	
	wait 1;

	}
}

hard_way1()
{
trig = getEnt( "hard_trig", "targetname" );
laser3 = getent("hard_laser3", "targetname");
laser4 = getent("hard_laser4", "targetname");	
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
	while(1)
	{
	laser3 movex(-88,1);
	laser4 movex(88,1);
	wait 1;
	laser3 movex(88,1);
	laser4 movex(-88,1);
	wait 1;
	laser3 movex(-88,1);
	laser4 movex(88,1);	
	wait 1;
	laser3 movex(88,1);
	laser4 movex(-88,1);	
	wait 1;

	}
}

hard_way2()
{
trig = getEnt( "hard_trig", "targetname" );
laser5 = getent("hard_laser5", "targetname");
laser6 = getent("hard_laser6", "targetname");	
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
	while(1)
	{
	laser5 movex(-88,1);
	laser6 movex(88,1);
	wait 1;
	laser5 movex(88,1);
	laser6 movex(-88,1);
	wait 1;
	laser5 movex(-88,1);
	laser6 movex(88,1);	
	wait 1;
	laser5 movex(88,1);
	laser6 movex(-88,1);	
	wait 1;

	}
}

hard_way3()
{
trig = getEnt( "hard_trig", "targetname" );
laser7 = getent("hard_laser7", "targetname");
laser8 = getent("hard_laser8", "targetname");
hurt1 = getEnt ("trap7_hurt1", "targetname");
hurt2 = getEnt ("trap8_hurt2", "targetname");  
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
    while(1)
    {
    hurt1 enablelinkto();
    hurt1 linkto (laser7);
    hurt2 enablelinkto();
    hurt2 linkto (laser8);
    laser7 movex(-88,1);
    laser8 movex(88,1);
    wait 1;
    laser7 movex(88,1);
    laser8 movex(-88,1);
    wait 1;
    laser7 movex(-88,1);
    laser8 movex(88,1);
    wait 1;
    laser7 movex(88,1);
    laser8 movex(-88,1);   
    wait 1;
 
    }
}

hard_way4()
{
trig = getEnt( "hard_trig", "targetname" );
laser9 = getent("hard_laser9", "targetname");
laser10 = getent("hard_laser10", "targetname");
hurt1 = getEnt ("trap9_hurt1", "targetname");
hurt2 = getEnt ("trap10_hurt2", "targetname");  
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
    while(1)
    {
    hurt1 enablelinkto();
    hurt1 linkto (laser9);
    hurt2 enablelinkto();
    hurt2 linkto (laser10);
    laser9 movex(-88,1);
    laser10 movex(88,1);
    wait 1;
    laser9 movex(88,1);
    laser10 movex(-88,1);
    wait 1;
    laser9 movex(-88,1);
    laser10 movex(88,1);
    wait 1;
    laser9 movex(88,1);
    laser10 movex(-88,1);   
    wait 1;
 
    }
}

hard_way5()
{
trig = getEnt( "hard_trig", "targetname" );
laser11 = getent("hard_laser11", "targetname");
laser12 = getent("hard_laser12", "targetname");
hurt1 = getEnt ("trap11_hurt1", "targetname");
hurt2 = getEnt ("trap12_hurt2", "targetname");  
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
    while(1)
    {
    hurt1 enablelinkto();
    hurt1 linkto (laser11);
    hurt2 enablelinkto();
    hurt2 linkto (laser12);
    laser11 movex(-88,1);
    laser12 movex(88,1);
    wait 1;
    laser11 movex(88,1);
    laser12 movex(-88,1);
    wait 1;
    laser11 movex(-88,1);
    laser12 movex(88,1);
    wait 1;
    laser11 movex(88,1);
    laser12 movex(-88,1);   
    wait 1;
 
    }
}



hard_way6()
{
trig = getEnt( "hard_trig", "targetname" );
spikes1 = getent("hard_spikes1", "targetname");
spikes2 = getent("hard_spikes2", "targetname");	
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
	while(1)
	{
	spikes1 movex(24,.8,.2,.2);
	spikes2 movex(-24,.8,.2,.2);
	wait 2;
	spikes1 movex(-24,.8,.2,.2);
	spikes2 movex(24,.8,.2,.2);
	wait 2;

	}
}

hard_way7()
{
trig = getEnt( "hard_trig", "targetname" );
spikes3 = getent("hard_spikes3", "targetname");
spikes4 = getent("hard_spikes4", "targetname");	
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
	while(1)
	{
	spikes3 movex(24,.8,.2,.2);
	spikes4 movex(-24,.8,.2,.2);
	wait 2;
	spikes3 movex(-24,.8,.2,.2);
	spikes4 movex(24,.8,.2,.2);
	wait 2;

	}
}

hard_way8()
{
trig = getEnt( "hard_trig", "targetname" );
spikes5 = getent("hard_spikes5", "targetname");
spikes6 = getent("hard_spikes6", "targetname");	
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
	while(1)
	{
	spikes5 movex(24,.8,.2,.2);
	spikes6 movex(-24,.8,.2,.2);
	wait 2;
	spikes5 movex(-24,.8,.2,.2);
	spikes6 movex(24,.8,.2,.2);
	wait 2;

	}
}

hard_way9()
{
 
trig = getEnt( "hard_trig", "targetname" );
left = getEnt( "hard_plat1", "targetname" );
right = getEnt( "hard_plat2", "targetname" );
 
trig waittill ("trigger");
trig delete();
 
while( 1 )
{

left movex( 128, 1 );
right movex( -128, 1 );
wait 1;
right movex( 128, 1 );
left movex( -128, 1 );
wait 1;
right movex( 128, 1 );
left movex( -128, 1 );
wait 1;
left movex( 128, 1 );
right movex( -128, 1 );
wait 1;

}
}

hard_way10()
{
 
trig = getEnt( "hard_trig", "targetname" );
lasend1 = getEnt( "hard_lasers1_end", "targetname" );
lasend2 = getEnt( "hard_lasers2_end", "targetname" );
lasend3 = getEnt( "hard_lasers3_end", "targetname" );
 
trig waittill ("trigger");
trig delete();
 
while( 1 )
{

lasend1 movex( 128, 1 );
lasend2 movex( -128, 1 );
lasend3 movex( 128, 1 );
wait 1;
lasend1 movex( -128, 1 );
lasend2 movex( 128, 1 );
lasend3 movex( -128, 1 );
wait 1;
lasend1 movex( 128, 1 );
lasend2 movex( -128, 1 );
lasend3 movex( 128, 1 );
wait 1;
lasend1 movex( -128, 1 );
lasend2 movex( 128, 1 );
lasend3 movex( -128, 1 );
wait 1;

}
}

hard_way11()
{
trig = getEnt( "hard_trig", "targetname" );
lasend4 = getent("hard_lasers4_end", "targetname");
lasend5 = getent("hard_lasers5_end", "targetname");	
trig waittill("trigger" , player );
if(player.pers["team"] != "axis")
{
//wait 0.1();
}
else
trig delete();
	while(1)
	{
	lasend4 movex(-88,1);
	lasend5 movex(88,1);
	wait 1;
	lasend4 movex(88,1);
	lasend5 movex(-88,1);
	wait 1;
	lasend4 movex(-88,1);
	lasend5 movex(88,1);	
	wait 1;
	lasend4 movex(88,1);
	lasend5 movex(-88,1);	
	wait 1;

	}
}

trap1()
{
	trig = getent("trap1_trig", "targetname");
	csirke = getent ("csirke", "targetname");

	trig waittill ("trigger");
	trig delete();
	csirke PlaySound ("csirke");

	wait 0.7;
	csirke PlaySound ("csirke2");
	PlayFX( level.chicken_fx, csirke.origin );
	RadiusDamage( csirke.origin, 135, 150, 70);
	Earthquake( 2, 1, csirke.origin, 250);
	csirke delete();
}


trap2()
{
        trap2 = getEnt("trap2","targetname");
		origin = getEnt("trap2_origin","targetname");
		trig = getEnt("trap2_trig","targetname");
		ent = getEnt( "boom", "targetname" );
        trig waittill ("trigger", player);
        trig delete();
                trap2 hide();
				trap2 notsolid();
				PlayFX( level.pyromaniac, origin.origin );
				player playsound ( "explo" );
		        wait 10;
				ent delete();
		
}

trap3()
{

trig = getEnt( "trap3_trig", "targetname" );
trap3 = getEnt( "trap3", "targetname" );
trap3_a = getEnt( "trap3_a", "targetname" );
trap3_b = getEnt( "trap3_b", "targetname" );
 
trig waittill ("trigger");
trig delete();
 
{

trap3 movez( -232, 1 );
wait 1;
trap3_a movex( -208, 1 );
trap3_b movex( 208, 1 );
wait 2;
trap3_a movex( 208, 2 );
trap3_b movex( -208, 2 );
trap3 delete();
}
}

trap4()
{

trig = getEnt( "trap4_trig", "targetname" );
trap4_a = getEnt( "trap4_a", "targetname" );
trap4_b = getEnt( "trap4_b", "targetname" );
trap4_c = getEnt( "trap4_c", "targetname" );
hurt1 = getEnt ("trap4_hurt_a", "targetname"); 
hurt2 = getEnt ("trap4_hurt_b", "targetname"); 
hurt3 = getEnt ("trap4_hurt_c", "targetname"); 

 
trig waittill ("trigger");
trig delete();
    while(1)
	{
    hurt1 enablelinkto(); 
    hurt1 linkto (trap4_a);
	
    hurt2 enablelinkto(); 
    hurt2 linkto (trap4_b);
	
    hurt3 enablelinkto(); 
    hurt3 linkto (trap4_c);
	
	trap4_a movex( -592, 1 );
    trap4_b movex( -592, 1 );
	trap4_c movex( -592, 1 );
    wait 2;
    trap4_a movex( 592, 1 );
	trap4_b movex( 592, 1 );
    trap4_c movex( 592, 1 );
	wait 2;
	
	}

}

trap5()
{

trig = getEnt( "trap5_trig", "targetname" );
trap5_a = getEnt( "trap5_a", "targetname" );
trap5_b = getEnt( "trap5_b", "targetname" );
trap5_c = getEnt( "trap5_c", "targetname" );
hurt4 = getEnt ("trap5_hurt_a", "targetname"); 
hurt5 = getEnt ("trap5_hurt_b", "targetname"); 
hurt6 = getEnt ("trap5_hurt_c", "targetname"); 

 
trig waittill ("trigger");
trig delete();
    while(1)
	{
    hurt4 enablelinkto(); 
    hurt4 linkto (trap5_a);
	
    hurt5 enablelinkto(); 
    hurt6 linkto (trap5_b);
	
    hurt6 enablelinkto(); 
    hurt6 linkto (trap5_c);
	
	trap5_a movex( 592, 1 );
    trap5_b movex( 592, 1 );
	trap5_c movex( 592, 1 );
    wait 2;
    trap5_a movex( -592, 1 );
	trap5_b movex( -592, 1 );
    trap5_c movex( -592, 1 );
	wait 2;
	
	}

}

trap6()
{

trig = getEnt( "trap6_trig", "targetname" );
trap6 = getEnt( "trap6", "targetname" );
hurt = getEnt ("trap6_hurt", "targetname"); 
hurt1 = getEnt ("trap6_hurt_a", "targetname"); 
hurt2 = getEnt ("trap6_hurt_b", "targetname"); 
hurt3 = getEnt ("trap6_hurt_c", "targetname"); 
hurt4 = getEnt ("trap6_hurt_d", "targetname"); 
hurt5 = getEnt ("trap6_hurt_e", "targetname"); 
trap6 hide();
trap6 notsolid();
hurt maps\mp\_utility::triggerOff();
hurt1 maps\mp\_utility::triggerOff();
hurt2 maps\mp\_utility::triggerOff();
hurt3 maps\mp\_utility::triggerOff();
hurt4 maps\mp\_utility::triggerOff();
hurt5 maps\mp\_utility::triggerOff();

 
trig waittill ("trigger");

trig delete();
    while(1)
{

    trap6 hide();
	hurt maps\mp\_utility::triggerOff();
	hurt1 maps\mp\_utility::triggerOff();
    hurt2 maps\mp\_utility::triggerOff();
    hurt3 maps\mp\_utility::triggerOff();
    hurt4 maps\mp\_utility::triggerOff();
	hurt5 maps\mp\_utility::triggerOff();
    trap6 notsolid();
    wait 0.5;
    trap6 hide();
	hurt maps\mp\_utility::triggerOff();
	hurt1 maps\mp\_utility::triggerOff();
    hurt2 maps\mp\_utility::triggerOff();
    hurt3 maps\mp\_utility::triggerOff();
    hurt4 maps\mp\_utility::triggerOff();
	hurt5 maps\mp\_utility::triggerOff();
    trap6 notsolid();
    wait 0.5;
    trap6 hide();
	hurt maps\mp\_utility::triggerOff();
	hurt1 maps\mp\_utility::triggerOff();
    hurt2 maps\mp\_utility::triggerOff();
    hurt3 maps\mp\_utility::triggerOff();
    hurt4 maps\mp\_utility::triggerOff();
	hurt5 maps\mp\_utility::triggerOff();
    trap6 notsolid();

    trap6 show();
    hurt maps\mp\_utility::triggerOn();
	hurt1 maps\mp\_utility::triggerOn();
    hurt2 maps\mp\_utility::triggerOn();
    hurt3 maps\mp\_utility::triggerOn();
    hurt4 maps\mp\_utility::triggerOn();
	hurt5 maps\mp\_utility::triggerOn();
    trap6 solid();
    wait 0.5;
    trap6 show();
	hurt maps\mp\_utility::triggerOn();
	hurt1 maps\mp\_utility::triggerOn();
    hurt2 maps\mp\_utility::triggerOn();
    hurt3 maps\mp\_utility::triggerOn();
    hurt4 maps\mp\_utility::triggerOn();
	hurt5 maps\mp\_utility::triggerOn();
    trap6 solid();
    wait 0.5;
    trap6 show();
	hurt maps\mp\_utility::triggerOn();
	hurt1 maps\mp\_utility::triggerOn();
    hurt2 maps\mp\_utility::triggerOn();
    hurt3 maps\mp\_utility::triggerOn();
    hurt4 maps\mp\_utility::triggerOn();
	hurt5 maps\mp\_utility::triggerOn();
    trap6 solid();
    wait 0.5;

    }
}	

trap7()
{

trig = getEnt( "trap7_trig", "targetname" );
plat1 = getent("trap7_a","targetname");
plat2 = getent("trap7_b","targetname");
plat3 = getent("trap7_c","targetname");
plat4 = getent("trap7_d","targetname");
plat5 = getent("trap7_e","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(5)

{

plat1 rotateyaw(-720, 3);
plat2 rotateyaw(-720, 3);
plat3 rotateyaw(-720, 3);
plat4 rotateyaw(-720, 3);
plat5 rotateyaw(-720, 3);

wait(5);

plat1 rotateyaw(720, 3);
plat2 rotateyaw(720, 3);
plat3 rotateyaw(720, 3);
plat4 rotateyaw(720, 3);
plat5 rotateyaw(720, 3);

wait(3);
 
}

}

trap8()
{
	brush = getent ("trap8", "targetname");
	trig = getent ("trap8_trig", "targetname");
	
	trig waittill("trigger");
	while(1)
{
	brush rotateroll (360,4);
	wait 5;
}
}

trap9()
{
 
trig = getEnt( "trap9_trig", "targetname" );
trap9_1 = getEnt( "trap9_plat1", "targetname" );
trap9_2 = getEnt( "trap9_plat2", "targetname" );
trap9_3 = getEnt( "trap9_plat3", "targetname" );
 
trig waittill ("trigger");
trig delete();
 
while( 1 )
{

trap9_1 movex( -248, 1 );
trap9_2 movex( 248, 1 );
trap9_3 movex( -248, 1 );
wait 1;
trap9_1 movex( 248, 1 );
trap9_2 movex( -248, 1 );
trap9_3 movex( 248, 1 );
wait 1;
trap9_1 movex( -248, 1 );
trap9_2 movex( 248, 1 );
trap9_3 movex( -248, 1 );
wait 1;
trap9_1 movex( 248, 1 );
trap9_2 movex( -248, 1 );
trap9_3 movex( 248, 1 );
wait 1;

}
}

trap10()
{

trig = getEnt( "trap10_trig", "targetname" );
trap10_a = getEnt( "trap10_a", "targetname" );
trap10_b = getEnt( "trap10_b", "targetname" );
hurt_a = getEnt ("trap10_hurt_a", "targetname"); 
hurt_b = getEnt ("trap10_hurt_b", "targetname"); 

 
trig waittill ("trigger");
trig delete();
    while(1)
	{
    hurt_a enablelinkto(); 
    hurt_a linkto (trap10_a);
	
    hurt_b enablelinkto(); 
    hurt_b linkto (trap10_b);
	
	trap10_a movez( -152, 1 );
    trap10_b movez( -152, 1 );
    wait 2;
    trap10_a movez( 152, 1 );
	trap10_b movez( 152, 1 );
	wait 2;
	
	}

}

trap11()
{
 
    trig = getEnt ("trap11_trig", "targetname");
	trap11 = getEnt ("trap11", "targetname");

    trig waittill ("trigger");
    trig delete();
    
    trap11 movez( -144, 1);
	wait 1;
	trap11 movez( 144, 1);
	wait 1;
     
}

trap12()
{
 
    trig = getEnt ("trap12_trig", "targetname");
	trap12 = getEnt ("trap12", "targetname");

    trig waittill ("trigger");
    trig delete();
    
    trap12 rotateyaw( -360, 2);
	wait 2;
     
}

teleport()
{

	target = getEnt( "teleport_target", "targetname" );
	trig = getent("teleport_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport1()
{

	target = getEnt( "teleport1_target", "targetname" );
	trig = getent("teleport1_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport2()
{

	target = getEnt( "teleport2_target", "targetname" );
	trig = getent("teleport2_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport3()
{

	target = getEnt( "teleport3_target", "targetname" );
	trig = getent("teleport3_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport4()
{

	target = getEnt( "teleport4_target", "targetname" );
	trig = getent("teleport4_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport5()
{

	target = getEnt( "teleport5_target", "targetname" );
	trig = getent("teleport5_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport6()
{

	target = getEnt( "teleport6_target", "targetname" );
	trig = getent("teleport6_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport7()
{

	target = getEnt( "teleport7_target", "targetname" );
	trig = getent("teleport7_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport8()
{

	target = getEnt( "teleport8_target", "targetname" );
	trig = getent("teleport8_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport9()
{

	target = getEnt( "teleport9_target", "targetname" );
	trig = getent("teleport9_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport10()
{

	target = getEnt( "teleport10_target", "targetname" );
	trig = getent("teleport10_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport11()
{

	target = getEnt( "teleport11_target", "targetname" );
	trig = getent("teleport11_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teddy1()
{
 
    trig = getEnt ("teddy1_trig", "targetname");
    ted1 = getEnt ("teddy1", "targetname");

    trig waittill ("trigger", player );
    
    player braxi\_rank::giveRankXP("",100);
	player iPrintLn("7You got 100XP");
	
	trig delete();
    ted1 delete();
     
}

teddy2()
{
 
    trig = getEnt ("teddy2_trig", "targetname");
    ted2 = getEnt ("teddy2", "targetname");

    trig waittill ("trigger", player );
    
    player braxi\_rank::giveRankXP("",100);
	player iPrintLn("7You got 100XP");
	
	trig delete();
    ted2 delete();
     
}

teddy3()
{
 
    trig = getEnt ("teddy3_trig", "targetname");
    ted3 = getEnt ("teddy3", "targetname");

    trig waittill ("trigger", player );
    
    player braxi\_rank::giveRankXP("",100);
	player iPrintLn("7You got 100XP");
	
	trig delete();
    ted3 delete();
     
}

teddy4()
{
 
    trig = getEnt ("teddy4_trig", "targetname");
    ted4 = getEnt ("teddy4", "targetname");

    trig waittill ("trigger", player );
    
    player braxi\_rank::giveRankXP("",100);
	player iPrintLn("7You got 100XP");
	
	trig delete();
    ted4 delete();
     
}

teddy5()
{
 
    trig = getEnt ("teddy5_trig", "targetname");
    ted5 = getEnt ("teddy5", "targetname");

    trig waittill ("trigger", player );
    
    player braxi\_rank::giveRankXP("",100);
	player iPrintLn("7You got 100XP");
	
	trig delete();
    ted5 delete();
     
}

teddy6()
{
 
    trig = getEnt ("teddy6_trig", "targetname");
    ted6 = getEnt ("teddy6", "targetname");

    trig waittill ("trigger", player );
    
    player braxi\_rank::giveRankXP("",100);
	player iPrintLn("7You got 100XP");
	
	trig delete();
    ted6 delete();
     
}

teddy7()
{
 
    trig = getEnt ("teddy7_trig", "targetname");
    ted7 = getEnt ("teddy7", "targetname");

    trig waittill ("trigger", player );
    
    player braxi\_rank::giveRankXP("",100);
	player iPrintLn("7You got 100XP");
	
	trig delete();
    ted7 delete();
     
}

teddy8()
{
 
    trig = getEnt ("teddy8_trig", "targetname");
    ted8 = getEnt ("teddy8", "targetname");

    trig waittill ("trigger", player );
    
    player braxi\_rank::giveRankXP("",100);
	player iPrintLn("7You got 100XP");
	
	trig delete();
    ted8 delete();
     
}

platform()
{
	trig = getEnt("plat1_trig","targetname");
	plat1 = getEnt("platform1", "targetname");
	
	trig waittill("trigger", player);
	
	while(1)
	{
	plat1 moveY(-1536,4);
	wait 4;
	plat1 moveY(1536,4);
	wait 4;

	}
}

sniper()
{
   
	level.final_trigger = getEnt( "final_trigger", "targetname");
    jump = getEnt( "enter_jumper_room", "targetname" );
    acti = getEnt( "activator_enter_jump", "targetname" );
	

     while(1)
    {
        level.final_trigger waittill( "trigger", player );
        if( !isDefined( level.final_trigger ) )
            return;
        
		level.final_trigger_k delete();
        level.final_trigger_d delete();
		
		
         player.health = player.maxhealth;
		 level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "m40a3_mp" );         
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient4" );
        player switchToWeapon( "remington700_mp" ); 
        level.activ SwitchToWeapon( "remington700_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "^3S^7niper ^3R^7oom";
				noti.notifyText = level.activ.name + " ^3V^7S " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
			
    }

}

knife()
{
   
	level.final_trigger_k = getEnt( "final_trigger_k", "targetname");
    jump = getEnt( "enter_jumper_k", "targetname" );
    acti = getEnt( "activator_enter_k", "targetname" );
	
     while(1)
    {
        level.final_trigger_k waittill( "trigger", player );
        if( !isDefined( level.final_trigger_k ) )
            return;
        
        level.final_trigger_d delete();
        level.final_trigger delete();
      
         player.health = player.maxhealth;
		 level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
		player GiveWeapon( "knife_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        level.activ GiveWeapon( "knife_mp" );         
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient5" );
        player switchToWeapon( "knife_mp" ); 
        level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "^3K^7nife ^3R^7oom";
				noti.notifyText = level.activ.name + " ^3V^7S " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
			
    }

}

jump()
{   
	level.Jump = getEnt( "jump_trigger", "targetname");
    jump = getEnt( "jumpe_room", "targetname" );
    acti = getEnt( "activa_room", "targetname" );
	
     while(1)
    {
        level.Jump waittill( "trigger", player );
        if( !isDefined( level.Jump ) )
            return;
        
        level.sniper delete();
        level.weapon delete();
        level.knife delete();
		
        player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
		player GiveWeapon( "knife_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        level.activ GiveWeapon( "knife_mp" );         
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient6" );
        player switchToWeapon( "knife_mp" ); 
        level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "^5Jump Room";
				noti.notifyText = level.activ.name + " ^9VS^7 " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
	
    }

}

jump_sniper()
{
    trig = getEnt( "jump_sniper_trigger", "targetname" );

    while(1)
    {
	trig waittill( "trigger", player );
	
	player GiveWeapon( "remington700_mp" );
	player switchToWeapon( "remington700_mp" );
	player givemaxammo("remington700_mp");	
	wait 1;
}
}

start()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "Map by Fen1x!" );
wait(4);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "Thanks alot VC'BLADE, VC,ERIK, oCm OrK!DeA, Madlion." );
wait(4);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "Visit Xenia-gaming.net" );
}
