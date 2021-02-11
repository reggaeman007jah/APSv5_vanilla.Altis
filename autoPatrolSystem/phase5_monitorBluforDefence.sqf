/*
From: autoPatrolSystem\phase4_createOpforRF.sqf

Purpose:
	This script checks how well the defence of the objective is going. 
	If the enemy is destroyed, the team can progress to the next stage of the mission - everything reboots 

Flow:
	Player info / intel on phase start and number of attackers 
	sets _RGG_reinforcementTrigger value 
	run monitor defence bool-loop 
	checks indifor numbers, and informs players if numbers are low 
	chcks whether entire patrol has been wiped out, and adds to that score if yes 
	The main check in the bool-loop is: if ((RGG_redzoneEast <5) && (RGG_totalEast <10) && (RGG_redzoneIndi >6)) 
	declares success, deletes camp items and creates a new field-base, with some goodies 
	push patrol position to global array 
	close bool-loop bool 
	kick off new patrol phase 
	move any remiaining opfor units to new phase objective 
	move and remaining indifor units to new phase objective
	uses new missionOrigin pos to find a location, then create tent, repair items etc also VA  
	rewards are random and based on patrolPointsTaken progress 
	creates blue marker 

Receives:
	number of attackers (from autoPatrolSystem\phase4_createOpforRF.sqf)
	_numberOfAttackers = _this select 0;

Informs:
	[_cleanupPos] execVM "autoPatrolSystem\cleanupSystems\garbageControl.sqf"
	[_cleanupPos] execVM "autoPatrolSystem\fobSystems\fobInit.sqf"
	[RGG_missionOrigin] execVM "autoPatrolSystem\phase6_regroup.sqf"

Notes:
	An issue occurs when - for whatever reason - enemy do not engage. This could be due to being spawned in 
	rocks (Malden!!), prevented from engaging due to a building or wall, AI-path-finding issue etc.
	Without an insurance policy, this lack of engagement could draw the mission to a standstill. So, a secondary 
	system is needed to ensure that things always progress at a certain time regardless of engagement.
	bool-loop is based on: monitorDefence
	adds score to patrolPointsTaken var 
	Any existing opfor in the mission will be pushed to the new objective, when everything loops around 

Actions:
	Investigate using a timer system as the main trigger to move things forward 
	Investigate using a voice alert to inform players of incoming attack vectors and size 
	Inbestigate whether there could be a role, or activity involving setting up a sat-dish that would enable
	... voice alerts that inform players of incoing opfor ... so ensuring that there are 'boots on the ground'
	Investigate paradrop script to manage RF - maybe this is another 'boots on the ground' job?
	if ((RGG_redzoneEast <5) && (RGG_totalEast <10) && (RGG_redzoneIndi >6)) then - note this can lead to statis ...
	this ^^ needs to be adjusted either by changing the values, or by adding a timer 
	Think more about the game dynamic of having perks like paradrops, or sat-intel on incoming opfor 
	consider using patrolPointsTaken to inform an end-state 

Questions:
	What does _RGG_reinforcementTrigger do here, if anything? If nothing, what was it going to do?
	What was the plan here? execVM "autoPatrolSystem\insuranceSystems\phase5Timer.sqf?
	Why did I remove the sending in of RF on the first bool-loop check, i.e. checking indifor numbers?
	Was this bc this led to lots of extra units being sent in?
	I seem to have two parallel cleanup scripts .. which one is correct? was there an issue with this one?
	what does this do? [_cleanupPos] execVM "autoPatrolSystem\fobSystems\fobInit.sqf"? There is nothing there?
	Should sapper units be pushed to any new objective, on phase-loop? I think currently they are captured in this action.
	should we exclude opfor sappers and other 'far away units' from bulk-move on phase-loop?

Data:

*/

// player info 
systemChat "DEFEND THE POINT"; // debug  	
"DEFEND THE POINT" remoteExec ["systemChat", 0, true]; // debug 	

// // HERE WE CHECK IF BLUFOR NEED RF 
// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
// systemchat "debug --- checking for blufor RF";
// "MP debug --- checking for blufor RF" remoteExec ["systemChat", 0, true];

// message to players regarding incoming opfor 
_numberOfAttackers = _this select 0;
// _numberOfAttackPoints = _this select 1;
// systemChat format ["Intel suggests %1 enemy units are advancing in your immediate area", _numberOfAttackers];
// systemChat "Check the map for specific locational intel";

// player intel 
format ["Intel suggests %1 enemy units are advancing in your immediate area. Check the map for specific locational intel", _numberOfAttackers] remoteExec ["hint", 0];

/*
We need to add a better voice system to inform players of this ^^^
*/

// previously this managed blu RF, but now it can be used to manage future things (has no direct usage now)
_RGG_reinforcementTrigger = 10; 

// sets patrol phase timer and creates basic move orders for opfor, to prevent stalemate 
execVM "autoPatrolSystem\insuranceSystems\phase5Timer.sqf";
// note - I am removing this for now ... 

// Allow time for battle before checking initial state of defence 
sleep 180;

// monitor defence - bool-loop 
monitorDefence = true; 

while {monitorDefence} do {
	// sleep 10;

	// _units1 = allUnits inAreaArray "Objective 1"; // just trying this change out... april 2020
	// // _unitCount = count _units1;

	// // _opfor = (side _x == opfor) inAreaArray "BattleArea";
	// // hint str _opfor;
			
	// _opforCount = 0;
	// _indiCount = 0;
	// {
	// 	switch ((side _x)) do
	// 	{
	// 		case EAST: {_opforCount = _opforCount + 1};
	// 		case INDEPENDENT: {_indiCount = _indiCount + 1}; 
	// 	};
	// } forEach _units1;

	

	// if (_indiCount >= _RGG_reinforcementTrigger)  then {
	// 	systemChat "Patrol is at good strength, hold the line .. !!!";
	// 	"MP - Patrol is at good strength, hold the line .. !!!" remoteExec ["systemChat", 0, true];
	// 	// "Patrol is at good strength, hold the line .. !!!" remoteExec ["systemChat", 0, true]; // learn this
	// };

	// note this first message does not actually do anything, it just informs players of situation 
	if (RGG_redzoneIndi < _RGG_reinforcementTrigger)  then {
		// systemChat (format ["The Patrol has been compromised, with %1 units left in the fight. Reinforcements are needed.. ", _indiCount]);
		// "Patrol has been compromised. Reinforcements are needed.. " remoteExec ["systemChat", 0, true]; // make this better
		format ["The Patrol has been compromised, with %1 units on the front line. Reinforcements are needed.. ", RGG_redzoneIndi] remoteExec ["hint", 0];
		// [RGG_patrol_obj, RGG_missionOrigin] execVM "autoPatrolSystem\callRF.sqf"; // send RF units into area 
		// PARADOP UNITS HERE!!!
	};

	// again, this is just for info only - it does not trigger new units 
	if (RGG_redzoneIndi <= 1)  then {
		// hint "LOST PATROL!! the entire patrol has been WIPED!! Someone is going to get sacked for this!!";
		// systemChat "The Patrol has been Lost .. ";
		"LOST PATROL!! the entire patrol has been WIPED!! Someone is going to get sacked for this!!" remoteExec ["systemChat", 0, true]; 
		// make this better // MAYBE -1 PLATOON SCORE
		lostPatrols = lostPatrols +1;

		// send in new units - removed as i am exp with an auto check 
		// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
		// systemchat "sending in fresh units to avenge the lost patrol";
		// "sending in fresh units to avenge the lost patrol" remoteExec ["systemChat", 0, true];
		// LOSTPATROL = true; // indicates patrol has been lost and RF will need to head in to take over // i.e. do not auto-progress via timer 

		// this (below) did not work 
		// [RGG_patrol_obj, RGG_patrol_obj] execVM "autoPatrolSystem\phase1_createObj.sqf";
		// hint "restarting after patrol was wiped out";
		// systemchat "debug --- phase1_createObj ACTIVATED";
		// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];

		// monitorDefence = false;
		// end state FAIL - what happens here???
	};

	/*
	Note: I have seen issues where the mission stalls / does not progress. I suspect this is down to the logic I use to 
	determine whether to progress things - if ((RGG_redzoneEast <5) && (RGG_totalEast <10) && (RGG_redzoneIndi >6)). I am 
	removing the middle check, as (I think) once there are enough roamers and sappers in-mission, this will prevent 
	progression, even though the actual patrol point is taken, and not under threat.
	*/

	// this is the main check - have indifor won the point?
	// this needs to also ensure indifor have over 10 in the area 
	// if ((RGG_redzoneEast <5) && (RGG_totalEast <10) && (RGG_redzoneIndi >6)) then {
	if ((RGG_redzoneEast <5) && (RGG_redzoneIndi >10)) then {

		// breather - what else to do in this time? Sort out injured??
		
		// if (_opforCount <= 5) then {// loop ends when opfor is reduced to this number
		// hint "WELL DONE !!! the patrol has held the position successfully and is now moving to the next point";
		systemChat "this proves && syntax test"; // was this ever proven?
		"WELL DONE !!! the patrol has held the position successfully and is now moving to the next point" remoteExec ["hint", 0, true];	
		"The enemy camp has been destroyed and a new FOB is being built" remoteExec ["systemChat", 0, true];	
		sleep 1;
		"The patrol FOB will enable full heals at the medical tent" remoteExec ["systemChat", 0, true];	
		sleep 1;
		"As well as vehicle repair and rearm" remoteExec ["systemChat", 0, true];	
		sleep 1;
		"You now have time to regroup - patrol will move out in 2 minutes" remoteExec ["systemChat", 0, true];	
		// do stats?
		// consolidate injured?
		

		if (!BESILENT) then {
			// voice broadcast to formalise success 
			execVM "sounds\welcome\thisIsCommand.sqf";
			sleep 2;
			execVM "sounds\welcome\success.sqf";		
		};

		sleep 120;
	
		// delete existing camp 
		{ deleteVehicle _x } forEach campItems;
		campItems = [];
		systemChat "camp cleanup"; // debug 
			
		// trigger delayed cleanup 
		_cleanupPos = RGG_patrol_obj; 
		// this ensures that a snapshot of the location is sent to the cleanup script - a global var will always be the most ..
		// .. current version and so will not suit this purpose 
		// activate garbage control 
		[_cleanupPos] execVM "autoPatrolSystem\cleanupSystems\garbageControl.sqf";
		// systemchat "debug --- cleanup script triggered";
		// "MP debug --- cleanup script triggered" remoteExec ["systemChat", 0, true]; // find out if i need or do not need to parse this var to the garbage script?!
		// note - this does not work as intended ?!

		sleep 1;

		// leave a treat at the won position (reusing the above local var cos why not?)
		// [_cleanupPos] execVM "autoPatrolSystem\fobSystems\fobInit.sqf";
		// note: this ^^ does nothing??!

		// systemchat "debug --- cleanup script triggered";
		// "MP debug --- cleanup script triggered" remoteExec ["systemChat", 0, true];
		// systemChat "debug --- PATROL HAS CLEARED THE AREA";
		// "debug --- PATROL HAS CLEARED THE AREA" remoteExec ["systemChat", 0, true];

		// this is where things go wrong !!!

		// [RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";
		// systemchat "debug --- phase1_createObj ACTIVATED";
		// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];

		// push patrol position to global array 
		_takenBasePoint = RGG_patrol_obj;
		RGG_fieldbases pushback _takenBasePoint;
		systemChat format ["Field Bases: %1", RGG_fieldbases]; // debug to list known captured bases 

		// kick off new patrol phase 
		[RGG_patrol_obj, RGG_patrol_obj] execVM "autoPatrolSystem\phase1_createObj.sqf"; 
		systemchat "debug --- phase1_createObj ACTIVATED"; // debug 
		"MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true]; // debug 

		// track progress
		// execVM "autoPatrolSystem\counterSystems\counterSystems.sqf";
		// systemchat "debug --- mission count amended";
		// "MP debug --- mission count amended" remoteExec ["systemChat", 0, true];

		// move any remaining opfor out first, towards new objective  
		_moveOpfor = [];
		{if ((side _x) == EAST) then {_moveOpfor pushBack _x}} forEach allUnits;
		{
			_randomDir = selectRandom [270, 310, 00, 50, 90];
			_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
			_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
			_endPoint1 = _unitDest getPos [_randomDist, _randomDir];
			_x setBehaviour "COMBAT";
			_x doMove _endPoint1;
		} forEach _moveOpfor;
		// I think this captures all opfor units, moving sapper away from their chosen base 
		// do we want this?

		sleep 20;


		// move remaining indifor units to next task objective 
		_moveIndi = [];
		_holdIndi = [];

		{ if ((side _x) == independent) then { _moveIndi pushBack _x; } } forEach allUnits;
		

				// _damage = getDamage _x;
				// if ((getDamage _x) < 0.7) then {
				// 	_moveIndi pushBack _x;
				// } else {
				// 	_holdIndi pushBack _x;
				// };
				

		
		// _units = allUnits inAreaArray "missionOrigin";
		/*
			make sure this is only indifor and only units that are not injured!
		*/
		{
			_randomDir = selectRandom [270, 310, 00, 50, 90];
			_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
			_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
			_endPoint1 = _unitDest getPos [_randomDist, _randomDir];
			_x setBehaviour "COMBAT";
			_x doMove _endPoint1;
		} forEach _moveIndi;

		// try to extract injured units 
		{
			_damageLevel = getDammage _x;
			if (_damageLevel > .7) then {
				systemChat "count injured";
				_holdIndi pushBack _x; 
			}
		} forEach _moveIndi;

		_countInjured = count _holdIndi;
		systemChat format ["Units ready for medivac: %1", _countInjured];


		// move remaining indifor units to next task objective 
		// _moveIndi = [];
		// {if ((side _x) != WEST) then {_moveIndi pushBack _x}} forEach allUnits;
		// // _units = allUnits inAreaArray "missionOrigin";
		// {
		// 	_randomDir = selectRandom [270, 310, 00, 50, 90];
		// 	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
		// 	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
		// 	_endPoint1 = _unitDest getPos [_randomDist, _randomDir];
		// 	_x setBehaviour "COMBAT";
		// 	_x doMove _endPoint1;
		// } forEach _moveIndi;
		// above block is old and works











		// BASE REWARD :)
		// get initial position  
		_anchorPos = getMarkerPos "missionOrigin";
		// systemChat format ["anchorPos: %1", _anchorPos];
		// position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject]
		
		// _buildLocation = _anchorPos isFlatEmpty [3, -1, -1, 1, 0];
		// center findEmptyPosition [radius, maxDistance, vehicleType]
		_buildLocation = _anchorPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
		// systemChat format ["buildLocation: %1", _buildLocation];
		_fobPos = _buildLocation getPos [20,180];
		_repairPos = _fobPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
		
		hint "FLARES ...........";

		_flrObj = "F_20mm_Red" createvehicle _buildLocation;
		sleep 2;
		_flrObj = "F_20mm_Red" createvehicle _fobPos;
		sleep 2;
		_flrObj = "F_20mm_Red" createvehicle _repairPos;
		sleep 15;


		// _baseBuilding1 = createVehicle ["Land_IRMaskingCover_02_F", getMarkerPos "missionOrigin", [], 30, "none"]; 
		_baseBuilding1 = createVehicle ["Land_MedicalTent_01_tropic_closed_F", _buildLocation, [], 30, "none"]; 
		// _baseBuilding1 enableSimulationGlobal false;
		// sleep 0.6;

		// _ammoPos = _fobPos getPos [10,180];
		// _repairPos = _fobPos getPos [10,90];
		// _fuelPos = _fobPos getPos [10,270];
		// _ammoSup = createVehicle ["Land_PortableCabinet_01_medical_F", _fobPos];//med kit for full heal // CONTACT DLC 
		// _ammoSup = createVehicle ["Land_MedicalTent_01_tropic_closed_F", _fobPos];//med kit for full heal 
		// sleep 2;
		// _ammoSup = createVehicle ["B_supplyCrate_F", _fobPos];//ammo 
		// _ammoSup enableSimulationGlobal false;

		sleep 0.6;
		_ammoSup = createVehicle ["Box_NATO_Support_F", _fobPos];//ammmo 
		[ "AmmoboxInit", [_ammoSup, true, {true}] ] call BIS_fnc_arsenal;
		// _ammoSup enableSimulationGlobal false;
		// sleep 2;
		// _ammoSup = createVehicle ["Box_FIA_Support_F", _fobPos];//ammo 
		// _ammoSup enableSimulationGlobal false;
		// sleep 2;
		// _ammoSup = createVehicle ["Box_FIA_Wps_F", _fobPos];//ammo 
		// _ammoSup enableSimulationGlobal false;
		sleep 0.6;
		_quaddy = createVehicle ["I_G_Quadbike_01_F", _fobPos]; // quad

		// testVA
		// _spawnedVA = createVehicle ["Land_WoodenBox_F", _fobPos];
		// [ "AmmoboxInit", [_spawnedVA, true, {true}] ] call BIS_fnc_arsenal;

		// repair area 
		
		_ammoSup = createVehicle ["B_Slingload_01_Repair_F", _repairPos];//vehicle repair 
		// _repairMan = createVehicle ["C_Man_UtilityWorker_01_F", _repairPos];//mechanic
		// why does the unit spawn with an empty gun?
		// sleep 2;

		// vehicle ammo - next to repair 
		// _ammoPos = _repairPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
		// _ammoSup = createVehicle ["Box_NATO_AmmoVeh_F", _ammoPos];//vehicle ammo 
		sleep 0.6;
		
		// rewards
		/*
		Initially the rewards are low level and ramp up, up to level 6 
		After level 6 everything is randomised
		Todo: add tank classes to l6 !!
		*/
		switch (patrolPointsTaken) do {
			case 1: {
				_vicLocation = _anchorPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
				_vic = selectRandom [
					"I_G_Offroad_01_armed_F", 
					"I_C_Offroad_02_LMG_F", 
					"I_C_Offroad_02_LMG_F", 
					"B_LSV_01_armed_F"
					];
				_rewardSpawn = createVehicle [_vic, _vicLocation];
			};
			case 2: {
				_vicLocation = _anchorPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
				_vic = selectRandom [
					"I_G_Offroad_01_armed_F", 
					"I_C_Offroad_02_LMG_F", 
					"I_C_Offroad_02_LMG_F", 
					"B_LSV_01_armed_F"
					];
				_rewardSpawn = createVehicle [_vic, _vicLocation];
			};
			case 3: {
				_vicLocation = _anchorPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
				_vic = selectRandom [
					"I_LT_01_cannon_F", 
					"I_LT_01_scout_F", 
					"I_LT_01_AT_F"
					];
				_rewardSpawn = createVehicle [_vic, _vicLocation];
			};
			case 4: {
				_vicLocation = _anchorPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
				_vic = selectRandom [
					"I_APC_tracked_03_cannon_F", 
					"I_APC_Wheeled_03_cannon_F"
					];
				_rewardSpawn = createVehicle [_vic, _vicLocation];
			};
			case 5: {
				_vicLocation = _anchorPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
				_vic = selectRandom [
					"B_APC_Wheeled_01_cannon_F", 
					"B_APC_Tracked_01_rcws_F", 
					"B_AFV_Wheeled_01_cannon_F", 
					"B_AFV_Wheeled_01_up_cannon_F"
					];
				_rewardSpawn = createVehicle [_vic, _vicLocation];
			};
			case 6: {
				_vicLocation = _anchorPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
				_vic = selectRandom [
					"B_MBT_01_cannon_F", 
					"I_MBT_03_cannon_F"
					]; 
				_rewardSpawn = createVehicle [_vic, _vicLocation];
			};
			default {
				_vicLocation = _anchorPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
				_vic = selectRandom [
					"I_G_Offroad_01_armed_F", 
					"I_C_Offroad_02_LMG_F", 
					"I_C_Offroad_02_LMG_F", 
					"B_LSV_01_armed_F", 
					"I_G_Offroad_01_armed_F", 
					"I_C_Offroad_02_LMG_F", 
					"I_C_Offroad_02_LMG_F", 
					"B_LSV_01_armed_F",
					"I_G_Quadbike_01_F",
					"I_LT_01_cannon_F", 
					"I_LT_01_scout_F", 
					"I_LT_01_AT_F", 
					"I_APC_tracked_03_cannon_F", 
					"I_APC_Wheeled_03_cannon_F", 
					"B_APC_Wheeled_01_cannon_F", 
					"B_APC_Tracked_01_rcws_F", 
					"B_AFV_Wheeled_01_cannon_F", 
					"B_AFV_Wheeled_01_up_cannon_F",
					"B_MBT_01_cannon_F",
					"I_MBT_03_cannon_F"
					];
				_rewardSpawn = createVehicle [_vic, _vicLocation];
			};
		};
		

		// maybe only one - at base ? is a bit big 
		// _fuelPos = _fobPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
		// _ammoSup = createVehicle ["StorageBladder_01_fuel_sand_F", _fuelPos];//vehicle fuel 
		// sleep 2;

		// _medic = createVehicle ["C_IDAP_Man_Paramedic_01_F", _fobPos];//placeholder for auto medic 
		// sleep 2;

		// _medicSup = getPos _fobPos;
		// _medicCab = createVehicle ["Land_PortableCabinet_01_medical_F", _medicSup];//med kit for full heal 
		
		// INJURY MANAGEMENT
		// manage injured units and remove from fight 
		// _damageTrigger = 0.4; // change this value to set what constitutes an evac-worthy injury level
		// injuredIndi = [];
		// {if ((side _x) == INDEPENDENT) then {injuredIndi pushBack _x}} forEach allUnits;

		// // _readyInjured = allUnits inAreaArray "medivac";
		// {
		// 	_inj = getDamage _x;
		// 	if ((_inj) >= _damageTrigger) then {
		// 		_x doMove _fobPos;
		// 		_civGroup = createGroup civilian;
		// 		_x joinSilent _civGroup;
		// 		systemChat "injured ready for pickup";
		// 	};
		// } forEach injuredIndi;
		// systemChat format ["injured civvies: %1", injuredIndi];

		_float = diag_tickTime;
		_float2 = random 10000;
		_uniqueStamp = [_float, _float2];
		_stampToString = str _uniqueStamp;

		_tempBase = createMarker [_stampToString, _anchorPos];
		_tempBase setMarkerShape "ELLIPSE";
		_tempBase setMarkerSize [30, 30];
		_tempBase setMarkerAlpha 0.8;
		_tempBase setMarkerColor "colorBlue";

		// regroup stage 
		[RGG_missionOrigin] execVM "autoPatrolSystem\phase6_regroup.sqf";
		// we need a big center here too 

		// sleep 90;
		// HINT "SLEEPY TIME";

		// kick off new patrol phase 
		// [RGG_patrol_obj, RGG_patrol_obj] execVM "autoPatrolSystem\phase1_createObj.sqf"; 
		// systemchat "debug --- phase1_createObj ACTIVATED"; // debug 
		// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true]; // debug 

		// untested change - bool change should in theory be the last thing to process here...
		monitorDefence = false;
		patrolPointsTaken = patrolPointsTaken + 1;
	};

	sleep 90;
};
