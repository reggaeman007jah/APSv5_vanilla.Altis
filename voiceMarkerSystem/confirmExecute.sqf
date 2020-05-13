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

_Vcat 	= _this select 0; // category (East West Indi General etc) 
_Vtype 	= _this select 1; // marker type (infi, repair etc)
_Vdist 	= _this select 2; // spoken distance 
_Vdir 	= _this select 3; // head direction 

systemChat format ["%1 // %2 // %3 // %4", _Vcat, _Vtype, _Vdist, _Vdir];

private _visualMarkerTypeX = ""; 

RGG_FNC_VMS_createMarker = {

	execVM "voiceMarkerSystem\1_vmsInit.sqf";

	// params  
	params ["_Vcat", "_Vtype", "_Vdist", "_Vdir"];
	
	// get cat && type 
	switch (_Vcat) do {
		case (1): {
			switch (_Vtype) do {
				case (1): { _visualMarkerTypeX = "b_inf" };
				case (2): { _visualMarkerTypeX = "b_motor_inf" };
				case (3): { _visualMarkerTypeX = "b_mech_inf" };
				case (4): { _visualMarkerTypeX = "b_armor" };
				case (5): { _visualMarkerTypeX = "b_art" };
			}; 
		};
		case (2): {
			switch (_Vtype) do {
				case (1): { _visualMarkerTypeX = "n_inf" };
				case (2): { _visualMarkerTypeX = "n_motor_inf" };
				case (3): { _visualMarkerTypeX = "n_mech_inf" };
				case (4): { _visualMarkerTypeX = "n_armor" };
				case (5): { _visualMarkerTypeX = "n_art" };
			}; 
		};
		case (3): {
			switch (_Vtype) do {
				case (1): { _visualMarkerTypeX = "o_inf" };
				case (2): { _visualMarkerTypeX = "o_motor_inf" };
				case (3): { _visualMarkerTypeX = "o_mech_inf" };
				case (4): { _visualMarkerTypeX = "o_armor" };
				case (5): { _visualMarkerTypeX = "o_art" };
			}; 
		};
		case (4): {
			switch (_Vtype) do {
				case (1): { _visualMarkerTypeX = "mil_pickup" };
				case (2): { _visualMarkerTypeX = "mil_destroy" };
				case (3): { _visualMarkerTypeX = "mil_objective" };
				case (4): { _visualMarkerTypeX = "FireMission" };
				case (5): { _visualMarkerTypeX = "RepairVehicle" };
			}; 
		};
	}; 

	// get marker pos 
	_markerPos = player getPos [_Vdist, _Vdir];

	// create marker 
	_tempMarker = createMarker ["VMS_Marker", _markerPos];

	// _tempMarker setMarkerShape "ELLIPSE";
	_tempMarker setMarkerType _visualMarkerTypeX;

	// _tempMarker setMarkerSize [20, 20];
	_tempMarker setMarkerAlpha 0.8;

	// _tempMarker setMarkerColor "colorBlue";
	// debug feedback 
	systemchat format [" ........................."];
	systemchat format [" .. DEBUG .. category:  %1", _Vcat];
	systemchat format [" .. DEBUG .. type:      %1", _Vtype];
	systemchat format [" .. DEBUG .. distance:  %1", _Vdist];
	systemchat format [" .. DEBUG .. direction: %1", _Vdir];
	systemchat format [" .. DEBUG .. position:  %1", _markerPos];
	systemchat format [" ........................."];

	//fade and delete (sorry!) 
	sleep 50;
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
	
};

[_Vcat, _Vtype, _Vdist, _Vdir] call RGG_FNC_VMS_createMarker;
