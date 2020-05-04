/*
from:	VASS_init.sqf
to:		voiceActivatedSyncShot\keyDowns.sqf
to:		voiceActivatedSyncShot\keyDownMonitor.sqf

purpose:
declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
vamp is a universal bool that is used to ensure that only one module can be run at any one time by the user 

notes:
*/

systemChat "SYNC HELLFIRES ON STANDBY";
"... SHIT IS GOING DOWN ..." remoteExec ["systemChat", 0, true];

// vars and arrays initialisation

// shot1					= [];
// shot2					= [];
// shot3					= [];
// shot4					= [];

shotCount				= [];

splash1CoordsLat		= [];
splash1CoordsLon 		= [];

splash2CoordsLat		= [];
splash2CoordsLon 		= [];

splash3CoordsLat		= [];
splash3CoordsLon 		= [];

splash4CoordsLat		= [];
splash4CoordsLon 		= [];

splashConfirm			= [];		

numericalInputBool 		= false; 	
shotCountBool			= false;

shot1LatBool			= false;
shot1LonBool			= false;
shot2LatBool			= false;
shot2LonBool			= false;
shot3LatBool			= false;
shot3LonBool			= false;
shot4LatBool			= false;
shot4LonBool			= false;
executeSyncShotBool		= false;
// latCoordInputBool 		= false; 		  
// lonCoordInputBool 		= false; 		  
		 
// confirmActionBool 		= false; 

// key = "1"
rgg_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 79)) then {

	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_Activate];
	systemChat 'VASS Activated - Please confirm number of shots required';
	systemChat '1 = 1 shot, 2 = 2 shots, 3 = 3 shots, 4 = 4 shots';
	numericalInputBool = true; 
	shotCountBool = true;
	execVM 'voiceActivatedSyncShot\keyDowns.sqf'; 
	execVM 'voiceActivatedSyncShot\keyDownMonitor.sqf'; 

}"];

// 	playSound 'dangerClose1';
