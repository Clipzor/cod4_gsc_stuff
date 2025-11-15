main() {
    maps\mp\_load::main();
 
    game["allies"] = "sas";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
 
    setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
    setdvar("compassmaxrange","1800");

	thread secret();
 
}

secret()
{
	trig = getEnt ("secret_enter", "targetname");
	end = getEnt ("secret_enter_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);        
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}

}