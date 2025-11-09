// Garry's Mod Prison Break made by Misteri Late
// Remade in cod4 for Arcane deathrun by Mist

main() {
	maps\mp\_load::main();

    // Disables Fall Damage
    setdvar( "bg_fallDamageMaxHeight","999999999" );
    setdvar( "bg_fallDamageMinHeight","9999999" );

    // For testing purposes
    setdvar( "cg_fovscale","1.2" );
    setdvar( "g_speed", "210" );

    setdvar( "bg_bobamplitudesprinting", "0" );
    setdvar( "bg_bobamplitudeducked", "0" );
    setdvar( "bg_bobamplitudeprone", "0" );
    setdvar( "bg_bobamplitudestanding", "0" );

    // Models
    preCacheModel( "plr_terry_steve" );
    preCacheModel( "plr_terry_police" );
    preCacheModel( "deluca" );
    preCacheModel( "viewhands_deluca" );

    // Weapons
    preCacheItem( "ak47_mp" );
    preCacheItem( "remington700_mp" );
    preCacheItem( "m40a3_mp" );
    
    level.old = getEnt( "old_trig", "targetname" );
    level.sniper = getEnt( "sniper_trig", "targetname" );
    level.bounce = getEnt( "bounce_trig", "targetname" );
    level.knife = getEnt( "knife_trig", "targetname" );
    level.strafe = getEnt( "strafe_trig", "targetname" );
    level.race = getEnt( "race_trig", "targetname" );
    level.rope = getEnt( "rope_trig", "targetname" );

    level.sniper_sign = getEnt( "sniper_sign", "targetname" );
    level.bounce_sign = getEnt( "bounce_sign", "targetname" );
    level.knife_sign = getEnt( "knife_sign", "targetname" );
    level.strafe_sign = getEnt( "strafe_sign", "targetname" );
    level.race_sign = getEnt( "race_sign", "targetname" );
    level.rope_sign = getEnt( "rope_sign", "targetname" );

    level.sniper_light = getEnt( "sniper_light", "targetname" );
    level.bounce_light = getEnt( "bounce_light", "targetname" );
    level.knife_light = getEnt( "knife_light", "targetname" );
    level.strafe_light = getEnt( "strafe_light", "targetname" );
    level.race_light = getEnt( "race_light", "targetname" );
    level.rope_light = getEnt( "rope_light", "targetname" );
    

    level.spark = loadfx( "prisonbreak/sparks" );
    level.spark_loop = loadfx( "prisonbreak/spark_loop" );
    level.smoke = loadfx( "prisonbreak/vent_smoke" );
    level.fire = loadfx( "prisonbreak/fire" );
    level.explosion = loadfx( "prisonbreak/explosion" );

    // Cool Stuff
    thread credits();

    // Acti
    thread acti();

    // Secret Shit
    thread secret();
    thread secret_fail1();
    thread secret_fail2();
    thread secret_finish();
    thread hammer();
    thread cat();

    // Spawn
    thread fx();
    thread startdoor();
    thread vents();

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
    thread trap13();
    thread trap14();
    thread trap15();
    thread trap16();

    // End Rooms
    thread old();
    thread strafe();
    thread race();
    thread knife();
    thread jump();
    thread rope();
    thread sniper();
}

credits() {
    while( 1 ) {
        wait 8;
        iPrintLn( "Mapped by Mist" );
        wait 8;
        iPrintLn( "Thanks to Jax & alexbubu7" );
        wait 8;
        iPrintLn( "made for ^8210^7, ^81.0" );
    }
}

acti() {
    level waittill( "round_started" );
    wait 5;

    if (isDefined (level.activ))
    level.activ setModel( "plr_terry_police" );
}

secret() {
    level.fail1 = getEnt( "secret_fail1_org", "targetname" );
    level.fail2 = getEnt( "secret_fail2_org", "targetname" );

    trig = getEnt( "secret_trig", "targetname" );

    bhop = getEnt( "bhop", "targetname" );
    bhop setHintString( "Bhop" );
    
    while( 1 ) {
        trig waittill( "trigger", player );
        player freezeControls( 1 );
        player setPlayerAngles( level.fail1.angles );
        player setOrigin( level.fail1.origin );
        wait .2;
        player freezeControls( 0 );
    }
}

secret_fail1() {
    trig = getEnt( "secret_fail1", "targetname" );

    while( 1 ) {
        trig waittill( "trigger", player );
        player freezeControls( 1 );
        player setOrigin( level.fail1.origin );
        player setPlayerAngles( level.fail1.angles );
        wait .2;
        player freezeControls( 0 );
    }
}

secret_fail2() {
    trig = getEnt( "secret_fail2", "targetname" );

    while( 1 ) {
        trig waittill( "trigger", player );
        player freezeControls( 1 );
        player setOrigin( level.fail2.origin );
        player setPlayerAngles( level.fail2.angles );
        wait .2;
        player freezeControls( 0 );
    }
}

secret_finish() {
    trig = getEnt( "secret_finish", "targetname" );
    org = getEnt( "secret_finish_org", "targetname" );

    while( 1 ) {
        trig waittill( "trigger", player );
        iPrintLnBold( "^8" + player.name + " ^7finished the secret!" );
        player freezeControls( 1 );
        player setOrigin( org.origin );
        player setPlayerAngles( org.angles );
        wait .05;
        player freezeControls( 0 );
        //player braxi\_rank::giveRankXp(undefined, 1234);
    }
}

hammer() {
    hammer = getEnt( "hammer", "targetname" );

    trig = getEnt( "hammer_trig", "targetname" );
    trig waittill( "trigger" );
    trig delete();
    hammer delete();

    thread door();
}

cat() {
    level waittill( "round_started" );
    trig = getEnt( "steve_trig", "targetname" );
    cat = getEnt( "cat", "targetname" );

    cat playLoopSound( "cat" );

    while( 1 ) {
        trig waittill( "trigger", player );
        player setModel( "plr_terry_steve" );
        iPrintLnBold("^8" + player.name + " ^7found steve");
    }
}

door() {
    door = getEnt( "secret_door", "targetname" );

    trig = getEnt( "secret_open", "targetname" );
    trig waittill( "trigger", player );
    trig delete();
    iPrintLnBold( "^8" + player.name + " ^7opened the secret!" );
    door moveZ( -100, 2, 1, 1 );
    wait 1.7;
    door notSolid();

}

fx() {
    level waittill( "round_started" );
    wait 5;

    // water area
    spark1 = getEnt( "spark_fx1", "targetname" );
    spark2 = getEnt( "spark_fx2", "targetname" );
    spark3 = getEnt( "spark_fx3", "targetname" );
    spark4 = getEnt( "spark_fx4", "targetname" );
    spark5 = getEnt( "spark_fx5", "targetname" );
    spark6 = getEnt( "spark_fx6", "targetname" );
    spark7 = getEnt( "spark_fx7", "targetname" );
    
    // spark sounds
    spark1 playLoopSound( "spark_loop" );
    spark2 playLoopSound( "spark_loop" );
    spark3 playLoopSound( "spark_loop" );
    spark4 playLoopSound( "spark_loop" );
    spark5 playLoopSound( "spark_loop" );
    spark6 playLoopSound( "spark_loop" );
    spark7 playLoopSound( "spark_loop" );

    // spark fx
    playFX(level.spark_loop, spark1.origin);
    playFX(level.spark_loop, spark2.origin);
    playFX(level.spark_loop, spark3.origin);
    playFX(level.spark_loop, spark4.origin);
    playFX(level.spark_loop, spark5.origin);
    playFX(level.spark_loop, spark6.origin);
    playFX(level.spark_loop, spark7.origin);
}

startdoor() {
    door = getEnt( "startdoor", "targetname" );
    siren = getEnt( "siren", "targetname" );
    wait 10;

    iPrintLn( "Cells Opening" );
    door moveZ( -80, 3, 1, 1 );
    siren playSound( "siren" );
}

vents() {
    vent = getEnt( "vent1", "targetname" );
    trig = getEnt( "vent1_trig", "targetname" );

    trig waittill( "trigger" );
    vent delete();
    trig delete();
    thread vent2();
}

vent2() {
    vent = getEnt( "vent2", "targetname" );
    trig = getEnt( "vent2_trig", "targetname" );

    trig waittill( "trigger", player );
    vent delete();
    trig delete();
    iPrintLn( player.name + " found a secret room" );
}

trap1() {
    pusher = getEnt( "trap1", "targetname" );
    sound = getEnt( "pusher", "targetname" );
    hurt = getEnt( "trap1_hurt", "targetname" );

    hurt EnableLinkTo();
    hurt LinkTo( pusher );

    trig = getEnt( "trap1_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    sound playSound( "pusher" );

    pusher moveX( -450, 1, .5, .5 );
    wait 4;
    sound playSound( "pusher_return" );
    pusher moveX( 450, 1, .5, .5 );
}

trap2() {
    origin = getEnt( "trap2_origin", "targetname" );
    sound1 = getEnt( "trap2_sound1", "targetname" );
    sound2 = getEnt( "trap2_sound2", "targetname" );

    hurt1 = getEnt( "trap2_hurt1", "targetname" );
    hurt2 = getEnt( "trap2_hurt2", "targetname" );

    fx1 = getEnt( "trap2_fx1", "targetname" );
    fx2 = getEnt( "trap2_fx2", "targetname" );
    fx3 = getEnt( "trap2_fx3", "targetname" );
    fx4 = getEnt( "trap2_fx4", "targetname" );

    hurt1 EnableLinkTo();
    hurt1 LinkTo( origin );

    hurt2 EnableLinkTo();
    hurt2 LinkTo( origin );

    trig = getEnt( "trap2_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );
    
    sound1 playSound( "spark" );
    sound2 playSound( "spark" );
    origin moveZ( 117, .2 );
    
    playFX(level.spark, fx1.origin);
    playFX(level.spark, fx2.origin);
    playFX(level.spark, fx3.origin);
    playFX(level.spark, fx4.origin);
    wait 1;
    origin moveZ( -117, .2 );
}

trap3() {
    origin = getEnt( "trap3_origin", "targetname" );

    hurt1 = getEnt( "trap3_hurt1", "targetname" );
    hurt2 = getEnt( "trap3_hurt2", "targetname" );
    hurt3 = getEnt( "trap3_hurt3", "targetname" );
    hurt4 = getEnt( "trap3_hurt4", "targetname" );
    
    fx1 = getEnt( "trap3_fx1", "targetname" );
    fx2 = getEnt( "trap3_fx2", "targetname" );
    fx3 = getEnt( "trap3_fx3", "targetname" );
    fx4 = getEnt( "trap3_fx4", "targetname" );

    hurt1 EnableLinkTo();
    hurt1 LinkTo( origin );

    hurt2 EnableLinkTo();
    hurt2 LinkTo( origin );
    
    hurt3 EnableLinkTo();
    hurt3 LinkTo( origin );
    
    hurt4 EnableLinkTo();
    hurt4 LinkTo( origin );
    
    trig = getEnt( "trap3_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );
    
    origin moveZ( 131, 2 );

    playFX(level.smoke, fx1.origin);
    playFX(level.smoke, fx2.origin);
    playFX(level.smoke, fx3.origin);
    playFX(level.smoke, fx4.origin);

    fx1 playLoopSound( "fan" );
    fx2 playLoopSound( "fan" );
    fx3 playLoopSound( "fan" );
    fx4 playLoopSound( "fan" );
}

trap4() {
    wall = getEnt( "trap4", "targetname" );
    
    hurt = getEnt( "trap4_hurt", "targetname" );
    hurt EnableLinkTo();
    hurt LinkTo( wall );

    trig = getEnt( "trap4_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    wall moveX( 270, 1, .5, .5 );
    wait 3;
    wall moveX( -270, 1, .5, .5 );
}

trap5() {
    origin = getEnt( "trap5_origin", "targetname" );

    hurt1 = getEnt( "trap5_hurt1", "targetname" );
    hurt2 = getEnt( "trap5_hurt2", "targetname" );
    hurt3 = getEnt( "trap5_hurt3", "targetname" );
    hurt4 = getEnt( "trap5_hurt4", "targetname" );
    
    hurt1 EnableLinkTo();
    hurt1 LinkTo( origin );
    
    hurt2 EnableLinkTo();
    hurt2 LinkTo( origin );
    
    hurt3 EnableLinkTo();
    hurt3 LinkTo( origin );
    
    hurt4 EnableLinkTo();
    hurt4 LinkTo( origin );
    

    fx1 = getEnt( "trap5_fx1", "targetname" );
    fx2 = getEnt( "trap5_fx2", "targetname" );
    fx3 = getEnt( "trap5_fx3", "targetname" );
    fx4 = getEnt( "trap5_fx4", "targetname" );

    trig = getEnt( "trap5_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );
    
    while( 1 ) {
        origin moveZ( 128, .2 );
        playFX(level.fire, fx1.origin);
        playFX(level.fire, fx2.origin);
        playFX(level.fire, fx3.origin);
        playFX(level.fire, fx4.origin);
        fx1 playSound( "fire" );
        fx2 playSound( "fire" );
        fx3 playSound( "fire" );
        fx4 playSound( "fire" );
        wait 1.4;
        origin moveZ( -128, .2 );
        wait 2.2;
    }
}

trap6() {
    plat1 = getEnt( "trap6_1", "targetname" );
    plat2 = getEnt( "trap6_2", "targetname" );
    
    trig = getEnt( "trap6_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    plat1 rotateYaw( -1080, 5, 1, 1 );
    wait 2;
    plat2 rotateYaw( 1080, 5, 1, 1 );
}

trap7() {
    plat1 = getEnt( "trap7_1", "targetname" );
    plat2 = getEnt( "trap7_2", "targetname" );
    
    trig = getEnt( "trap7_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    plat1 rotateYaw( -1080, 5, 1, 1 );
    wait 2;
    plat2 rotateYaw( 1080, 5, 1, 1 );
}

trap8() {
    plat1 = getEnt( "trap8_1", "targetname" );

    trig = getEnt( "trap8_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    plat1 rotateYaw( -1080, 5, 1, 1 );
}

trap9() {
    origin = getEnt( "trap9_origin", "targetname" );
    clip = getEnt( "trap9_clip", "targetname" );
    barrel1 = getEnt( "trap9_barrel1", "targetname" );
    barrel2 = getEnt( "trap9_barrel2", "targetname" );
    barrel3 = getEnt( "trap9_barrel3", "targetname" );
    barrel4 = getEnt( "trap9_barrel4", "targetname" );
    
    c41 = getEnt( "trap9_c41", "targetname" );
    c42 = getEnt( "trap9_c42", "targetname" );
    c43 = getEnt( "trap9_c43", "targetname" );
    c44 = getEnt( "trap9_c44", "targetname" );

    fx = getEnt( "trap9_fx", "targetname" );

    hurt = getEnt( "trap9_hurt", "targetname" );
    hurt EnableLinkTo();
    hurt LinkTo( origin );

    trig = getEnt( "trap9_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    clip playSound( "explosion" );
    origin moveZ( 100, .1 );
    c41 delete();
    c42 delete();
    c43 delete();
    c44 delete();
    
    barrel1 delete();
    barrel2 delete();
    barrel3 delete();
    barrel4 delete();
    clip delete();
    playFX(level.explosion, fx.origin);
    wait .5;
    origin moveZ( -100, .1 );
}

trap10() {
    up = getEnt( "trap10", "targetname" );

    trig = getEnt( "trap10_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    up moveZ( 185, 1, .5, .5 );
}

trap11() {
    spinner = getEnt( "trap11", "targetname" );

    hurt = getEnt( "trap11_hurt", "targetname" );
    hurt EnableLinkTo();
    hurt LinkTo( spinner );

    trig = getEnt( "trap11_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    while( 1 ) {
        spinner rotateYaw( -1080, 5 );
        wait 5;
    }
}

trap12() {
    skipper = getEnt( "trap12", "targetname" );

    hurt = getEnt( "trap12_hurt", "targetname" );
    hurt EnableLinkTo();
    hurt LinkTo( skipper );

    trig = getEnt( "trap12_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    while( 1 ) {
        skipper rotateRoll( -360, 2 );
        wait 2;
    }
}

trap13() {
    ladder1 = getEnt( "trap13_1", "targetname" );
    ladder2 = getEnt( "trap13_2", "targetname" );

    trig = getEnt( "trap13_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    randomPart = randomInt( 2 );
        switch( randomPart ) {
        case 0:
        for( i = 0; i < ladder1.size; i++ ) {
            ladder1 delete();
            wait .05;
        }
        break;
        case 1:
        for( i = 0; i < ladder2.size; i++ ) {
            ladder2 delete();
            wait .05;
        }
        break;
    }
}

trap14() {
    spinner = getEnt( "trap14", "targetname" );

    hurt = getEnt( "trap14_hurt", "targetname" );
    hurt EnableLinkTo();
    hurt LinkTo( spinner );

    trig = getEnt( "trap14_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    while( 1 ) {
        spinner rotateYaw( -1080, 5 );
        wait 5;
    }
}

trap15() {
    bounce = getEnt( "trap15_1", "targetname" );

    trig = getEnt( "trap15_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    bounce moveY( 110, 5, 2, 2 );
    wait 5;
    bounce moveY( -110, 5, 2, 2 );
}

trap16() {
    left = getEnt( "trap16_left", "targetname" );
    right = getEnt( "trap16_right", "targetname" );

    trig = getEnt( "trap16_trig", "targetname" );
    trig SetHintString( "^7Press ^8&&1 ^7To Activate" );
    trig waittill( "trigger", player );
    trig SetHintString( "^8Activated" );

    left moveX( 53.5, .5 );
    right moveX( -53.5, .5 );

}

old() {
    door = getEnt( "old_door", "targetname" );

    level.old waittill( "trigger", player );
    level.old delete();
    level.sniper delete();
    level.bounce delete();
    level.knife delete();
    level.strafe delete();
    level.race delete();
    level.rope delete();

    level.sniper_sign delete();
    level.bounce_sign delete();
    level.knife_sign delete();
    level.strafe_sign delete();
    level.race_sign delete();
    level.rope_sign delete();

    level.sniper_light delete();
    level.bounce_light delete();
    level.knife_ligh delete();
    level.strafe_light delete();
    level.race_light delete();
    level.rope_light delete();

    iPrintLnBold( "^8" + player.name + " ^7chose the classic way!" );
    door moveZ( -200, 1, .5, .5 );
}

strafe() {

    orig_jumper = getEnt ("jump_strafe_org", "targetname");
    orig_acti = getEnt ("acti_strafe_org", "targetname");

    while ( 1 ) {
        level.strafe setHintString( "Press ^8&&1 ^7to choose ^8Pure Strafe!" );        
        level.strafe waittill( "trigger", player );
        level.strafe setHintString( "^8" + player.name + " ^7is batteling it out in the strafe room with ^8" + level.activ.name + "^7!" );

        level.old delete();
        level.sniper delete();
        level.bounce delete();
        level.knife delete();
        //level.strafe delete();
        level.race delete();
        level.rope delete();

        level.sniper_sign delete();
        level.bounce_sign delete();
        level.knife_sign delete();
        //level.strafe_sign delete();
        level.race_sign delete();
        level.rope_sign delete();

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon ("knife_mp");
        player iPrintLnBold("Get ready!");
        player.maxhealth = 100;

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setPlayerAngles(orig_acti.angles);
            level.activ setOrigin(orig_acti.origin);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ iPrintLnBold("Get ready!");
            level.activ.maxhealth = 100;

            player iPrintLnBold(player.name + " VS " + level.activ.name);
            level.activ iPrintLnBold(player.name + " VS " + level.activ.name);

            }
                    
            player freezecontrols(1);
            level.activ freezecontrols(1);

            wait 3;

            player iPrintlnBold( "^83" );
            if(isDefined(level.activ) && isAlive(level.activ))
                level.activ iPrintlnBold( "^83" );
            wait 1;
            player iPrintlnBold( "^82" );
            if(isDefined(level.activ) && isAlive(level.activ))
                level.activ iPrintlnBold( "^82" );
            wait 1;
            player iPrintlnBold( "^81" );
            if(isDefined(level.activ) && isAlive(level.activ))
                level.activ iPrintlnBold( "^81" );
            wait 1;
            player iPrintlnBold( "^7GO^7!" );
            player freezecontrols(0);
            if(isDefined(level.activ) && isAlive(level.activ))
            {
                level.activ iPrintlnBold( "^7GO^7!" );
                level.activ freezecontrols(0);
            }

        thread pureend(player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        level notify("strafeend");

        iPrintLnBold ("^3they/them got shat on");
    }
}

pureend(who, who2)
{
    level endon("strafeend");
    trig = getEnt ("strafe_end_trig", "targetname");
    origWin = getEnt ("winner", "targetname");
    origLose = getEnt ("loser", "targetname");

    while(1)
    {
        trig waittill("trigger", winner);
        winner freezeControls (1);
        winner iPrintLnBold("^7You won !");
        winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        wait .1;
        winner freezeControls (0);
        winner giveWeapon("ak47_mp");
        winner giveMaxAmmo("ak47_mp");
        winner switchToWeapon("ak47_mp");


        if (winner == who)
            loser = who2;
        else
            loser = who;

        if (isDefined(loser))
        {
            loser setOrigin (origLose.origin);
            loser setPlayerAngles (origLose.angles);
            loser freezeControls (1);
            loser takeAllWeapons();
            loser iPrintLnBold("^7lmao u bad");
        }
    }
}

race() {

    level.orig_jumper = getEnt ("jump_race_org", "targetname");
    level.orig_acti = getEnt ("acti_race_org", "targetname");

    while ( 1 ) {
        level.race setHintString( "Press ^8&&1 ^7to choose ^8Race!" );        
        level.race waittill( "trigger", player );
        level.race setHintString( "^8" + player.name + " ^7is batteling it out in the race room with ^8" + level.activ.name + "^7!" );

        level.old delete();
        level.sniper delete();
        level.bounce delete();
        level.knife delete();
        level.strafe delete();
        //level.race delete();
        level.rope delete();

        level.sniper_sign delete();
        level.bounce_sign delete();
        level.knife_sign delete();
        level.strafe_sign delete();
        //level.race_sign delete();
        level.rope_sign delete();

        player setOrigin (level.orig_jumper.origin);
        player setPlayerAngles (level.orig_jumper.angles);
        player iPrintLnBold("Get ready!");
        player.maxhealth = 100;

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setPlayerAngles(level.orig_acti.angles);
            level.activ setOrigin(level.orig_acti.origin);
            level.activ takeAllWeapons();
            level.activ giveWeapon("beretta_mp");
            level.activ switchToWeapon("beretta_mp");
            level.activ iPrintLnBold("Get ready!");
            level.activ.maxhealth = 100;

            player iPrintLnBold(player.name + " VS " + level.activ.name);
            level.activ iPrintLnBold(player.name + " VS " + level.activ.name);

            }
                    
            player freezecontrols(1);
            level.activ freezecontrols(1);

            wait 3;

            player iPrintlnBold( "^83" );
            if(isDefined(level.activ) && isAlive(level.activ))
                level.activ iPrintlnBold( "^83" );
            wait 1;
            player iPrintlnBold( "^82" );
            if(isDefined(level.activ) && isAlive(level.activ))
                level.activ iPrintlnBold( "^82" );
            wait 1;
            player iPrintlnBold( "^81" );
            if(isDefined(level.activ) && isAlive(level.activ))
                level.activ iPrintlnBold( "^81" );
            wait 1;
            player iPrintlnBold( "^7GO^7!" );
            player freezecontrols(0);
            if(isDefined(level.activ) && isAlive(level.activ))
            {
                level.activ iPrintlnBold( "^7GO^7!" );
                level.activ freezecontrols(0);
            }

        thread raceend(player, level.activ);
        thread racefail();

        while(isDefined(player) && isAlive(player))
            wait .05;

        level notify("strafeend");

        iPrintLnBold("^3they/them got shat on");
    }
}

raceend(who, who2)
{
    level endon("strafeend");
    trig = getEnt ("race_end", "targetname");
    origWin = getEnt ("race_winner_org", "targetname");
    origLose = getEnt ("race_loser_org", "targetname");

    while(1)
    {
        trig waittill("trigger", winner);
        winner freezeControls (1);
        winner iPrintLnBold("^7You won !");
        winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        wait .1;
        winner freezeControls (0);
        winner giveWeapon("ak47_mp");
        winner giveMaxAmmo("ak47_mp");
        winner switchToWeapon("ak47_mp");


        if (winner == who)
            loser = who2;
        else
            loser = who;

        if (isDefined(loser))
        {
            loser setOrigin (origLose.origin);
            loser setPlayerAngles (origLose.angles);
            loser freezeControls (1);
            loser takeAllWeapons();
            loser iPrintLnBold("^7lmao u bad");
        }
    }
}

racefail() {
    
    trig = getEnt( "race_fail", "targetname" );

    while( 1 ) {
        trig waittill( "trigger", player );

        if( player.pers["team"] == "allies" ) {
            player freezeControls( 1 );
            player SetPlayerAngles( level.orig_jumper.angles );
            player SetOrigin( level.orig_jumper.origin );
            player freezeControls( 0 );
        }
        else if( player.pers["team"] == "axis" ) {
            level.activ freezeControls( 1 );
            level.activ setPlayerAngles ( level.orig_acti.angles );
            level.activ setOrigin( level.orig_acti.origin );
            level.activ freezeControls( 0 );
        }
    }
}

knife() {
    jump = getEnt( "jump_knife_org", "targetname" );
    acti = getEnt( "acti_knife_org", "targetname" );

    while( 1 ) {
            level.knife setHintString( "Press ^8&&1 ^7to choose ^8Knife!" );        
            level.knife waittill( "trigger", player );
            level.knife setHintString( "^8" + player.name + " ^7is batteling it out in the knife room with ^8" + level.activ.name + "^7!" );  // change to level.activ

            level.old delete();
            level.sniper delete();
            level.bounce delete();
            //level.knife delete();
            level.strafe delete();
            level.race delete();
            level.rope delete();

            level.sniper_sign delete();
            level.bounce_sign delete();
            //level.knife_sign delete();
            level.strafe_sign delete();
            level.race_sign delete();
            level.rope_sign delete();

            if(!level.inroom) {

                level.inroom = true;

                player setOrigin( jump.origin );
                player setPlayerAngles( jump.angles );
                player TakeAllWeapons(); 
                player GiveWeapon( "knife_mp" );
                player switchToWeapon( "knife_mp" );
                player iPrintLnBold("Get ready!");
                player.health = 100;
                
                
                if( isDefined( level.activ ) && isAlive( level.activ ) ) 
                {

                    level.activ setOrigin( acti.origin );
                    level.activ setPlayerAngles( acti.angles );
                    level.activ TakeAllWeapons(); 
                    level.activ GiveWeapon( "knife_mp" );
                    level.activ switchToWeapon( "knife_mp" );
                    level.activ iPrintLnBold("Get ready!");
                    level.activ.health = 100;   
                    
                    player iPrintLnBold(player.name + " VS " + level.activ.name);
                    level.activ iPrintLnBold(player.name + " VS " + level.activ.name);
                }
                    
                player freezecontrols(1);
                level.activ freezecontrols(1);

                wait 3;

                player iPrintlnBold( "^83" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^83" );
                wait 1;
                player iPrintlnBold( "^82" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^82" );
                wait 1;
                player iPrintlnBold( "^81" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^81" );
                wait 1;
                player iPrintlnBold( "^7GO^7!" );
                player freezecontrols(0);
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                    level.activ iPrintlnBold( "^7GO^7!" );
                    level.activ freezecontrols(0);
                }
                
                while( isAlive( player ) && isDefined( player ) ) 
                    wait 0.05;

                iPrintLnBold ("^3they/them got shat on");
                level.inroom = false;
            }
    }
}

jump() {
    level.jump_jump = getEnt( "jump_jump_org", "targetname" );
    level.acti_jump = getEnt( "jump_acti_org", "targetname" );

    while( 1 ) {
            level.bounce setHintString( "Press ^8&&1 ^7to choose ^8Bounce!" );        
            level.bounce waittill( "trigger", player );
            level.bounce setHintString( "^8" + player.name + " ^7is batteling it out in the bounce room with ^8" + level.activ.name + "^7!" );  // change to level.activ

            level.old delete();
            level.sniper delete();
            //level.bounce delete();
            level.knife delete();
            level.strafe delete();
            level.race delete();
            level.rope delete();

            level.sniper_sign delete();
            //level.bounce_sign delete();
            level.knife_sign delete();
            level.strafe_sign delete();
            level.race_sign delete();
            level.rope_sign delete();

            thread jump_ak();
            thread jump_fail();

            if(!level.inroom) {

                level.inroom = true;

                player setOrigin( level.jump_jump.origin );
                player setPlayerAngles( level.jump_jump.angles );
                player TakeAllWeapons(); 
                player GiveWeapon( "knife_mp" );
                player switchToWeapon( "knife_mp" );
                player iPrintLnBold("Get ready!");
                player.health = 100;
                
                
                if( isDefined( level.activ ) && isAlive( level.activ ) ) 
                {

                    level.activ setOrigin( level.acti_jump.origin );
                    level.activ setPlayerAngles( level.acti_jump.angles );
                    level.activ TakeAllWeapons(); 
                    level.activ GiveWeapon( "knife_mp" );
                    level.activ switchToWeapon( "knife_mp" );
                    level.activ iPrintLnBold("Get ready!");
                    level.activ.health = 100;   
                    
                    player iPrintLnBold(player.name + " VS " + level.activ.name);
                    level.activ iPrintLnBold(player.name + " VS " + level.activ.name);
                }
                    
                player freezecontrols(1);
                level.activ freezecontrols(1);

                wait 3;

                player iPrintlnBold( "^83" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^83" );
                wait 1;
                player iPrintlnBold( "^82" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^82" );
                wait 1;
                player iPrintlnBold( "^81" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^81" );
                wait 1;
                player iPrintlnBold( "^7GO!" );
                player freezecontrols(0);
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                    level.activ iPrintlnBold( "^7GO!" );
                    level.activ freezecontrols(0);
                }
                
                while( isAlive( player ) && isDefined( player ) ) 
                    wait 0.05;

                iPrintLnBold("^3they/them got shat on");
                level.inroom = false;
            }
    }
}

jump_ak() {
    trig = getEnt( "sniper_grab", "targetname" );

    while( 1 ) {
        trig waittill( "trigger", player );
        player takeAllWeapons();
        player giveWeapon( "remington700_mp" );
        player switchToWeapon( "remington700_mp" );
        player giveMaxAmmo( "remington700_mp" );
        player giveWeapon( "m40a3_mp" );
        player giveMaxAmmo( "m40a3_mp" );
    }
}

jump_fail() {
    
    trig = getEnt( "jump_fail", "targetname" );

    while( 1 ) {
        trig waittill( "trigger", player );

        if( player.pers["team"] == "allies" ) {
            player freezeControls( 1 );
            player SetPlayerAngles( level.jump_jump.angles );
            player SetOrigin( level.jump_jump.origin );
            player freezeControls( 0 );
        }
        else if( player.pers["team"] == "axis" ) {
            level.activ freezeControls( 1 );
            level.activ setPlayerAngles ( level.acti_jump.angles );
            level.activ setOrigin( level.acti_jump.origin );
            level.activ freezeControls( 0 );
        }
    }
}

rope()
{
    jump_rope_org = getEnt( "rope_jump_org", "targetname");
    acti_rope_org = getEnt( "rope_acti_org", "targetname" );

    level.rope_spin = getEnt( "rope", "targetname" );

    level.jump_rope_fail = getEnt( "rope_fail", "targetname" );

    jump_rope_over_org = getEnt( "rope_winner_org", "targetname");
    acti_rope_over_org = getEnt( "rope_loser_org", "targetname" );

    level.jump_rope_fail enableLinkTo();
    level.jump_rope_fail linkTo(level.rope_spin);

    while(1)
    {
        level.rope setHintString( "Press ^8&&1 ^7to choose ^8Jump Rope!" );        
        level.rope waittill( "trigger", player );
        level.rope setHintString( "^8" + player.name + " ^7is batteling it out in the Jump Rope Room with ^8" + level.activ.name + "^7!" );

        if(isDefined(level.classic))
        {
            level.old delete();
            level.sniper delete();
            level.bounce delete();
            level.knife delete();
            level.strafe delete();
            level.race delete();
            //level.rope delete();

            level.sniper_sign delete();
            level.bounce_sign delete();
            level.knife_sign delete();
            level.strafe_sign delete();
            level.race_sign delete();
            //level.rope_sign delete();
        }

        player setOrigin(jump_rope_org.origin);
        player setPlayerAngles(jump_rope_org.angles);
        player TakeAllWeapons();
        player freezecontrols(1);
        player iPrintLnBold("Get ready!");

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin(acti_rope_org.origin);
            level.activ setPlayerAngles(acti_rope_org.angles);
            level.activ TakeAllWeapons();
            level.activ freezecontrols(1);

            player iPrintLnBold(player.name + " VS " + level.activ.name);
            level.activ iPrintLnBold(player.name + " VS " + level.activ.name);
        }

        wait 3;

        player iPrintlnBold( "^83" );
        if(isDefined(level.activ) && isAlive(level.activ))
            level.activ iPrintlnBold( "^83" );
        wait 1;
        player iPrintlnBold( "^82" );
        if(isDefined(level.activ) && isAlive(level.activ))
            level.activ iPrintlnBold( "^82" );
        wait 1;
        player iPrintlnBold( "^81" );
        if(isDefined(level.activ) && isAlive(level.activ))
            level.activ iPrintlnBold( "^81" );
        wait 1;
        player iPrintlnBold( "^7GO!" );
        player freezecontrols(0);
        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ iPrintlnBold( "^7GO!" );
            level.activ freezecontrols(0);
        }
            
        level.ropeloser = undefined;

        thread ropeLogic(player);
        ropeCheck(player);

        if(isDefined(level.ropeloser))
        {
            player setOrigin(jump_rope_over_org.origin);
            player setPlayerAngles(jump_rope_over_org.angles);

            level.activ setOrigin(acti_rope_over_org.origin);
            level.activ setPlayerAngles(acti_rope_over_org.angles);

            if(level.ropeloser == player)
            {
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                    level.activ giveWeapon("ak47_mp");
                    level.activ switchToWeapon( "ak47_mp" );
                    level.activ giveMaxAmmo("ak47_mp");
                }


                player freezeControls(1);
            }
            else
            {
                player giveWeapon("ak47_mp");
                player switchToWeapon( "ak47_mp" );
                player giveMaxAmmo("ak47_mp");

                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ freezeControls(1);
            }
        }

        while( isDefined( player ) && isAlive( player ) ) 
            wait 0.05;

        iPrintLnBold("^3they/them got shat on");
    }
}

ropeLogic(player)
{
    level endon("rope_touched");

    ropespeed = 3;

    while(isDefined(player) && isAlive(player))
    {
        level.rope_spin rotatePitch(360, ropespeed);
        level.rope_spin waittill("rotatedone");


        if(!(ropespeed<1))
            ropespeed /= 1.1;
    }

    level notify("rope_touched");
}

ropeCheck(player)
{
    level endon("rope_touched");

    if(!(isDefined(player) && isAlive(player)))
        return;

    level.jump_rope_fail waittill("trigger", player);
    level.ropeloser = player;
    level notify("rope_touched");
}

sniper() {
    level.snipe_jump = getEnt( "jump_sniper_org", "targetname" );
    level.snipe_acti = getEnt( "acti_sniper_org", "targetname" );

    while( 1 ) {

            level.sniper setHintString( "Press ^8&&1 ^7to choose ^8Sniper!" );        
            level.sniper waittill( "trigger", player );
            level.sniper setHintString( "^8" + player.name + " ^7is batteling it out in the sniper room with ^8" + level.activ.name + "^7!" );  // change to level.activ

            level.old delete();
            //level.sniper delete();
            level.bounce delete();
            level.knife delete();
            level.strafe delete();
            level.race delete();
            level.rope delete();

            //level.sniper_sign delete();
            level.bounce_sign delete();
            level.knife_sign delete();
            level.strafe_sign delete();
            level.race_sign delete();
            level.rope_sign delete();

            thread sniper_deag();
            thread sniper_fail();

            if(!level.inroom) {

                level.inroom = true;

                player setOrigin( level.snipe_jump.origin );
                player setPlayerAngles( level.snipe_jump.angles );
                player TakeAllWeapons(); 
                player GiveWeapon( "m40a3_mp" );
                player giveMaxAmmo( "m40a3_mp" );
                player GiveWeapon( "remington700_mp" );
                player giveMaxAmmo( "remington700_mp" );
                player switchToWeapon( "m40a3_mp" );
                player iPrintLnBold("Get ready!");
                player.health = 100;
                
                if( isDefined( level.activ ) && isAlive( level.activ ) ) 

                    level.activ setOrigin( level.snipe_acti.origin );
                    level.activ setPlayerAngles( level.snipe_acti.angles );
                    level.activ TakeAllWeapons(); 
                    level.activ GiveWeapon( "m40a3_mp" );
                    level.activ giveMaxAmmo( "m40a3_mp" );
                    level.activ GiveWeapon( "remington700_mp" );
                    level.activ giveMaxAmmo( "remington700_mp" );
                    level.activ switchToWeapon( "m40a3_mp" );
                    level.activ iPrintLnBold("Get ready!");
                    level.activ.health = 100;   
                }

                player freezecontrols(1);
                level.activ freezecontrols(1);

                wait 3;

                player iPrintlnBold( "^83" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^83" );
                wait 1;
                player iPrintlnBold( "^82" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^82" );
                wait 1;
                player iPrintlnBold( "^81" );
                if(isDefined(level.activ) && isAlive(level.activ))
                    level.activ iPrintlnBold( "^81" );
                wait 1;
                player iPrintlnBold( "^7GO!" );
                player freezecontrols(0);
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                    level.activ iPrintlnBold( "^7GO!" );
                    level.activ freezecontrols(0);
                }
                
                while( isAlive( player ) && isDefined( player ) ) 
                    wait 0.05;

                iPrintLnBold("^3they/them got shat on");
                level.inroom = false;
    }
}

sniper_deag() {
    deagle = getEnt( "deagle", "targetname" );

    trig = getEnt( "deagle_trig", "targetname" );
    trig waittill( "trigger", player );
    trig delete();

    player giveWeapon( "deserteagle_mp" );
    player switchToWeapon( "deserteagle_mp" );
    player giveMaxAmmo( "deserteagle_mp" );
    deagle delete();
}

sniper_fail() {
    
    trig = getEnt( "sniper_fail", "targetname" );

    while( 1 ) {
        trig waittill( "trigger", player );

        if( player.pers["team"] == "allies" ) {
            player freezeControls( 1 );
            player SetPlayerAngles( level.snipe_jump.angles );
            player SetOrigin( level.snipe_jump.origin );
            player freezeControls( 0 );
        }
        else if( player.pers["team"] == "axis" ) {
            level.activ freezeControls( 1 );
            level.activ setPlayerAngles ( level.snipe_acti.angles );
            level.activ setOrigin( level.snipe_acti.origin );
            level.activ freezeControls( 0 );
        }
    }
}