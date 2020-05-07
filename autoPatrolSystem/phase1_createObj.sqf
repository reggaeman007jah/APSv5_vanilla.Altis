/*
This file creates dynamic markers 
These markers are used to direct the flow-logic of the mission 
"missionOrigin" - green - designates the start of any patrol mission - 
"battleArea" - grey - main AO that can be used to direct all AO units - 
"objective 1" - red - should be renamed really - main red area - used to control 
"missionCore" - dark red - used to control units at center of patrol point 
*/

sleep 5;

hint "Setting up new patrol objective";
MISSIONTASK = "Setting up new patrol objective";
publicVariable "MISSIONTASK";

_sentPos 	= _this select 0; // objective point for any new mission 
_sentOrigin = _this select 1; // starting point for any new mission

RGG_missionOrigin = _sentOrigin;
RGG_patrol_obj = [_sentPos, 400, 800, 3, 0, 0, 0, RGG_patrolPositionBlacklist] call BIS_fnc_findSafePos; // generate patrol obj between 600m and 800m away, and always over land 
// new test to make each point closer, now 350 - 500 away 
// RGG_patrol_obj = [_sentPos, 600, 650, 3, 0, 0, 0, RGG_patrolPositionBlacklist] call BIS_fnc_findSafePos; // generate patrol obj between 600m and 800m away, and always over land 
// RGG_patrol_obj = [_sentPos, 600, 800, 3, 0, 20, 0] call BIS_fnc_findSafePos; // generate patrol obj between 600m and 800m away, and always over land 
// _newPos = [_markerPos, 600, 1800, 3, 0, 20, 0, blackList] call BIS_fnc_findSafePos;
// delete any existing opfor RF points 
deleteMarker "Point 1";
deleteMarker "Point 2";
deleteMarker "Point 3";

// Patrol Stage Origin 
deleteMarker "missionOrigin";
_base = createMarker ["missionOrigin", RGG_missionOrigin];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorGreen";
_base setMarkerSize [70, 70];
_base setMarkerAlpha 0.5;
sleep 0.1;
_base setMarkerSize [80, 80];
_base setMarkerAlpha 0.6;
sleep 0.1;
_base setMarkerSize [90, 90];
_base setMarkerAlpha 0.7;
sleep 0.1;
_base setMarkerSize [100, 100];
_base setMarkerAlpha 0.8;
sleep 0.1;
_base setMarkerSize [110, 110];
_base setMarkerAlpha 0.9;
sleep 1;

// AO - grey circle within which all calcs take place
deleteMarker "BattleArea"; 
_battleArea = createMarker ["BattleArea", RGG_patrol_obj];
_battleArea setMarkerShape "ELLIPSE";
_battleArea setMarkerColor "ColorBlack";
_battleArea setMarkerSize [1000, 1000];
_battleArea setMarkerAlpha 0.1;
sleep 0.1;
_battleArea setMarkerSize [1500, 1500];
// _battleArea setMarkerAlpha 0.2;
sleep 0.1;
_battleArea setMarkerSize [2000, 2000];
_battleArea setMarkerAlpha 0.2;
sleep 0.1;
_battleArea setMarkerSize [2500, 2500];
// _battleArea setMarkerAlpha 0.4;
sleep 0.1;
_battleArea setMarkerSize [3000, 3000];
_battleArea setMarkerAlpha 0.3;
sleep 0.1;
_battleArea setMarkerSize [3500, 3500];

// OBJ - patrol stage objective 
deleteMarker "Objective 1";
_objective1 = createMarker ["Objective 1", RGG_patrol_obj];
_objective1 setMarkerShape "ELLIPSE";
_objective1 setMarkerColor "ColorRed";
_objective1 setMarkerSize [100, 100];
_objective1 setMarkerAlpha 0.5;
sleep 0.1;
_objective1 setMarkerSize [120, 120];
_objective1 setMarkerAlpha 0.6;
sleep 0.1;
_objective1 setMarkerSize [130, 130];
_objective1 setMarkerAlpha 0.7;
sleep 0.1;
_objective1 setMarkerSize [140, 140];
_objective1 setMarkerAlpha 0.8;
sleep 0.1;
_objective1 setMarkerSize [150, 150];
_objective1 setMarkerAlpha 0.9;
sleep 0.1;
_objective1 setMarkerSize [250, 250];
sleep 0.1;
_objective1 setMarkerSize [450, 450];
sleep 1;

// Patrol Stage Core 
deleteMarker "missionCore";
_base = createMarker ["missionCore", RGG_patrol_obj];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorRed";
_base setMarkerSize [10, 10];
_base setMarkerAlpha 0.5;
sleep 0.1;
_base setMarkerSize [150, 15];
_base setMarkerAlpha 0.6;
sleep 0.1;
_base setMarkerSize [20, 20];
_base setMarkerAlpha 0.7;
sleep 0.1;
_base setMarkerSize [25, 25];
_base setMarkerAlpha 0.8;
sleep 0.1;
_base setMarkerSize [30, 30];
_base setMarkerAlpha 0.9;
sleep 1;

// add patrol position to blacklist 
_topleft = RGG_patrol_obj getPos [1000,315];
_bottomRight = RGG_patrol_obj getPos [1000,135];
RGG_patrolPositionBlacklist pushBack [_topLeft, _bottomRight];

sleep 5;

// generate defending opfor 
execVM "autoPatrolSystem\phase2_createOpforWave1.sqf";

// paths between marker points 
_float = diag_tickTime;
_float2 = random 10000;
_uniqueStamp = [_float, _float2];
_stampToString = str _uniqueStamp;

_reldirX = RGG_missionOrigin getDir RGG_patrol_obj;
_relDir = floor _relDirX;
_distX = RGG_missionOrigin distance RGG_patrol_obj;
_dist = floor _distX;
_dist2 = _dist / 2;
_testPos = RGG_missionOrigin getPos [_dist2, _relDirX];

sleep 5;

_lineTest = createMarker [_stampToString, _testPos];
_lineTest setMarkerShape "RECTANGLE";
_lineTest setMarkerColor "ColorBlack";
_lineTest setMarkerDir _reldirX;
_lineTest setMarkerSize [2, _dist2];
// to enable a colour change when the chain breaks, these lines need to be pushed back into an array 

// camp to dest 
// _randomCampLocation = RGG_patrol_obj findEmptyPosition [10,50,"B_Heli_Light_01_dynamicLoadout_F"];
// _randomItemNumber = selectRandom [6,7,8,9,10];
// for "_i" from 1 to _randomItemNumber do {
// 	_randomDist = selectRandom [2,5,10,15,20];
// 	_randomDir = random 359;
// 	_campItem = selectRandom [
// 		"Land_BarrelSand_F",
// 		"Land_BarrelSand_F",
// 		"Land_BarrelSand_grey_F",
// 		"Land_BarrelWater_grey_F",
// 		// "Land_Suitcase_F",
// 		"Land_WoodenCrate_01_stack_x3_F",
// 		"Weapon_launch_O_Vorona_brown_F",
// 		// "Land_Camera_01_F",
// 		// "Land_CarBattery_01_F",
// 		// "Land_ExtensionCord_F",
// 		// "Land_MobilePhone_smart_F",
// 		// "Land_PortableLongRangeRadio_F",
// 		// "Land_Tablet_02_F",
// 		// "Land_SurvivalRadio_F",
// 		"Land_TransferSwitch_01_F",
// 		"Land_TentDome_F",
// 		// "FlexibleTank_01_forest_F",
// 		"Box_T_East_Wps_F",
// 		"Box_East_AmmoOrd_F",
// 		"Box_East_WpsLaunch_F",
// 		"Land_RotorCoversBag_01_F",
// 		// "Land_FMradio_F",
// 		// "Land_Laptop_F",
// 		// "Land_SatellitePhone_F",
// 		"Land_FoodSack_01_full_brown_F",
// 		// "Intel_Photos_F",
// 		// "Land_Camping_Light_F",
// 		"Land_CratesWooden_F",
// 		"Land_Pallet_MilBoxes_F",
// 		// "Land_TankRoadWheels_01_single_F",
// 		// "Land_File1_F",
// 		// "Land_Money_F",
// 		"Land_MetalBarrel_F",
// 		"Land_WaterTank_F"
// 		// "Land_Bucket_painted_F",
// 		// "Land_FireExtinguisher_F",
// 		// "Land_MetalWire_F"
// 	];
// 	_spawnPos = _randomCampLocation getPos [_randomDist, _randomDir];
// 	_rewardSpawn = createVehicle [_campItem, _spawnPos];

// 	// _rewardSpawn2 = createVehicle ["Land_TentDome_F", _spawnPos];
// 	_rewardSpawn setDir _randomDir;
// 	// _rewardSpawn2 setDir _randomDir;
// 	systemChat format ["random base dir: %1", _randomDir];
// 	_rewardSpawn enableSimulationGlobal false;
// 	sleep 0.5;
// };


// _randomDist = selectRandom [10,15,20];
// _randomDir = random 359;
// _spawnPos = _randomCampLocation getPos [_randomDist, _randomDir];
// _rewardSpawn2 = createVehicle ["Land_TentDome_F", _spawnPos];
// systemChat "tent 1";

// _randomDist = selectRandom [10,15,20];
// _randomDir = random 359;
// _spawnPos = _randomCampLocation getPos [_randomDist, _randomDir];
// _rewardSpawn2 = createVehicle ["Land_TentDome_F", _spawnPos];
// systemChat "tent 2";

// _randomDist = selectRandom [10,15,20];
// _randomDir = random 359;
// _spawnPos = _randomCampLocation getPos [_randomDist, _randomDir];
// _rewardSpawn2 = createVehicle ["Land_TentDome_F", _spawnPos];systemChat "tent 3";


// new 
_randomCampLocation = RGG_patrol_obj findEmptyPosition [10,50,"B_Heli_Light_01_dynamicLoadout_F"];
_random5 = random 5;
_random3 = random 3;

// tents 
for "_i" from 1 to 2 do {
	_randomDir = random 359;
	_random30 = random 30;
	_spawnPos = _randomCampLocation getPos [_random30, _randomDir];
	_campItem = createVehicle ["Land_TentDome_F", _spawnPos];
	_campItem setDir _randomDir;
	campItems pushback _campItem;
};

// barrels and other camp stuff 
for "_i" from 1 to 2 do {
	_randomDir = random 359;
	_random25 = random 25;
	_spawnPos = _randomCampLocation getPos [_random3, _randomDir];
	_campItem = selectRandom [
		"Land_BarrelSand_F",
		"Land_BarrelSand_F",
		"Land_BarrelSand_grey_F",
		"Land_BarrelWater_grey_F",
		"Land_TransferSwitch_01_F",
		"Land_TentDome_F",
		"Land_RotorCoversBag_01_F",
		"Land_MetalBarrel_F",
		"Land_WaterTank_F"
	];
	_spawnPos = _randomCampLocation getPos [_random25, _randomDir];
	_campItem2 = createVehicle [_campItem, _spawnPos];
	_campItem2 setDir _randomDir;
	campItems pushback _campItem2;
};

// crates 
for "_i" from 1 to _random5 do {
	_randomDir = random 359;
	_random5 = random 5;
	_random25 = random 25;
	_spawnPos = _randomCampLocation getPos [_random5, _randomDir];
	_campItem = selectRandom [
		"Land_WoodenCrate_01_stack_x3_F",
		"Weapon_launch_O_Vorona_brown_F",
		"Box_T_East_Wps_F",
		"Box_East_AmmoOrd_F",
		"Box_East_WpsLaunch_F",
		"Land_CratesWooden_F",
		"Land_Pallet_MilBoxes_F",
		"Land_MetalBarrel_F",
		"Land_WaterTank_F"
	];
	_spawnPos = _randomCampLocation getPos [_random25, _randomDir];
	_campItem2 = createVehicle [_campItem, _spawnPos];
	_campItem2 setDir _randomDir;
	campItems pushback _campItem2;
};

sleep 2;

systemChat format ["Camp Items: %1", campItems];
_noOfCampItems = count campItems;
systemChat format ["No. of Camp Items: %1", _noOfCampItems];