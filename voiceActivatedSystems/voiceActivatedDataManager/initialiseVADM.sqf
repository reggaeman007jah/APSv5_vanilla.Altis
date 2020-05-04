/*
from:		voiceActivatedDataManager\VADM_init.sqf
to:			voiceActivatedDataManager\VADM_keyDowns.sqf				
to:			voiceActivatedDataManager\VADM_keyDownMonitor.sqf		

purpose:
shows list of stored coords on-screen 
it is populated via input from VACF, however here you can set labels for each line item 

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

// --------------------------------------------------------

// vars and arrays initialisation	
VADM_numericalInputbool	= false; 

VADM_selectItemBool		= false;
VADM_selectedItem		= [];	

VADM_selectLabelBool	= false; 
VADM_selectedLabel		= [];	

VADM_confirmBool		= false;
VADM_confirm			= [];

// --------------------------------------------------------

// key = "numpad 5"
rgg_vadm_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 76)) then {
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_vadm_Activate];
	systemChat 'VADM Activated - Please select item to edit';
	execVM 'voiceActivatedDataManager\VADM_keyDownMonitor.sqf';
	VADM_numericalInputbool = true; 
	VADM_selectItemBool = true;
	execVM 'voiceActivatedDataManager\VADM_keyDowns.sqf'; 
	execVM 'voiceActivatedDataManager\VADM_displayData.sqf'; 
}"];