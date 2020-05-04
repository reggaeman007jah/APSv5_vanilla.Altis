// RFCHECK
// comments needed here 
// untested 

sleep 180; // no need to run this system straight away 

// {
// 	// systemChat "debug - BLUEDEFEND STATE - Blue Unit Counted";
// 	// "MP debug - BLUEDEFEND STATE - Blue Unit Counted" remoteExec ["systemChat", 0, true];
// 	_dir = random 360;
// 	_dist = selectRandom [14, 16, 18, 20]; 
// 	_defendPoint = RGG_patrol_obj getPos [_dist, _dir]; // moves units into a rough 360 defensive circle
// 	_x setBehaviour "COMBAT";
// 	_x doMove _defendPoint;
// 	sleep 1;
// } forEach _indi;	


while {RFCHECK} do {

	hint "DEBUG - INDI INSURANCE MOVE";
	
	_indi = [];
	// {if ((side _x) == INDEPENDENT) then {_indi pushBack _x}} forEach allUnits inAreaArray "Battlearea";
	{if ((side _x) == INDEPENDENT) then {_indi pushBack _x}} forEach allUnits;

	// systemChat "Debug - redirecting all indi units to patrol obj during RFCHECK state !!!";
	// "MP debug - redirecting all blu units to patrol obj during RFCHECK state !!!" remoteExec ["systemChat", 0, true];	

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

	sleep 180;
};


// _indi = [];
// {if ((side _x) == INDEPENDENT) then {_indi pushBack _x}} forEach allUnits inAreaArray "Battlearea";;

// 	hint "INDI INSURANCE MOVE";
// 	systemChat "Debug - redirecting all blu units to patrol obj during RFCHECK state !!!";
// 	"MP debug - redirecting all blu units to patrol obj during RFCHECK state !!!" remoteExec ["systemChat", 0, true];	

// {
// 	// systemChat "debug - BLUEDEFEND STATE - Blue Unit Counted";
// 	// "MP debug - BLUEDEFEND STATE - Blue Unit Counted" remoteExec ["systemChat", 0, true];
// 	_dir = random 360;
// 	_dist = selectRandom [14, 16, 18, 20]; 
// 	_defendPoint = RGG_patrol_obj getPos [_dist, _dir]; // moves units into a rough 360 defensive circle
// 	_x setBehaviour "COMBAT";
// 	_x doMove _defendPoint;
// 	sleep 1;
// } forEach _indi;	




// note this must ONLY be applied to blufor units!!!
/*
_opfor = (side _x == opfor) inAreaArray "BattleArea";



	_blufor = [];
	{if ((side _x) == west) && (inAreaArray "BattleArea") then {_blufor pushBack _x}} forEach allUnits;

	{
		_Dir = random 360;
		_Dist = selectRandom [1, 5, 10]; 
		_moveTo = RGG_patrol_obj getPos [_Dist,_Dir]; 
		_x setBehaviour "COMBAT";
		_x doMove _moveTo;
		sleep 10;
	} forEach _opfor;