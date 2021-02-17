
sleep 1;
customFlag setFlagTexture "flag1.jpg";
customFlag2 setObjectTexture [0,"flag1.jpg"];
// remove stamina 
player enableStamina FALSE;
player addEventHandler ['Respawn',{player enableStamina FALSE;}];

// test of new voiceMarkerSystem 
execVM "voiceMarkerSystem\1_vmsInit.sqf";

// JTAC
systemChat "JTAC Systems spinning up";
execVM "autoPatrolSystem\JTAC_Systems\JTACinit.sqf";

// welcome message 
execVM "sounds\welcome\welcome.sqf";

// [player, ["<t color='#FF0000'>DROP RED SMOKE</t>", {_smoke = "SmokeShellRed" createVehicle position player;},nil,0,false,true,"","true", 5]] remoteExec ["addAction"];
player addAction ["<t color='#FF0000'>DROP RED SMOKE</t>", {_smoke = "SmokeShellRed" createVehicle position player;}];

// execVM "voiceActivatedCoordFinder\VACF_init.sqf";
// execVM "voiceActivatedDataStore\VADS_init.sqf";
// execVM "voiceActivatedDataManager\VADM_init.sqf";
// execVM "voiceActivatedSyncShot\VASS_init.sqf";

// EH to track friendly fire 

/*
_index = player addMPEventHandler ["MPKilled", { _this execVM "playerKilled.sqf"; }];

Triggered when the unit is killed. EH can be added on any machine and EH code will trigger globally on every connected client and server. 
This EH is clever enough to be triggered globally only once even if added on all clients or a single client that is then disconnected, EH 
will still trigger globally only once.

MPKilled
unit: Object - Object the event handler is assigned to
killer: Object - Object that killed the unit
Contains the unit itself in case of collisions
instigator: Object - Person who pulled the trigger
useEffects: Boolean - same as useEffects in setDamage alt syntax

*/

// params ["_player", "_didJIP"];

// _index = _player addMPEventHandler ["MPKilled", {
// 	_dead = _this select 0;
// 	_killer = _this select 1;
// 	if ((side _dead == independent) && (side _killer == west)) then {systemChat "oh noes - blufor killed a friendly"};
// }]; 



// {_x addMPEventHandler ["MPKilled", {
// 	_dead = _this select 0;
// 	_killer = _this select 1;
// 	if ((side _dead == independent) && (side _killer == west)) then {systemChat "oh noes - blufor killed a friendly"};
// 	}];
// } foreach allUnits;



// If !(isserver) exitwith {};
// {_x addMPEventHandler ["MPKilled", {
// 	_dead = _this select 0;
// 	_killer = _this select 1;
// 	if ((side _dead == independent) && (side _killer == independent)) then {systemChat "oh noes - indifor killed a friendly"};
// 	}];
// } foreach allUnits;



