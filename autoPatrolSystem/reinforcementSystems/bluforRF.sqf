/*
This runs a check to see if blufor RF should be created and sent into the AO 
It adds a RF score, so we can track how many RFs have been called in during the session 
*/

// _bluCount = west countSide allUnits;
// this is 18 to incorporate playable units and perma-base defences 


	// hint str _blufor;

/*
afaik this is not being used!
*/

sleep 20;

while {true} do {

	// _obj = getMarkerPos "Objective 1";
	// _base = getMarkerPos "permaBase";
	// _distance = _obj distance _base;
	_bluCount = west countSide allUnits;
	// systemChat format ["TOTAL BLUFOR UNITS: %1", _bluCount];
	// systemChat format ["DISTANCE BETWEEN BASE AND POINT: %1", _distance];



	// what are the distances we would trigger change in RF?
	// 1KM = be worried when redZone = 10
	// 2KM = be worried when redZone = 12
	// 3KM = be worried when redZone = 14

	if ((_bluCount) < 10)  then {
		_blufor = [];
		{if ((side _x) == west) then {_blufor pushBack _x}} forEach allUnits;

		hint "REINFORCEMENTS ARE INBOUND";
		systemchat "debug --- friendly units created";
		"MP debug --- friendly units created" remoteExec ["systemChat", 0, true];
		reinforcementsCalled = reinforcementsCalled + 1;
		// [RGG_initStartPos] execVM "autoPatrolSystem\createFriendlyUnits.sqf";
		[RGG_missionOrigin] execVM "autoPatrolSystem\createFriendlyUnits.sqf";
	};

	sleep 60;
};



/*
Note, it is possible that a new platoon will be created and sent to the right place, but then the mission obj will change after the order is given 
So, a system is needed to ensure that if RF have been generated, that they always move in to the correct obj 
So, I guess when a new obj is created, it is important to drawn in all blufor to this new obj 
But, I want to ensure that I do not always draw down playable units from the perma-base - so I need to either exclude them from any calcs, or ensure the area i use is not overlapping the parmabase area 
And there are no auto-move orders that will cater for this issue 
So, this needs a solution. 
I think I had a solution before which was to check if there were any units in green, and then move them - this works but does not address the fact that a platoon could be walking a long way in the 
wrong direction before landing in green and then being redirected. 
So it makes sense to trigger a check after RF is called, to periodically check that their move orders reflect the correct obj 
My options are to use another inAreaArray system, or assignVar possibly 

I could True a bool on RF call, and false the bool when blufor is >10 in obj area perhaps?