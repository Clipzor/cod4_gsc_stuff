main()
{
maps\mp\_load::main();

 AmbientPlay("party_2");

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
   
   addTriggerToList("csapda_1_trig");
   addTriggerToList("csapda_2_trig");
   addTriggerToList("forg_indul");
   addTriggerToList("forgat_2");
   addTriggerToList("kapu_trig");
   addTriggerToList("forgat_3");
   addTriggerToList("forgat_4");
   addTriggerToList("tololap_trig");
   addTriggerToList("forgat_5");
   addTriggerToList("elrejt_trig");

thread fotocellak();
thread csapda_1 ();
thread csapda_2 ();
thread forgatas ();
thread kapu0 ();
thread tololap0 ();
thread forgatas_2 ();
thread forgatas_3 ();
thread forgatas_4 ();
thread forgatas_5 ();
thread teleport ();
thread teleport_2 ();
thread teleport_3 ();
thread teleport_4 ();
thread teleport_5 ();
thread eltuntet ();
thread udvozlo ();

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

fotocellak(){
  level.sebesseg = 1;   //ennyi id� alatt nyilik ki  (secund)
  hosszusag = 51;          //elmozdulas merteke

  fcxek = getentarray("fotocellax","targetname");     //entity-ben megadott ertek (x=elmozdulassal parhuzamos tengely)
  for(i=0;i<fcxek.size;i++){
    fc = fcxek[i];
    fc.j = getent(fcxek[i].target,"targetname");
    fc.b = getent(fc.j.target,"targetname");
    fc.jalap = fc.j getorigin();
    fc.balap = fc.b getorigin();
    fc.jvege = fc.jalap+(hosszusag,0,0);
    fc.bvege = fc.balap-(hosszusag,0,0);
    fc thread fotocella_mukodes();
    }
  fcyok = getentarray("fotocellay","targetname");
    for(i=0;i<fcyok.size;i++){
    fc = fcyok[i];
    fc.j = getent(fcyok[i].target,"targetname");
    fc.b = getent(fc.j.target,"targetname");
    fc.jalap = fc.j getorigin();
    fc.balap = fc.b getorigin();
    fc.jvege = fc.jalap+(0,hosszusag,0);
    fc.bvege = fc.balap-(0,hosszusag,0);
    fc thread fotocella_mukodes();
    }
  }

fotocella_mukodes(){
  while(1){
    self waittill("trigger");
    self fotocella_kinyit();
    wait(10);                        //ennyi ido mulva magatol becsuk
    self fotocella_becsuk();
    }
  }

fotocella_kinyit(){
  self.b moveto(self.bvege, level.sebesseg, 0, 0);
  self.j moveto(self.jvege, level.sebesseg, 0, 0);
  }

fotocella_becsuk(){
  self.b moveto(self.balap, level.sebesseg, 0, 0);
  self.j moveto(self.jalap, level.sebesseg, 0, 0);
  }

  csapda_1()

{
  csapda = getent( "csapda_1", "targetname" );
  trig = getent( "csapda_1_trig", "targetname" );

  while(true)
     {
      trig waittill ("trigger");
      trig delete();
      csapda movez (360,2,0,0.6);
      csapda waittill ("movedone");


      wait 5;

      csapda movez(-360,1,0,0.6);
      csapda waittill ("movedone");
     }
}

csapda_2()

{

  csapda = getent( "csapda_2", "targetname" );
  trig = getent( "csapda_2_trig", "targetname" );

  while(true)

        {
        trig waittill ("trigger");
        trig delete();
        csapda movex (330,1,0,0.6);
        csapda waittill ("movedone");


        wait 3;

        csapda movex(-330,1,0,0.6);
        csapda waittill ("movedone");
        }
}

forgatas()

{
  trig = getEnt( "forg_indul", "targetname" );
  brush = getEnt( "forgat", "targetname" );

  trig waittill( "trigger");
        trig delete();

       {
       brush rotateYaw( 115200, 600 );
       wait 1;
       }
}


teleport()

{
  entTransporter = getentarray( "enter", "targetname" );

  if(isdefined(entTransporter))
     {
     for( i = 0; i < entTransporter.size; i++ )
     entTransporter[i] thread transporter();
     }
}

transporter()
{
  while(true)
  {
    self waittill( "trigger", player );
    entTarget = getEnt( self.target, "targetname" );
    wait 0.1;
    player setOrigin( entTarget.origin );
    player setplayerangles( entTarget.angles );
    wait 0.1;
  }
}


teleport_2()
{
  entTransporter = getentarray( "enter_2", "targetname" );

  if(isdefined(entTransporter))
  {
    for( i = 0; i < entTransporter.size; i++ )
      entTransporter[i] thread transporter_2();
  }
}

transporter_2()
{
  while(true)
  {
    self waittill( "trigger", player );
    entTarget = getEnt( self.target, "targetname" );
    wait 0.1;
    player setOrigin( entTarget.origin );
    player setplayerangles( entTarget.angles );
    wait 0.1;
  }
}


teleport_3()
{
  entTransporter = getentarray( "enter_3", "targetname" );

  if(isdefined(entTransporter))
  {
    for( i = 0; i < entTransporter.size; i++ )
      entTransporter[i] thread transporter_3();
  }
}

transporter_3()
{
  while(true)
  {
    self waittill( "trigger", player );
    entTarget = getEnt( self.target, "targetname" );
    wait 0.1;
    player setOrigin( entTarget.origin );
    player setplayerangles( entTarget.angles );
    wait 0.1;
  }
}

teleport_4()
{
  entTransporter = getentarray( "enter_4", "targetname" );

  if(isdefined(entTransporter))
  {
    for( i = 0; i < entTransporter.size; i++ )
      entTransporter[i] thread transporter_2();
  }
}

transporter_4()
{
  while(true)
  {
    self waittill( "trigger", player );
    entTarget = getEnt( self.target, "targetname" );
    wait 0.1;
    player setOrigin( entTarget.origin );
    player setplayerangles( entTarget.angles );
    wait 0.1;
  }
}

teleport_5()
{
  entTransporter = getentarray( "enter_5", "targetname" );

  if(isdefined(entTransporter))
  {
    for( i = 0; i < entTransporter.size; i++ )
      entTransporter[i] thread transporter_2();
  }
}

transporter_5()
{
  while(true)
  {
    self waittill( "trigger", player );
    entTarget = getEnt( self.target, "targetname" );
    wait 0.1;
    player setOrigin( entTarget.origin );
    player setplayerangles( entTarget.angles );
    wait 0.1;
  }
}

forgatas_2()

{
  trig = getEnt( "forgat_2", "targetname" );
  brush1 = getEnt( "forog_2_1", "targetname" );
  brush2 = getEnt( "forog_2_2", "targetname" );
  brush3 = getEnt( "forog_2_3", "targetname" );
  brush4 = getEnt( "forog_2_4", "targetname" );
  brush5 = getEnt( "forog_2_5", "targetname" );

  trig waittill( "trigger");
        trig delete();

  {
    brush1 rotateYaw( 3600, 100 );
    brush2 rotateYaw( 3600, 80 );
    brush3 rotateYaw( 3600, 100 );
    brush4 rotateYaw( 3600, 80 );
    brush5 rotateYaw( 3600, 100 );
    wait 1;
  }
}


kapu0()
{

  csapda = getent( "kapu", "targetname" );
  trig = getent( "kapu_trig", "targetname" );

  while(true)
  {
  trig waittill ("trigger");
  trig delete();
    csapda movez (-238,0.5,0,0.1);
    csapda waittill ("movedone");


    wait 5;

    csapda movez(238,1,0,0.6);
    csapda waittill ("movedone");
  }
}


forgatas_3()

{
  trig = getEnt( "forgat_3", "targetname" );
  brush = getEnt( "forog_3", "targetname" );

  trig waittill( "trigger");
        trig delete();

  {
    brush rotateroll( -57600, 480 );
    wait 1;
  }
}

forgatas_4()

{
  trig = getEnt( "forgat_4", "targetname" );
  brush = getEnt( "forog_4", "targetname" );

  trig waittill( "trigger");
        trig delete();

  {
    brush rotateYaw( 115200, 520 );
    wait 1;
  }
}


tololap0()
{

  csapda = getent( "tololap", "targetname" );
  trig = getent( "tololap_trig", "targetname" );

  while(true)
  {
  trig waittill ("trigger");
  trig delete();
    csapda movex (-529,1,0,0.1);
    csapda waittill ("movedone");


    wait 2;

    csapda movex(529,1,0,0.6);
    csapda waittill ("movedone");
  }
}



forgatas_5()

{
  trig = getEnt( "forgat_5", "targetname" );
  brush = getEnt( "forog_5", "targetname" );

  trig waittill( "trigger");
        trig delete();
  //who PlaySound("rotatething");


  //for( i = 0; i < 8; i++ )
  {
    brush rotatepitch( 115200, 400 );
    wait 1;
  }
}


eltuntet()

{
   trig = getEnt( "elrejt_trig", "targetname" );
   first = getent ("solid","targetname");
   second = getent ("not_solid","targetname");
   trig waittill( "trigger");
        trig delete();
   while(1)
{
    first movez(-1820,1,0,0.6);
    wait 2;
    first movez(1820,1,0,0.6);
    wait 1;
    second movez(-1820,1,0,0.6);
    wait 2;
    second movez(1820,1,0,0.6);
    wait 1;
  }

}


udvozlo()

{
    delay = 30;
    for(;;) {

        level waittill("connected", player);
        wait (10.0);
        player thread welc_issue(.15, "mp_deathrun_lalamx"  + player.name);
        wait (9.0);
        player thread welc_issue(.10, "Script fixed by Death");
    }
}

welc_issue(delay, welc)
{
  self endon("intermission");
      self endon("disconnect");
  self endon("killthreads");
  self endon("game_ended");

    wait(delay);

    notifyData = spawnStruct();
    notifyData.notifyText = welc;
    notifyData.glowColor = (0.2, 0.3, 0.7);
    notifyData.duration = level.welcomeduration;

    notifyData.sort = 5;
    notifyData.hideWhenInMenu = true;
    self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
}