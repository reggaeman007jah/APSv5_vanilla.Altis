/*
This creates small opfor group at patrol obj and sends them to patrol origin, to engage the patrol as they move in - this is the first wave 
These opfor units will head to the patrol origin .. there is a chance they will not engage with the blufor units heading in 
Consider sending them back to patrol dest if this happens (surprise attack)
*/

MISSIONTASK = "Move into the patrol point and destroy any opfor defenders";
publicVariable "MISSIONTASK";

// systemChat "debug - op first wave units being created - check perf";

// diffRamping 
/*
Here we have a simple system to slowly add diff in terms of statics, based on patrol points taken 
*/

_grp = createGroup east;

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


// _grp = createGroup east;

// for "_i" from 1 to 1 do {
// 	_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
// 	_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
// 	_static = "O_HMG_01_high_F" createVehicle _pos;
// 	_unit moveInGunner _static; 
// 	_unit setBehaviour "COMBAT";
// 	spawnedOpforUnit = spawnedOpforUnit + 1;
// 	systemChat "spawning static opfor";
// 	sleep 1;						
// };

// for "_i" from 1 to 1 do {
// 	_pos = [RGG_patrol_obj, 0, 50] call BIS_fnc_findSafePos; 
// 	_unit = _grp createUnit ["o_g_soldier_ar_f", _pos, [], 1, "none"]; 
// 	_static = "O_G_Mortar_01_F" createVehicle _pos;
// 	_unit moveInGunner _static; 
// 	_unit setBehaviour "COMBAT";
// 	spawnedOpforUnit = spawnedOpforUnit + 1;
// 	systemChat "spawning mortar opfor";
// 	sleep 1;						
// };

// soldierOne moveInGunner tankOne 
// O_HMG_01_high_F

sleep 2;

_rndOp1 = selectRandom [6, 10, 14];

for "_i" from 1 to _rndOp1 do {
	_rndtype = selectRandom [
		"o_g_soldier_ar_f", 
		"o_g_soldier_gl_f", 
		"o_g_sharpshooter_f", 
		"o_soldieru_lat_f"
		// "O_G_HMG_02_high_F",
		// "O_G_Mortar_01_F",
		// "O_G_HMG_02_F"
		];
	_pos = [RGG_patrol_obj, 0, 30] call BIS_fnc_findSafePos; // was 30, now 80, now 150 hopefully for better dispertion // now back to 30
	_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
	_unit setBehaviour "COMBAT";
	_unit doMove RGG_missionOrigin; 
	spawnedOpforUnit = spawnedOpforUnit + 1;
	sleep 1;						
};

sleep 1;

execVM "autoPatrolSystem\phase3_createOpforDefenders.sqf";
