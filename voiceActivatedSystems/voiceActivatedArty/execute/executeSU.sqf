/*
from: 	voiceActivatedArty\execute\confirmExecute.sqf	
to:		voiceActivatedArty\clearKeyDowns.sqf
to:		voiceActivatedArty\initialiseVAA.sqf

purpose:


notes:
numericalInput = false; -- what is this??
make these vars LOCAL FFS!
*/

// Surgical execute
// execVM "voiceActivatedArty\clearKeyDowns.sqf";

_lat = _this select 0;
_lon = _this select 1;
_pos = [_lat, _lon];

// createMarker
deleteMarker "gun1";
_marker1 = createMarker ["gun1", _pos];
_marker1 setMarkerShapeLocal "ELLIPSE";
_marker1 setMarkerColorLocal "ColorRed";
_marker1 setMarkerSizeLocal [100, 100];
_marker1 setMarkerAlphaLocal 0.9;

// function
RGG_callArty1 = {
	
	numericalInput = false;
	sleep 25;
	systemChat ".. 5 ..";
	sleep 1;
	systemChat ".. 4 ..";
	sleep 1;
	systemChat ".. 3 ..";
	sleep 1;
	systemChat ".. 2 ..";
	sleep 2;
	
	params ["_shell", "_origin", "_radius", "_count"];

	while {_count = _count - 1; _count >= 0} do {

		private _int = selectRandom [1, 2, 4, 8];
		private _dir = random 360;
		private _rad = 1;
		private _prj = _shell createVehicle (_origin getPos [_rad, _dir]);		
		sleep _int;
		[_origin] execVM "voiceActivatedArty\execute\damageMaker.sqf";
	};

	numericalInputBool = false;
	deleteMarker "gun1";
	// execVM "voiceActivatedArty\initialiseVAA.sqf";
	
};

["Bo_GBU12_LGB", _pos, 1, 1] call RGG_callArty1;	






/* toys:
ammo_Bomb_SDB
BombCluster_02_Ammo_F
Cluster_155mm_AMOS
ammo_Missile_HARM
R_80mm_HE
Bo_GBU12_LGB - tha big fucker

