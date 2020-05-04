
/*

Three types of helis for different jobs - recon, transport and attack 

heliRecon = used for observation, and dropping smoke - different smoke could do different things, like, blue = big bomb strike 
heliTransport = used to extract injured units back to main base 
heliAttack = used to provide air support to ground forces - used in conjunction with either heliRecon or other smoke markers called in by infi 


To do:
Work out how to make addAction persist after respawn 
Set up refuel and rearm systems 
Decide what to trigger when recon smoke is used (or what action per smoke colour)
Set up auto medivac system 
decide if medivac should be auto, or addAction controlled 


*/

// recon 
heliRecon addAction ["Drop Yellow Smoke", "autoPatrolSystem\heliSystems\heliDrops\dropSmokeRecon.sqf"];	
heliRecon addAction ["Drop Flares", "autoPatrolSystem\heliSystems\heliDrops\dropFlare.sqf"];	
// heliRecon addAction ["Drop Artillery Smoke", "autoPatrolSystem\heliSystems\heliDrops\dropArtySmokeRecon.sqf"];	

// attack 
heliAttack addAction ["Drop Yellow Smoke", "autoPatrolSystem\heliSystems\heliDrops\dropSmokeAttack.sqf"];	

// transport 
heliTransport addAction ["Drop Yellow Smoke", "heliDrops\dropSmokeTransport.sqf"];
heliTransport addAction ["Medivac Board", "autoPatrolSystem\heliSystems\medivacBoard.sqf"];		
heliTransport addAction ["Medivac unoard", "autoPatrolSystem\heliSystems\medivacUnboard.sqf"];	
