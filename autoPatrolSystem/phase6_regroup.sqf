/*
here we consolidate the indifor forces 
heal and rearm 
regroup into groups of 5 
take up any statics 

*/

// set new respawn point here 
// _spawnNumber = patrolPointsTaken; 
// _spawnToString = str _spawnNumber;
// _preText = "Spawn point ";
// _newSpawn = _preText + _spawnToString;


_mpSpawn = _this select 0;
_testMpSpawn = _mpSpawn getPos [30,180];
_testMpIndiSpawn = _mpSpawn getPos [20,180];
[west, _testMpSpawn] call BIS_fnc_addRespawnPosition;
[independent, _testMpIndiSpawn] call BIS_fnc_addRespawnPosition;







// [independent, _mpSpawn] call BIS_fnc_addRespawnPosition;
// player getPos [100,45];


// // paths between marker points 
// _float = diag_tickTime;
// _float2 = random 10000;
// _uniqueStamp = [_float, _float2];
// _stampToString = str _uniqueStamp;

// _reldirX = RGG_missionOrigin getDir RGG_patrol_obj;
// _relDir = floor _relDirX;
// _distX = RGG_missionOrigin distance RGG_patrol_obj;
// _dist = floor _distX;
// _dist2 = _dist / 2;
// _testPos = RGG_missionOrigin getPos [_dist2, _relDirX];// testing unfloored dir 

// sleep 5;
// _lineTest = createMarker [_stampToString, _testPos];
// _lineTest setMarkerShape "RECTANGLE";
// _lineTest setMarkerColor "ColorBlack";
// _lineTest setMarkerDir _reldirX;
// _lineTest setMarkerSize [2, _dist2];


/*

// junk to destroy... 
"Land_TentDome_F"

"Land_BarrelSand_F",
"Land_BarrelSand_F",
"Land_BarrelSand_grey_F",
"Land_BarrelWater_grey_F",
"Land_Suitcase_F",
"Land_WoodenCrate_01_stack_x3_F",
"Weapon_launch_O_Vorona_brown_F",
"Land_Camera_01_F",
"Land_CarBattery_01_F",
"Land_ExtensionCord_F",
"Land_MobilePhone_smart_F",
"Land_PortableLongRangeRadio_F",
"Land_Tablet_02_F",
"Land_SurvivalRadio_F",
"Land_TransferSwitch_01_F",
"Land_TentDome_F",
"FlexibleTank_01_forest_F",
"Box_T_East_Wps_F",
"Box_East_AmmoOrd_F",
"Box_East_WpsLaunch_F",
"Land_RotorCoversBag_01_F",
"Land_FMradio_F",
"Land_Laptop_F",
"Land_SatellitePhone_F",
"Land_FoodSack_01_full_brown_F",
"Intel_Photos_F",
"Land_Camping_Light_F",
"Land_CratesWooden_F",
"Land_Pallet_MilBoxes_F",
"Land_TankRoadWheels_01_single_F",
"Land_File1_F",
"Land_Money_F",
"Land_MetalBarrel_F",
"Land_WaterTank_F",
"Land_Bucket_painted_F",
"Land_FireExtinguisher_F",
"Land_MetalWire_F"