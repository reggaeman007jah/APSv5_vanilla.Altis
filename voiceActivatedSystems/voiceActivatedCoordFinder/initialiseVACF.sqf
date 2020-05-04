/*
from:	voiceActivatedCoordFinder\VACF_init.sqf
to:		voiceActivatedCoordFinder\VACF_keyDowns.sqf				/ once
to:		voiceActivatedCoordFinder\VACF_keyDownMonitor.sqf		/ once 

purpose:
declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
vamp is a universal bool that is used to ensure that only one module can be run at any one time  
*/ 

// _countData = count VAMP_dataList; // determines how many items we have in the data list 
// systemChat "items in VAMP_dataList beforee data entry:";
// systemChat str _countData;

// vars and arrays initialisation
VACF_Heading			= [];
VACF_Distance			= [];
VACF_ConfirmedCoords	= [];		
VACF_numericalInputbool	= false; 	
VACF_headingBool		= false;
VACF_distanceBool		= false;
VACF_showCoords			= false;

// key = "numpad 3"
rgg_vacf_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 81)) then {

	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_vacf_Activate];
	_countData = count VAMP_dataList; 
	systemChat 'items in VAMP_dataList beforee data entry:';
	systemChat str _countData;
	systemChat 'VACF Activated - Please confirm heading';
	VACF_headingBool = true;
	VACF_numericalInputbool = true; 
	execVM 'voiceActivatedCoordFinder\VACF_keyDowns.sqf'; 
	execVM 'voiceActivatedCoordFinder\VACF_keyDownMonitor.sqf'; 
}"];


