/*
from:	voiceActivatedDataStore\VADS_init.sqf
to:		voiceActivatedDataStore\VADS_keyDowns.sqf				/ once
to:		voiceActivatedDataStore\VADS_keyDownMonitor.sqf		/ once 

purpose:
shows list of stored coords on-screen 
it is populated via VACF, however here you can set labels for each line item 
note - this is read only and can be used alongside other apps

declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
vamp is a universal bool that is used to ensure that only one module can be run at any one time  
here we use VAMP when editing labels, however we must also be able to call this alongside other modules 
so - additional kdowns are needed in VAAS and VACF to hide/show this content

notes:
I think that when the first EH fires, we will need to show all stored data on screen.
Then when data is on-screen, our keyDown system can work with whatever is on screen.
So we really need to render everything first.

*/ 

// vars and arrays initialisation	
VADS_numericalInputbool	= false; 	

// key = "numpad 2"
rgg_vads_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 80)) then {

	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_vads_Activate];
	systemChat 'VADS Activated - Please select item to edit';
	
	VADS_numericalInputbool = true; 
	execVM 'voiceActivatedDataStore\VADS_keyDowns.sqf'; 
	execVM 'voiceActivatedDataStore\VADS_displayData.sqf'; 
}"];

