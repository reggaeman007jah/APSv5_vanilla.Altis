/*
from:		
to:			
to:			
to: 		

purpose:

notes:

issues:

configs: 
https://community.bistudio.com/wiki/cfgMarkers

General Requests - to be done in JTAC system / or VA Recon 
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

RGG_JTAC_mission	 	= [];
RGG_JTAC_grid	 		= [];
RGG_JTAC_approach	 	= [];
RGG_JTAC_egress		 	= [];
RGG_JTAC_target	 		= [];
// RGG_JTAC_helis	 		= [];
RGG_JTAC_ord	 		= [];
RGG_JTAC_danger	 		= [];
RGG_JTAC_colour	 		= [];
RGG_JTAC_id	 			= [];
// RGG_JTAC_duration 		= [];

*/

// static mission  information 
// _missionType	= _this select 0; // 1 - intiState - CAS or Recon 
// _missionID		= _this select 1; // 2 - alpha - echo 
// _missionColour	= _this select 2; // 3 - rgb 

// _missionGrid	= _this select 3; // 4 - 10-grid 
// _approachVec	= _this select 4; // 5 - 3-num 
// _egressVec		= _this select 5; // 6 - 3-num 

// _ordReq			= _this select 6; // 7 - guns, rocks, runs and rocks, rock dump 
// _targetType		= _this select 7; // 8 - infi, vics, tanks 
// _dangerclose	= _this select 8; // 9 - y or n 

// _missionTTL		= _this select 3; // 4 - 2 4 6 8 10 
// _heliNum		= _this select 7; // 8 - 1-5 

// or 
/*
RGG_JTAC_mission; 	// 1 - intiState - CAS or Recon 	 	
RGG_JTAC_target; 	// 8 - infi, vics, tanks 	
RGG_JTAC_ord; 		// 7 - guns, rocks, runs and rocks, rock dump 
RGG_JTAC_danger; 	// 9 - y or n 	
RGG_JTAC_colour; 	// 3 - rgb 	
RGG_JTAC_id; 		// 2 - alpha - echo 		
*/



/*
lets test this out 
*/
// _RGG_JTAC_mission = RGG_JTAC_mission select 0;
// _RGG_JTAC_target = RGG_JTAC_target select 0;
// _RGG_JTAC_ord = RGG_JTAC_ord select 0;
// _RGG_JTAC_danger = RGG_JTAC_danger select 0;
// _RGG_JTAC_colour = RGG_JTAC_colour select 0;
// _RGG_JTAC_id = RGG_JTAC_id select 0;


// _Vtype 	= _this select 1; // marker type (infi, repair etc)
// _Vdist 	= _this select 2; // spoken distance 
// _Vdir 	= _this select 3; // head direction 




private _colourLabel = "";
private _missionTypeLabel = "";
private _targetTypeLabel = "";
private _ordLabel = "";
private _dangerCloseLabel = "";
// private _colourLabel = "";
private _ID_Label = "";
private _parsedLon = "";
private _markerCol = "";

_dataPos1 = [010,300];
_dataPos2 = [020,300];
_dataPos3 = [030,300];
_dataPos4 = [040,300];
_dataPos5 = [050,300];

RGG_JTAC_EXEC = {

	private _markerCol = "";
	_missionType = 		RGG_JTAC_mission select 0;
	_missionTarget = 	RGG_JTAC_target select 0;
	_missionOrd = 		RGG_JTAC_ord select 0;
	_missionDanger = 	RGG_JTAC_danger select 0;
	_missionColour = 	RGG_JTAC_colour select 0;
	_missionID = 		RGG_JTAC_id select 0;

	// extract given answers from JTAC:
	switch (_missionType) do {
		case (1): { _missionTypeLabel = "Close Air Support Mission"; };
		case (2): { _missionTypeLabel = "Fire Team Insertion Mission"; };
	}; 

	switch (_missionTarget) do {
		case (1): { _targetTypeLabel = "Infantry"; };
		case (2): { _targetTypeLabel = "Motorised"; };
		case (3): { _targetTypeLabel = "Armoured"; };
		default { _targetTypeLabel = ""; };
	};
	// is a default needed?

	switch (_missionOrd) do {
		case (1): { _ordLabel = "Guns"; };
		case (2): { _ordLabel = "Guns and Rockets"; };
		case (3): { _ordLabel = "Rockets"; };
		case (4): { _ordLabel = "Rocket Dump"; };
		default { _ordLabel = ""; };
	};

	switch (_missionDanger) do {
		case (1): { _dangerCloseLabel = "WARNING DANGER CLOSE"; };
		case (2): { _dangerCloseLabel = "DANGER NOT CLOSE"; };
		case (3): { _dangerCloseLabel = "DANGER CLOSE - UNKNOWN"; };
	};

	switch (_missionColour) do {
		case (1): { _colourLabel = "Red"; };
		case (2): { _colourLabel = "Green"; };
		case (3): { _colourLabel = "Blue"; };
	};

	switch (_missionID) do {
		case (1): { _ID_Label = "Alpha"; };
		case (2): { _ID_Label = "Bravo"; };
		case (3): { _ID_Label = "Charlie"; };
		case (4): { _ID_Label = "Delta"; };
		case (5): { _ID_Label = "Echo"; };
	};

	switch (_colourLabel) do {
		case ("Red"): { _markerCol = "colorRed"; };
		case ("Green"): { _markerCol = "colorGreen"; };
		case ("Blue"): { _markerCol = "colorBlue"; };
	};

	// construct entry vector 
	_entryVec = [];
	_entry1 = RGG_JTAC_approach select 0;
	_entry2 = RGG_JTAC_approach select 1;
	_entry3 = RGG_JTAC_approach select 2;
	_entryVec pushBack _entry1;
	_entryVec pushBack _entry2;
	_entryVec pushBack _entry3;

	// construct exit vector 
	_exitVec = [];
	_exit1 = RGG_JTAC_egress select 0;
	_exit2 = RGG_JTAC_egress select 1;
	_exit3 = RGG_JTAC_egress select 2;
	_exitVec pushBack _exit1;
	_exitVec pushBack _exit2;
	_exitVec pushBack _exit3;

	// process vectors into one number 
	_parsedEntry1 = _entryVec joinString "";
	_parsedExit1 = _exitVec joinString "";
	_parsedEntry = parseNumber _parsedEntry1;
	_parsedExit = parseNumber _parsedExit1;

	// construct 10-grid 
	_gridLat = [];
	_gridLon = [];
	// _gridLat pushBack RGG_JTAC_grid select [0,4]; // should select range - why not work?
	// _gridLon pushBack RGG_JTAC_grid select [5,9]; // should select range - why not work?
	_grid1 = RGG_JTAC_grid select 0;
	_grid2 = RGG_JTAC_grid select 1;
	_grid3 = RGG_JTAC_grid select 2;
	_grid4 = RGG_JTAC_grid select 3;
	_grid5 = RGG_JTAC_grid select 4;
	_grid6 = RGG_JTAC_grid select 5;
	_grid7 = RGG_JTAC_grid select 6;
	_grid8 = RGG_JTAC_grid select 7;
	_grid9 = RGG_JTAC_grid select 8;
	_grid10 = RGG_JTAC_grid select 9;
	_gridLat pushBack _grid1; 
	_gridLat pushBack _grid2; 
	_gridLat pushBack _grid3; 
	_gridLat pushBack _grid4; 
	_gridLat pushBack _grid5; 
	_gridLon pushBack _grid6;
	_gridLon pushBack _grid7;
	_gridLon pushBack _grid8;
	_gridLon pushBack _grid9;
	_gridLon pushBack _grid10;
	_parsedLat1 = _gridLat joinString "";
	_parsedLon1 = _gridLon joinString "";
	_parsedLat = parseNumber _parsedLat1;
	_parsedLon = parseNumber _parsedLon1;
	_10Grid = [];
	_10Grid pushback _parsedLat;
	_10Grid pushback _parsedLon;

	// procedurally generated marker name
	_float = diag_tickTime;
	_float2 = random 10000;
	_uniqueStamp = [_float, _float2];
	_stampToString = str _uniqueStamp;

	// show mission information - debug 
	"---------- ALERT ------------------------------------------" remoteExec ["systemChat", 0, true];
	format ["mission id colour --- %1 %2 %3", _missionTypeLabel, _ID_Label, _colourLabel] remoteExec ["systemChat", 0, true];
	format ["Target: %1", _targetTypeLabel] remoteExec ["systemChat", 0];
	format ["Grid: %1", _10Grid] remoteExec ["systemChat", 0];
	format ["Fire Request: %1", _ordLabel] remoteExec ["systemChat", 0];
	format ["Protocol: %1", _dangerCloseLabel] remoteExec ["systemChat", 0];
	format ["Attack Vector: %1", RGG_JTAC_approach] remoteExec ["systemChat", 0];
	format ["Egress Vector: %1", RGG_JTAC_egress] remoteExec ["systemChat", 0];
	"---------- ALERT ------------------------------------------" remoteExec ["systemChat", 0, true];
	
	
	_dataPos = _10Grid getPos [100,180];
	// if (_missionTypeLabel == "Close Air Support Mission") then {
		[_dataPos, _missionTypeLabel, _ID_Label, _colourLabel, _targetTypeLabel, _ordLabel, _dangerCloseLabel] execVM "autoPatrolSystem\JTAC_Systems\missionData.sqf";
	// };
	// if (_missionTypeLabel == "Fire Team Insertion Mission") then {
	// 	[_dataPos, _missionTypeLabel, _ID_Label, _colourLabel, _targetTypeLabel, _ordLabel, _dangerCloseLabel] execVM "autoPatrolSystem\JTAC_Systems\missionData.sqf";
	// };

	

	// approach and egress markers 
	_anchor = _10Grid;
	_attackVec9 = _10Grid getPos [1000, _parsedEntry];
	_attackVec7 = _10Grid getPos [800, _parsedEntry];
	_attackVec5 = _10Grid getPos [600, _parsedEntry];
	_attackVec3 = _10Grid getPos [400, _parsedEntry];
	_attackVec1 = _10Grid getPos [200, _parsedEntry];
	_egressVec1 = _10Grid getPos [200, _parsedExit];
	_egressVec3 = _10Grid getPos [450, _parsedExit];
	_egressVec5 = _10Grid getPos [600, _parsedExit];
	[_10Grid, _attackVec9, _attackVec7, _attackVec5, _attackVec3, _attackVec1, _egressVec1, _egressVec3, _egressVec5, _markerCol, _parsedEntry, _parsedExit] execVM "autoPatrolSystem\JTAC_Systems\directionMarkers.sqf";


	/*
	// paths between marker points 
	_float = diag_tickTime;
	_float2 = random 10000;
	_uniqueStamp = [_float, _float2];
	_stampToString = str _uniqueStamp;

	_reldirX = RGG_missionOrigin getDir RGG_patrol_obj;
	_relDir = floor _relDirX;
	_distX = RGG_missionOrigin distance RGG_patrol_obj;
	_dist = floor _distX;
	_dist2 = _dist / 2;
	_testPos = RGG_missionOrigin getPos [_dist2, _relDirX];

	sleep 5;

	_lineTest = createMarker [_stampToString, _testPos];
	_lineTest setMarkerShape "RECTANGLE";
	_lineTest setMarkerColor "ColorBlack";
	_lineTest setMarkerDir _reldirX;
	_lineTest setMarkerSize [2, _dist2];
	*/
	// populate fire mission data 


	// animate target marker:
	_angle = 1;
	for "_i" from 0 to 1200 do {
		// create marker 
		_tempMarker = createMarker [_stampToString, _10Grid];
		if (_missionTypeLabel == "Close Air Support Mission") then {
			_tempMarker setMarkerText " <<< DESTROY";
		} else {
			_tempMarker setMarkerText " <<< DEPLOY TROOPS";
		};
		
		_tempMarker setMarkerType "mil_destroy";
		_tempMarker setMarkerColor _markerCol;
		_angle = _angle + 5;
		_tempMarker setMarkerDir _angle;
		sleep 0.1;
		deleteMarker _tempMarker;
	};

	execVM "autoPatrolSystem\JTAC_Systems\clearKeyDowns.sqf";
	execVM "autoPatrolSystem\JTAC_Systems\JTACinit.sqf";
};
[] call RGG_JTAC_EXEC;








// _parsed1Lat = splashCoordsLat joinString "";
// _parsed1Lon = splashCoordsLon joinString "";
// _parsed1Rnd = splashRounds joinString "";
// _parsed1Rad = splashRadius joinString "";
// _parsedLat = parseNumber _parsed1Lat;
// _parsedLon = parseNumber _parsed1Lon;
// _parsedRounds = parseNumber _parsed1Rnd;
// _parsedRadius = parseNumber _parsed1Rad;




// _disLat = RGG_JTAC_grid Select 0; 
// _disLon = RGG_JTAC_grid Select 1; 
// _displayLat = floor _disLat;
// _displayLon = floor _disLon;
// _gridCoords = [_displayLat, _displayLon];

// create unique marker name for target


// // test 
// format ["ALL STATIONS BE ADVISED - %1", _colourLabel] remoteExec ["systemChat", 0];

// sleep 1;
// // test
// systemChat "test -------------";
// systemChat str _colourLabel;
// systemChat "test -------------";








// "mil_arrow2"









/*

// old below 

_Vcat 	= _this select 0; // category (East West Indi General etc) 
_Vtype 	= _this select 1; // marker type (infi, repair etc)
_Vdist 	= _this select 2; // spoken distance 
_Vdir 	= _this select 3; // head direction 

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
		// case (4): {
		// 	switch (_Vtype) do {
		// 		_markerCat = "GENERAL";
		// 		case (1): { _visualMarkerTypeX = "mil_pickup", _markerType = "PICKUP" };
		// 		case (2): { _visualMarkerTypeX = "mil_destroy", _markerType = "DESTROY" };
		// 		case (3): { _visualMarkerTypeX = "mil_objective", _markerType = "OBJECTIVE" };
		// 		case (4): { _visualMarkerTypeX = "FireMission", _markerType = "FIRE MISSION" };
		// 		case (5): { _visualMarkerTypeX = "RepairVehicle", _markerType = "REPAIR" };
		// 	}; 
		// };
		// todo - move the above to a J-TAC script 
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

	// create marker 
	_tempMarker = createMarker [_stampToString, _markerPos];

	// _tempMarker setMarkerShape "ELLIPSE";
	_tempMarker setMarkerType _visualMarkerTypeX;

	// _tempMarker setMarkerSize [20, 20];
	_tempMarker setMarkerAlpha 0.8;

	// debug feedback 
	// systemchat format [" ........................."];
	// systemchat format [" .. DEBUG .. category:  %1", _markerCat];
	// systemchat format [" .. DEBUG .. type:      %1", _markerType];
	// systemchat format [" .. DEBUG .. distance:  %1", _Vdist];
	// systemchat format [" .. DEBUG .. direction: %1", _Vdir];
	// systemchat format [" .. DEBUG .. position:  %1", _markerPos];
	// systemchat format [" ........................."];

	// inform MP Players
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
