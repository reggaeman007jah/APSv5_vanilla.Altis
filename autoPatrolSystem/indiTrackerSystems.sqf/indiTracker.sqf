/*
System will cycle a check of all indifor group leaders, and place a map marker on their position 

WORK IN PROGRESS!!!
*/

while {true} do {
	_indiforGroups = allGroups select {side _x isEqualTo independent};
	
	{
		"mkr" setmarkerpos getpos leader blue;
	} forEach _indiforGroups;

	sleep 120;
};




// while {true} do {
// 	{ deleteVehicle _x } forEach allDead;
// 	systemChat "cleanup";
// 	sleep 30;
// };

// maybe use this as a way to get group leaders to pop smoke 