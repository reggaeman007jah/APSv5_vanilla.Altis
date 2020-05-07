// defensive positions (blufor) 

/*
Maybe use this as a timer system?
_defendStartTime = time;
systemChat format ["patrol defence started at %1 seconds into mission", _defendStartTime];

I capture mission minutes - this is an easy way to set a timer on any one point 

*/

MISSIONTASK = "Secure the patrol point and prepare for opfor retaliation";
publicVariable "MISSIONTASK";

_smoke = createVehicle ["G_40mm_smokeYELLOW", RGG_patrol_obj, [], 0, "none"]; // drop this from up high 

// systemChat "debug --- blufor moving into defensive positions at the patrol point"; 	
// "MP debug --- blufor moving into defensive positions at the patrol point" remoteExec ["systemChat", 0, true];

sleep 3;

_indi = [];
// {if ((side _x) == INDEPENDENT) then {_indi pushBack _x}} forEach allUnits inAreaArray "Objective 1";
{if ((side _x) == INDEPENDENT) then {_indi pushBack _x}} forEach allUnits;

{
	// systemChat "debug - BLUEDEFEND STATE - Blue Unit Counted";
	// "MP debug - BLUEDEFEND STATE - Blue Unit Counted" remoteExec ["systemChat", 0, true];
	_dir = random 360;
	_dist = selectRandom [14, 16, 18, 20, 22, 24]; 
	_defendPoint = RGG_patrol_obj getPos [_dist, _dir]; // moves units into a rough 360 defensive circle
	_x setBehaviour "COMBAT";
	_x doMove _defendPoint;
	sleep 1;
} forEach _indi;	

// then create and move enemy into attack 

// _enemyWaves = selectRandom [1,2,3]; // do this once

// systemChat format ["MSG there are %1 waves incoming", _enemyWaves];
// "MP MSG there are %1 waves incoming" remoteExec ["systemChat format", 0, true];	// this won't work!

// work out waves later - for now keep things alternating attack / defend 

// systemChat "op retaliatory attackers being created";

// _outcome = selectRandom [1,2,3]; 
_outcome = 1; // for testing 

if (_outcome == 1) then {
	ONEPOINT = true;
};
if (_outcome == 2) then {
	TWOPOINT = true;
};
if (_outcome == 3) then {
	THREEPOINT = true;
};

// _rndOp1 = selectRandom [24, 30, 36, 42, 48, 54]; // RF force size 
// stage RF based on patrol points taken and maybe also dist from home base 

switch (patrolPointsTaken) do {
	case (0): { _rndOp1 = 24; };
	case (1): { _rndOp1 = 30; };
	case (2): { _rndOp1 = 36; };
	case (3): { _rndOp1 = 42; };
	case (4): { _rndOp1 = 48; };
	case (4): { _rndOp1 = 54; };
	default { _rndOp1 = selectRandom [24, 30, 36, 42, 48, 54]; };
};

// create 6 groups each time and send to one two or three points 
_grp1 = createGroup east;
_grp2 = createGroup east;
_grp3 = createGroup east;
_grp4 = createGroup east;
_grp5 = createGroup east;
_grp6 = createGroup east;
_groupSize = _rndOp1 / 6;

switch (true) do {	

	case (ONEPOINT): {
		_anchor1 = [RGG_patrol_obj, 400, 700] call BIS_fnc_findSafePos; 
		for "_i" from 1 to 6 do {
			_indiGroup = createGroup east;
			_anchor2 = [_anchor1, 50, 150, 3, 0] call BIS_fnc_findSafePos;
			_opforTeam = [];
			_opClasses = ["o_g_soldier_ar_f","o_g_soldier_gl_f","o_g_sharpshooter_f","o_soldieru_lat_f"];
			for "_i" from 1 to _groupSize do {
				_unit = selectRandom _opClasses;
				_unit1 = _indiGroup createUnit [_unit, _pos, [], 0.1, "none"];
				_opforTeam pushBack _unit1;
			};
			systemChat "opfor team:";
			systemChat str _opforTeam;
			sleep 0.3;
			// move orders 
			_ranDist = random 30;
			_ranDir = random 359;
			_unitDest = RGG_patrol_obj getPos [_ranDist, _ranDir];
			_opforTeam doMove _unitDest;
			spawnedIndiUnit = spawnedIndiUnit + _groupSize;
		};
		// _anchor1 = [RGG_patrol_obj, 400, 700] call BIS_fnc_findSafePos; 
		// deleteMarker "Point 1";
		// deleteMarker "Point 2";
		// deleteMarker "Point 3"; 
		// _objective1 = createMarker ["Point 1", _pos1];
		// _objective1 setMarkerShape "ELLIPSE";
		// _objective1 setMarkerColor "ColorRed";
		// _objective1 setMarkerSize [50, 50];

		// for "_i" from 1 to 6 do {						
		// 	_grp = createGroup east; // should be 6 groups
		// 	// get good position away from anchor 
		// 	_anchor2 = [_anchor1, 500, 100, 3, 0] call BIS_fnc_findSafePos; 
		// 	// we need more options here!
		// 	for "_i" from 1 to _groupSize do {
		// 		_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];	
		// 		_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"];
		// 		_moveTo = RGG_patrol_obj getPos [5, _randomDir]; 
		// 		_unit doMove _moveTo;
		// 		spawnedOpforUnit = spawnedOpforUnit + 1;
		// 		sleep 0.5;
		// 	};
 		// }; 
		ONEPOINT = false;
	};
	// case (ONEPOINT): {
	// 	_pos1 = [RGG_patrol_obj, 400, 700, 1, 0] call BIS_fnc_findSafePos; 
	// 	deleteMarker "Point 1";
	// 	deleteMarker "Point 2";
	// 	deleteMarker "Point 3"; 
	// 	_objective1 = createMarker ["Point 1", _pos1];
	// 	_objective1 setMarkerShape "ELLIPSE";
	// 	_objective1 setMarkerColor "ColorRed";
	// 	_objective1 setMarkerSize [50, 50];

	// 	for "_i" from 1 to _rndOp1 do 
	// 	{						
	// 		sleep 3;
	// 		_grp = createGroup east;
	// 		_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; 
	// 		_pos = _pos1 getPos [50, _randomDir];
	// 		_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
	// 		_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
	// 		sleep 0.3;
	// 		_moveTo = RGG_patrol_obj getPos [5, _randomDir]; 
	// 		_unit doMove _moveTo;
	// 		spawnedOpforUnit = spawnedOpforUnit + 1;
	// 	}; 
	// 	ONEPOINT = false;
	// };
	case (TWOPOINT): {
		// systemChat "switch test ok 2";
		_pos1 = [RGG_patrol_obj, 400, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		_pos2 = [RGG_patrol_obj, 400, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		deleteMarker "Point 3";
		deleteMarker "Point 1";
		_objective1 = createMarker ["Point 1", _pos1];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];
		deleteMarker "Point 2";
		_objective1 = createMarker ["Point 2", _pos2];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];

		for "_i" from 1 to _rndOp1 do 
		{						
			sleep 3;
			_grp = createGroup east;
			_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; 
			_posRandom = selectRandom [_pos1, _pos2];
			_pos = _posRandom getPos [50, _randomDir];
			_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
			_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
			sleep 0.3;
			_moveTo = RGG_patrol_obj getPos [5, _randomDir]; 
			_unit doMove _moveTo;
			spawnedOpforUnit = spawnedOpforUnit + 1;

		}; 
		TWOPOINT = false;
	};
	case (THREEPOINT): {	
		// systemChat "switch test ok 3";
		_pos1 = [RGG_patrol_obj, 300, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		_pos2 = [RGG_patrol_obj, 300, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		_pos3 = [RGG_patrol_obj, 300, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		deleteMarker "Point 1";
		_objective1 = createMarker ["Point 1", _pos1];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];
		deleteMarker "Point 2";
		_objective1 = createMarker ["Point 2", _pos2];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];
		deleteMarker "Point 3";
		_objective1 = createMarker ["Point 3", _pos3];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];

		_grp = createGroup east; // moving this 'out' of the loop, so it is only triggered once - will this resolve the noSpawn issue?

		for "_i" from 1 to _rndOp1 do 
		{						
			sleep 3;
			// _grp = createGroup east;
			_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; 
			_moveDist = selectRandom [5, 10, 15, 20, 25, 30]; 
			_posRandom = selectRandom [_pos1, _pos2, _pos3];
			_pos = _posRandom getPos [50, _randomDir];
			_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
			_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
			sleep 0.3;
			_moveTo = RGG_patrol_obj getPos [_moveDist, _randomDir]; // _moveDist is an attempt to better space out opfor attackers after they have taken back a point 
			_unit doMove _moveTo;
			spawnedOpforUnit = spawnedOpforUnit + 1;

		}; 
		THREEPOINT = false;
	};
};

// hint "get ready to switch to phase 5";
sleep 5;
[_rndOp1, _outcome] execVM "autoPatrolSystem\phase5_monitorBluforDefence.sqf"; // pass in no. of enemy units / no. of origin points / vars to inform intel message