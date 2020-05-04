// this will be given a location to create a temp marker - cleanup will then be applied in this marker area only


// missionOrigin
// _cleanupMarkerPos = _this select 0;
// sleep 300;
// _deadBodies = [];

systemChat "get ready to check garbage...";
sleep 5;

// _objective1 = createMarker ["garbageCollection", _cleanupMarkerPos];
// _objective1 setMarkerShape "ELLIPSE";
// _objective1 setMarkerColor "ColorYellow";
// _objective1 setMarkerSize [350, 350];
// sleep 20;
{
	if ((getMarkerPos "missionOrigin" distance _x) > 450) then {
		deleteVehicle _x
		};
} forEach allDead;
// deleteMarker "garbageCollection";
/*
^^^ April 2020 UNTESTED 
*/


/*

while {true} do {
	sleep 600;
	// systemChat "cleanup";
	{ deleteVehicle _x } forEach allDead;
};



{if ((getMarkerPos "respawn_west" distance _x) => 400) then {deleteVehicle _x}} forEach allDead;

*/