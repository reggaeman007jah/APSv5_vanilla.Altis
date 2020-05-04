/*
from:	voiceActivatedCoordFinder\initialiseVACF.sqf
to:		voiceActivatedCoordFinder\RSCnums\titleDisplay.sqf 		/ once 
to:		voiceActivatedCoordFinder\RSCnums\dataEntry.sqf 		/ every keypress 

purpose:
listens to numpad keypresses, and sends respective values (numpad nums) into arrays 
the array the data is pushed into is dependent on the current state (bool) - this is managed by the monitor 
kicks off the main title UI 
*/

if (VACF_numericalInputbool) then {

	rgg_vacf_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		
		systemChat 'VACF SYSTEM ABORTED';
		execVM 'voiceActivatedCoordFinder\VACF_clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vacf_cnl];
		VACF_numericalInputbool = false;
		execVM 'voiceActivatedCoordFinder\VACF_Init.sqf';
	}"];

	execVM 'voiceActivatedCoordFinder\RSCnums\titleDisplay.sqf';

	rgg_vacf_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {
			
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';

		if (VACF_headingBool) then {
			VACF_Heading pushback 0;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 0;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_vacf_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {

		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';

		if (VACF_headingBool) then {
			VACF_Heading pushback 1;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 1;
			playSound '3DEN_notificationDefault';
		};		
	}"];

	rgg_vacf_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
			
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';

		if (VACF_headingBool) then {
			VACF_Heading pushback 2;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 2;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_vacf_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
			
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';
		
		if (VACF_headingBool) then {
			VACF_Heading pushback 3;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 3;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_vacf_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';
		
		if (VACF_headingBool) then {
			VACF_Heading pushback 4;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 4;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_vacf_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
			
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';

		if (VACF_headingBool) then {
			VACF_Heading pushback 5;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 5;
			playSound '3DEN_notificationDefault';
		};		
	}"];

	rgg_vacf_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
			
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';

		if (VACF_headingBool) then {
			VACF_Heading pushback 6;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 6;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_vacf_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
			
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';

		if (VACF_headingBool) then {
			VACF_Heading pushback 7;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 7;
			playSound '3DEN_notificationDefault';
		};		
	}"];

	rgg_vacf_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
			
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';

		if (VACF_headingBool) then {
			VACF_Heading pushback 8;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 8;
			playSound '3DEN_notificationDefault';
		};	
	}"];

	rgg_vacf_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
			
		execVM 'voiceActivatedCoordFinder\RSCnums\dataEntry.sqf';

		if (VACF_headingBool) then {
			VACF_Heading pushback 9;
			playSound '3DEN_notificationDefault';
		};
		if (VACF_distanceBool) then {
			VACF_Distance pushback 9;
			playSound '3DEN_notificationDefault';
		};
	}"];
};
		

