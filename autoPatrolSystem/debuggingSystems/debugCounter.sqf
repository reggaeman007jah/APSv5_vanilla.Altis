
while {true} do {

	sleep 28;

	// mission time
	_missionDuration = time;
	_roundedMission2 = _missionDuration / 60;
	_roundedMission3 = floor _roundedMission2;

	// global side count 
	RGG_totalIndi = independent countSide allUnits;
	RGG_totalWest = west countSide allUnits;
	RGG_totalEast = east countSide allUnits;
	
	// placeholder
	_TEST1 = "";

	// redzone count
	RGG_redzoneEast = 0;
	RGG_redzoneWest = 0;
	RGG_redzoneIndi = 0;
	_units = allUnits inAreaArray "Objective 1";
	_totalUnits = count _units;
	
	{
		switch ((side _x)) do
		{
			case EAST: {RGG_redzoneIndi = RGG_redzoneEast + 1};
			case WEST: {RGG_redzoneWest = RGG_redzoneWest + 1};
			case INDEPENDENT: {RGG_redzoneIndi = RGG_redzoneIndi + 1};
		};
	} forEach _units;
	_totalRedzone = RGG_redzoneEast + RGG_redzoneWest + RGG_redzoneIndi;
	_totalUnits = count allUnits;

	// count blacklist items 
	_blackListItems = count RGG_patrolPositionBlacklist; // EVENTUALLY TRIM THIS TO BE ONLY 5 OR 6 

	// list groups 
	_opforGroups = allGroups select {side _x isEqualTo east};
	_indiforGroups = allGroups select {side _x isEqualTo independent};
	// _bluforGroupCount = allGroups select {side _x isEqualTo west};

	// count groups 
	_opforGroupCount = count _opforGroups;
	_indiforGroupCount = count _indiforGroups;

	// _indiKilled = spawnedIndiUnit - RGG_totalIndi;

	/*
	RGG_totalOpforGroups = [];
	RGGRGG_totalIndiforGroups = [];
	*/

	// count total groups spawned in since mission start 
	testOpforPBU = RGG_totalOpforGroups pushBackUnique _opforGroups;
	testIndiforPBU = RGG_totalIndiforGroups pushBackUnique _indiforGroups;
	countTotalOpforGroups = count RGG_totalOpforGroups;
	countTotalIndiforGroups = count RGG_totalIndiforGroups;

	// _averagePatrolTime = _roundedMission3 / patrolPointsTaken;

	// systemChat ".....................................................................................................";
	// systemChat "................. MISSION PHASE:";
	// systemChat format ["................. STATUS: %1", @@@]; 
	systemChat "................. MISSION STATUS";
	systemChat format ["................. TASK: %1", MISSIONTASK]; 
	systemChat "................. ";
	systemChat "................. REDZONE UNITS";
	systemChat format ["................. TOTAL: %1", _totalRedzone]; 
	systemChat format ["................. WEST: %1 / EAST: %2 / INDI: %3", RGG_redzoneWest, RGG_redzoneEast, RGG_redzoneIndi]; 
	systemChat "................. ";
	systemChat "................. GLOBAL UNITS";
	systemChat format ["................. TOTAL: %1", _totalUnits]; 
	systemChat format ["................. WEST: %1 / EAST: %2 / INDI: %3", RGG_totalWest, RGG_totalEast, RGG_totalIndi]; 
	systemChat "................. ";
	// systemChat format ["................. REDZONE BLUFOR %1", RGG_redzoneWest]; 
	// systemChat format ["................. REDZONE OPFOR %1", RGG_redzoneEast]; 
	systemChat "................. STATS";
	systemChat format ["................. MISSION DURATION (MINS): %1", _roundedMission3]; 
	systemChat format ["................. POINTS TAKEN: %1", patrolPointsTaken]; 
	systemChat format ["................. REINFORCEMENT PATROLS CALLED: %1", reinforcementsCalled]; 
	systemChat format ["................. BLACKLIST ITEMS: %1", _blackListItems]; 
	// systemChat format ["................. OVERALL PATROL DISTANCE: %1", _TEST1]; 
	// systemChat format ["................. AVERAGE TIME TO TAKE EACH PATROL POINT: %1", _TEST1]; 
	// systemChat format ["................. OPFOR KILLED: %1", _TEST1]; 
	// systemChat format ["................. INDIFOR KILLED: %1", _TEST1]; 	
	systemChat format ["................. TOTAL OPFOR SPAWNED: %1", spawnedOpforUnit]; 	
	systemChat format ["................. CURRENT OPFOR GROUPS: %1", _opforGroupCount]; 	
	// systemChat format ["................. TOTAL OPFOR GROUPS CREATED: %1", countTotalOpforGroups]; 	
	systemChat "................. ";
	systemChat format ["................. TOTAL INDIFOR SPAWNED: %1", spawnedIndiUnit]; 	
	systemChat format ["................. CURRENT INDIFOR GROUPS: %1", _indiforGroupCount]; 	
	// systemChat format ["................. TOTAL INDIFOR GROUPS CREATED: %1", countTotalIndiforGroups]; 	
	// systemChat format ["................. PATROLS LOST: %1", LOSTPATROLS]; 
	systemChat ".............................................................................................................................";

	if ((RGG_totalIndi <10) && (RGG_redzoneIndi <10)) then {
		// hint "RF called in now from initServer";
		// systemChat "............ CALLING IN RF NOW ....................";
		// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
		sleep 2;
		"INDI REINFORCEMENTS ARE INBOUND" remoteExec ["hint", 0, true];	
		_smoke = createVehicle ["G_40mm_smokeYELLOW", RGG_missionOrigin, [], 0, "none"]; // drop this from up high 


		// systemchat "debug --- friendly units created";
		// "MP debug --- friendly units created" remoteExec ["systemChat", 0, true];
		reinforcementsCalled = reinforcementsCalled + 1;
		[RGG_missionOrigin] execVM "autoPatrolSystem\spawnerSystems\createFriendlyUnits.sqf";
		sleep 10;
	};

	// MP Stats Test using pubVars 
	// publicVariable "RGG_totalOpforGroups";
	/*
	// Manages total count of groups created 
		RGG_totalOpforGroups = [];
		RGGRGG_totalIndiforGroups = [];
		publicVariable "RGG_totalOpforGroups";
		publicVariable "RGGRGG_totalIndiforGroups";
	// base-counter var for tracking how many missions have been completed 
		patrolPointsTaken = 0;
		publicVariable "patrolPointsTaken";
	// base-counter var for tracking how many times RF have been called in 
		reinforcementsCalled = 0;
		publicVariable "reinforcementsCalled";
	// mission status 
	// there are a few different stages of the mission, these states will track the current task 
		MISSIONTASK = "Setting up initial patrol";
		publicVariable "MISSIONTASK";
	// track created units  
		spawnedIndiUnit = 0;
		spawnedOpforUnit = 0;
		publicVariable "spawnedIndiUnit";
		publicVariable "spawnedOpforUnit";

		_time = selectRandom [45, 60, 120];
		format ["All friendly units are KIA. Next available unit in: %1 seconds!", _time] remoteExec ["hint", 0];

	*/


	"MISSION STATUS" remoteExec ["systemChat", 0, true];	
	format ["................. TASK: %1", MISSIONTASK] remoteExec ["systemChat", 0];

};
