/*
from:		

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:

issues:

*/

if (RGG_JTAC_NumInputBool) then {

	rgg_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		systemChat 'JTAC Systems Aborted';
		execVM 'autoPatrolSystem\JTAC_Systems\clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_cnl];
		RGG_JTAC_NumInputBool = false;
		execVM 'autoPatrolSystem\JTAC_Systems\JTACinit.sqf';
	}"];

	rgg_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {
		systemChat '0';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 0; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 0; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 0; };
		if (RGG_JTAC_durationBool) then { RGG_JTAC_duration pushback 10; };
	}"];

	rgg_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {
		systemChat '1';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 1;	};
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 1; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 1;	};
		if (RGG_JTAC_targetBool) then { RGG_JTAC_target pushback 1; };
		if (RGG_JTAC_ordBool) then { RGG_JTAC_ord pushback 1; };
		if (RGG_JTAC_dangerBool) then { RGG_JTAC_danger pushback 1; }; 
		if (RGG_JTAC_colourBool) then { RGG_JTAC_colour pushback 1; };
		if (RGG_JTAC_idBool) then { RGG_JTAC_id pushback 1; }; 
		if (RGG_JTAC_durationBool) then { RGG_JTAC_duration pushback 1; }; 
		if (RGG_JTAC_confirmBool) then { RGG_JTAC_confirm pushback 1; }; 
	}"];

	rgg_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
		systemChat '2';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 2; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 2; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 2; };
		if (RGG_JTAC_targetBool) then { RGG_JTAC_target pushback 2; };
		if (RGG_JTAC_helisBool) then { RGG_JTAC_helis pushback 2; };
		if (RGG_JTAC_ordBool) then { RGG_JTAC_ord pushback 2; };
		if (RGG_JTAC_dangerBool) then { RGG_JTAC_danger pushback 2; };
		if (RGG_JTAC_colourBool) then { RGG_JTAC_colour pushback 2; };
		if (RGG_JTAC_idBool) then { RGG_JTAC_id pushback 2; }; 
		if (RGG_JTAC_durationBool) then { RGG_JTAC_duration pushback 2; }; 
		if (RGG_JTAC_confirmBool) then { RGG_JTAC_confirm pushback 2; }; 
	}"];

	rgg_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
		systemChat '3';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 3; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 3; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 3; };
		if (RGG_JTAC_targetBool) then { RGG_JTAC_target pushback 3; };
		if (RGG_JTAC_helisBool) then { RGG_JTAC_helis pushback 3; };
		if (RGG_JTAC_ordBool) then { RGG_JTAC_ord pushback 3; };
		if (RGG_JTAC_dangerBool) then { RGG_JTAC_danger pushback 3; };
		if (RGG_JTAC_colourBool) then { RGG_JTAC_colour pushback 3; };
		if (RGG_JTAC_idBool) then { RGG_JTAC_id pushback 3; }; 
		if (RGG_JTAC_durationBool) then { RGG_JTAC_duration pushback 3; }; 
	}"];

	rgg_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		systemChat '4';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 4; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 4; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 4; };
		if (RGG_JTAC_helisBool) then { RGG_JTAC_helis pushback 4; };
		if (RGG_JTAC_ordBool) then { RGG_JTAC_ord pushback 4; };
		if (RGG_JTAC_dangerBool) then { RGG_JTAC_danger pushback 4; };
		if (RGG_JTAC_idBool) then { RGG_JTAC_id pushback 4; }; 
		if (RGG_JTAC_durationBool) then { RGG_JTAC_duration pushback 4; }; 
	}"];

	rgg_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
		systemChat '5';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 5; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 5; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 5; };
		if (RGG_JTAC_idBool) then { RGG_JTAC_id pushback 5; }; 
		if (RGG_JTAC_durationBool) then { RGG_JTAC_duration pushback 5; }; 
	}"];

	rgg_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
		systemChat '6';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 6; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 6; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 6; };
	}"];

	rgg_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
		systemChat '7';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 7; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 7; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 7; };
	}"];

	rgg_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
		systemChat '8';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 8; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 8; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 8; };
	}"];

	rgg_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
		systemChat '9';
		if (RGG_JTAC_gridBool) then { RGG_JTAC_grid pushback 9; };
		if (RGG_JTAC_approachBool) then { RGG_JTAC_approach pushback 9; };
		if (RGG_JTAC_egressBool) then { RGG_JTAC_egress pushback 9; };
	}"];
};
		

