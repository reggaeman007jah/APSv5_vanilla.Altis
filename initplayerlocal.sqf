
sleep 1;

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