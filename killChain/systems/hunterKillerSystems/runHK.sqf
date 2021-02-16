/*
Runs HK system for a fire team dropped into the AO 

Takes name of hunting group the only param 
*/

// _hunterGroup = _this select 0;
// systemChat format ["running runHK, received: %1", _hunterGroup];

// // confirm position of hunter leader 
// _groupLeader = leader _hunterGroup;
// _hunterPos = getPos _groupLeader;


// find nearest enemy to populate the function 
// get group name of that nearest enemy 

// _hunted = objnull;
// _distance = 1000000;
// _hostiles = allUnits select {side _x == east};
// {
//  if (_hunter distance _x < _distance) then {
//   _hunted =_x;
//   _distance = _hunter distance _x;
// };
// } forEach _hostiles;
// _hunted;

// _opforCount1 = 0;
// _blueforCount1 = 0;
// _units = allUnits inAreaArray "Objective 1";
// _unitCount1 = count _units;
// {
// 	switch ((side _x)) do
// 	{
// 		case EAST: {_opforCount1 = _opforCount1 + 1};
// 		case WEST: {_blueforCount1 = _blueforCount1 + 1};
// 	};
// } forEach allGroups;


// TEST_opforGroups = []; // empty array to store opfor group IDs / names 
// TEST_groups = allGroups; // gets all known game groups 
// _numberOfGroups = count TEST_groups; // counts all known game groups 
// systemChat format ["there are %1 groups in the game", _numberOfGroups]; // info 

// // now extract only opfor groups and put into storage array 
// {
// 	switch ((side _x)) do
// 	{
// 		case EAST: {TEST_opforGroups pushBack _x};
// 		case WEST: {};
// 	};
// } forEach TEST_groups;
// systemChat format ["opfor groups in redzone: %1", TEST_opforGroups]; // debug lists all opfor groups 

// RGG_distanceStore = []; // storage to manage distance data 


// process each opfor group 
// {
// 	_leader = leader _x; // get group leader 
// 	_leaderPos = getPos _leader; 
// 	_dist = _leaderPos distance _hunterPos; // get distance between hunter and hunted 
// 	systemChat format ["opfor group distance: %1", _dist]; // debug info 
// 	RGG_distanceStore pushBack _dist;
// } forEach TEST_opforGroups;
// debug text 
// systemChat format ["RGG_distanceStore: %1", RGG_distanceStore]; // debug lists all opfor groups 
// // debug sleep 
// sleep 4;

// now to try to only keep the closest one 
// _cnt = count RGG_distanceStore;

// _min = selectMin RGG_distanceStore; // this gives us the minimum value, but not the array position 
// systemChat format ["_min = selectMin RGG_distanceStore: %1", _min]; // debug lists all opfor groups 
// // debug sleep 
// // sleep 4;

// {
// 	systemChat "cycle";
// 	_leader = leader _x; // get group leader 
// 	_leaderPos = getPos _leader; 
// 	_dist = _leaderPos distance _hunterPos; // get distance between hunter and hunted 
// 	if (_dist == _min) then {
// 		systemChat format ["winning group and distance is: %1 %2", _x, _dist]; // debug lists all opfor groups 
// 		_stalking = [_hunterGroup, _x] spawn BIS_fnc_stalk;
// 		systemChat format ["stalking group: %1 %2 away", _x, _dist]; // debug lists all opfor groups 
// 		RGG_distanceStore = [];
// 		TEST_opforGroups = [];
// 	};
// } forEach TEST_opforGroups;



// {
// 	if (_x == _min) then {
// 		_closest = RGG_distanceStore select _min;
// 		systemChat format ["opfor group smallest distance: %1", _closest];
// 	} else {
		
// 	};
// } forEach RGG_distanceStore;


// _closest = RGG_distanceStore select _min;
// systemChat format ["opfor group smallest distance: %1", _closest];


// _hunter = player;
// _hostiles = allUnits select {side _x == east};
// _nearestEnemy = [_hostiles , [_hunter], { _input0 distance _x }, "ASCEND", { canMove _x }] call BIS_fnc_sortBy;
// _huntedGroup = group (_nearestEnemy select 0);
// _huntedGroup

// sleep 2;
// _stalked = TEST_opforGroups select _min;
// _stalking = [_hunterGroup, _stalked] spawn BIS_fnc_stalk;

// // _arr sort true;

// // select lowest dist 
// _nearestEnemyDist = selectMin 

// _min = selectMin [1,2,3,4,5]; //1


// -----------------------------------------------------------------------------------------
systemChat "Loading HK System v2...";
_hunterGroup = _this select 0; // the group of the hunter team passed in 
systemChat format ["running runHK, received: %1", _hunterGroup];
// confirm position of hunter leader 
_groupLeader = leader _hunterGroup;
_hunterPos = getPos _groupLeader;
// -----------------------------------------------------------------------------------------

_allGroups = allGroups; // get all game groups 
_stalking = []; // this holds data related to stalking 
systemChat format ["all game groups: %1", _allGroups]; // debug lists all opfor groups 
_opforGroups = []; // to hold all opfor groups 
// _hunters = []; // to hold single hunter group 
_targetGroup = []; // will hold closest (target) group 

// collate all opfor groups
{
	switch ((side _x)) do {
		case EAST: {
			_unitCount = count units _x;
			if (_unitCount > 0) then {
				_opforGroups pushBack _x;
				systemChat format ["SWITCH OPFOR: %1", _x];
				systemChat format ["Groupsize: %1", _unitCount];
			} else {
				deleteGroup _x;
			};
		};
	};
} forEach _allGroups;

// simple debug message 
systemChat format ["opfor groups: %1", _opforGroups]; // debug lists all opfor groups 
systemChat ".....";
systemChat format ["hunter group: %1", _hunterGroup]; // debug lists hunter group 

// -----------------------------------------------------------------------------------------

// get hunter group and leader - do once 
// _hunter = _hunterGroup select 0; 
_hunterLeader = leader _hunterGroup; 
_hunterLeaderPos = getPos _hunterLeader;

// -----------------------------------------------------------------------------------------

// now find nearest group 
_enemyGroupDistances = [3000]; // limiter distance value 
_cnt = count _opforGroups;
_cycle = 1;
// systemChat format ["There are %1 opfor groups", _cnt]; // debug info 

// catch situation where no enemy - TBD
if (_cnt == 0) exitwith {}; 

// process all known opfor groups to grab the one nearest to hunter group
{
	_leader = leader _x; // get group leader 
	_leaderPos = getPos _leader; // get pos of leader 
	_dist = _leaderPos distance _hunterLeaderPos; // get distance between hunter and hunted 
	systemChat format ["Iteration %1", _cycle]; // debug info - iteraration
	systemChat format ["opfor group %1 distance: %2", _x, _dist]; // debug info 
	_enemyGroupDistances pushBack _dist;
	_cnt = count _enemyGroupDistances;
	systemChat format ["_enemyGroupDistances array count is: %1", _cnt]; // debug info 
	// -----------------------
	_pos0 = _enemyGroupDistances select 0;
	_pos1 = _enemyGroupDistances select 1;
	systemChat format ["_pos0: %1", _pos0]; // debug info 
	systemChat format ["_pos1: %1", _pos1]; // debug info 
	// -----------------------
	if (_pos1 < _pos0) then {
		_enemyGroupDistances deleteAt 0;
		_targetGroup deleteAt 0;
		_targetGroup pushBack _x;
		systemChat format ["_pos1 %1 is less than _pos0 %2", _pos1, _pos0]; // debug info 
	} else {
		systemChat format ["_pos1 %1 is greater than or equal to _pos0 %2", _pos1, _pos0]; // debug info 
		systemChat "too far away";
		_enemyGroupDistances deleteAt 1;
	};
	// sleep 3;
	systemChat format ["_targetGroup is currently %1", _targetGroup]; // debug info
	systemChat "cycling";
	_cycle = _cycle + 1;
	sleep 1;
} forEach _opforGroups;

// -----------------------------------------------------------------------------------------

// get markers for targets - DEBUG ONLY
{
	_leader = leader _x; // get group leader 
	_leaderPos = getPos _leader; // get pos of leader 
	_name = str _x;
	deleteMarker _name;
	_marker = createMarker [_name, _leaderPos];
	_name setMarkerShape "rectangle";
	_name setMarkerSize [5,5];
	_name setMarkerColor "colorred";
	_name setMarkerText _name;
} forEach _opforGroups;

systemChat format ["target group is %1, and is %2 m away", _targetGroup, _enemyGroupDistances]; // debug info 
systemChat format ["hunter group is %1", _hunterGroup]; // debug info 

// -----------------------------------------------------------------------------------------
_target = _targetGroup select 0;
_targetDist = _enemyGroupDistances select 0;
_unitCount = count units _target;
_leader = leader _target; // get group leader 
_leaderPos = getPos _leader; // get pos of leader 

_hkUnitCount = count units _hunterGroup;

if (_unitCount >= 1) then {
	systemChat format ["calling HK order on group %1, %2 away, size: %3", _target, _targetDist, _unitCount]; // debug info 
	_hunterGroup move _leaderPos;
} else {
	systemChat "error - found empty group - deleting empty group - retrying";
	deleteGroup _target;
	sleep 10;
	if (_hkUnitCount > 0) then {
		[_hunterGroup] execVM "hkSystemv2\runHK.sqf"; 
	};
};

_HKACTIVE = true;

while {_HKACTIVE} do {
	_target = _targetGroup select 0;
	_targetDist = _enemyGroupDistances select 0;
	_unitCount = count units _target;
	_leader = leader _target; // get group leader 
	_leaderPos = getPos _leader; // get pos of leader 

	if (_unitCount == 0) then {
		deleteGroup _target;
		hint "SUCCCESS ALL DEAD";
		_HKACTIVE = false;
		// [] execVM "hkSystemv2\runHK.sqf";
		[_hunterGroup] execVM "killChain\systems\hunterKillerSystems\runHK.sqf";
	} else {
		_hunterGroup move _leaderPos;
	};

	if (_hkUnitCount > 0) then {
		_HKACTIVE = false;
	};

	sleep 30;
	systemChat format ["HKACTIVE CHECK - Group: %1", _hunterGroup];
};







