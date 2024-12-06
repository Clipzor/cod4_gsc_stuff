/*
______           __  _____  _____ 
| ___ \         /  ||  _  ||  _  |
| |_/ /_____  __`| || |/' || |_| |
|    // _ \ \/ / | ||  /| |\____ |
| |\ \  __/>  < _| |\ |_/ /.___/ /
\_| \_\___/_/\_\\___/\___/ \____/ 

*/

init(ver)
{
  if(getDvarInt("developer_script") == 0 )
  {
      while(1)
      {
          iPrintLnBold("developer_script must be set to 1 for this plugin to work");
          wait 1;
      }
  }

  if(!getdvarint("Entity_Visualizer")) {
    print("^1Entity Visualizer Dvars Not Defined");
    initialize_dvar("Entity_Visualizer",      1);
    initialize_dvar("ev_distance",            500);
    initialize_dvar("ev_target",              0);
    initialize_dvar("ev_origin",              0);
    initialize_dvar("ev_undefined",           1);
    initialize_dvar("ev_angles",              0);
    initialize_dvar("ev_textspacing",         15);
    initialize_dvar("ev_fontsize",            1);
    initialize_dvar("ev_displaymode",         0);
    initialize_dvar("ev_enabletrace",         0);
  }

  level.EV_display_distance     = getdvarint("ev_distance");
  level.EV_display_target       = getdvarint("ev_target");
  level.EV_display_origin       = getdvarint("ev_origin");
  level.EV_display_angles       = getdvarint("ev_angles");
  level.EV_display_undefined    = getdvarint("ev_undefined");
  level.EV_text_spacing         = getdvarint("ev_textspacing");
  level.EV_fontsize             = getdvarfloat("ev_fontsize");
  level.EV_display_mode         = getdvarint("ev_displaymode");
  level.EV_enabletrace          = getdvarint("ev_enabletrace");

  level thread settings();

  level waittill( "connected", player );

  player setClientDvar("developer", "2");

  level.refPlayer = player;

  player thread trigger_radius_controller();

  build_debug_array();

  print("^1ARRAY SIZE: "+level.debug_array.size);

  thread visualizer_logic();
  thread trace_logic();
}

build_debug_array() {
  trig_damage = getEntArray("trigger_damage","classname");
  trig_disk = getEntArray("trigger_disk","classname");
  trig_friendlychain = getEntArray("trigger_friendlychain","classname");
  trig_hurt = getEntArray("trigger_hurt","classname");
  trig_lookat = getEntArray("trigger_lookat","classname");
  trig_multiple = getEntArray("trigger_multiple","classname");
  trig_once = getEntArray("trigger_once","classname");
  trig_radius = getEntArray("trigger_radius","classname");
  trig_use = getEntArray("trigger_use","classname");
  trig_use_touch = getEntArray("trigger_use_touch","classname");

  script_brushmodel = getEntArray("script_brushmodel","classname");
  script_model = getEntArray("script_model","classname");
  script_origin = getEntArray("script_origin","classname");
  script_struct = getEntArray("script_struct","classname");
  script_vehicle = getEntArray("script_vehicle","classname");
  script_vehicle_mp = getEntArray("script_vehicle_mp","classname");
  
  level.debug_array = [];

  for(i=0;i<trig_damage.size;i++){
    level.debug_array[level.debug_array.size] = trig_damage[i];
  } for(i=0;i<trig_disk.size;i++){
    level.debug_array[level.debug_array.size] = trig_disk[i];
  } for(i=0;i<trig_friendlychain.size;i++){
    level.debug_array[level.debug_array.size] = trig_friendlychain[i];
  } for(i=0;i<trig_hurt.size;i++){
    level.debug_array[level.debug_array.size] = trig_hurt[i];
  } for(i=0;i<trig_lookat.size;i++){
    level.debug_array[level.debug_array.size] = trig_lookat[i];
  } for(i=0;i<trig_multiple.size;i++){
    level.debug_array[level.debug_array.size] = trig_multiple[i];
  } for(i=0;i<trig_once.size;i++){
    level.debug_array[level.debug_array.size] = trig_once[i];
  } for(i=0;i<trig_radius.size;i++){
    level.debug_array[level.debug_array.size] = trig_radius[i];
  } for(i=0;i<trig_use.size;i++){
    level.debug_array[level.debug_array.size] = trig_use[i];
  } for(i=0;i<trig_use_touch.size;i++){
    level.debug_array[level.debug_array.size] = trig_use_touch[i];
  } for(i=0;i<script_brushmodel.size;i++){
    level.debug_array[level.debug_array.size] = script_brushmodel[i];
  } for(i=0;i<script_model.size;i++){
    level.debug_array[level.debug_array.size] = script_model[i];
  } for(i=0;i<script_origin.size;i++){
    level.debug_array[level.debug_array.size] = script_origin[i];
  } for(i=0;i<script_struct.size;i++){
    level.debug_array[level.debug_array.size] = script_struct[i];
  } for(i=0;i<script_vehicle.size;i++){
    level.debug_array[level.debug_array.size] = script_vehicle[i];
  } for(i=0;i<script_vehicle_mp.size;i++){
    level.debug_array[level.debug_array.size] = script_vehicle_mp[i];
  }
}

trace_logic() {
  
  for(;;) {
    wait 0.05;
    waittillframeend;
    if(!isalive(level.refPlayer))
      continue;

    if(!level.EV_enabletrace)
      continue;

    if(level.refPlayer GetStance() == "stand")
      start = level.refPlayer.origin + (0,0,60);
    else
      start = level.refPlayer.origin + (0,0,40);

    fwd = anglestoforward(level.refPlayer getplayerangles());
    trace = BulletTrace( start, start + (fwd*10000) , false, level.refPlayer);
    if(!isdefined(trace))
      continue;
    
    if(isdefined(trace["entity"]) && isdefined(trace["entity"].targetname) && isdefined(trace["position"])) {
      distance = Distance(start, trace["position"]);
      font = max(1,(distance/100) * .45);
      print3d(trace["position"], "       " + trace["entity"].targetname, (1, 0.64, 0), 1, font, 1);
    } else {
      distance = Distance(start, trace["position"]);
      font = max(.75,(distance/100) * .25);
      print3d(trace["position"], "         " + distance, (1, 0.25, 0.25), 1, font, 1);
    }

    if(isdefined(trace["position"]) && isdefined(trace["normal"])) {
      trace_fwd = anglestoforward(vectortoangles(trace["normal"]));
      trace_right = anglestoright(vectortoangles(trace["normal"]));
      trace_up = anglestoup(vectortoangles(trace["normal"]));
      line(trace["position"] + trace_fwd*10, trace["position"] - trace_fwd*10, (1,0,0),false,1);
      line(trace["position"] + trace_right*10, trace["position"] - trace_right*10, (1,0,0),false,1);
      line(trace["position"] + trace_up*10, trace["position"] - trace_up*10, (1,0,0),false,1);
    }
  }
}

visualizer_logic() {
  for(;;) {
    wait 0.05;
    build_debug_array();
    to_be_displayed = [];
    for(i=0;i<level.debug_array.size;i++) {
      level.debug_array[i].distance_to_player = Distance(level.refPlayer.origin + (0,0,60), level.debug_array[i].origin);
      if(level.debug_array[i].distance_to_player < level.EV_display_distance) {
        to_be_displayed[to_be_displayed.size] = level.debug_array[i];
      }
    }
    to_be_displayed = bubbleSort(to_be_displayed);
    for(i=to_be_displayed.size - 1;i>=0;i--) {
      to_be_displayed[i] display_ent();
    }
  }
}


bubbleSort(array) {
  n = array.size;

  for (i = 0; i < n - 1; i++) {
    swapped = false;
    for (j = 0; j < n - i - 1; j++) {
      if (array[j].distance_to_player > array[j + 1].distance_to_player) {
        tmp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = tmp;
        swapped = true;
        // iprintln(array[j].distance_to_player + " ^2- Swapped - ^7" + array[j + 1].distance_to_player);
      }
    }

    if (!swapped)
        break;
  }
  return array;
}


initialize_dvar(dvar, value) {
  setdvar(dvar, value);
  print("^1Entity Visualizer - ^1" + dvar + "^1 - ^3" + value);
}

settings() {
  for(;;) {
    wait 0.25;
    if(level.EV_display_distance != getdvarint("ev_distance"))
      level.EV_display_distance = getdvarint("ev_distance");
    
    if(level.EV_display_target != getdvarint("ev_target"))
      level.EV_display_target = getdvarint("ev_target");

    if(level.EV_display_origin != getdvarint("ev_origin"))
      level.EV_display_origin = getdvarint("ev_origin");

    if(level.EV_display_angles != getdvarint("ev_angles"))
      level.EV_display_angles = getdvarint("ev_angles");
    
    if(level.EV_display_undefined != getdvarint("ev_undefined"))
      level.EV_display_undefined = getdvarint("ev_undefined");

    if(level.EV_text_spacing != getdvarint("ev_textspacing"))
      level.EV_text_spacing = getdvarint("ev_textspacing");

    if(level.EV_fontsize != getdvarfloat("ev_fontsize"))
      level.EV_fontsize = getdvarfloat("ev_fontsize");

    if(level.EV_display_mode != getdvarfloat("ev_displaymode"))
      level.EV_display_mode = getdvarfloat("ev_displaymode");

    if(level.EV_enabletrace != getdvarfloat("ev_enabletrace"))
      level.EV_enabletrace = getdvarfloat("ev_enabletrace");
  }
}

display_ent() {
  if(!isdefined(self))
    return;

  if(isDefined(self.targetname)) {
    targetname = self.targetname;
    target_color = (1.0, 1.0, 1.0);
  }
  else {
    if(level.EV_display_undefined) {
      targetname = "no_targetname";
      target_color = (1, 0.76, 0.94);;
    }
    else
      return;
  }

  if(isDefined(self.classname)) {
    classname = self.classname;
    color = getColor(classname);
    if(classname == "trigger_radius" && isdefined(self.radius) && isdefined(self.height)) {
      drawCircle(self.origin, self.radius, self.height);
    }
  }
  else {
    if(level.EV_display_undefined) {
      classname = "no_classname";
      color = (1, 0.76, 0.94);
    }
    else
      return;
  }

  target = undefined;
  has_target = isdefined(self.target);
  if(has_target)
    target = getent(self.target, "targetname");


  

  if(level.EV_display_mode) {
    if(has_target && isdefined(self.angles)) {
      print3d(self getOrigin(), targetname +" - "+ classname +" - "+ self.target +" - "+ self.origin +" - "+ self.angles, (1, 1, 1), 1, level.EV_fontsize, 1);
      line(self getOrigin(), target.origin,(1, 0.75, 0), false, 1);
    } else if(has_target) {
      print3d(self getOrigin(), targetname +" - "+ classname +" - "+ self.target +" - "+ self.origin, (1, 1, 1), 1, level.EV_fontsize, 1);
      line(self getOrigin(), target.origin,(1, 0.75, 0), false, 1);
    } else if(isdefined(self.angles))
      print3d(self getOrigin(), targetname +" - "+ classname +" - "+ self.origin +" - "+ self.angles, (1, 1, 1), 1, level.EV_fontsize, 1);
    else
      print3d(self getOrigin(), targetname +" - "+ classname +" - "+ self.origin, (1, 1, 1), 1, level.EV_fontsize, 1);
  }
  else {
    total=2;
    if(level.EV_display_target) total++;
    if(level.EV_display_origin) total++;
    if(level.EV_display_angles) total++;

    i=total;
    if(level.EV_display_angles && isdefined(self.angles)) {
      print3d(self getOrigin()-(0,0,level.EV_text_spacing*i), self.angles, (0.8, 1, 0.96), 1, level.EV_fontsize, 1); i--;
    }
    if(level.EV_display_origin) {
      print3d(self getOrigin()-(0,0,level.EV_text_spacing*i), self.origin, (0.76, 0.89, 1), 1, level.EV_fontsize, 1); i--;
    }
    if(has_target && level.EV_display_target) {
      print3d(self getOrigin()-(0,0,level.EV_text_spacing*i), self.target, (1, 0.75, 0), 1, level.EV_fontsize, 1); i--;
      line(self getOrigin(), target.origin,(1, 0.75, 0), false, 1);
    }
    print3d(self getOrigin()-(0,0,level.EV_text_spacing*i), classname, color, 1, level.EV_fontsize, 1); i--;
    print3d(self getOrigin()-(0,0,level.EV_text_spacing*i), targetname, target_color, 1, level.EV_fontsize, 1); i--;
  }
}

getColor(classname)
{

    if (isSubStr(classname, "trigger_")) {
        if(classname == "trigger_hurt")
          return (1, 0, 0);
        else
          return (0.0, 1.0, 0.0);
    }
    else if (isSubStr(classname, "script_")) {
      if(classname == "script_model")
        return (0.64, 0.84, 1);
      else if(classname == "script_brushmodel")
        return (0.69, 1, 0.99);
      else
        return (0, 0.8, 1);
    }

    return (1, 0.60, 0.55);
}


drawCircle(start, radius, height)
{
	points = [];
	r = radius;
	z = start[2];
	idx = 0;
	for(q = 0; q<2; q++)
	{
		h = start[0];
		k = start[1];
		for(i = 0; i< 360; i++)
		{
			x = h + r*Cos(i);
			y = k - r*Sin(i);
			points[idx] = (x,y,z);
			idx++;
		}
		z += height;
		for(i=0; i<points.size-1; i++)
		{
			Line(points[i], points[i+1], (1,0,0), true, 1);
		}
	}
}

grab_trigger() {
  distance = 150;
  trig_radius = getEntArray("trigger_radius","classname");
  ent = undefined;
  for(i=0; i<trig_radius.size;i++) {
    if(!isdefined(ent))
      ent = trig_radius[i];

    if(distance(trig_radius[i].origin, self geteye()) < distance(ent.origin, self geteye())) {
      ent = trig_radius[i];
    }
  }

  if(!isdefined(ent)) {
    self iprintlnbold("^1No ^3Trigger Radius ^7Found, Spawning One");
    return spawn_trigger(self.origin, 200, 200);
  } else {
    if(distance(ent.origin, self geteye()) < distance) {
      self iprintlnbold("^1Closest ^3Trigger Radius ^7Selected");
      if(!isdefined(ent.radius))
        ent.radius = 20;
      if(!isdefined(ent.height))
        ent.height = 20;
      ent enablelinkto();
      return ent;
    } else {
      self iprintlnbold("^1No ^3Trigger Radius ^7Within " + distance + " Units, Spawning One");
      return spawn_trigger(self.origin, 200, 200);
    }
  }

}

trigger_radius_controller() {
  level.manipulating_ent = undefined;
  self.movingmode = 0;
  for(;;) {
    wait 0.05;
    if(self SecondaryOffhandButtonPressed()) {
      count = 0;
      while(self SecondaryOffhandButtonPressed()) {
        wait 0.05;
        count++;
        if(count > 30) {
          level.manipulating_ent = self grab_trigger();
          break;
        }
      }
    }

    wait 1;

    if(isdefined(level.manipulating_ent)) {
      while(isdefined(level.manipulating_ent)) {
        wait 0.05;
        iprintln(self.movingmode);
        if(self reloadbuttonPressed() && self.movingmode == 0) {
          self iprintlnbold("^2Linked ^1Trigger Radius");
          // level.manipulating_ent LinkTo(self, "tag_origin", self.origin - level.manipulating_ent.origin, (0,0,0));
          level.manipulating_ent LinkTo(self);
          self.movingmode = 1;
          wait 1.5;
        } else if(self reloadbuttonPressed() && self.movingmode == 1) {
          self iprintlnbold("^3UnLinked ^1Trigger Radius");
          level.manipulating_ent unlink();
          self.movingmode = 0;
          wait 1.5;
        }
        else if(self usebuttonpressed() && self.movingmode == 0) { // note to self. this is fucking disgusting, fix this
          count = 0;
          while(self usebuttonpressed()) {
            wait 0.05;
            count++;
            if(count > 20) {
              self.movingmode = 3;
              self iprintlnbold("^3Changing Height^7, Press ^1Attack ^7to increase, ^2Ads ^7to decrease");
              wait 1;
              for(;;) {
                wait 0.05;
                if(self AttackButtonPressed()) {
                  wait 0.2;
                  org = level.manipulating_ent.origin;
                  rad = level.manipulating_ent.radius;
                  height =level.manipulating_ent.height + 5;
                  level.manipulating_ent delete();
                  level.manipulating_ent = spawn_trigger(org, rad, height);
                } else if(self AdsButtonPressed()) {
                  wait 0.2;
                  org = level.manipulating_ent.origin;
                  rad = level.manipulating_ent.radius;
                  height =level.manipulating_ent.height - 5;
                  level.manipulating_ent delete();
                  level.manipulating_ent = spawn_trigger(org, rad, height);
                }
                else if(self usebuttonpressed())
                {
                  while(self usebuttonpressed()) {
                    wait 0.05;
                    count++;
                    if(count > 30) {
                      self iprintlnbold("^3Changing Radius^7, Press ^1Attack ^7to increase, ^2Ads ^7to decrease");
                      wait 1;

                      for(;;) {
                        wait 0.05;
                        if(self AttackButtonPressed()) {
                          wait 0.2;
                          org = level.manipulating_ent.origin;
                          rad = level.manipulating_ent.radius + 5;
                          height =level.manipulating_ent.height;
                          level.manipulating_ent delete();
                          level.manipulating_ent = spawn_trigger(org, rad, height);
                        } else if(self AdsButtonPressed()) {
                          wait 0.2;
                          org = level.manipulating_ent.origin;
                          rad = level.manipulating_ent.radius - 5;
                          height =level.manipulating_ent.height;
                          level.manipulating_ent delete();
                          level.manipulating_ent = spawn_trigger(org, rad, height);
                        }
                        else if(self usebuttonpressed())
                        {
                          count++;
                          if(count > 30) {
                            self iprintlnbold("^1Stopped ^7Adjusting Height/Radius");
                            wait 1.5;
                            break;
                          }
                        }
                      }
                      break;
                    }
                  }
                  break; // mega fucked fix this garbo
                }
              }
              wait 1;
              self.movingmode = 0;
              break;
            }
          }
          wait 1;
        } else if(self FragButtonPressed() && self.movingmode == 0) {
          count = 0;
          while(self FragButtonPressed()) {
            wait 0.05;
            count++;
            if(count > 40) {
              self iprintlnbold("^3Stopped ^7Moving ^1Trigger Radius");
              print("spawn(\"trigger_radius\", " + level.manipulating_ent.origin + " , 1 , " + level.manipulating_ent.radius + " , " + level.manipulating_ent.height + ");");
              logprint("spawn(\"trigger_radius\", " + level.manipulating_ent.origin + " , 1 , " + level.manipulating_ent.radius + " , " + level.manipulating_ent.height + ");");
              level.manipulating_ent = undefined;
              break;
            }
          }
        }
      }
    }
  }
}

spawn_trigger(origin, radius, height) {
  ent = spawn("trigger_radius", origin, 1, radius, height);
  ent.radius = radius;
  ent.height = height;
  ent enablelinkto();
  return ent;
}