main() {


    
}

add_endmap_trigger(mapname, origin, radius, height) {
    if(!isdefined(level.endmap_triggers))
        level.endmap_triggers = [];

    if(!isdefined(mapname)) return;
    if(!isdefined(origin))  return;
    if(!isdefined(radius))  radius = 200;
    if(!isdefined(height))  height = 150;
    
    if(!isdefined(level.endmap_triggers[mapname]))
        level.endmap_triggers[mapname] = [];

    level.endmap_triggers[mapname]["origin"] = origin;
    level.endmap_triggers[mapname]["radius"] = radius;
    level.endmap_triggers[mapname]["height"] = height;
}

add_endmap_trigger_change_targetname(mapname, targetname) {
    if(!isdefined(level.endmap_triggers))
        level.endmap_triggers = [];
    
    if(!isdefined(mapname))     return;
    if(!isdefined(targetname))  return;

    if(!isdefined(level.endmap_triggers[mapname]))
        level.endmap_triggers[mapname] = targetname;
}

spawn_endmap_trigger() {
    endmap_trig = getent("endmap_trig", "targetname");
    if(isdefined(endmap_trig))
        return endmap_trig;
    
    mapname = getdvar("mapname");

    if(isdefined(level.endmap_triggers[mapname])) {
        if(isarray(level.endmap_triggers[mapname])) {
            endmap_trig = Spawn("trigger_radius", level.endmap_triggers[mapname]["origin"], 0, level.endmap_triggers[mapname]["radius"], level.endmap_triggers[mapname]["height"]);
            endmap_trig.targetname = "endmap_trig";
            endmap_trig.radius = level.endmap_triggers[mapname]["radius"];
            endmap_trig.height = level.endmap_triggers[mapname]["height"];
            return endmap_trig;
        } else {
            endmap_trig = getent(level.endmap_triggers[mapname], "targetname");
            if(!isdefined(endmap_trig)) {
                iprintln("No Ent with Targetname: " + level.endmap_triggers[mapname]);
                return undefined;
            }
            endmap_trig.targetname = "endmap_trig";
            return endmap_trig;
        }
    }

}