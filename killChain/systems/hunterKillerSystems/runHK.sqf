/*
Runs HK system for a fire team dropped into the AO 

Takes name of hunting group the only param 
*/

_hunterGroup = _this select 0;
systemChat format ["running runHK, received: %1", _hunterGroup];

// confirm position of hunter leader 
_groupLeader = leader _hunterGroup;
_hunterPos = getPos _groupLeader;


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


TEST_opforGroups = []; // empty array to store opfor group IDs / names 
TEST_groups = allGroups; // gets all known game groups 
_numberOfGroups = count TEST_groups; // counts all known game groups 
systemChat format ["there are %1 groups in the game", _numberOfGroups]; // info 

// now extract only opfor groups and put into storage array 
{
	switch ((side _x)) do
	{
		case EAST: {TEST_opforGroups pushBack _x};
		case WEST: {};
	};
} forEach TEST_groups;
systemChat format ["opfor groups in redzone: %1", TEST_opforGroups]; // debug lists all opfor groups 

RGG_distanceStore = []; // storage to manage distance data 


// process each opfor group 
{
	_leader = leader _x; // get group leader 
	_leaderPos = getPos _leader; 
	_dist = _leaderPos distance _hunterPos; // get distance between hunter and hunted 
	systemChat format ["opfor group distance: %1", _dist]; // debug info 
	RGG_distanceStore pushBack _dist;
} forEach TEST_opforGroups;
// debug text 
// systemChat format ["RGG_distanceStore: %1", RGG_distanceStore]; // debug lists all opfor groups 
// // debug sleep 
// sleep 4;

// now to try to only keep the closest one 
// _cnt = count RGG_distanceStore;

_min = selectMin RGG_distanceStore; // this gives us the minimum value, but not the array position 
systemChat format ["_min = selectMin RGG_distanceStore: %1", _min]; // debug lists all opfor groups 
// debug sleep 
// sleep 4;

{
	systemChat "cycle";
	_leader = leader _x; // get group leader 
	_leaderPos = getPos _leader; 
	_dist = _leaderPos distance _hunterPos; // get distance between hunter and hunted 
	if (_dist == _min) then {
		systemChat format ["winning group and distance is: %1 %2", _x, _dist]; // debug lists all opfor groups 
		_stalking = [_hunterGroup, _x] spawn BIS_fnc_stalk;
		systemChat format ["stalking group: %1 %2 away", _x, _dist]; // debug lists all opfor groups 
		RGG_distanceStore = [];
		TEST_opforGroups = [];
	};
} forEach TEST_opforGroups;



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



