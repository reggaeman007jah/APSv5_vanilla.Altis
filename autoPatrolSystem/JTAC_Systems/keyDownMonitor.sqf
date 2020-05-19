/*
from:		voiceMarkerSystem\1_vmsInit.sqf
to:			voiceMarkerSystem\
to:			voiceMarkerSystem\ 
to: 		voiceMarkerSystem\

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:
RGG_JTAC_mission	 	= [];
RGG_JTAC_missionBool 	= false;

RGG_JTAC_grid	 		= [];
RGG_JTAC_gridBool 		= false;

RGG_JTAC_approach	 	= [];
RGG_JTAC_appraochBool	= false;

RGG_JTAC_egress		 	= [];
RGG_JTAC_egressBool		= false;

RGG_JTAC_target	 		= [];
RGG_JTAC_targetBool		= false;

RGG_JTAC_ord	 		= [];
RGG_JTAC_ordBool 		= false;

RGG_JTAC_danger	 		= [];
RGG_JTAC_dangerBool		= false;

RGG_JTAC_colour	 		= [];
RGG_JTAC_colourBool		= false;

RGG_JTAC_id	 			= [];
RGG_JTAC_idBool 		= false;

RGG_JTAC_duration 		= [];
RGG_JTAC_durationBool	= false;

RGG_JTAC_confirm 		= [];
RGG_JTAC_confirmBool	= false;


issues:

*/

while {RGG_JTAC_NumInputBool} do {
	
	// local variable here counts the entry of inputted values
	_countRGG_JTAC_mission		= count RGG_JTAC_mission;	// q1 	 	
	_countRGG_JTAC_grid	 		= count RGG_JTAC_grid;		// q2	
	_countRGG_JTAC_approach	 	= count RGG_JTAC_approach;	// q3
	_countRGG_JTAC_egress		= count RGG_JTAC_egress;	// q4	
	_countRGG_JTAC_target	 	= count RGG_JTAC_target;	// q5
	_countRGG_JTAC_ord	 		= count RGG_JTAC_ord;		// q6
	_countRGG_JTAC_danger	 	= count RGG_JTAC_danger;	// q7
	_countRGG_JTAC_colour	 	= count RGG_JTAC_colour;	// q8
	_countRGG_JTAC_id	 		= count RGG_JTAC_id;		// q9
	_countRGG_JTAC_confirm 		= count RGG_JTAC_confirm;	// confirm / cancel
	// _countRGG_JTAC_duration 	= count RGG_JTAC_duration;	
	// _countRGG_JTAC_helis	 	= count RGG_JTAC_helis;	


	// q1 - mission state / CAS or Recon
	if (RGG_JTAC_missionBool) then {
		// CAS Mission
		if (_countRGG_JTAC_mission == 1) then {
			switch (RGG_JTAC_mission) do {
				case (1): { 
					systemChat "CAS Misison Selected";  
					systemChat "Now confirm 10-Digit Target Grid ";
					RGG_JTAC_missionBool 	= false;
					RGG_JTAC_gridBool 		= true;
				};
				case (2): { systemChat "Recon Misison Selected - not built yet - do not select"; };
			};
		};
	};

	// q2 grid state 
	if (RGG_JTAC_gridBool) then {
		if (_countRGG_JTAC_grid == 10) then {
			systemChat "Mission Grid Accepted";
			systemChat "Please confirm approach vector";
			systemChat "enter 3 digits";
			RGG_JTAC_gridBool 		= false;
			RGG_JTAC_approachBool 	= true;
		};
	};

	// q3 approach state 
	if (RGG_JTAC_approachBool) then {
		if (_countRGG_JTAC_approach == 3) then {
			systemChat "Attack Vector Accepted";
			systemChat "Please confirm exit vector";
			systemChat "enter 3 digits";
			RGG_JTAC_approachBool 	= false;
			RGG_JTAC_egressBool 	= true;
		};
	};

	// q4 egress state 
	if (RGG_JTAC_egressBool) then {
		if (_countRGG_JTAC_egress == 3) then {
			systemChat "Ergess Vector Accepted";
			systemChat "Please confirm Target Type";
			systemChat "1 - Infantry";
			systemChat "2 - Vehicle";
			systemChat "3 - Armour";
			RGG_JTAC_egressBool 	= false;
			RGG_JTAC_targetBool 	= true;
		};
	};

	// q5 target state 
	if (RGG_JTAC_targetBool) then {
		if (_countRGG_JTAC_target == 1) then {
			systemChat "Target Type Confirmed";
			systemChat "Please confirm Number of Gunships Required";
			systemChat "1 - 1 Heli";
			systemChat "2 - 2 Helis";
			systemChat "3 - 3 Helis";
			systemChat "4 - Anything in the area";
			RGG_JTAC_targetBool 	= false;
			RGG_JTAC_helisBool 		= true;
		};
	};

	// q5 heli state 
	// if (RGG_JTAC_helisBool) then {
	// 	if (_countRGG_JTAC_helis == 1) then {
	// 		systemChat "Heli Numbers Confirmed";
	// 		systemChat "Confirm ord required";
	// 		systemChat "1 - Guns";
	// 		systemChat "2 - Rockets";
	// 		systemChat "3 - Guns or Rockets";
	// 		systemChat "4 - Rocket Dump";
	// 		RGG_JTAC_helisBool 		= false;
	// 		RGG_JTAC_ordBool 		= true;
	// 	};
	// };

	// q6 ord state 
	if (RGG_JTAC_ordBool) then {
		if (_countRGG_JTAC_ord == 1) then {
			systemChat "Ammo Type Confirmed";
			systemChat "Is this considered DANGER CLOSE?";
			systemChat "1 - Yes Danger Close";
			systemChat "2 - No Danger Not Close";
			systemChat "3 - Unknown";
			RGG_JTAC_ordBool 		= false;
			RGG_JTAC_dangerBool 	= true;
		};
	};

	// q7 danger state 
	if (RGG_JTAC_dangerBool) then {
		if (_countRGG_JTAC_danger == 1) then {
			systemChat "Danger Close Confirmed";
			systemChat "Confirm Misison Colour";
			systemChat "1 - Red";
			systemChat "2 - Green";
			systemChat "3 - Blue";
			RGG_JTAC_dangerBool 	= false;
			RGG_JTAC_colourBool 	= true;
		};
	};

	// q8 colour state 
	if (RGG_JTAC_colourBool) then {
		if (_countRGG_JTAC_colour == 1) then {
			systemChat "Misison Colour Confirmed";
			systemChat "Confirm Mission ID";
			systemChat "1 - Alpha";
			systemChat "2 - Bravo";
			systemChat "3 - Charlie";
			systemChat "4 - Delta";
			systemChat "5 - Echo";
			RGG_JTAC_colourBool 	= false;
			RGG_JTAC_idBool 		= true;
		};
	};

	// q9 ID state 
	if (RGG_JTAC_idBool) then {
		if (_countRGG_JTAC_id == 1) then {
			systemChat "Mission ID Confirmed";
			systemChat "Confirm Mission Duration";
			systemChat "1 - 2 Minute";
			systemChat "2 - 4 Minutes";
			systemChat "3 - 6 Minutes";
			systemChat "4 - 8 Minutes";
			systemChat "5 - 10 Minutes";
			RGG_JTAC_idBool 		= false;
			RGG_JTAC_durationBool 	= true;
		};
	};

	// q10 duration state 
	// if (RGG_JTAC_durationBool) then {
	// 	if (_countRGG_JTAC_duration == 1) then {
	// 		systemChat "Mission Duration Confirmed";
	// 		systemChat "Please confirm or Cancel Mission";
	// 		systemChat "1 - CONFIRM";
	// 		systemChat "2 - CANCEL";
	// 		RGG_JTAC_durationBool 	= false;
	// 		RGG_JTAC_confirmBool 	= true;
	// 	};
	// };

	// confirm state 
	if (RGG_JTAC_confirmBool) then {
		if (_countRGG_JTAC_confirm == 1) then {
			switch (RGG_JTAC_confirm) do {
				case (1): { 
					systemChat "CAS Misison Confirmed";  
					RGG_JTAC_confirmBool 	= false;
					RGG_JTAC_NumInputBool	= false;
					execVM "autoPatrolSystem/JTAC_Systems/confirmExecute.sqf";
				};
				case (2): { 
					systemChat "CAS Mission Cancelled"; 
					RGG_JTAC_confirmBool 	= false;
					// RGG_JTAC_?Bool 			= true;
					// to be completed!
				};
			};
		};
	};

	sleep 0.1;
};	