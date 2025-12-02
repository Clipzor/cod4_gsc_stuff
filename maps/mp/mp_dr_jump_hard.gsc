#include maps\mp\gametypes\_hud_util;
#include braxi\_dvar;
#include braxi\_common;
#include braxi\_rank;
main() {
        maps\mp\_load::main();
        maps\mp\_teleport::main();
//setExpFog(300, 3500, .5, 0.5, 0.45, 0);      
        VisionSetNaked( "armada_ground" );
 
        game["allies"] = "marines";
        game["axis"] = "opfor";
        game["attackers"] = "allies";
        game["defenders"] = "axis";
        game["allies_soldiertype"] = "desert";
        game["axis_soldiertype"] = "desert";

        level.firstenter = false;
 
        setdvar( "r_specularcolorscale", "1" );
 
        precacheitem ("ak74u_mp");
        precacheitem ("intervention_mp");
        precacheitem ("m40a3_mp");
        precacheitem ("knife_mp");
        precacheitem ("raygun_mp");
       
        thread start_door();
        thread credits();
        thread end_roof();
        thread end();
        thread music();

        thread vip();
        thread moving_platform();
        thread Secret();
        thread sniperoom();
        thread akroom();
        thread raygunroom();
        thread kniferoom();
        thread bounceroom();
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
       
        addTriggerToList("trap1_trig");
        addTriggerToList("trap2_trig");
        addTriggerToList("trap3_trig");
        addTriggerToList("trap4_trig");
        addTriggerToList("trap5_trig");
        addTriggerToList("trap6_trig");
        addTriggerToList("trap7_trig");
        addTriggerToList("trap8_trig");
        addTriggerToList("trap9_trig");
        addTriggerToList("trap10_trig");
        addTriggerToList("trap11_trig");
        addTriggerToList("trap12_trig");
       
       
       
        level.PlayerInRoom = false;
        level.gotsnip = false;
        level.jumperfail = 0;
}
 
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
 
music()
{
    level waittill("round_started");
    x = randomint(4);
    if(x == 0)
    {
            ambientplay("amb_sound1");
            iprintln("Song Name: ^5Feint - The Journey Feat. Veela");
    }
    if(x == 1)
    {
            ambientplay("amb_sound2");
            iprintln("Song Name: ^5Krale - Frontier (ft. Jasmina Lin and Jay Christopher)");
    }
    if(x == 2)
    {
            ambientplay("amb_sound3");
            iprintln("Song Name: ^5Vicetone vs. Popeska - The New Kings Ft. Luciana");
    }
    if(x == 3)
    {
            ambientplay("amb_sound4");
            iprintln("Song Name: ^5Pegboard Nerds - Disconnected");
    }
}
 
 
 
 
start_door()
{
        trig = getEnt("start_door_trig","targetname");
        brush = getEnt("start_door","targetname");
        button = getEnt("start_door_button","targetname");
        
        if(getdvarint("dr_auto_open_door")) {
                brush delete();
        } else {
                level waittill( "round_started" );
                brush moveZ(-272,2);
                brush waittill("movedone");
                brush delete();
        }
}
 
credits()
{
        iprintln( "^5Mapped & scripted by ^7DarkBla");          wait 1;
        iprintln( "^3Thanks to all the testers ^9<3");          wait 1;      
        iprintln( "^7Sheep Wizard ^3for help with some bugs");  wait 1;
        iprintln( "^0[AR51]Mroz ^3for big help <3");
}
 
 
end_roof() {
 trig = getentarray("roof","targetname");
 if(isdefined(trig)) {
  for(lp=0;lp<trig.size;lp=lp+1)
  trig[lp] thread end_roof_xp();
 }
}
 
end_roof_xp() {
  self waittill("trigger",player);
  xp = getent(self.target, "targetname");
  player braxi\_rank::giveRankXP( "", 75);
  iprintlnbold (player.name +" Have landed in end roof and recived XP");
}
 
end()
{
  trigger = getent("endmap_trig","targetname");
 
    trigger waittill("trigger",player);
    iprintlnbold("^3"+ player.name +"^1 Have Finished The Map ^51st ^2!!!!!");
       
  }
  
vip()
{      
//On AR51 servers you have different guid so i add 2 :P
        level.accepted1 = "da6c0c4832a50cd7e1598a17ef04f2e4"; //DarkBla
        level.accepted2 = "e6dc4434ead7bcfc7263327c11ba6bad"; //AR51 DarkBla
        level.accepted3 = "074bcda0f71bd0d430ea726d3a2faff5"; //Mroz
        level.accepted4 = "812e75cedc71fa1c9f44ab15d06d9848"; //AR51 Mroz
        level.accepted5 = "99d2c6b52d629179ec5dfbbdf7192dd8"; //<3 RaBBit
		level.accepted6 = "002a0f0300b57f6dcc832a755adfbd94"; //2nd <3 RaBBit
		level.accepted7 = "0000000013e7917ab74b6d9c3b254cb4"; //Runy
		level.accepted8 = "570f3f8a63604d49097358d588fc8904"; //AR51 Runy
		level.accepted9 = "0000000069eda27712776d16404b0ae1"; //Neck
		level.accepted9 = "2c6e8b8569eda27712776d16404b0ae1"; //AR51 Neck
       
        while (1)
        {
        level waittill( "player_spawn", player );
        wait 2;
        tempGuid = player getGUID();
       
        if ((tempGuid == level.accepted1) || (tempGuid == level.accepted2) || (tempGuid == level.accepted3) || (tempGuid == level.accepted4) || (tempGuid == level.accepted5))
        {
        player giveweapon( "raygun_mp");
        player switchToWeapon( "raygun_mp" );
        iPrintLnBold ("^3Sexy Vip Online <3");
        }
}
}
 
moving_platform()
{
 
platform = getent("platform","targetname");
trigger = getent("platform_trig","targetname");
 
trigger waittill("trigger");
trigger delete();
while(1)
{
platform movey( 1392,4,1,1);
wait 5;
platform movey( -1392,4,1,1);
wait 5;
}
}
 
Secret()
{
        thread SecretEnter();
        thread SecretFinish();
        thread SecretFinish_easy();
}
 
SecretEnter()
{
        trig = GetEnt("secret_enter_trig","targetname");
        end = GetEnt("secret_enter_origin","targetname");
 
 
        for(;;)
        {
                trig waittill("trigger", player);
 
                player SetOrigin( end.origin );
                player SetPlayerAngles( end.angles );
                player GiveWeapon( "ak74u_mp" );
                player GiveMaxAmmo( "ak74u_mp" );
                wait .05;
                player SwitchToWeapon( "ak74u_mp" );
 
                player thread SecretTimer();
        }
}
 
SecretTimer()
{
        self endon( "disconnect" );
        self endon( "death" );
        self endon( "endsecret" );
 
        self.secret_timer = NewClientHudElem( self );
        self.secret_timer.y = 32;
        self.secret_timer.alignX = "center";
        self.secret_timer.alignY = "middle";
        self.secret_timer.horzAlign = "center";
        self.secret_timer.sort = -3;
        self.secret_timer.fontScale = 2.5;
        self.secret_timer.owner = self;
        self thread removehudifsuicide();
 
        self.secret_time_left = 180;
        self.secret_finished = false;
 
        while( self.secret_time_left > 0 && !self.secret_finished )
        {
                self.secret_timer setText( "^3Secret time left: ^0" + self.secret_time_left );
                self.secret_time_left--;
                wait 1;
        }
       
        if( !self.secret_finished )
        {
                if(isdefined(self.secret_timer))
                        self.secret_timer Destroy();
                self Suicide();
                self iPrintlnBold( "^3Nab, you didn't finish secret in time..." );
        }
       
}
 
removehudifsuicide() {
        self endon ("disconnect");
        self endon ("endsecret");
        self waittill("death");
        self.secret_finished = true;
        if(isdefined(self.secret_timer))
                self.secret_timer destroy();
       
}
 
SecretFinish()
{
        trig = GetEnt("secret_finish_trig","targetname");
        end = GetEnt("secret_finish_end","targetname");
 
        for(;;)
        {
                trig waittill("trigger", player);
 
                player.secret_finished = true;
                if(isdefined(player.secret_timer)) {
                        player.secret_timer Destroy();
                        player notify("endsecret");
                }
 
                player SetOrigin( end.origin );
                player SetPlayerAngles( end.angles );
                player braxi\_rank::giveRankXP( "", 500);
 
                iPrintlnBold( player.name + "^3 has finished the ^9Hard Secret^3!" );
 
        }
}
 
SecretFinish_easy()
{
        trig = GetEnt("easysecret_end","targetname");
        end = GetEnt("easysecret_end_script","targetname");
 
        for(;;)
        {
                trig waittill("trigger", player);
 
                player.secret_finished = true;
                player.secret_timer Destroy();
 
                player SetOrigin( end.origin );
                player SetPlayerAngles( end.angles );
                player braxi\_rank::giveRankXP( "", 50);
 
                iPrintlnBold( player.name + "^3 has finished the ^9Easy Secret^3!" );
 
        }
}
 
 
 
 
sniperoom()
{
        level.snipe_trig = GetEnt("room_snipe_trig","targetname");
    jump = GetEnt( "sniper_j", "targetname" );
    acti = GetEnt( "sniper_a", "targetname" );
       
        thread nukebullets();
        thread snip_fail();
       
 
        while(1)
        {
                level.snipe_trig waittill("trigger", player);

                if(!level.firstenter) {
                        level.firstenter = true;
                        level.bounce_trig delete();
                        level.knife_trig delete();
                        level.ak_trig delete();
                        level.raygun_trig delete();
                }
 
                if( !level.PlayerInRoom )
                {
                        if( isDefined(level.old_trig) )
                                level.old_trig Delete();
                        level.PlayerInRoom = true;
                       
                        player.health = player.maxhealth;
                        level.activ.health = level.activ.maxhealth;
                        player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "m40a3_mp" );
                        player GiveMaxAmmo( "m40a3_mp" );
                    player GiveWeapon( "intervention_mp" );
                        player GiveMaxAmmo( "intervention_mp" );
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "m40a3_mp" );
                level.activ GiveMaxAmmo( "m40a3_mp" );
                    level.activ GiveWeapon( "intervention_mp" );
                level.activ GiveMaxAmmo( "intervention_mp" );
                wait .05;
                player switchToWeapon( "intervention_mp" );
                level.activ SwitchToWeapon( "intervention_mp" );
                player FreezeControls(1);
                        level.activ FreezeControls(1);
                        noti = SpawnStruct();
                                        noti.titleText = "Sniper Room";
                                        noti.notifyText = level.activ.name + " ^6VS^7 " + player.name;
                                        noti.glowcolor = (1,0,0.9);
                                        noti.duration = 5;
                                        players = getentarray("player", "classname");
                                        for(i=0;i<players.size;i++)
                                                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                                        wait 5;
                                        player FreezeControls(0);
                                        level.activ FreezeControls(0);
                        player waittill( "death" );
                        level.PlayerInRoom = false;
                }
        }
}
 
akroom()
{
        level.ak_trig = GetEnt("room_ak74u_trig","targetname");
    jump = GetEnt( "sniper_j", "targetname" );
    acti = GetEnt( "sniper_a", "targetname" );
       
 
        while(1)
        {
                level.ak_trig waittill("trigger", player);

                if(!level.firstenter) {
                        level.firstenter = true;
                        level.bounce_trig delete();
                        level.knife_trig delete();
                        level.snipe_trig delete();
                        level.raygun_trig delete();
                }

                if( !level.PlayerInRoom )
                {
                        if( isDefined(level.old_trig) )
                                level.old_trig Delete();
                        level.PlayerInRoom = true;
 
 
                        player.health = player.maxhealth;
                        level.activ.health = level.activ.maxhealth;
                        player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "ak74u_mp" );
                        player GiveMaxAmmo( "ak74u_mp" );
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "ak74u_mp" );
                level.activ GiveMaxAmmo( "ak74u_mp" );
                wait .05;
                player switchToWeapon( "ak74u_mp" );
                level.activ SwitchToWeapon( "ak74u_mp" );
                player FreezeControls(1);
                        level.activ FreezeControls(1);
                        noti = SpawnStruct();
                                        noti.titleText = "AK74u Room";
                                        noti.notifyText = level.activ.name + " ^6VS^7 " + player.name;
                                        noti.glowcolor = (1,0,0.9);
                                        noti.duration = 5;
                                        players = getentarray("player", "classname");
                                        for(i=0;i<players.size;i++)
                                                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                                        wait 5;
                                        player FreezeControls(0);
                                        level.activ FreezeControls(0);
                        player waittill( "death" );
                        level.PlayerInRoom = false;
                }
        }
}
 
raygunroom()
{
        level.raygun_trig = GetEnt("room_raygun_trig","targetname");
    jump = GetEnt( "snip_fail_j", "targetname" );
    acti = GetEnt( "snip_fail_a", "targetname" );
       
       
 
        while(1)
        {
                level.raygun_trig waittill("trigger", player);

                if(!level.firstenter) {
                        level.firstenter = true;
                        level.bounce_trig delete();
                        level.knife_trig delete();
                        level.snipe_trig delete();
                        level.ak_trig delete();
                }

                if( !level.PlayerInRoom )
                {
                        if( isDefined(level.old_trig) )
                                level.old_trig Delete();
                        level.PlayerInRoom = true;
                       
 
                        player.health = player.maxhealth;
                        level.activ.health = level.activ.maxhealth;
                        player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "raygun_mp" );
                        player GiveMaxAmmo( "raygun_mp" );
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "raygun_mp" );
                level.activ GiveMaxAmmo( "raygun_mp" );
                wait .05;
                player switchToWeapon( "raygun_mp" );
                level.activ SwitchToWeapon( "raygun_mp" );
                player FreezeControls(1);
                        level.activ FreezeControls(1);
                        noti = SpawnStruct();
                                        noti.titleText = "RayGun Room";
                                        noti.notifyText = level.activ.name + " ^6VS^7 " + player.name;
                                        noti.glowcolor = (1,0,0.9);
                                        noti.duration = 5;
                                        players = getentarray("player", "classname");
                                        for(i=0;i<players.size;i++)
                                                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                                        wait 5;
                                        player FreezeControls(0);
                                        level.activ FreezeControls(0);
                        player waittill( "death" );
                        level.PlayerInRoom = false;
                }
        }
}
 
kniferoom()
{
        level.knife_trig = GetEnt("room_knife_trig","targetname");
    jump = GetEnt( "knife_j", "targetname" );
    acti = GetEnt( "knife_a", "targetname" );
       
       
 
        while(1)
        {
                level.knife_trig waittill("trigger", player);

                if(!level.firstenter) {
                        level.firstenter = true;
                        level.bounce_trig delete();
                        level.ak_trig delete();
                        level.snipe_trig delete();
                        level.raygun_trig delete();
                }
                if( !level.PlayerInRoom )
                {
                        if( isDefined(level.old_trig) )
                                level.old_trig Delete();
                        level.PlayerInRoom = true;
                       
 
                        player.health = player.maxhealth;
                        level.activ.health = level.activ.maxhealth;
                        player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "knife_mp" );
                        player GiveMaxAmmo( "knife_mp" );
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "knife_mp" );
                level.activ GiveMaxAmmo( "knife_mp" );
                wait .05;
                player switchToWeapon( "knife_mp" );
                level.activ SwitchToWeapon( "knife_mp" );
                player FreezeControls(1);
                        level.activ FreezeControls(1);
                        noti = SpawnStruct();
                                        noti.titleText = "Knife Room";
                                        noti.notifyText = level.activ.name + " ^6VS^7 " + player.name;
                                        noti.glowcolor = (1,0,0.9);
                                        noti.duration = 5;
                                        players = getentarray("player", "classname");
                                        for(i=0;i<players.size;i++)
                                                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                                        wait 5;
                                        player FreezeControls(0);
                                        level.activ FreezeControls(0);
                        player waittill( "death" );
                        level.PlayerInRoom = false;
                }
        }
}
 
bounceroom()
{
        level.bounce_trig = GetEnt("bounce_trig","targetname");
        jump = GetEnt( "bounce_j", "targetname" );
        activat = GetEnt( "bounce_a", "targetname" );



        while(1)
        {
                level.bounce_trig waittill("trigger", player);
                thread bouncehud(player);
                if(!level.firstenter) {
                        level.firstenter = true;
                        level.ak_trig delete();
                        level.knife_trig delete();
                        level.snipe_trig delete();
                        level.raygun_trig delete();
                }
                if( !level.PlayerInRoom )
                {
                        if( isDefined(level.old_trig) )
                        level.old_trig Delete();
                        level.PlayerInRoom = true;



                        player.health = player.maxhealth;
                        level.activ.health = level.activ.maxhealth;
                        player SetPlayerAngles( jump.angles );
                        player setOrigin( jump.origin );
                        player TakeAllWeapons();
                        player GiveWeapon( "knife_mp" );
                        wait .05;
                        player SwitchToWeapon( "knife_mp" );
                        level.activ setPlayerangles( activat.angles );
                        level.activ setOrigin( activat.origin );
                        level.activ TakeAllWeapons();
                        level.activ GiveWeapon( "knife_mp" );
                        wait .05;
                        player switchToWeapon( "knife_mp" );
                        level.activ SwitchToWeapon( "knife_mp" );
                        player FreezeControls(1);
                        level.activ FreezeControls(1);
                        noti = SpawnStruct();
                        noti.titleText = "Bounce Room";
                        noti.notifyText = level.activ.name + " ^6VS^7 " + player.name;
                        noti.glowcolor = (1,0,0.9);
                        noti.duration = 5;
                        players = getentarray("player", "classname");
                        for(i=0;i<players.size;i++)
                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                        wait 5;
                        player FreezeControls(0);
                        level.activ FreezeControls(0);
                        player waittill( "death" );
                        level.PlayerInRoom = false;
                        level.jumperhud destroy();

                }
        }
}

createbouncetext() {
bouncetext = newHudElem();
bouncetext.x = 20;
bouncetext.y = 20;
bouncetext.horzAlign = "Left";
bouncetext.vertAlign = "Top";
bouncetext.alignX = "Left";
bouncetext.alignY = "Top";
bouncetext.font = "objective";
bouncetext.archived = false;
bouncetext.fontScale = 1.4;
bouncetext.glowalpha = 1;
bouncetext.glowcolor = (1.0, 0.0, 0.9);
return bouncetext;
}

bouncehud(guy) {
level.jumperhud = createbouncetext();
level.jumperhud setText("^5Jumper Fail^7: ^60");
thread bouncefail(guy);
thread snip(guy);
}

bouncefail(guy) {
trig = getent("bounce_fail","targetname");
jump = getent("bounce_j","targetname");
activ = getent("bounce_a","targetname");
level.jumperfail = 0;
level.gotsnip = false;

for(;;) {
acti = ActivGuy();
trig waittill("trigger", player);
if(player == guy) {
if(level.gotsnip == false) {
level.jumperfail ++;
level.jumperhud setText("^5Jumper Fail^7: ^6" + level.jumperfail);
}
if(level.jumperfail == 15 && level.gotsnip == false) {
guy suicide();
}
else {
guy setOrigin(jump.origin);
guy setPlayerAngles(jump.angles);
}
}
else if(player == acti) {
acti setOrigin(activ.origin);
acti setPlayerAngles(activ.angles);
}
}
}

snip(guy) {
SnipeEnd = getent("bounce_end","targetname");
acti = ActivGuy();
AnyHasSniper = 0;
SnipeEnd waittill("trigger",player);
if(player == guy) {
level.jumperhud setText(player.name + " Has ^1Snipah");
level.gotsnip = true;
AnyHasSniper = 1;
}
else if(player == acti) {
level.jumperhud setText("Activator Has ^1Snipah");
level.gotsnip = true;
AnyHasSniper = 2;
}
player giveWeapon("intervention_mp");
player giveMaxAmmo("intervention_mp");
player switchToWeapon("intervention_mp");
for(;;) {
SnipeEnd waittill("trigger",player);
if(player == guy && AnyHasSniper == 2 && level.freerun == false) {
level.jumperhud setText("Both have ^1Snipah");
AnyHasSniper = 3;
}
else if(player == acti && AnyHasSniper == 1 && level.freerun == false) {
level.jumperhud setText("Both have ^1Snipah");
AnyHasSniper = 3;
}
player giveWeapon("intervention_mp");
player giveMaxAmmo("intervention_mp");
player switchToWeapon("intervention_mp");
wait 1;
}
}

ActivGuy() {
        players = getEntArray("player","classname");
        for(i = 0;i < players.size;i++) {
        player = players[i];
        if(isDefined(player) && isPlayer(player) && isAlive(player) && player.pers["team"] == "axis")
        return player;
        }
        return undefined;
}

snip_fail()
{
        trig = GetEnt("snip_fail","targetname");
        j = GetEnt("snip_fail_j","targetname");
        a = GetEnt("snip_fail_a","targetname");
 
        for(;;)
        {
                trig waittill("trigger", player);
                if( player.pers["team"] == "axis" )
                {
                        player SetOrigin( a.origin );
                        player SetPlayerAngles( a.angles );
                }
                else
                {
                        player SetOrigin( j.origin );
                        player SetPlayerAngles( j.angles );
                }
        }
}
 
 
 
 
nukebullets()
{
trig = getent("snipe_bullets","targetname");
trig sethintstring("Press [USE] for a free nuke bullet :P");
 
      trig waittill("trigger",player);
          {
          trig sethintstring("^2" + player.name + " ^2was 1st!");
      player iprintlnbold( "^7You got ^3A NUKE BULLET^7!" );
      player thread killstreak3();
      iprintln( "^2" + player.name + " ^7got ^2A NUKE BULLET^7!" );
          }
}
 
killstreak3()
{
self endon("death");
self waittill("weapon_fired");
my = self gettagorigin("j_head");
trace=bullettrace(my, my + anglestoforward(self getplayerangles())*100000,true,self)["position"];
playfx(level.expbullt,trace);
self playSound( "artillery_impact" );
dis=distance(self.origin, trace);
if(dis<101) RadiusDamage( trace, dis, 200, 50, self );
RadiusDamage( trace, 60, 250, 50, self );
RadiusDamage( trace, 100, 800, 50, self );
vec = anglestoforward(self getPlayerAngles());
end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ];
explode = loadfx( "fire/tank_fire_engine" );
playfx(explode, SPLOSIONlocation);
self thread DamageArea(SPLOSIONlocation,500,800,200,"artillery_mp",false);
}
 
DamageArea(Point,Radius,MaxDamage,MinDamage,Weapon,TeamKill)
{
KillMe = false;
Damage = MaxDamage;
for(i=0;i<level.players.size+1;i++){
DamageRadius = distance(Point,level.players[i].origin);
if(DamageRadius<Radius){
if(MinDamage<MaxDamage)
Damage = int(MinDamage+((MaxDamage-MinDamage)*(DamageRadius/Radius)));
if((level.players[i] != self) && ((TeamKill && level.teamBased) || ((self.pers["team"] != level.players[i].pers["team"]) && level.teamBased) || !level.teamBased))
level.players[i] FinishPlayerDamage(level.players[i],self,Damage,0,"MOD_PROJECTILE_SPLASH",Weapon,level.players[i].origin,level.players[i].origin,"none",0);
if(level.players[i] == self)
KillMe = true;
}
wait 0.01;
}
RadiusDamage(Point,Radius-(Radius*0.25),MaxDamage,MinDamage,self);
if(KillMe)
self FinishPlayerDamage(self,self,Damage,0,"MOD_PROJECTILE_SPLASH",Weapon,self.origin,self.origin,"none",0);
}
 
gettrigger(trigname)
{
trig = getent(trigname, "targetname");
trig setHintString("Press [USE] to activate");
trig waittill("trigger", player);
trig setHintString("^1Activated");
}
 
trap1()
{
 
gettrigger("trap1_trig");
 
thread trap1a();
 
}
 
trap1a()
{
 
script = getent("trap1_script","targetname");
 
script delete();
 
}
 
trap2()
{
 
gettrigger("trap2_trig");
 
thread trap2a();
 
}
 
trap2a()
{
script = getent("trap2_script","targetname");
 
for(;;)
{
script rotateyaw(360,2);
script waittill("rotatedone");
wait 2;
}
}
 
trap3()
{
 
gettrigger("trap3_trig");
 
thread trap3a();
 
}
 
trap3a()
{
 
s = getent("trap3_script","targetname");

while (1)
{
s movex (96,1);
s waittill("movedone");
s movez (192,0.5);
s waittill("movedone");
s movez (-432,0.5);
s waittill("movedone");
s movez (240,1);
s waittill("movedone");
s movex (-96,2);
s waittill("movedone");
wait 5;
}
 
}
 
trap4()
{
 
gettrigger("trap4_trig");
 
thread trap4a();
 
}
 
trap4a()
{
 
s1 = getent ("trap4_script","targetname");
s2 = getent ("trap4_script2","targetname");
s3 = getent ("trap4_script3","targetname");
s4 = getent ("trap4_script4","targetname");
 
x = randomint(5);
 
if (x == 0){
s1 delete();
s3 delete();
}
 
else if(x == 1){
s2 delete();
s4 delete();
}
 
 
else if (x == 2){
s3 delete();
s4 delete();
}
 
else if (x == 3){
s1 delete();
s2 delete();
}
 
 
}
 
trap5()
{
 
gettrigger("trap5_trig");
 
thread trap5a();
 
}
 
trap5a()
{
 
s = getent("trap5_script","targetname");
 
s delete();
 
}
 
trap6()
{
 
gettrigger("trap6_trig");
 
thread trap6a();
 
}
 
trap6a()
{
 
s = getent("platform","targetname");
 
s notsolid();
wait 2;
s solid();
 
}
 
 
trap7()
{
 
gettrigger("trap7_trig");
 
thread trap7a();
 
}
 
trap7a()
{
 
script = getent("trap7_script","targetname");
hurt = getent("trap7_hurt","targetname");
 
hurt enablelinkto();
hurt linkto(script);
script movez (128,0.5);
script waittill("movedone");
script movez(-128,1);
 
}
 
trap8()
{
 
gettrigger("trap8_trig");
 
thread trap8a();
 
}
 
trap8a()
{
s1 = getent ("trap8_script","targetname");
s2 = getent ("trap8_script2","targetname");
 
x = randomint(2);
 
if(x == 0){
s1 notsolid();
}
 
else if(x == 1){
s2 notsolid();
}
}
 
trap9()
{
 
gettrigger("trap9_trig");
 
thread trap9a();
 
}
 
trap9a()
{
 
s = getent ("trap9_script","targetname");
 
for(;;)
{
s rotatepitch(-360,4);
s waittill("rotatedone");
}
}
 
trap10()
{
 
gettrigger("trap10_trig");
 
thread trap10a();
 
}
 
trap10a()
{
 
s = getent("trap10_script","targetname");
 
s movey (768,3,1,1);
 
}
 
trap11()
{
 
gettrigger("trap11_trig");
 
thread trap11a();
 
}
 
trap11a()
{
 
s = getent("trap11_script","targetname");
 
for(;;)
{
 
s rotateyaw (720,4,1,1);
s waittill ("rotatedone");
wait randomint(6);
 
}
}
 
trap12()
{
 
gettrigger("trap12_trig");
 
thread trap12a();
 
}
 
trap12a()
{
 
s = getent("trap12_script","targetname");
 
s delete();
 
}