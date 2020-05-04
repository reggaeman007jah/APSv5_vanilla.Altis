/*
from:		voiceActivatedDataManager\initialiseVADS.sqf
to:				
to:					

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

if (VADM_numericalInputbool) then {

	rgg_vadm_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		systemChat 'VADM SYSTEM ABORTED from VADM_keyDown.sqf';
		execVM 'voiceActivatedDataManager\VADM_clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vadm_cnl];
		VADM_numericalInputbool = false;
		execVM 'voiceActivatedDataManager\VADM_Init.sqf';
	}"];

	// execVM 'voiceActivatedCoordFinder\RSCnums\titleDisplay.sqf';

	rgg_vadm_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 0;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 0;
		};

	}"];

	rgg_vadm_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 1;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 1;
		};
		if (VADM_confirmBool) then {
			VADM_confirm pushback 1;
		};		
	}"];

	rgg_vadm_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 2;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 2;
		};
		if (VADM_confirmBool) then {
			VADM_confirm pushback 2;
		};	
	}"];

	rgg_vadm_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 3;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 3;
		};
	}"];

	rgg_vadm_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 4;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 4;
		};
	}"];

	rgg_vadm_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 5;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 5;
		};		
	}"];

	rgg_vadm_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 6;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 6;
		};
	}"];

	rgg_vadm_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 7;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 7;
		};		
	}"];

	rgg_vadm_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 8;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 8;
		};	
	}"];

	rgg_vadm_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
		if (VADM_selectItemBool) then {
			VADM_selectedItem pushback 9;
		};
		if (VADM_selectLabelBool) then {
			VADM_selectedLabel pushback 9;
		};
	}"];
};


