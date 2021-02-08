/*
This system will cycle on an always loop, showing locations of indifor group leaders 
It may one day show number in team, ammo, health etc .. for now though, just makers 
*/
sleep 20;
systemChat "MARKER SYSTEM RUNNING";

while {true} do {

	_groups = allGroups; // gets all known game groups 
	RGG_indiforGroups = []; // empty array to store opfor group IDs / names 
	RGG_bluforGroups = []; // empty array to store opfor group IDs / names 

	// now extract only indifor groups and put into storage array 
	{
		switch ((side _x)) do {
			case independent: {RGG_indiforGroups pushBackUnique _x};
			case WEST: { RGG_bluforGroups pushBackUnique _x };
		};
	} forEach _groups;

	_indiGroups = count RGG_indiforGroups;

	systemChat format ["There are %1 known indifor Groups right now", _indiGroups];

	{
		_size = count units _x; 
		if (_size >0) then {
			_leader = leader _x;
			_leaderPos = getPos _leader;
			_stampToString = str _x;
			deleteMarker _stampToString;
			_tempMarker = createMarker [_stampToString, _leaderPos];
			_tempMarker setMarkerType "n_inf";
			// sleep 5;
			systemChat "indifor marker updated";
		} else {
			// delete group - to do 
			_stampToString = str _x;
			deleteMarker _stampToString;
			deleteGroup _x;
			systemChat "indifor MARKER DELETED";
			systemChat format ["Indifor Group Deleted: %1", _x];
		};
	} forEach RGG_indiforGroups;

	{
		_size = count units _x; 
		if (_size >0) then {
			_leader = leader _x;
			_leaderPos = getPos _leader;
			_zPos = _leaderPos select 2;
			if (_zPos < 10) then {
				_stampToString = str _x;
			deleteMarker _stampToString;
			_tempMarker = createMarker [_stampToString, _leaderPos];
			_tempMarker setMarkerType "b_inf";
			// sleep 5;
			systemChat "blufor marker updated";
			};			
		} else {
			// delete group - to do 
			_stampToString = str _x;
			deleteMarker _stampToString;
			deleteGroup _x;
			systemChat "blufor MARKER DELETED";
			systemChat format ["Blufor Group Deleted: %1", _x];
		};
	} forEach RGG_bluforGroups;


// {
// 	_leader = leader _x; // get group leader 
// 	_leaderPos = getPos _leader; 
// 	_dist = _leaderPos distance _hunterPos; // get distance between hunter and hunted 
// 	systemChat format ["opfor group distance: %1", _dist]; // debug info 
// 	RGG_distanceStore pushBack _dist;
// } forEach TEST_opforGroups;

// _size = count units _group; 

	// systemChat format ["opfor groups in redzone: %1", TEST_opforGroups]; // debug lists all opfor groups 

	// RGG_distanceStore = []; // storage to manage distance data 

	sleep 30;
};