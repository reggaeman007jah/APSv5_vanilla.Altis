/*
from:		voiceMarkerSystem\keyDownMonitor.sqf
to:			voiceMarkerSystem\
to:			voiceMarkerSystem\ 
to: 		voiceMarkerSystem\

purpose:
executes marker creation 

notes:

issues:

configs: 
https://community.bistudio.com/wiki/cfgMarkers

General Requests 
1 Pick up / "mil_pickup"
2 Destroy / "mil_destroy"
3 Objective / "mil_objective"
4 "FireMission"
5 "RepairVehicle"

West 
1 Infantry (Blue) / "b_inf"
2 Motorized (Blue) / "b_motor_inf"
3 Mechanized (Blue) / "b_mech_inf"
4 Armor (Blue) / "b_armor"
5 Artillery (Blue) / "b_art"

Indi 
1 Infantry (Green) / "n_inf"
2 Motorized (Green) / "n_motor_inf"
3 Mechanized (Green) / "n_mech_inf" 
4 Armor (Green) / "n_armor"
5 Artillery (Green) / "n_art"

East 
1 Infantry (Red) / "o_inf"
2 Motorized (Red) / "o_motor_inf"
3 Mechanized (Red) / "o_mech_inf"
4 Armor (Red) / "o_armor"
5 Artillery (Red) / "o_art"

*/

_cat 	= _this select 0; // faction type (East West Indi General etc) 
_type 	= _this select 1; // marker type (infi, repair etc)
_dist 	= _this select 2; // spoken distance 
_dir 	= _this select 3; // head direction 

RGG_FNC_VMS_createMarker = {

	// params  
	params ["_cat", "_type", "_dist", "_dir"];
	private = "_markerType";

	// get cat && type 
	switch (_cat) do {
		case (1): {
			switch (_type) do {
				case (1): { _markerType = "b_inf" };
				case (2): { _markerType = "b_motor_inf" };
				case (3): { _markerType = "b_mech_inf" };
				case (4): { _markerType = "b_armor" };
				case (5): { _markerType = "b_art" };
			}; 
		};
		case (2): {
			switch (_type) do {
				case (1): { _markerType = "n_inf" };
				case (2): { _markerType = "n_motor_inf" };
				case (3): { _markerType = "n_mech_inf" };
				case (4): { _markerType = "n_armor" };
				case (5): { _markerType = "n_art" };
			}; 
		};
		case (3): {
			switch (_type) do {
				case (1): { _markerType = "o_inf" };
				case (2): { _markerType = "o_motor_inf" };
				case (3): { _markerType = "o_mech_inf" };
				case (4): { _markerType = "o_armor" };
				case (5): { _markerType = "o_art" };
			}; 
		};
		case (4): {
			switch (_type) do {
				case (1): { _markerType = "mil_pickup" };
				case (2): { _markerType = "mil_destroy" };
				case (3): { _markerType = "mil_objective" };
				case (4): { _markerType = "FireMission" };
				case (5): { _markerType = "RepairVehicle" };
			}; 
		};
	}; 

	// get marker pos 
	_markerPos = player getPos [_dist, _dir];

	// create marker 
	_tempMarker = createMarker ["VMS_Marker", _markerPos];

	// _tempMarker setMarkerShape "ELLIPSE";
	_tempMarker setMarkerType _markerType;

	// _tempMarker setMarkerSize [20, 20];
	_tempMarker setMarkerAlpha 0.8;

	// _tempMarker setMarkerColor "colorBlue";
	// debug feedback 
	systemchat format ["distance:  %1", _dist];
	systemchat format ["direction: %1", _dir];
	systemchat format ["position:  %1", _markerPos];

	//fade and delete (sorry!) 
	sleep 30;
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

[_cat, _type, _dist, _dir] call RGG_FNC_VMS_createMarker;

