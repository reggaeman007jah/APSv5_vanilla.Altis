
/*

RGG_fieldbases = holds all taken base points 

sapperCheck = true; - this needs to be the outcome to trigger back the saper check - ensures only one attack at a time to deal with 

if this is running, it means an attack has been triggered 

determine target 

determine attack force 

send force to chosen base 

set counter when this is triggered 

ensure group is set to stealth 

track when opfor is in the base core marker area (create if does not exist)

set counter when they get there 

check after 10 minutes 

if they are, then move them to their origin (this also needs a marker) and start explosive timer 

get pos of each item at base - set exp on each item 

determine how these can be turned off 

if not turned off, set bombs off and alert all players a base has been lost 


*/

systemChat "ATTACK BASE SCRIPT ACTIVATED!!!";
"Warning - Local informants have informed us that OPFOR may be planning a spec-ops strike on one of our bases. Ensure you check our supply lines and destroy any incoming threats" remoteExec ["hint", 0, true];

_countBases = count RGG_fieldbases;
_selectedBase = random _countBases; 
_baseTarget = RGG_fieldbases select _selectedBase;
_sapperTarget = createMarker ["sapperTarget", _baseTarget];
_sapperTarget setMarkerShape "rectangle";
_sapperTarget setMarkerSize [20,20];
_sapperTarget setMarkerColor "colorBlue";

// create sapper spawn point 
_sapperSpawn = [_baseTarget, 300, 700, 3, 0] call BIS_fnc_findSafePos;

// create units
_opforClass = [
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
_grp = createGroup civilian; // test this - very simple way to avoid these sappers being caught by insurance move orders 
for "_i" from 1 to 6 do {
	_rndtype = selectRandom _opforClass;
	_pos = [_sapperSpawn, 0, 20] call BIS_fnc_findSafePos;

	_sapperSpawnPoint = createMarker ["sapperSpawn", _sapperSpawn];
	_sapperSpawnPoint setMarkerShape "rectangle";
	_sapperSpawnPoint setMarkerSize [20,20];
	_sapperSpawnPoint setMarkerColor "colorBlue";

	_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
	_randomDir = selectRandom [270, 290, 01, 30, 90];
	_randomDist = random [5, 25, 50]; 
	_endPoint = _baseTarget getPos [_randomDist, _randomDir];
	_unit setBehaviour "STEALTH";
	_unit doMove _endPoint;
	spawnedSapperUnit = spawnedSapperUnit +1;
	sleep 1;									
};

private _RGG_redzoneEast = 0;
private _RGG_redzoneWest = 0;
private _RGG_redzoneIndi = 0;
private _RGG_redzoneCivi = 0;

while {SAPPERS} do {
	_units = allUnits inAreaArray "sapperTarget";
	_totalUnits = count _units;
	{
		switch ((side _x)) do
		{
			case EAST: 			{_RGG_redzoneEast = _RGG_redzoneEast + 1};
			case WEST: 			{_RGG_redzoneWest = _RGG_redzoneWest + 1};
			case INDEPENDENT: 	{_RGG_redzoneIndi = _RGG_redzoneIndi + 1};
			case CIVILIAN: 		{_RGG_redzoneCivi = _RGG_redzoneCivi + 1};
		};
	} forEach _units;

	if (_RGG_redzoneCivi > 1) then {
		"Warning - One of your bases is under attack!" remoteExec ["hint", 0, true];	
		_countDown = [180] call BIS_fnc_countDown;
		waitUntil { _countDown = 1; };
		// [_baseTarget] execVM "autoPatrolSystem/chainSecuritySystems/bombBlast.sqf";

		if ((_RGG_redzoneCivi >1) && (_RGG_redzoneWest <1)) then {
			_blasts = selectRandom [3,4,5,6];
			_ord = "Bo_GBU12_LGB";
			for "_i" from 0 to _blasts do {
				_delay = selectRandom [.03, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
				_distance = selectRandom [1,3,6,9,12,15,18,21,24];
				_direction = random 359;
				_pos = _baseTarget getPos [_distance,_direction];
				_boom = _ord createVehicle _pos;	
				sleep _delay;
			};
		} else {
			hint "BOMB SQUAD DESTROYED - BASE IS SAFE"
		};

		SAPPERS = false;
	};
	sleep 60;
};






// _indiGroup = createGroup east;
// _anchor1a = [_anchor1, 50, 200, 3, 0] call BIS_fnc_findSafePos;
// _opforTeam = [];
// _opClasses = ["o_g_soldier_ar_f","o_g_soldier_gl_f","o_g_sharpshooter_f"];
// for "_i" from 1 to _groupSize do {
// 	_unit = selectRandom _opClasses;
// 	_unit1 = _indiGroup createUnit [_unit, _anchor1a, [], 0.1, "none"];
// 	_opforTeam pushBack _unit1;
// };
// systemChat "opfor team:";
// systemChat str _opforTeam;
// sleep 0.3;
// // move orders 
// _ranDist = random 30;
// _ranDir = random 359;
// _unitDest = RGG_patrol_obj getPos [_ranDist, _ranDir];
// _opforTeam doMove _unitDest;
// spawnedIndiUnit = spawnedIndiUnit + _groupSize;



// test update 

// select random base target location (exclusing current front line fob)

// create spawn point 

// create target marker 

// create sappers 

// set sapper behaviour and move orders 

// determine target items - check are these items held in an array anywhere? 

// alert players that local intel is suggesting an attack is immenent but no exact details given 

// start check to see if they make it to target // also in same check see if team is still alive - active 

// if any of the team are still alive, they will try to damage the base 

// if all of the team are destroyed, the threat is closed and players notified soon after, sapper bool reset 

// if any of the team make it to the core, a timer starts 

// timer is two minutes and all players alerted 

// after two minutes, opfor run off back to their origin, and eventually get grabbed by the insurance order 

// after five minutes, destroy base with explosions 

// ensure a detection script is running - any blufor units near a base should alert all players if any opfor spotted 

// if players can get to the base after an activation they can try to defuse the bomb - there should be an object placed with an addaction 

// the addaction should offer three questions - if all correct answers, bomb is defused - if any wrong, bomb is accelerated with 20 seconds to get away! 

// a dsetroyed base means that you cannot spawn from there, there are no repair or medics, and the RF delay is x3 

// so if two bases are destroyed, that is x3 x3 

// there should be a sapper fob, secret and standalone - if that is found, then all sapper missions stop for a hour, after which another sapper fob is created 

