/*
From: initServer.sqf 
*/


// this launches the mission-specific params file 
execVM "autoPatrolSystem\autoPatrolSystemParams.sqf";

// this launches the sapper system
execVM "autoPatrolSystem\chainSecuritySystems\chainSec.sqf";

// this launches the random roamers system
execVM "autoPatrolSystem\randomThreatSystems\randomThreats.sqf";

// this file should run only once 
sleep 2;
systemchat "debug --- autoPatrolSystem.sqf running";
"Welcome to Operation Killchain" remoteExec ["systemChat", 0, true];
"Support Independent forces as they patrol the badlands" remoteExec ["systemChat", 0, true];
// "Welcome to Operation Killchain" remoteExec ["systemChat", 0, true];
// "Welcome to Operation Killchain" remoteExec ["systemChat", 0, true];
// "Welcome to Operation Killchain" remoteExec ["systemChat", 0, true];

/*
------- Base Setup ------- 
*/

// "ammo1" is a fixed 'named asset' in the mission itself - it is both the VA arsenal and also acts as a anchor point for the main Blufor base.
// RGG_initStartPos is a location array (of the location of the ammo box)
// "permaBase" acts as the one and only fixed blufor base area, can be used for RF/RE-UP/Medivac tasks (TBC)
RGG_initStartPos = getPos ammo1;
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
// the above sequence provides a very basic marker animation on startup 

// this takes the permaBase location as the first anchor (subsequent progress-anchors will be different)
// -------------------------------------------- to do / April 2020 / work out why you used the same arg twice here --------------------------------------------
[RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";
// systemchat "debug --- phase1_createObj ACTIVATED";
// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];
sleep 0.2;

// this also takes the main blufor permaBase anchor location as the first spawn point for blufor troops
[RGG_initStartPos] execVM "autoPatrolSystem\spawnerSystems\createFriendlyUnits.sqf";
// systemchat "debug --- createFriendlyUnits.sqf running";
// "MP debug --- createFriendlyUnits.sqf running" remoteExec ["systemChat", 0, true];
sleep 0.2;

// add base position to blacklist 
_topleft = RGG_initStartPos getPos [800,315];
_bottomRight = RGG_initStartPos getPos [800,135];
RGG_patrolPositionBlacklist pushBack [_topLeft, _bottomRight];
// consider making this smaller 
