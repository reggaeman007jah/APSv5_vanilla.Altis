/*
This file is meant to (brute force) break any deadlock between the two factions 
Mission flow used to be based on blu/opfor numbers, and progression would only happen if numbers fell to a low level 
Given spawning and troop movement issues, sometimes units would be close but not see eachother, hence why this is used 

This runs constantly in the bg (every 90 seconds) and forces opfor units (held in _opfor array) to move to the patrol objective 

April 2020 
I don't know how expensive this process is, and not also convinced this is needed now there is a mission phase timer running also.
I need to decide whether the scrap the unit count altogether and just use time to progress the misison, or whether to use a hybrid 
(i.e. use both, enabling a quicker move to next objecive of opfor are wiped out early)

I also don't know if this system will affect the first wave attackers that are generated on each new patrol point 

*/

// CAN I DELETE THIS?

hint "YOU SHOULD NOT SEE THIS";

while {true} do {
	_opfor = [];
	{if ((side _x) == east) then {_opfor pushBack _x}} forEach allUnits;

	{
		_Dir = random 360;
		_Dist = selectRandom [1, 5, 10]; 
		_moveTo = RGG_patrol_obj getPos [_Dist,_Dir]; 
		_x setBehaviour "COMBAT";
		_x doMove _moveTo;
		systemChat "body mooovin";
		sleep 10;
	} forEach _opfor;

	sleep 90;
};
	