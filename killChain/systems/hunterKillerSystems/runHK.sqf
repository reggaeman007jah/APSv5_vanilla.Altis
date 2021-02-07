/*
Runs HK system for a fire team dropped into the AO 

Takes name of hunting group the only param 
*/

_hunterGroup = _this select 0;
systemChat format ["running runHK, received: %1", _hunterGroup];

// confirm position of huntger leader 
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


TEST_opforGroups = [];
TEST_groups = allGroups;
_numberOfGroupsInRedZone = count TEST_groups;
systemChat format ["there are %1 groups in the game", _numberOfGroupsInRedZone];
sleep 2;

{
	switch ((side _x)) do
	{
		case EAST: {TEST_opforGroups pushBack _x};
		case WEST: {};
	};
} forEach TEST_groups;
systemChat format ["opfor groups in redzone: %1", TEST_opforGroups];

// TEST_target = [1000,];
// process nearest one 
{
	_leader = leader _x;
	_dist = _leader distance _hunterPos;
	systemChat format ["opfor group distance: %1", _dist]; 

} forEach TEST_opforGroups;

sleep 2;
_stalked = TEST_opforGroups select 0;

_stalking = [_hunterGroup, _stalked] spawn BIS_fnc_stalk;

// // _arr sort true;

// // select lowest dist 
// _nearestEnemyDist = selectMin 

// _min = selectMin [1,2,3,4,5]; //1



