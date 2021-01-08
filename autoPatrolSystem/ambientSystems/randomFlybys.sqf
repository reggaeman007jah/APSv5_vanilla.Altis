/*
From: initSServer.sqf 
*/

/*
ambient spawner for effect only 

Improvement ideas 

decide from which / to direction 
decide how many in flight 
decide on formation (line or column or echelon or vee)
decide on spawn gap 
decide on alt#
decide on speed 
decide if mixed or one class (if mixed, what are the other downstream requirements (ie no AH6 + jets))
store pos at local so it does not crap out if the obj changes 
always have ambient flybys go relative to the next patrol obj

*/

sleep 300; // initial delay

while {true} do {
	_sleep = selectRandom [60, 90, 120, 180, 240, 300]; // determines how long between each batch of ambients 
	sleep _sleep; // random sleep between spawn batches // test if moving this line solves the pos problem 
	_number = selectRandom [1,2,3]; // determines how many ambients per spawn event 
	_type = selectRandom ["B_Plane_CAS_01_dynamicLoadout_F", "B_Heli_Transport_01_F", "B_Heli_Transport_03_F", "B_Heli_Light_01_dynamicLoadout_F"]; // 4 types, each batch is always the same type - you wont get a jet and an MH6 together 
	_startPos = RGG_patrol_obj getPos [5000, 90]; // starts east of the patrol point 
	_endPos = RGG_patrol_obj getPos [5000, 270]; // ends west of the patrol point 
	for "_i" from 1 to _number do {
		[_startPos, _endPos, 100, "FULL", _type, west] call BIS_fnc_ambientFlyby;
		sleep 15; // spacer sleep between each iteration to prevent spawn overlaps 	
	};
	
};


/*
NOTES ----------------------------------------------------------------------------------------------------------

B_Plane_CAS_01_dynamicLoadout_F
[startPos, endPos, altitude, speedMode, classname, side] call BIS_fnc_ambientFlyby;
always over RGG_patrol_obj
player getPos [100,45];

000 / 180 
180 / 000

090 / 270
270 / 090

get an origin by taking patrol point, then get pos east at 090 100m 
then get pos west 270 from patrol point 


