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

// systemChat format ["%1 // %2 // %3 // %4", _Vcat, _Vtype, _Vdist, _Vdir];

private _visualMarkerTypeX = ""; 
private _markerCat = ""; 
private _markerType = ""; 

RGG_FNC_VMS_createMarker = {

	execVM "voiceMarkerSystem\1_vmsInit.sqf";

	// params  
	params ["_Vcat", "_Vtype", "_Vdist", "_Vdir"];
	
	// get cat && type 
	switch (_Vcat) do {
		case (1): {
			_markerCat = "BLUFOR";
			switch (_Vtype) do {
				case (1): { _visualMarkerTypeX = "b_inf", _markerType = "INFANTRY" };
				case (2): { _visualMarkerTypeX = "b_motor_inf", _markerType = "MOTORIZED" };
				case (3): { _visualMarkerTypeX = "b_mech_inf", _markerType = "MECHANIZED" };
				case (4): { _visualMarkerTypeX = "b_armor", _markerType = "ARMOUR" };
				case (5): { _visualMarkerTypeX = "b_art", _markerType = "ARTILLERY" };
			}; 
		};
		case (2): {
			_markerCat = "INDIFOR";
			switch (_Vtype) do {
				case (1): { _visualMarkerTypeX = "n_inf", _markerType = "INFANTRY" };
				case (2): { _visualMarkerTypeX = "n_motor_inf", _markerType = "MOTORIZED" };
				case (3): { _visualMarkerTypeX = "n_mech_inf", _markerType = "INFAMECHANIZEDNTRY" };
				case (4): { _visualMarkerTypeX = "n_armor", _markerType = "ARMOUR" };
				case (5): { _visualMarkerTypeX = "n_art", _markerType = "ARTILLERY" };
			}; 
		};
		case (3): {
			_markerCat = "OPFOR";
			switch (_Vtype) do {
				case (1): { _visualMarkerTypeX = "o_inf", _markerType = "INFANTRY" };
				case (2): { _visualMarkerTypeX = "o_motor_inf", _markerType = "MOTORIZED" };
				case (3): { _visualMarkerTypeX = "o_mech_inf", _markerType = "MECHANIZED" };
				case (4): { _visualMarkerTypeX = "o_armor", _markerType = "ARMOUR" };
				case (5): { _visualMarkerTypeX = "o_art", _markerType = "ARTILLERY" };
			}; 
		};
		case (4): {
			switch (_Vtype) do {
				_markerCat = "GENERAL";
				case (1): { _visualMarkerTypeX = "mil_pickup", _markerType = "PICKUP" };
				case (2): { _visualMarkerTypeX = "mil_destroy", _markerType = "DESTROY" };
				case (3): { _visualMarkerTypeX = "mil_objective", _markerType = "OBJECTIVE" };
				case (4): { _visualMarkerTypeX = "FireMission", _markerType = "FIRE MISSION" };
				case (5): { _visualMarkerTypeX = "RepairVehicle", _markerType = "REPAIR" };
			}; 
		};
	}; 

	// get marker pos 
	_markerPos = player getPos [_Vdist, _Vdir];
	_disLat = _markerPos Select 0; 
	_disLon = _markerPos Select 1; 
	_displayLat = floor _disLat;
	_displayLon = floor _disLon;
	_displayCoords = [_displayLat, _displayLon];


	// create unique marker name 
	_float = diag_tickTime;
	_float2 = random 10000;
	_uniqueStamp = [_float, _float2];
	_stampToString = str _uniqueStamp;

	// _lineTest = createMarker [_stampToString, _testPos];
	// _lineTest setMarkerShape "RECTANGLE";
	// _lineTest setMarkerColor "ColorBlack";
	// _lineTest setMarkerDir _reldirX;
	// _lineTest setMarkerSize [2, _dist2];

	// create marker 
	_tempMarker = createMarker [_stampToString, _markerPos];

	// _tempMarker setMarkerShape "ELLIPSE";
	_tempMarker setMarkerType _visualMarkerTypeX;

	// _tempMarker setMarkerSize [20, 20];
	_tempMarker setMarkerAlpha 0.8;

	// _tempMarker setMarkerColor "colorBlue";
	// debug feedback 
	// systemchat format [" ........................."];
	// systemchat format [" .. DEBUG .. category:  %1", _markerCat];
	// systemchat format [" .. DEBUG .. type:      %1", _markerType];
	// systemchat format [" .. DEBUG .. distance:  %1", _Vdist];
	// systemchat format [" .. DEBUG .. direction: %1", _Vdir];
	// systemchat format [" .. DEBUG .. position:  %1", _markerPos];
	// systemchat format [" ........................."];

	// inform MP Players
	// format ["Intel suggests %1 enemy units are advancing in your immediate area. Check the map for specific locational intel", _numberOfAttackers] remoteExec ["hint", 0];
	// <t size='1.25' font='Zeppelin33' color='#ff0000'>%1 lives remaining.</t>

	// format ["<t color='#ff0000'>A visual marker has been created: %1 %2 at %3</t>", _Vcat, _Vtype, _markerPos] remoteExec ["systemChat", 0];
	format ["ALL STATIONS BE ADVISED - %1 %2 SPOTTED at %3", _markerCat, _markerType, _displayCoords] remoteExec ["systemChat", 0];

	//fade and delete (sorry!) 
	sleep 45;
	_tempMarker setMarkerAlpha 0.6;
	sleep 5;
	_tempMarker setMarkerAlpha 0.5;
	sleep 5;
	_tempMarker setMarkerAlpha 0.4;
	sleep 5;
	_tempMarker setMarkerAlpha 0.3;
	sleep 5;
	_tempMarker setMarkerAlpha 0.2;
	sleep 5;
	_tempMarker setMarkerAlpha 0.1;
	deleteMarker _stampToString;
	
};

[_Vcat, _Vtype, _Vdist, _Vdir] call RGG_FNC_VMS_createMarker;
