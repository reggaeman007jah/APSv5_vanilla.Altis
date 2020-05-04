/*
from:	voiceActivatedDataStore\initialiseVADS.sqf
//to:		voiceActivatedCoordFinder\RSCnums\titleDisplay.sqf 		/ once 
//to:		voiceActivatedCoordFinder\RSCnums\dataEntry.sqf 		/ every keypress 

purpose:
listens to numpad keypresses, and sends respective values (numpad nums) into arrays 
the array the data is pushed into is dependent on the current state (bool) - this is managed by the monitor 
kicks off the main title UI 

notes:

elements:
VADS_selectItemBool			
VADS_selectLabelBool
VADS_selectedItem				
VADS_selectedLabel	
VADS_closeApp			
VADS_numericalInputbool	
*/

if (VADS_numericalInputbool) then {

	rgg_vads_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		systemChat 'VADS SYSTEM ABORTED from VADS_keyDown.sqf';
		execVM 'voiceActivatedDataStore\VADS_clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vads_cnl];
		VADS_numericalInputbool = false;
		execVM 'voiceActivatedDataStore\VADS_Init.sqf';
	}"];

	// execVM 'voiceActivatedCoordFinder\RSCnums\titleDisplay.sqf';

	// rgg_vads_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 0;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 0;
	// 	};
	// }"];

	// rgg_vads_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 1;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 1;
	// 	};		
	// }"];

	// rgg_vads_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 2;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 2;
	// 	};
	// }"];

	// rgg_vads_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 3;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 3;
	// 	};
	// }"];

	// rgg_vads_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 4;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 4;
	// 	};
	// }"];

	// rgg_vads_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 5;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 5;
	// 	};		
	// }"];

	// rgg_vads_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 6;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 6;
	// 	};
	// }"];

	// rgg_vads_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 7;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 7;
	// 	};		
	// }"];

	// rgg_vads_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 8;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 8;
	// 	};	
	// }"];

	// rgg_vads_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
	// 	if (VADS_selectItemBool) then {
	// 		VADS_selectedItem pushback 9;
	// 	};
	// 	if (VADS_selectLabelBool) then {
	// 		VADS_selectedLabel pushback 9;
	// 	};
	// }"];
};


