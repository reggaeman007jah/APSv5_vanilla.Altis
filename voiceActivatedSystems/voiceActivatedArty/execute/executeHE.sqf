/*
from: 	voiceActivatedArty\execute\confirmExecute.sqf	
to:		voiceActivatedArty\clearKeyDowns.sqf
to:		voiceActivatedArty\initialiseVAA.sqf

purpose:
fnc that manages all ze booms 
number parsing 
marker making 
countdown indicator 

notes:
if I activate keyDowns as I do here, it will make adjust fire impossible 
there needs to be an active instruction to either close, repeat or adjust fire at the end here ...
and only then should keyDowns be activated (if player closes call)

numericalInput = false; -- what is this??
*/

// HE Execute 
execVM "voiceActivatedArty\clearKeyDowns.sqf";
systemChat "clearKeyDowns activated";

_lat = _this select 0;
_lon = _this select 1;
_rnd = _this select 2;
_radi = _this select 3;
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
	// this is where a delay config would go <<<
	// sleep 15;
	// systemChat "HE x 25 inbound, splash in 60 ...";
	// sleep 30;
	// // inform user through display or .ogg, but for now just use sysChat 
	// systemChat "HE x 25, splash in 30 ...";
	// sleep 15;
	// systemChat "splash in 15 ...";
	// sleep 10;
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
		private _rad = random _radius;
		private _prj = _shell createVehicle (_origin getPos [_rad, _dir]);		
		sleep _int;
	};
	systemChat "barrage over";
	sleep 2;
	systemChat "what next?";
	sleep 2;
	systemChat "0 - close, 1 = repeat, 2 = adjust fire";
	systemChat "be advised this aint built yet";

	numericalInputBool = false;
	deleteMarker "gun1";
	systemChat "reactivating initVAA after calling strike";	
	execVM "voiceActivatedArty\initialiseVAA.sqf";
};

["R_80mm_HE", _pos, _radi, _rnd] call RGG_callArty1;
