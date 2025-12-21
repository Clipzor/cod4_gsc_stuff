/* 

tysm to xoxo

*/

#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	// EFFECTS+ //
	level.leaves 			= loadFx( "1_ui/leaves_ground_gentle" );
	level.bugs 	 			= loadFx( "1_ui/bugs" );
	level.fire 	 		= loadFx( "redlight" );
	level.fog 	 		= loadFx( "weather/fog_bog_b" );

	// MAP SETUP+ //
	maps\mp\_load::main();
	

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	thread playMiscFx();
	thread roundNumber();
	thread hintstrings();
	thread spawnchickens();
	thread startTeleport();
	thread blackTeleport();
	thread tunnelTeleport();
	thread blackTeleportTwo();
	thread blackTeleportThree();
	thread blueTeleport();
	thread orangeTeleport();
	thread lowgrav();
	thread normalgrav();
	thread gravtrapgrav();
	thread endTele();
	thread bluespin();
	thread weirdplatform();
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
	thread trap13();
	thread trap14();
	thread trap15();
	thread trap16();
	thread trap17();
	thread trap18();
	thread trap19();
	thread trap20();
	thread cube();

	setDvar("dr_timelimit", 3);

	addTriggerToList("trap1");
	addTriggerToList("trap20");
	addTriggerToList("trap2");
	addTriggerToList("trap3");
	addTriggerToList("trap4");
	addTriggerToList("trap5");
	addTriggerToList("trap6");
	addTriggerToList("trap7");
	addTriggerToList("trap8");
	addTriggerToList("trap9");
	addTriggerToList("trap10");
	addTriggerToList("trap11");
	addTriggerToList("trap12");
	addTriggerToList("trap13");
	addTriggerToList("trap14");
	addTriggerToList("trap15");
	addTriggerToList("trap16");
	addTriggerToList("trap17");
	addTriggerToList("trap18");
	addTriggerToList("trap19");


	//VisionSetNaked( "mp_jwofles", 1 );
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

spawnEffectOnEnt( effect, customAngles )
{
    if( !isDefined( effect ) )
        return undefined;
    
    if( !isDefined( customAngles ) )
    	baseEffect = spawnFx( effect, ( self.origin ) );

    else
    {
    	baseEffect = spawnFx( effect, ( self.origin ) );
    	baseEffect.angles = self.angles + ( 90, 90, 0 );
    }
    
    triggerFx( baseEffect, 1 );
    
    return baseEffect;
}

cube(){
	gcube = getEnt("cube", "targetname");
	for(;;){
		gcube moveZ(2, 2, 1, 1);
		gcube waittill("movedone");
		gcube moveZ(-2, 2, 1, 1);
		gcube waittill("movedone");
	}
}

playMiscFx()
{
	// ++++

	leaves = getentarray( "fx_leaves", "targetname" );

	if( isdefined( leaves ))
		for( i = 0; i < leaves.size; i++ )
			leaves[i] spawnEffectOnEnt( level.leaves, true );


	bugs = getentarray( "fx_bugs", "targetname" );

	if( isdefined( bugs ))
		for( i = 0; i < bugs.size; i++ )
			bugs[i] spawnEffectOnEnt( level.bugs );

	fog = getentarray( "fx_fog", "targetname" );

	if( isdefined( fog ))
		for( i = 0; i < fog.size; i++ )
			bugs[i] spawnEffectOnEnt( level.fog );


}

roundNumber()
{
	deadtree1 = getEntArray( "deadtree1", "targetname" );
	deadtree2 = getEntArray( "deadtree2", "targetname" );
	deadtree4 = getEntArray( "deadtree4", "targetname" );
	deadtree5 = getEntArray( "deadtree5", "targetname" );
	deadtree6 = getEntArray( "deadtree6", "targetname" );
	deadtree8 = getEntArray( "deadtree8", "targetname" );
	for( i = 0; i < deadtree1.size; i++ ){
		deadtree1[i] hide();
	}
	for( i = 0; i < deadtree2.size; i++ ){
		deadtree2[i] hide();
	}
	for( i = 0; i < deadtree4.size; i++ ){
		deadtree4[i] hide();
	}
	for( i = 0; i < deadtree5.size; i++ ){
		deadtree5[i] hide();
	}
	for( i = 0; i < deadtree6.size; i++ ){
		deadtree6[i] hide();
	}
	for( i = 0; i < deadtree8.size; i++ ){
		deadtree8[i] hide();
	}
	level waittill("round_started");
	//iprintlnbold(game["roundsplayed"]); 
	roundNum = (game["roundsplayed"]);
	if( roundNum == 2 ) {
		AmbientPlay( "endmap2", 1 );
		VisionSetNaked( "mp_dr_pretrichor", 1 );
		setdvar("r_glowBloomIntensity0",1.5);
	}
	else if( roundNum == 3 ){
		AmbientPlay( "endmap3", 1 );
		VisionSetNaked( "mp_dr_pretrichor", 1 );
	}
	else if( roundNum == 4 ){
		AmbientPlay( "endmap4", 1 );
		VisionSetNaked( "mp_dr_pretrichor", 1 );
	}
	else if( roundNum == 5 ){
		AmbientPlay( "endmap5", 1 );
		VisionSetNaked( "mp_dr_pretrichor", 1 );
	}
	else if( roundNum == 6 ){
		AmbientPlay( "endmap6", 1 );
		for(;;){
			setdvar("r_glow",1);
			VisionSetNaked( "mp_dr_pretrichor", .3 );
			wait .3;
			VisionSetNaked( "glow2", .3 );
			wait .3;
		}
	}
	else if( roundNum == 7 ){
		AmbientPlay( "7", 1 );
		deadtreefunc();
		VisionSetNaked( "blackwhite", 1 );
		setdvar("r_fullbright",0);
	}
	else if( roundNum == 8 ){
		AmbientPlay( "10", 1 );
		deadtreefunc();
		setExpFog(300, 700, 0, 0, 0, 19);	
		VisionSetNaked( "blackwhite", 19 );
		wait 19.8;
		for(;;){
			setExpFog(200, 200, 0, 0, 0, .1);	
			wait .1;
			setExpFog(400, 400, 0, 0, 0, .1);	
			wait .1;
		}
	}
	else if( roundNum == 9 ){
		AmbientPlay( "8", 1 );
		deadtreefunc();
		VisionSetNaked( "invert", 1 );
	}
	else if( roundNum == 10 ){
		AmbientPlay( "9", 1 );
		deadtreefunc();
		thread pulsing();
	}
	else if( roundNum == 11 ){
		AmbientPlay( "11", 1 );
		VisionSetNaked( "mp_dr_pretrichor", .3 );
	}
	else{
		AmbientPlay( "endmap1", 1 );
		VisionSetNaked( "glow", 1 );
		VisionSetNaked( "mp_dr_pretrichor", 1 );
		setdvar("r_glowBloomIntensity0",1.5);
		setdvar("r_blur",.85);
		VisionSetNaked( "glow", 1 );
		setdvar("r_glowBloomIntensity0",1.5);
	}
}

pulsing(){
		wait 1.8;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait .5;
		setExpFog(40, 100, 0, 0, 0, .5);
		wait .5;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait 1.3;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait .5;
		setExpFog(40, 100, 0, 0, 0, .5);
		wait .5;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait 1.3;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait .5;
		setExpFog(40, 100, 0, 0, 0, .5);
		wait .5;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait 1.3;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait .5;
		setExpFog(40, 100, 0, 0, 0, .5);
		wait .5;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait 1.3;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait .5;
		setExpFog(40, 100, 0, 0, 0, .5);
		wait .5;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait 1.3;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait .5;
		setExpFog(40, 100, 0, 0, 0, .5);
		wait .5;
		setExpFog(40, 400, .15, 0, 0, .5);
		wait 3.6;
	for(;;) {
		setExpFog(40, 400, .15, 0, 0, .6);
		wait .6;
		setExpFog(40, 100, 0, 0, 0, .6);
		wait .6;
	}
}

deadtreefunc(){
	deadtree1 = getEntArray( "deadtree1", "targetname" );
	deadtree2 = getEntArray( "deadtree2", "targetname" );
	deadtree4 = getEntArray( "deadtree4", "targetname" );
	deadtree5 = getEntArray( "deadtree5", "targetname" );
	deadtree6 = getEntArray( "deadtree6", "targetname" );
	deadtree8 = getEntArray( "deadtree8", "targetname" );
	foliage1 = getEntArray( "foliageone", "targetname" );
	foliage2 = getEntArray( "foliagetwo", "targetname" );
	foliage3 = getEntArray( "foliagethree", "targetname" );
	foliage4 = getEntArray( "foliagefour", "targetname" );
	foliage5 = getEntArray( "foliagefive", "targetname" );
	foliage6 = getEntArray( "foliagesix", "targetname" );
	foliage7 = getEntArray( "foliageseven", "targetname" );
	foliage8 = getEntArray( "foliageeight", "targetname" );
	for( i = 0; i < deadtree1.size; i++ ){
		deadtree1[i] show();
	}
	for( i = 0; i < deadtree2.size; i++ ){
		deadtree2[i] show();
	}
	for( i = 0; i < deadtree4.size; i++ ){
		deadtree4[i] show();
	}
	for( i = 0; i < deadtree5.size; i++ ){
		deadtree5[i] show();
	}
	for( i = 0; i < deadtree6.size; i++ ){
		deadtree6[i] show();
	}
	for( i = 0; i < deadtree8.size; i++ ){
		deadtree8[i] show();
	}

	for( i = 0; i < foliage1.size; i++ ){
		foliage1[i] delete();
	}
	for( i = 0; i < foliage2.size; i++ ){
		foliage2[i] delete();
	}
	for( i = 0; i < foliage3.size; i++ ){
		foliage3[i] delete();
	}
	for( i = 0; i < foliage4.size; i++ ){
		foliage4[i] delete();
	}
	for( i = 0; i < foliage7.size; i++ ){
		foliage7[i] delete();
	}
	for( i = 0; i < foliage5.size; i++ ){
		foliage5[i] delete();
	}
	for( i = 0; i < foliage6.size; i++ ){
		foliage6[i] delete();
	}
	for( i = 0; i < foliage8.size; i++ ){
		foliage8[i] delete();
	}
}

spawnchickens()
{
	one = getEnt( "chicken1", "targetname" );
	two = getEnt( "chicken2", "targetname" );
	three = getEnt( "chicken3", "targetname" );
	four = getEnt( "chicken4", "targetname" );
	two moveX( 5, .1);
	for(;;) {
		one rotateRoll( 360, 10);
		one rotateyaw( 360, 10);
		one rotatePITCH( 360, 10);
		two rotateRoll( 360, 10);
		two rotateyAW( 360, 10);
		two rotatePITCH( 360, 10);
		three rotateRoll( 360, 10);
		three rotateyAW( 360, 10);
		three rotatePITCH( 360, 10);
		four rotateRoll( 360, 10);
		four rotateyAW( 360, 10);
		four rotatePITCH( 360, 10);
		wait 10;
	 }
}

hintstrings(){
	bluestring = getEnt( "bluehint", "targetname" );
	orange = getEnt( "orangehint", "targetname" );
	bluestring SetHintString("^5blue ^7is slidey");	
	orange SetHintString("jump/climb");	
	redstring = getEnt( "redhurts", "targetname" );
	redstring SetHintString("^1red ^7hurts");	
	housestring = getEnt( "house", "targetname" );
	housestring setHintString("maybe you should try the back");
}

startTeleport()
{
	level waittill("round_started");
	iprintln("map by jwofles"); 
	iprintln("thanks xoxor4d for endroom + grass/trees"); 
	iprintln("thanks mist for chicken"); 
	wait 5;
	iprintln("     3"); 
	wait 1;
	iprintln("     2"); 
	wait 1;
	iprintln("     1"); 
	wait 1;
	iprintlnbold("other than the petrichor emanating from the rapidly drying grass,"); 
	iprintlnbold("there was not a trace of evidence that it had rained at all"); 
	t1 = getEnt( "telestart", "targetname" );
	t1l = getEnt( "telestartlocation", "targetname" );
	for(;;) {
		t1 waittill( "trigger", who );
		who SetOrigin( t1l.origin );
		who SetPlayerAngles( (t1l.angles) );
	}
}

blackTeleport()
{
	for(;;) {
		tele = getEnt( "blacktele", "targetname" );
		teleloc = getEnt( "teletunnelloc", "targetname" );
		tele waittill( "trigger", who );
		who SetOrigin( teleloc.origin );
		who SetPlayerAngles( (teleloc.angles) );
	}
}

tunnelTeleport()
{
	for(;;) {
		tele = getEnt( "teletunnel", "targetname" );
		teleloc = getEnt( "blacklocation", "targetname" );
		tele waittill( "trigger", who );
		who SetOrigin( teleloc.origin );
		who SetPlayerAngles( (teleloc.angles) );
	}
}

blackTeleportTwo()
{
	for(;;) {
		tele = getEnt( "blacktwotele", "targetname" );
		teleloc = getEnt( "blacklocationtwo", "targetname" );
		tele waittill( "trigger", who );
		who SetOrigin( teleloc.origin );
		who SetPlayerAngles( (teleloc.angles) );
	}
}

blackTeleportThree()
{
	for(;;) {
		tele = getEnt( "blackthreetele", "targetname" );
		teleloc = getEnt( "blacklocationthree", "targetname" );
		tele waittill( "trigger", who );
		who SetOrigin( teleloc.origin );
		who SetPlayerAngles( (teleloc.angles) );
	}
}

blueTeleport()
{
	for(;;) {
		tele = getEnt( "bluetele", "targetname" );
		teleloc = getEnt( "blueteleloc", "targetname" );
		tele waittill( "trigger", who );
		who SetOrigin( teleloc.origin );
		who SetPlayerAngles( (teleloc.angles) );
	}
}

orangeTeleport()
{
	tele = getEnt( "orangetele", "targetname" );
	for(;;) {
		teleloc = getEnt( "orangeteleloc", "targetname" );
		tele waittill( "trigger", who );
		who SetOrigin( teleloc.origin );
		who SetPlayerAngles( (teleloc.angles) );
		who setgravity(500);
		who setJumpHeight(150);
	}
}

lowgrav(){
	tele = getEnt( "lowgravtrig", "targetname" );
	for(;;) {
		tele waittill( "trigger", who );
		who setgravity(500);
		who setJumpHeight(150);
	}
}


normalgrav(){
	tele = getEnt( "normalgrav", "targetname" );
	for(;;) {
		tele waittill( "trigger", who );
		who setgravity(900);
		who setJumpHeight(39);
	}
}

gravtrapgrav(){
	tele = getEnt( "gravtrap", "targetname" );
	for(;;) {
		tele waittill( "trigger", who );
		who setgravity(900);
		who setJumpHeight(39);
	}
}


endTele()
{
	tele = getEnt( "endtele", "targetname" );
	teleloc = getEnt( "endteleloc", "targetname" );
	actiteleloc = getEnt( "endactiloc", "targetname" );
	tele waittill( "trigger", who );
	iprintlnbold ("^1" + who.name + " ^7reached the end");
	who SetOrigin( teleloc.origin );
	who SetPlayerAngles( (teleloc.angles) );
	who TakeAllWeapons();
	who GiveWeapon("knife_mp");
	wait 0.05;
	who SwitchToWeapon("knife_mp");
	level.activ SetOrigin( actiteleloc.origin );
	level.activ SetPlayerAngles( (actiteleloc.angles) );
	level.activ TakeAllWeapons();
	level.activ GiveWeapon("knife_mp");
	wait 0.05;
	level.activ SwitchToWeapon("knife_mp");
	for(;;) {
		tele waittill( "trigger", yeet );
		iprintlnbold ("^1" + yeet.name + " ^7reached the end");
		yeet SetOrigin( teleloc.origin );
		yeet SetPlayerAngles( (teleloc.angles) );
		yeet TakeAllWeapons();
		yeet GiveWeapon("knife_mp");
		wait 0.05;
		yeet SwitchToWeapon("knife_mp");
	}
}

blueSpin(){
	side1 = getEnt( "sideone", "targetname" );
	side2 = getEnt( "sidetwo", "targetname" );
	side3 = getEnt( "sidethree", "targetname" );
	side4 = getEnt( "sidefour", "targetname" );
	side5 = getEnt( "sidefive", "targetname" );
	side6 = getEnt( "sidesix", "targetname" );
	side7 = getEnt( "sideseven", "targetname" );
	side8 = getEnt( "sideeight", "targetname" );
	side1 moveX( -1536, 0.1);
	side2 moveX( -1536, 0.1);
	side3 moveX( -1536, 0.1);
	side4 moveX( -1536, 0.1);
	side5 moveX( -1536, 0.1);
	side6 moveX( -1536, 0.1);
	side7 moveX( -1536, 0.1);
	side8 moveX( -1536, 0.1);
	blue = getEntArray( "bluespiral", "targetname" );
	for(;;) {
		for( i = 0; i < blue.size; i++ ){
			blue[i] rotateRoll( 360, 5);
		}
		wait 5;
	}
}

trap1()
{
	deadtree1 = getEntArray( "deadtree1", "targetname" );
	deadtree2 = getEntArray( "deadtree2", "targetname" );
	deadtree4 = getEntArray( "deadtree4", "targetname" );
	deadtree5 = getEntArray( "deadtree5", "targetname" );
	deadtree6 = getEntArray( "deadtree6", "targetname" );
	deadtree8 = getEntArray( "deadtree8", "targetname" );
	water1 = getEnt( "waterone", "targetname" );
	water2 = getEnt( "watertwo", "targetname" );
	water1 hide();
	water2 hide();
	slice1 = getEnt( "sliceone", "targetname" );
	slice2 = getEnt( "slicetwo", "targetname" );
	slice3 = getEnt( "slicethree", "targetname" );
	slice4 = getEnt( "slicefour", "targetname" );
	slice5 = getEnt( "slicefive", "targetname" );
	slice6 = getEnt( "slicesix", "targetname" );
	slice7 = getEnt( "sliceseven", "targetname" );
	slice8 = getEnt( "sliceeight", "targetname" );
	side1 = getEnt( "sideone", "targetname" );
	side2 = getEnt( "sidetwo", "targetname" );
	side3 = getEnt( "sidethree", "targetname" );
	side4 = getEnt( "sidefour", "targetname" );
	side5 = getEnt( "sidefive", "targetname" );
	side6 = getEnt( "sidesix", "targetname" );
	side7 = getEnt( "sideseven", "targetname" );
	side8 = getEnt( "sideeight", "targetname" );
	foliage1 = getEntArray( "foliageone", "targetname" );
	foliageclip1 = getEnt( "foliageclipone", "targetname" );
	foliage2 = getEntArray( "foliagetwo", "targetname" );
	foliageclip2 = getEnt( "foliagecliptwo", "targetname" );
	foliage3 = getEntArray( "foliagethree", "targetname" );
	foliage4 = getEntArray( "foliagefour", "targetname" );
	foliageclip4 = getEnt( "foliageclipfour", "targetname" );
	foliage5 = getEntArray( "foliagefive", "targetname" );
	foliageclip5 = getEnt( "foliageclipfive", "targetname" );
	foliage6 = getEntArray( "foliagesix", "targetname" );
	foliageclip6 = getEnt( "foliageclipsix", "targetname" );
	foliage8 = getEntArray( "foliageeight", "targetname" );
	foliageclip8 = getEnt( "foliageclipeight", "targetname" );
	sixbuilding = getEnt( "buildingsix", "targetname" );
	eightbuilding = getEnt( "eightbuilding", "targetname" );
	eightmantle = getEnt( "eightmantle", "targetname" );
	wait 5;
	/*
	side1 enableLinkTo();
	side2 enableLinkTo();
	side3 enableLinkTo();
	side4 enableLinkTo();
	side5 enableLinkTo();
	side6 enableLinkTo();
	side7 enableLinkTo();
	side8 enableLinkTo();
	water1 enableLinkTo();
	water2 enableLinkTo();
	*/
	side1 LinkTo(slice1);
	side2 LinkTo(slice2);
	side3 LinkTo(slice3);
	side4 LinkTo(slice4);
	side5 LinkTo(slice5);
	side6 LinkTo(slice6);
	side7 LinkTo(slice7);
	side8 LinkTo(slice8);
	water1 linkto(slice3);
	water2 linkto(slice4);
	sixbuilding linkto(slice6);
	eightbuilding linkto(slice8);
	eightmantle linkto(slice8);
	foliageclip2 linkto(slice2);
	foliageclip4 linkto(slice4);
	foliageclip5 linkto(slice5);
	foliageclip6 linkto(slice6);
	foliageclip8 linkto(slice8);
	for( i = 0; i < foliage1.size; i++ ){
		foliage1[i] linkto(slice1);
	}
	for( i = 0; i < foliage2.size; i++ ){
		foliage2[i] linkto(slice2);
	}
	for( i = 0; i < foliage3.size; i++ ){
		foliage3[i] linkto(slice3);
	}
	for( i = 0; i < foliage4.size; i++ ){
		foliage4[i] linkto(slice4);
	}
	for( i = 0; i < foliage5.size; i++ ){
		foliage5[i] linkto(slice5);
	}
	for( i = 0; i < foliage6.size; i++ ){
		foliage6[i] linkto(slice6);
	}
	for( i = 0; i < foliage8.size; i++ ){
		foliage8[i] linkto(slice8);
	}
	foliageclip1 linkto(slice8);
	for( i = 0; i < deadtree1.size; i++ ){
		deadtree1[i] linkto(slice1);
	}
	for( i = 0; i < deadtree2.size; i++ ){
		deadtree2[i] linkto(slice2);
	}
	for( i = 0; i < deadtree4.size; i++ ){
		deadtree4[i] linkto(slice4);
	}
	for( i = 0; i < deadtree5.size; i++ ){
		deadtree5[i] linkto(slice5);
	}
	for( i = 0; i < deadtree6.size; i++ ){
		deadtree6[i] linkto(slice6);
	}
	for( i = 0; i < deadtree8.size; i++ ){
		deadtree8[i] linkto(slice8);
	}
	trigger = getEnt( "trap1", "targetname" );
	origin = getEnt( "trap20loc", "targetname" );
	trigger SetHintString("rotate stuff");
	trigger waittill( "trigger", who );
    // actual trap
	water1 show();
	water2 show();
	thread bob1();
	thread rotatet();
	trigger SetHintString("(press &&1 to teleport)");
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

bob1(){
	slice1 = getEnt( "sliceone", "targetname" );
	slice2 = getEnt( "slicetwo", "targetname" );
	slice3 = getEnt( "slicethree", "targetname" );
	slice4 = getEnt( "slicefour", "targetname" );
	slice5 = getEnt( "slicefive", "targetname" );
	slice6 = getEnt( "slicesix", "targetname" );
	slice7 = getEnt( "sliceseven", "targetname" );
	slice8 = getEnt( "sliceeight", "targetname" );
	spawn = getEnt( "telestartlocation", "targetname" );
	thread floatingchicken();
	spawn moveY( 900, 10, 5, 5);
	slice1 moveY( 900, 10, 5, 5 );
	slice2 moveY( 750, 9, 4.5, 4.5  );
	slice3 moveY( 600, 8, 4, 4  );
	slice4 moveY( 450, 7, 3.5, 3.5  );
	slice5 moveY( 300, 6, 3, 3  );
	slice6 moveY( 150, 5, 2.5, 2.5  );
	slice8 moveY( -220, 2, 1, 1  );
	slice1 waittill("movedone");
	slice6 moveX( -100, 2.5, 1.125, 1.125  );
	slice6 waittill("movedone");
	wait 2;
	for(;;){
		slice6 moveX( 300, 5, 2.5, 2.5  );
		slice6 waittill("movedone");
		wait 2;
		slice6 moveX( -300, 5, 2.5, 2.5  );
		slice6 waittill("movedone");
		wait 2;
	}
}

floatingchicken(){
	floatingchick = getEntArray( "floatingchick", "targetname" );
	clip = getEnt( "chickenclip", "targetname" );
	clip rotateYaw( 360, 5);
	clip moveZ( 120, 5); 
	for( i = 0; i < floatingchick.size; i++ ){
		floatingchick[i] moveZ( 120, 5, 1, 4);
		floatingchick[i] rotateYaw( 360, 5, 2, 3);
	}
	wait 5;
	for(;;){
		for( i = 0; i < floatingchick.size; i++ ){
			floatingchick[i] moveZ( 5, 1, .5, .5);
		}
		wait 1;
		for( i = 0; i < floatingchick.size; i++ ){
			floatingchick[i] moveZ( -5, 1, .5, .5);
		}
		wait 1;
	}
}

rotatet()
{
	slice2 = getEnt( "slicetwo", "targetname" );
	slice3 = getEnt( "slicethree", "targetname" );
	slice4 = getEnt( "slicefour", "targetname" );
	slice5 = getEnt( "slicefive", "targetname" );
	slice6 = getEnt( "slicesix", "targetname" );
	slice7 = getEnt( "sliceseven", "targetname" );
	slice8 = getEnt( "sliceeight", "targetname" );
	wait 10;
	for(;;){
		slice2 rotatePitch( 360, 15, 7.5, 7.5 );
		slice2 waittill("rotatedone");
		slice4 rotatePitch( 360, 15, 7.5, 7.5 );
		slice4 waittill("rotatedone");

		slice3 rotatePitch( 360, 15, 7.5, 7.5 );
		slice3 waittill("rotatedone");
		slice5 rotatePitch( 360, 15, 7.5, 7.5 );
		slice5 waittill("rotatedone");
	}
}

trap20() //second trap i made an oopsie
{
	trigger = getEnt( "trap20", "targetname" );
	origin = getEnt( "trap2loc", "targetname" );
	trigger SetHintString("evil mannequins");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread mannetrap();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

mannetrap(){
	hurt = getEnt( "redlighthurt", "targetname" );
	logo = getEnt( "petrichorlogo", "targetname" );
	fxorigin = getEnt( "redlightloc", "targetname" );
	hurtorigin = getEnt( "hurtlink", "targetname" );
	teleport = getEnt( "blacktele", "targetname" );
	one = getEnt( "mannequin1", "targetname" );
	two = getEnt( "mannequin2", "targetname" );
	hurt enablelinkto(hurtorigin);
	hurt linkTo(hurtorigin);
	teleport enablelinkto(hurtorigin);
	teleport linkTo(hurtorigin);
	playFX(level.fire, fxorigin.origin );
	hurtorigin moveZ (512, 0.1);
	one rotateYaw(-180,1);
	two rotateYaw(180,1);
	logo hide();
	wait 9;
	fxorigin delete();
	hurt delete();
	hurtorigin moveZ (-512, 0.1);
	one rotateYaw(180,1);
	two rotateYaw(-180,1);
	wait 1;
	logo show();
}

trap2()
{
	trigger = getEnt( "trap2", "targetname" );
	origin = getEnt( "trap3loc", "targetname" );
	path = getEnt( "whitepath", "targetname" );
	trigger SetHintString("make the path darker");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	path delete();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}
trap3()
{
	trigger = getEnt( "trap3", "targetname" );
	origin = getEnt( "trap4loc", "targetname" );
	lilplatform = getEnt( "lilplatform", "targetname" );
	trigger SetHintString("increase gap");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	lilplatform delete();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}
trap4()
{
	trigger = getEnt( "trap4", "targetname" );
	origin = getEnt( "trap5loc", "targetname" );
	trigger SetHintString("bridge up and down");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread bridgemove();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

bridgemove(){
	bridge = getEnt( "bridge", "targetname" );
	bridge moveZ(50, 2, 0, 2);
	wait 2;
	for(;;){
		bridge moveZ(-100, 4, 2,2);
		wait 4;
		bridge moveZ(100, 4, 2,2);
		wait 4;
	}
}

trap5()
{
	trigger = getEnt( "trap5", "targetname" );
	origin = getEnt( "trap6loc", "targetname" );
	blocker = getEnt( "blocker", "targetname" );
	blocker hide();
	blocker notSolid();
	trigger SetHintString("block the slide");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread blocked();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

blocked(){
	blocker = getEnt( "blocker", "targetname" );
	blocker show();
	blocker solid();
	wait 10;
	blocker hide();
	blocker notSolid();
	blocker delete();
}

trap6()
{
	trigger = getEnt( "trap6", "targetname" );
	origin = getEnt( "trap7loc", "targetname" );
	red = getEnt( "redladder", "targetname" );
	white = getEnt( "whiteladder", "targetname" );
	ladder = getEnt("ladderbrush", "targetname");
	ladder solid();
	white show();
	red hide();
	trigger SetHintString("hide ladder");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread killerladder();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

killerladder(){
	red = getEnt( "redladder", "targetname" );
	white = getEnt( "whiteladder", "targetname" );

	ladder = getEnt("ladderbrush", "targetname"); // trigger_hurt

	red show();
	white hide();
	ladder moveX(-64, 0.1);
	ladder notsolid();

	wait 10;

	ladder solid();
	ladder moveX(64, 0.1);
	white show();
	red hide();
}


trap7()
{
	trigger = getEnt( "trap7", "targetname" );
	origin = getEnt( "trap8loc", "targetname" );
	float = getEnt( "floatything", "targetname" );
	float hide();
	trigger SetHintString("blocker");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread floater();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

floater(){
	float = getEnt( "floatything", "targetname" );
	float show();
	float moveZ(128, 5, 2.5, 2.5);
	float rotateYaw(-45, 5, 2.5, 2.5);
	float waittill("movedone");
	for(;;){
		float moveZ(20, 2, 1, 1);
		float waittill("movedone");
		float moveZ(-20, 2, 1, 1);
		float waittill("movedone");
	}

}

trap8()
{
	trigger = getEnt( "trap8", "targetname" );
	origin = getEnt( "trap9loc", "targetname" );
	piece = getEnt("rotatingwhite", "targetname");
	trigger SetHintString("rotate piece");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	piece rotatePitch(360, 7);
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

trap9()
{
	trigger = getEnt( "trap9", "targetname" );
	origin = getEnt( "trap10loc", "targetname" );
	old = getEnt( "old_twist", "targetname" );
	new = getEnt( "new_twist", "targetname" );
	hurt = getEnt( "twisthurt", "targetname" );
	mover = getEnt( "twistmover", "targetname" );
	hurt enablelinkto();
	hurt linkto(mover);
	new hide();
	trigger SetHintString("switch red");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	mover moveY(-192, .1);
	old delete();
	new show();
	new solid();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

trap10()
{
	trigger = getEnt( "trap10", "targetname" );
	origin = getEnt( "trap11loc", "targetname" );
	trigger SetHintString("rotate tunnel");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread spinnerstuff();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

spinnerstuff(){
	spinner = getEnt( "spinner", "targetname" );
	for(;;){
		spinner rotateRoll(360, 10, 1,9);
		spinner waittill("rotatedone");
		wait 2;
	}
}

trap11()
{
	trigger = getEnt( "trap11", "targetname" );
	origin = getEnt( "trap12loc", "targetname" );
	trigger SetHintString("move lasers");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread laserskill();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

laserskill(){
	lasers = getEnt("lasers","targetname");
	lasershurt = getEnt("lasershurt","targetname");
	lasershurt enablelinkto();
	lasershurt linkto(lasers);
	for(;;){
		lasers moveZ(40, 2, 1,1);
		lasers waittill("movedone");
		lasers moveZ(-40, 2, 1,1);
		lasers waittill("movedone");
	}
}

weirdplatform(){
	state1 = getEnt("state1","targetname");
	state2 = getEnt("state2","targetname");
	state3 = getEnt("state3","targetname");
	state4 = getEnt("state4","targetname");
	state5 = getEnt("state5","targetname");
	state2 hide();
	state3 hide();
	state4 hide();
	state5 hide();
	for(;;){
		state1 hide();
		state2 show();
		wait .1;
		state2 hide();
		state3 show();
		wait .1;
		state3 hide();
		state4 show();
		wait .1;
		state4 hide();
		state5 show();
		wait .1;
		state5 hide();
		state1 show();
		wait .1;
	}
}

trap12()
{
	trigger = getEnt( "trap12", "targetname" );
	origin = getEnt( "trap13loc", "targetname" );
	trigger SetHintString("delete white platforms - 1");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread white1trap();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

white1trap(){
	white = getEnt( "white1", "targetname" );
	white notSolid();
	white hide();
	wait 10;
	white solid();
	white show();
}

trap13()
{
	trigger = getEnt( "trap13", "targetname" );
	origin = getEnt( "trap14loc", "targetname" );
	trigger SetHintString("delete white platforms - 2");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread white2trap();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

white2trap(){
	white = getEnt( "white2", "targetname" );
	white notSolid();
	white hide();
	wait 10;
	white solid();
	white show();
}

trap14()
{
	trigger = getEnt( "trap14", "targetname" );
	origin = getEnt( "trap15loc", "targetname" );
	trigger SetHintString("delete white platforms - 3");
	white = getEnt( "white3", "targetname" );
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread white3trap();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

white3trap(){
	white = getEnt( "white3", "targetname" );
	white notSolid();
	white hide();
	wait 10;
	white solid();
	white show();
}

trap15()
{
	trigger = getEnt( "trap15", "targetname" );
	origin = getEnt( "trap16loc", "targetname" );
	trigger SetHintString("move blue platform");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread blueslide();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

blueslide(){
	blue = getEnt( "bluething", "targetname" );
	blue moveY(-32, 3, 1.5, 1.5);
	for(;;){
		blue rotatePitch(10, 8, 4, 4);
		blue waittill("rotatedone");
		blue rotatePitch(-10, 8, 4, 4);
		blue waittill("rotatedone");
	}
}

trap16()
{
	trigger = getEnt( "trap16", "targetname" );
	origin = getEnt( "trap17loc", "targetname" );
	trigger SetHintString("remove orange");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread removeorange();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

removeorange(){
	orange = getEnt( "orangeplat", "targetname" );
	orange notSolid();
	orange hide();
	wait 5;
	orange show();
	orange Solid();
}

trap17()
{
	trigger = getEnt( "trap17", "targetname" );
	origin = getEnt( "trap18loc", "targetname" );
	trigger SetHintString("orange spin");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread orangespin();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

orangespin(){
	for(;;){
		blue = getEnt( "orangespin", "targetname" );
		blue rotateYaw( 360, 6 );
		blue waittill("rotatedone");
	}
}

trap18()
{
	trigger = getEnt( "trap18", "targetname" );
	origin = getEnt( "trap19loc", "targetname" );
	mover = getEnt( "gravmover", "targetname" );
	trig1 = getEnt( "gravtrap", "targetname" );
	trig1 enablelinkto();
	trig1 linkto(mover);
	trig2 = getEnt( "lowgravtrig", "targetname" );
	trig2 enablelinkto();
	trig2 linkto(mover);
	trigger SetHintString("reset gravity");
	trigger waittill( "trigger", who );
	trigger SetHintString("");
	thread gravitytrapfunc();
	for(;;) {
		trigger waittill( "trigger", who );
		who SetOrigin( origin.origin );
		who SetPlayerAngles( (origin.angles) );
	}
}

gravitytrapfunc(){
	mover = getEnt( "gravmover", "targetname" );
	trig1 = getEnt( "gravtrap", "targetname" );
	trig2 = getEnt( "lowgravtrig", "targetname" );
	mover moveY(-512, 0.1);
	wait 10;
	trig1 delete();
	mover moveY(-512, 0.1);
}

trap19()
{
	lastplat = getEnt( "lastplat", "targetname" );
	trigger = getEnt( "trap19", "targetname" );
	trigger SetHintString("lower end platform");
	trigger waittill( "trigger", who );
	trigger SetHintString("no more traps left");
	lastplat moveZ(-800, 5, 1, 4);
	wait 1;
	lastplat notSolid();
	wait 5;
	lastplat moveZ(800, 5, 4, 1);
	wait 4;
	lastplat Solid();
}