/*
This creates a group of opfor defenders who will head to the patrol obj and await the blufor patrol as they head in to take the point 
Then this triggers bluforRF script - this runs a check to see if RF should be called in 
Then runs an RFCHECK loop to assess if the patrol has taken the point 
If opfor is 3 or less in the red zone, it is considered taken and the mission progresses 
As this is all about the 'attack', and considering that sometimes you can have a deadzone if the blufor attackers do not spot hidden opfor defenders ..
a solution is needed to ensure that blufor essentially search and destroy in and around the objective 
I need to write a function or script that does an 'Insurance Move' for all blufor in the area but only while RFCHECK is true 
I tried this before and failed - find out why it failed!
When defenders are wiped out, next phase is called 
*/

// systemChat "op defenders being created - check performance ..................";

/*
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

_rndOp1 = selectRandom [8, 10, 12, 24];
_grp = createGroup east;

for "_i" from 1 to _rndOp1 do {
	_rndtype = selectRandom [
		"o_g_soldier_ar_f", 
		"o_g_soldier_gl_f", 
		"o_g_sharpshooter_f", 
		"o_soldieru_lat_f"
		];
	_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
	_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
	
	_randomDir = selectRandom [270, 290, 01, 30, 90];
	_endPoint = RGG_patrol_obj getPos [25, _randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint;
	spawnedOpforUnit = spawnedOpforUnit +1;
 	sleep 1;									
	// systemChat "debug --- opfor dug in defender unit created"; 	
	// "MP debug --- opfor dug in defender unit created" remoteExec ["systemChat", 0, true];		
};

systemChat "now creating statics";

// number of statics is linked initially to the number of points taken 
// after they have reached max diff, the statics are totally randomised 
// i.e. current iteration of killchain is an increasing diff model, until a point, then it is randomised 
switch (patrolPointsTaken) do {
	case 0: {
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
	};
	case 1: {
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
	};
	case 2: {
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
	};
	case 3: {
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
	};
	case 4: {
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
	};
	case 5: {
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
	};
	case 6: {
		for "_i" from 1 to 3 do {
			_pos = [RGG_patrol_obj, 0, 75] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_HMG_01_high_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning static opfor";
			sleep 1;						
		};
			for "_i" from 1 to 3 do {
			_pos = [RGG_patrol_obj, 0, 150] call BIS_fnc_findSafePos; 
			_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
			_static = "O_G_Mortar_01_F" createVehicle _pos;
			_unit moveInGunner _static; 
			_unit setBehaviour "COMBAT";
			spawnedOpforUnit = spawnedOpforUnit + 1;
			systemChat "spawning mortar opfor";
			sleep 1;						
		};
	};
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

	};
};

// systemChat "op defenders spawn complete .....................";

sleep 20; // changes from 5 to 20, in case this was the reasons for the logic glitching out 

// HERE WE CHECK IF BLUFOR NEED RF 
// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
// systemchat "debug --- checking for blufor RF";
// "MP debug --- checking for blufor RF" remoteExec ["systemChat", 0, true];
// this is one of two points where patrol reinforcements are considered - previously this was every 90 seconds, now it is more lean and cheap

// redirects any units incorrectly sent to the old point as part of an RF action 
execVM "autoPatrolSystem\insuranceSystems\phase3Timer.sqf";
// the above only applies to indifor units

RFCHECK = true; 

// there is a check, below, but there are other similar checks being done elsewhere - can we just do one check, and globalise the var, and just use that?

while {RFCHECK} do {

	// do this once and access a global!!! MAY 2020

	// systemChat "___RFCHECK phase 3 cycle___";
	// confirms side numbers on the red zone 
	_opforCount = 0;
	_indiCount = 0;
	_units = allUnits inAreaArray "Objective 1";
	_unitCount1 = count _units;
	{
		switch ((side _x)) do
		{
			case EAST: {_opforCount = _opforCount + 1};
			case INDEPENDENT: {_indiCount = _indiCount + 1};
		};
	} forEach _units;
	// hint format ["debug --- OPFOR DEFENDERS = %1", _opforCount1];

	if ((_opforCount) <= 3) then // this is the decider-value as to whether the second round of enemy moves in
	{
		// systemChat "Debug - Initial defenders neutralised, prepare for OPFOR RF .. !!!";
		// "MP debug - Initial defenders neutralised, prepare for OPFOR RF .. !!!" remoteExec ["systemChat", 0, true];	
		RFCHECK = false;
		sleep 1;
		execVM "autoPatrolSystem\phase4_createOpforRF.sqf";
		hint "debug - opfor count is now < 3";
		sleep 2;
		// systemchat "debug --- phase4_createOpforRF ACTIVATED";
		// "MP debug --- phase4_createOpforRF ACTIVATED" remoteExec ["systemChat", 0, true];

	} else {
		// systemChat "Patrol Point has not yet been cleared";
		// "MP Patrol Point has not yet been cleared" remoteExec ["systemChat", 0, true];	
		// placeholder for something else..?
	};

	systemChat "debug - 90 second RFcheck cycle";
	sleep 90;
};

// at what stage should these initial defenders retreat?