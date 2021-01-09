/*
From: autoPatrolSystem\phase2_createOpforWave1.sqf 

Purpose:
This creates a group of opfor defenders who will head to the patrol obj and await the blufor patrol as they head in to take the point 
Lots of this code determines size of enemy force depending on points taken

Flow:
	Create opfor defenders and send to enemy camp - addes scores to spawnedOpforUnit global var count 
	Runs INDIFOR FR check 
	Runs check loop - FRCHECK - to assess if INDIFOR have taken the point 
	When defenders are all killed, next phase is called 
	RFCHECK = true
	Checks for opfor 3 or less and indifor as 3 or more 
	execVM "autoPatrolSystem\phase4_createOpforRF.sqf" 

Receives:
TBC

Informs:
	redirects any indifor units incorrectly sent to the old point as part of an RF action: 
	execVM "autoPatrolSystem\insuranceSystems\phase3Timer.sqf"
	execVM "autoPatrolSystem\phase4_createOpforRF.sqf" 

Notes:
If opfor is 3 or less in the red zone, it is considered taken and the mission progresses 
Number of statics and size of defence is linked to the number of points taken - uses patrolPointsTaken global check 
after they have reached max diff, the statics are totally randomised ...
i.e. current iteration of killchain is an increasing diff model, until a point, then it is randomised 
RFCHECK uses RGG_redzoneEast and RGG_redzoneIndi global vars 

Actions:
As this is all about the 'attack', and considering that sometimes you can have a deadzone if the blufor attackers do not spot hidden 
opfor defenders a solution is needed to ensure that blufor essentially search and destroy in and around the objective 
I need to write a function or script that does an 'Insurance Move' for all blufor in the area but only while RFCHECK is true - 
.. find out why this failed before 
This entire script needs to be refined / refactored ... very verbose currently 
Design a retreat script 

Questions:
TBC

Data:
O_G_Soldier_LAT_F
O_G_Soldier_TL_F
O_G_Soldier_SL_F
O_G_Soldier_LAT2_F
O_G_Soldier_F
O_G_medic_F
O_G_HMG_02_high_F
O_G_Mortar_01_F
O_G_HMG_02_F
*/

_opforClass = [
	// "o_soldieru_lat_f",
	"O_G_Soldier_A_F",
	"O_G_Soldier_AR_F",
	"O_G_medic_F",
	"O_G_engineer_F",
	"O_G_Soldier_exp_F",
	"O_G_Soldier_GL_F",
	"O_G_Soldier_M_F",
	"O_G_officer_F",
	"O_G_Soldier_F",
	"O_G_Soldier_LAT_F",
	"O_G_Soldier_LAT2_F",
	"O_G_Soldier_lite_F",
	"O_G_Sharpshooter_F",
	"O_G_Soldier_SL_F",
	"O_G_Soldier_TL_F"
];

_rndOp1 = selectRandom [8, 10, 12, 24];

_grp = createGroup east;
systemchat format ["op defence: %1", _rndOp1]; // debug 
for "_i" from 1 to _rndOp1 do {
	_rndtype = selectRandom _opforClass;
	_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
	_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
	_randomDir = selectRandom [270, 290, 01, 30, 90];
	_randomDist = random [5, 25, 50]; 
	_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
	_unit setBehaviour "COMBAT";
	// _unit doMove _endPoint;
	spawnedOpforUnit = spawnedOpforUnit +1;
 	sleep 1;									
};

// createGuardedPoint [east, RGG_patrol_obj, -1, objNull];
// systemChat "guard wp set";

sleep 2;

switch (patrolPointsTaken) do {
	case 0: {
		systemChat "no statics this time around";
		_rndOp1 = random [8, 12, 16];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [5, 25, 50]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
	};
	case 1: {
		for "_i" from 1 to 1 do {
			_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_HMG_01_high_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
		for "_i" from 1 to 1 do {
			_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_static_AT_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
		// O_static_AT_F
		_rndOp1 = random [8, 14, 18];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [5, 25, 50]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
	};
	case 2: {
		for "_i" from 1 to 1 do {
			_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_G_Mortar_01_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning mortar opfor";
			sleep 1;						
		};
		for "_i" from 1 to 1 do {
			_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_static_AT_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
		_rndOp1 = random [8, 16, 20];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [5, 25, 50]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
	};
	case 3: {
		for "_i" from 1 to 2 do {
			_pos = [RGG_patrol_obj, 0, 75] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_HMG_01_high_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
		for "_i" from 1 to 1 do {
			_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_static_AT_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
		_rndOp1 = random [8, 12, 18];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [5, 25, 50]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
		_rndOp1 = random [4, 8, 10];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [25, 50, 75]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
	};
	case 4: {
		for "_i" from 1 to 2 do {
			_pos = [RGG_patrol_obj, 0, 150] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_G_Mortar_01_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning mortar opfor";
			sleep 1;						
		};
		for "_i" from 1 to 2 do {
			_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_static_AT_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
		_rndOp1 = random [8, 12, 18];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [5, 25, 50]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
		_rndOp1 = random [8, 10, 14];
		_grp = createGroup east;
		systemchat format ["op defencee: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [25, 50, 75]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
	};
	case 5: {
		for "_i" from 1 to 1 do {
			_pos = [RGG_patrol_obj, 0, 75] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_HMG_01_high_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
			for "_i" from 1 to 1 do {
			_pos = [RGG_patrol_obj, 0, 150] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_G_Mortar_01_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning mortar opfor";
			sleep 1;						
		};
		for "_i" from 1 to 1 do {
			_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_static_AT_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
		_rndOp1 = random [10, 14, 20];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [5, 25, 50]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
		_rndOp1 = random [6, 10, 12];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [25, 50, 75]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
	};
	case 6: {
		for "_i" from 1 to 2 do {
			_pos = [RGG_patrol_obj, 0, 75] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_HMG_01_high_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
			for "_i" from 1 to 2 do {
			_pos = [RGG_patrol_obj, 0, 150] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_G_Mortar_01_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning mortar opfor";
			sleep 1;						
		};
		for "_i" from 1 to 2 do {
			_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_static_AT_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
		_rndOp1 = random [10, 14, 20];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [5, 25, 50]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
		_rndOp1 = random [6, 10, 12];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [25, 50, 75]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
		_rndOp1 = random [6, 10, 12];
		_grp = createGroup east;
		systemchat format ["op defence: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [50, 75, 90]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
	};
	// case 6: {
	// 	for "_i" from 1 to 3 do {
	// 		_pos = [RGG_patrol_obj, 0, 75] call BIS_fnc_findSafePos; 
	// 		_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
	// 		_static = "O_HMG_01_high_F" createVehicle _pos;
	// 		_unit moveInGunner _static; 
	// 		_unit setBehaviour "COMBAT";
	// 		spawnedOpforUnit = spawnedOpforUnit + 1;
	// 		systemChat "spawning static opfor";
	// 		sleep 1;						
	// 	};
	// 		for "_i" from 1 to 3 do {
	// 		_pos = [RGG_patrol_obj, 0, 150] call BIS_fnc_findSafePos; 
	// 		_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
	// 		_static = "O_G_Mortar_01_F" createVehicle _pos;
	// 		_unit moveInGunner _static; 
	// 		_unit setBehaviour "COMBAT";
	// 		spawnedOpforUnit = spawnedOpforUnit + 1;
	// 		systemChat "spawning mortar opfor";
	// 		sleep 1;						
	// 	};
	// };
	default {
		_randomStatic = selectRandom [0,1,2,3,4];
		_randomMortar = selectRandom [0,1,2,3,4];

		for "_i" from 1 to _randomStatic do {
			_pos = [RGG_patrol_obj, 0, 75] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_HMG_01_high_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
			for "_i" from 1 to _randomMortar do {
			_pos = [RGG_patrol_obj, 0, 150] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_G_Mortar_01_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning mortar opfor";
			sleep 1;						
		};
		_rndOp1 = random [2, 8, 20];
		_grp = createGroup east;
		systemchat format ["op defencee: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [5, 25, 50]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
		_rndOp1 = random [2, 8, 20];
		_grp = createGroup east;
		systemchat format ["op defencee: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [25, 50, 75]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
		_rndOp1 = random [2, 8, 20];
		_grp = createGroup east;
		systemchat format ["op defencee: %1", _rndOp1];
		for "_i" from 1 to _rndOp1 do {
			_rndtype = selectRandom _opforClass;
			_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
			_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
			_randomDir = selectRandom [270, 290, 01, 30, 90];
			_randomDist = random [50, 75, 90]; 
			_endPoint = RGG_patrol_obj getPos [_randomDist, _randomDir];
			_unit setBehaviour "COMBAT";
			_unit doMove _endPoint;
			spawnedOpforUnit = spawnedOpforUnit +1;
			sleep 1;									
		};
	};
};

// systemChat "op defenders spawn complete .....................";

sleep 20; // changes from 5 to 20, in case this was the reasons for the logic glitching out 

// HERE WE CHECK IF BLUFOR NEED RF 
// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
// systemchat "debug --- checking for blufor RF";
// "MP debug --- checking for blufor RF" remoteExec ["systemChat", 0, true];
// this is one of two points where patrol reinforcements are considered - previously this was every 90 seconds, now it is more lean and cheap

// redirects any indifor units incorrectly sent to the old point as part of an RF action 
execVM "autoPatrolSystem\insuranceSystems\phase3Timer.sqf";

RFCHECK = true; 

while {RFCHECK} do {
	// systemChat "___RFCHECK phase 3 cycle___";
	// confirms side numbers on the red zone 
	// _opforCount = 0;
	// _indiCount = 0;
	// _units = allUnits inAreaArray "Objective 1";
	// _unitCount1 = count _units;
	// {
	// 	switch ((side _x)) do
	// 	{
	// 		case EAST: {_opforCount = _opforCount + 1};
	// 		case INDEPENDENT: {_indiCount = _indiCount + 1};
	// 	};
	// } forEach _units;
	// hint format ["debug --- OPFOR DEFENDERS = %1", _opforCount1];
	if ((RGG_redzoneEast <= 3) && (RGG_redzoneIndi >=3)) then { 
		// this is the decider-value as to whether the second round of enemy moves in
		// systemChat "Debug - Initial defenders neutralised, prepare for OPFOR RF .. !!!";
		// "MP debug - Initial defenders neutralised, prepare for OPFOR RF .. !!!" remoteExec ["systemChat", 0, true];	
		sleep 1;
		execVM "autoPatrolSystem\phase4_createOpforRF.sqf";
		"Independent Forces Have Taken The Patrol Point" remoteExec ["hint", 0, true];
		"Independent Forces Have Taken The Patrol Point" remoteExec ["systemChat", 0, true];
		"Opfor may try to retake this point - check the map" remoteExec ["systemChat", 0, true];
		RFCHECK = false;
	};
	systemChat "debug - 90 second RFcheck cycle";
	sleep 90;
};

// at what stage should these initial defenders retreat?