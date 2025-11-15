main() {
maps\mp\_load::main();

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"]= "desert";
 
   setdvar( "r_specularcolorscale", "1" );
   setdvar("r_glowbloomintensity0",".1");
   setdvar("r_glowbloomintensity1",".1");
   setdvar("r_glowskybleedintensity0",".1");
   setDvar("bg_falldamagemaxheight", 99999);
   setDvar("bg_falldamageminheight", 99998);

   addTriggerToList("trap1");
   addTriggerToList("trap2");
   addTriggerToList("trap3");
   addTriggerToList("trap4");

//thread Trap1();
//thread Trap2();
//thread Trap3();
//thread Trap4();
thread Open();
//thread End();
//thread lol();
thread lol2();

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

Trap1()
{
trap1=getent("trap1","targetname");
trigger=getent("multiple","targetname");
while(1)
{
trigger waittill ("trigger");
trigger delete ();
wait 1;
trap1 moveX (22000,400);
trap1 waittill ("movedone");
trigger delete ();
}
}

Trap2()
{
trap2=getent("trap2","targetname");
trigger=getent("trigtrap2","targetname");
while(1)
{
trigger waittill ("trigger");
trigger delete ();
wait 1;
trap2 movez (-60,2);
trap2 waittill ("movedone");
}
}

Trap3()
{
trap3=getent("trap3","targetname");
trigger=getent("trigtrap3","targetname");
{
trigger waittill ("trigger");
trigger delete ();
wait 1;
trap3 movey (316,3);
trap3 waittill ("movedone");
wait 10;
trap3 movey (-316,3);
trap3 waittill ("movedone");
}
}

Trap4()
{
trap4=getent("trap4","targetname");
trigger=getent("trigtrap4","targetname");
{
trigger waittill ("trigger");
trigger delete ();
wait 1;
trap4 movez (250,1);
trap4 waittill ("movedone");
}
}

Open()
{
open=getent("open","targetname");
trigger=getent("trigopen","targetname");
{
trigger waittill ("trigger");
trigger delete ();
wait 1;
open movez (250,3);
open waittill ("movedone");
}
}

End()
{
end=getent("end","targetname");

wait 20;
end movey (-174,5);
}

lol()
{
hurt = getent("hurt","targetname");
trap3 = getent("trap3","targetname");

hurt EnableLinkTo();
hurt LinkTo(trap3);
}

lol2()
{
trig = getent("multiple","targetname");

trig delete();
}