/*
from:		voiceMarkerSystem\keyDownMonitor.sqf
to:			voiceMarkerSystem\
to:			voiceMarkerSystem\ 
to: 		voiceMarkerSystem\

purpose:
executes marker creation 

notes:

issues:

*/

// eyepos 
_dir = _this select 0;

RGG_FNC_VMS_createMarker = {
	// params  
	params ["_dist", "_dir"];
	// get marker pos 
	_markerPos = player getPos [_dist, _dir];
	// create marker 
	_tempMarker = createMarker ["VMS_Marker", _markerPos];
	_tempMarker setMarkerShape "ELLIPSE";
	_tempMarker setMarkerSize [20, 20];
	_tempMarker setMarkerAlpha 0.8;
	_tempMarker setMarkerColor "colorRed";
	// fade and delete 
	sleep 10;
	_tempMarker setMarkerAlpha 0.6;
	sleep 5;
	_tempMarker setMarkerAlpha 0.4;
	sleep 3;
	_tempMarker setMarkerAlpha 0.1;
	sleep 2;
	deleteMarker "VMS_Marker";
	execVM "voiceMarkerSystem\1_vmsInit.sqf";

};

switch (RGG_VMS_Distance) do {
	case 1: {
		// dist 100m
		_dist = 100;
	};
	case 2: {
		// dist 200m
		_dist = 200;
	};
	case 3: {
		// dist 300m
		_dist = 300;
	};
	case 4: {
		// dist 400m
		_dist = 400;
	};
	case 5: {
		// dist 500m
		_dist = 500;
	};
	case 6: {
		// dist 600m
		_dist = 600;
	};
	case 7: {
		// dist 700m
		_dist = 700;
	};
	case 8: {
		// dist 800m
		_dist = 800;
	};
	case 9: {
		// dist 900m
		_dist = 900;
	};
	case 0: {
		// dist 1000m
		_dist = 1000;
	};

[_dist, _dir] call RGG_FNC_VMS_createMarker;
