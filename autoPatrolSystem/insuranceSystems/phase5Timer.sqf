/*
April 2020 - untested
This system does two things - first it tries (twice) to push opfor openly towards the objective, thereby 
preventing stalemate situations (prone v prone) 
But it also ensures that if the above system does not work, the patrol will only wait 10 minutes at a point 
before moving onto the next point.

I have introduced a bool called LOSTPATROL - if this is true it indicates that a patrol has been lost, and then 
effectively pauses the auto-progression-timer. 
This was needed as without it, RF would be sent to a position, then the actual obj would move on, resulting in 
RF waiting at the old obj (green marker).

*/

sleep 180;

for "_i" from 1 to 5 do {
	
	sleep 300;

	if (!SAPPERS) then {
		// systemChat "insurance move";
		hint "DEBUG - OPFOR INSURANCE MOVE";

		// this next bit is to ensure opfor dont get stuck somewhere and delay mission progression 
		// it used to be in a loop, now it only runs x times 

		_opfor = [];
		{if ((side _x) == east) then {_opfor pushBack _x}} forEach allUnits;

		{
			_Dir = random 360;
			_Dist = selectRandom [1, 5, 10]; 
			_moveTo = RGG_patrol_obj getPos [_Dist,_Dir]; 
			_x setBehaviour "COMBAT";
			_x doMove _moveTo;
			// systemChat "OPFOR insurance move orders";
			sleep 1;
		} forEach _opfor;	
	};

};

/*

if (monitorDefence) then {

	if (!LOSTPATROL) then {
		// essentially this means that this next bit will only happen - the auto-progression - if the patrol has 'not' been lost 
		// if the patrol 'has' been lost, and RF are inbound, then we pause this timer system

		// important - add a check here to ensure that things dont progress if opfor is above a reasonable amount 

		hint "INSURANCE PROGRESSION - we've been here long enough, let's move out";
		systemChat "Debug - we've been here long enough, let's move out .. !!!";
		"MP debug - we've been here long enough, let's move out .. !!!" remoteExec ["systemChat", 0, true];	

		monitorDefence = false;
		patrolPointsTaken = patrolPointsTaken + 1;

		// consolidate injured?
		// [RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";
		// systemchat "debug --- phase1_createObj ACTIVATED";
		// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];
		// [RGG_patrol_obj, ] execVM "";

		[RGG_patrol_obj, RGG_patrol_obj] execVM "autoPatrolSystem\phase1_createObj.sqf";
		systemchat "debug --- phase1_createObj ACTIVATED - NOTE ... FROM INSURANCE POLICY";
		"MP debug --- phase1_createObj ACTIVATED - NOTE FROM INSURANCE POLICY" remoteExec ["systemChat", 0, true];

		sleep 10; 
		hint "patrol is moving out";

		_indi = [];
		{if ((side _x) == INDEPENDENT) then {_indi pushBack _x}} forEach allUnits inAreaArray "Battlearea";

		// _units = allUnits inAreaArray "BattleArea";
		{
			_randomDir = selectRandom [270, 310, 00, 50, 90];
			_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
			_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
			_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
			SLEEP 2;
			_x setBehaviour "COMBAT";
			_x doMove _endPoint1;
		} forEach _indi;

	} else {
		// i.e. LOSTPATROL == true 
		_units1 = allUnits inAreaArray "Objective 1"; // just trying this change out... april 2020
		_unitCount = count _units1;

		// _opfor = (side _x == opfor) inAreaArray "BattleArea";
		// hint str _opfor;
				
		_opforCount = 0;
		_blueforCount = 0;
		{
			switch ((side _x)) do
			{
				case EAST: {_opforCount = _opforCount + 1};
				case WEST: {_blueforCount = _blueforCount + 1};
			};
		} forEach _units1;

		if (_blueforCount > 10) then {
			LOSTPATROL = false;
		};

		// from start of V4 I have not considered this else block .. is this a problem?
	};

};


