/*
From: initServer.sqf 

Purpose:
This file launches various threads / initiation scripts 


Flow:
	execVM "autoPatrolSystem\autoPatrolSystemParams.sqf";
	execVM "autoPatrolSystem\chainSecuritySystems\chainSec.sqf";
	execVM "autoPatrolSystem\randomThreatSystems\randomThreats.sqf";
	Issues player welcome info 
	Gets location of a mission-specific asset ("ammo1") and uses as anchor position: RGG_initStartPos
	Creates marker for main player FOB 
	Triggers mission phase 1
	Creates friendly units 
	Adds FOB base data to global blacklist array 

Receives:
TBC

Informs:
	mission-specific params file: 
	execVM "autoPatrolSystem\autoPatrolSystemParams.sqf";

	sapper system:
	execVM "autoPatrolSystem\chainSecuritySystems\chainSec.sqf";

	random roamers system:
	execVM "autoPatrolSystem\randomThreatSystems\randomThreats.sqf";

	Mission start:
	[RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";

	Creates friendly units 
	[RGG_initStartPos] execVM "autoPatrolSystem\spawnerSystems\createFriendlyUnits.sqf";

Notes:
"ammo1" is a fixed 'named asset' in the mission itself - it is both the VA arsenal and also acts as a anchor point for the main Blufor base.
RGG_patrolPositionBlacklist is the global array for blacklist areas

Actions:
Remove old comments 
HP - make this trigger from activity, not from mission start 

Questions:
How many times does this file run? Confirm only runs once...
*/


// this launches the mission-specific params file 
execVM "killChain\killchainSystemParams.sqf";

// this launches the sapper system
execVM "killChain\systems\chainSecuritySystems\chainSec.sqf";

// this launches the random roamers system
execVM "killChain\systems\randomThreatSystems\randomThreats.sqf";

// this file should run only once 
sleep 2;
// systemchat "debug --- autoPatrolSystem.sqf running"; // debug 
// player information
"---- Welcome to Operation Killchain" remoteExec ["systemChat", 0, true];
"---- Support Independent forces as they patrol the badlands" remoteExec ["systemChat", 0, true];

// voice broadcasts
execVM "sounds\welcome\thisIsCommand.sqf";
sleep 3;
execVM "sounds\welcome\missionLive.sqf";
// this ^^ is a one-off sound file called only once at the beginning of the mission 

/*
------- Base Setup ------- 
*/

// RGG_initStartPos is a location array (of the location of the mission-specific-asset "ammo1")
// "permaBase" acts as the one and only fixed blufor base area, can be used for RF/RE-UP/Medivac tasks (TBC)
RGG_initStartPos = getPos ammo1;

// Main FOB Marker 
_base = createMarker ["permaBase", RGG_initStartPos];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorBlue";
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

// KICK OFF PATROL MISSION 
// this takes the permaBase location as the first anchor (subsequent progress-anchors will be different)
// to do / April 2020 / work out why you used the same arg twice here --------------------------------------------
[RGG_initStartPos, RGG_initStartPos] execVM "killChain\phase1_createObj.sqf";
// systemchat "debug --- phase1_createObj ACTIVATED";
// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];

sleep 5;

// CREATE PATROL SQUADDIES
// this also takes the main blufor permaBase anchor location as the first spawn point for blufor troops
[RGG_initStartPos] execVM "killChain\systems\spawnerSystems\createFriendlyUnits.sqf";
// systemchat "debug --- createFriendlyUnits.sqf running";
// "MP debug --- createFriendlyUnits.sqf running" remoteExec ["systemChat", 0, true];
sleep 0.2;

// add base position to blacklist 
_topleft = RGG_initStartPos getPos [800,315];
_bottomRight = RGG_initStartPos getPos [800,135];
RGG_patrolPositionBlacklist pushBack [_topLeft, _bottomRight];
// consider making this smaller 
