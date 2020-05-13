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

_dist = _this select 0;
_dir = _this select 1;

RGG_FNC_VMS_createMarker = {
	systemChat "SEE THIS!";
	// params  
	params ["_dist", "_dir"];
	// get marker pos 
	_markerPos = player getPos [_dist, _dir];
	// create marker 
	_tempMarker = createMarker ["VMS_Marker", _markerPos];
	// _tempMarker setMarkerShape "ELLIPSE";
	_tempMarker setMarkerType "o_inf";
	// _tempMarker setMarkerSize [20, 20];
	_tempMarker setMarkerAlpha 0.8;
	// _tempMarker setMarkerColor "colorBlue";
	// feedback 
	systemchat format ["distance:  %1", _dist];
	systemchat format ["direction: %1", _dir];
	systemchat format ["position:  %1", _markerPos];
	//fade and delete 
	sleep 4;
	_tempMarker setMarkerAlpha 0.6;
	sleep 0.5;
	_tempMarker setMarkerAlpha 0.5;
	sleep 0.5;
	_tempMarker setMarkerAlpha 0.4;
	sleep 0.5;
	_tempMarker setMarkerAlpha 0.3;
	sleep 0.5;
	_tempMarker setMarkerAlpha 0.2;
	sleep 0.5;
	_tempMarker setMarkerAlpha 0.1;
	deleteMarker "VMS_Marker";
	execVM "voiceMarkerSystem\1_vmsInit.sqf";
};

[_dist, _dir] call RGG_FNC_VMS_createMarker;

