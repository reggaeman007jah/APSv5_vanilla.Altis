
_target = getPos heliRecon;
// _smoke = "SmokeShellRed" createVehicle position heliRecon;
_smoke = "SmokeShellRed" createVehicle _target;




// _lat = _this select 0;
// _lon = _this select 1;
// _rnd = _this select 2;
// _radi = _this select 3;
// _pos = [_lat, _lon];

// createMarker
deleteMarker "gun1";
_marker1 = createMarker ["gun1", _target];
_marker1 setMarkerShapeLocal "ELLIPSE";
_marker1 setMarkerColorLocal "ColorRed";
_marker1 setMarkerSizeLocal [100, 100];
_marker1 setMarkerAlphaLocal 0.9;

// function
RGG_smokeArty = {

	// this is where a delay config would go <<<
	// sleep 15;
	// systemChat "HE x 25 inbound, splash in 60 ...";
	// sleep 30;
	// // inform user through display or .ogg, but for now just use sysChat 
	// systemChat "HE x 25, splash in 30 ...";
	// sleep 15;
	// systemChat "splash in 15 ...";
	sleep 30;
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

	deleteMarker "gun1";
	systemChat "barrage over";
};

["R_80mm_HE", _target, 50, 20] call RGG_smokeArty;