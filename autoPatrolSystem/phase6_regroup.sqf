/*
From: autoPatrolSystem\phase5_monitorBluforDefence.sqf

Purpose: This creates two respawn points, for blufor and indifor players 

Flow: Create spawn points 	

Receives: TBC

Informs: TBC

Notes:
	There is confusion here - notes suggest this was about consolidating indifor forces, I assume to save on group numbers 
	However all this seems to do is create respawn points.
	Old notes:
	here we consolidate the indifor forces 
	heal and rearm 
	regroup into groups of 5 
	take up any statics 
	set new respawn point here 
	_spawnNumber = patrolPointsTaken; 
	_spawnToString = str _spawnNumber;
	_preText = "Spawn point ";
	_newSpawn = _preText + _spawnToString;

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

Actions: TBC

Questions: TBC

Data: TBC

*/

// create respawn points 
_mpSpawn = _this select 0;
_bluforSpawn = _mpSpawn getPos [40,90];
_indiSpawn = _mpSpawn getPos [40,270];
RGG_respawnStore pushBack [_bluforSpawn, _indiSpawn]; // sending to global array to enable deleting of older respawns 
[west, _bluforSpawn] call BIS_fnc_addRespawnPosition; // create blu resapwn
[independent, _indiSpawn] call BIS_fnc_addRespawnPosition; // create ind resapwn

_cnt = count RGG_respawnStore; // check if more than one, i.e. don't process this is we only have one (1st) point 
if (_cnt >1) then {
	_removeSpawns = RGG_respawnStore select 0;
	_removeBluSpawn = _removeSpawns select 0;
	_removeIndSpawn = _removeSpawns select 1;
	[west, _removeBluSpawn] callBIS_fnc_removeRespawnPosition
	[independent, _removeIndSpawn] callBIS_fnc_removeRespawnPosition
	RGG_respawnStore deleteAt 0;
};
