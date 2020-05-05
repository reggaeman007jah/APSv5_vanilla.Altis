/*
This creates small opfor group at patrol obj and sends them to patrol origin, to engage the patrol as they move in - this is the first wave 
These opfor units will head to the patrol origin .. there is a chance they will not engage with the blufor units heading in 
Consider sending them back to patrol dest if this happens (surprise attack)
Also consider ramping diff here somehow 
*/

/*
CSAT 
"O_soldierU_A_F",
"O_soldierU_AAR_F",
"O_soldierU_AAT_F",
"O_soldierU_AR_F",
"O_soldierU_medic_F",
"O_engineer_U_F",
"O_soldierU_exp_F",
"O_SoldierU_GL_F",
"O_Urban_HeavyGunner_F",
"O_soldierU_M_F",
"O_soldierU_AT_F",
"O_soldierU_repair_F",
"O_soldierU_F",
"O_soldierU_LAT_F",
"O_Urban_Sharpshooter_F",
"O_SoldierU_SL_F",
"O_soldierU_TL_F"

FIA
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
*/

// mission status info 
MISSIONTASK = "Move into the patrol point and destroy any opfor defenders";
publicVariable "MISSIONTASK";

sleep 2;

_diffLevel = 2; // diff modifier 

for "_i" from 1 to _diffLevel do {
	_grp = createGroup east;
	_rndOp1 = selectRandom [8, 10, 12, 14];

	for "_i" from 1 to _rndOp1 do {
		_rndtype = selectRandom [
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
		_pos = [RGG_patrol_obj, 0, 30] call BIS_fnc_findSafePos; // was 30, now 80, now 150 hopefully for better dispertion // now back to 30
		_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
		_unit setBehaviour "COMBAT";
		_unit doMove RGG_missionOrigin; 
		spawnedOpforUnit = spawnedOpforUnit + 1;
		sleep 1;						
	};
};

sleep 1;

execVM "autoPatrolSystem\phase3_createOpforDefenders.sqf";

















// :) delete after use below 

// _spawnPos = _this select 0; // position parsed to this script on execution
// // _numberOfCycles = _this select 1; // number of times we run this // 4 = 4 fire teams  
// _numberOfCycles = 4; // temp test  
// _area = 60; // distribution of units on spawn  // I am making this much smaller 
// _timer = 0.3; // spawn cycle gap  

// /*
// Each spawned team has:
// 1 rifleman
// 1 machine gunner 
// 1 grenadier 
// 1 medic 
// 1 marksman
// */

// for "_i" from 1 to _numberOfCycles do {
// 	_indiGroup = createGroup independent;
// 	_pos = [_spawnPos, 20, _area] call BIS_fnc_findSafePos;
// 	// _pos1 = _pos getPos [1,180];
// 	// _pos2 = _pos getPos [2,180];
// 	// _pos3 = _pos getPos [3,180];
// 	// _pos4 = _pos getPos [4,180];
// 	// _pos5 = _pos getPos [5,180];
// 	_fireTeam = [];
// 	_unit1 = _indiGroup createUnit ["I_soldier_F", _pos, [], 0.1, "none"]; 
// 	_unit2 = _indiGroup createUnit ["I_support_MG_F", _pos, [], 0.1, "none"]; 
// 	_unit3 = _indiGroup createUnit ["I_Soldier_GL_F", _pos, [], 0.1, "none"]; 
// 	_unit4 = _indiGroup createUnit ["I_Soldier_M_F", _pos, [], 0.1, "none"]; 
// 	_unit5 = _indiGroup createUnit ["I_medic_F", _pos, [], 0.1, "none"]; 
// 	_fireTeam pushBack _unit1;
// 	_fireTeam pushBack _unit2;
// 	_fireTeam pushBack _unit3;
// 	_fireTeam pushBack _unit4;
// 	_fireTeam pushBack _unit5;
// 	systemChat "opfor group data:";
// 	systemChat str _fireTeam;

// 	sleep _timer;
// 	// move orders 
// 	_randomDir = selectRandom [270, 310, 00, 50, 90];
// 	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
// 	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
// 	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
// 	// _unit setBehaviour "COMBAT";
// 	// _fireTeam setBehaviour "COMBAT";
// 	// _unit doMove _endPoint1;
// 	_fireTeam doMove _endPoint1;
	
// 	spawnedIndiUnit = spawnedIndiUnit +5;
// };










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