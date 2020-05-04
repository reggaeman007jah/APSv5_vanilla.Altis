/*
from:		VAA_init.sqf
to:			voiceActivatedArty\keyDowns.sqf
to:			voiceActivatedArty\keyDownMonitor.sqf

purpose:
declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
vamp is a universal bool that is used to ensure that only one module can be run at any one time by the user 

notes:
*/

systemChat "ARTILLERY AND HELLFIRES ON STANDBY";
// "... ARTILLERY AND HELLFIRES ON STANDBY ..." remoteExec ["systemChat", 0, true];

// vars and arrays initialisation
splashArtyTypeHE		= [];
splashArtyTypeSU		= [];
splashArtyTypeSUx2		= [];
splashArtyTypeSUx3		= [];
splashArtyTypeSUx4		= [];
splashArtyTypeSM		= [];
splashArtyTypeFL		= [];
splashOrdColour			= [];
splashCoordsLat		 	= [];
splashCoordsLon 		= [];
splashRounds 			= [];
splashRadius 			= [];
splashConfirm			= [];		// an entry in this array indicates 'good to fire'
//new
syncSU					= [];		// entry in this indicates that this 'is' a sync shot  // might not be needed
syncSULat1				= [];
syncSULon1				= [];
syncSULat2				= [];
syncSULon2				= [];
syncSULat3				= [];
syncSULon3				= [];
syncSULat4				= [];
syncSULon4				= [];

numericalInputBool 		= false; 	// this is a general bool to handle keyDown EHs
artyTypeBool 			= false;	// first entry to confirm type
ordColourBool 			= false;
latCoordInputBool 		= false; 		  
lonCoordInputBool 		= false; 		  
roundsInputBool 		= false; 		 
radiusInputBool 		= false; 		 
confirmActionBool 		= false; 

//new 
syncInputBool			= false;

// new
shot1Data 				= false;
shot2Data 				= false;
shot3Data 				= false;
shot4Data				= false;
moreOrExecute			= false;
// these are linked to the repeat fire theory/test

// key = "4"
rgg_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 75)) then {

	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_Activate];
	systemChat 'VAA Activated - Please confirm type';
	systemChat '1 = HE, 2 = SURGICAL, 3 = SMOKE, 4 = FLARES';
	artyTypeBool = true;
	numericalInputBool = true; 
	execVM 'voiceActivatedArty\keyDowns.sqf'; 
	execVM 'voiceActivatedArty\keyDownMonitor.sqf'; 
}"];

// 	playSound 'dangerClose1';
