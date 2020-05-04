/*
from:	
to:				

purpose:
loop-listener that validates user input, and changes state at correct times 
*/

while {VADM_numericalInputbool} do {

	// see a list 
	// choose a number to edit
	// choose a label to add 
	// close / repeat 

	confirmedItem 	= count VADM_selectedItem; // should be 1 
	confirmedLabel 	= count VADM_selectedLabel; // should be 1 
	confirmClose 	= count VADM_confirm; // should be 1

	if (VADM_selectItemBool) then {
		if (confirmedItem == 1) then {
			_item = VADM_selectedItem select 0;
			if (_item == 1) then {
				systemChat "item 1 selected";
			};
			if (_item == 2) then {
				systemChat "item 2 selected";
			};
			if (_item == 3) then {
				systemChat "item 3 selected";
			};
			if (_item == 4) then {
				systemChat "item 4 selected";
			};
			if (_item == 5) then {
				systemChat "item 5 selected";
			};
			if (_item == 6) then {
				systemChat "item 6 selected";
			};
			if (_item == 7) then {
				systemChat "item 7 selected";
			};
			if (_item == 8) then {
				systemChat "item 8 selected";
			};
			systemChat "now select label";

			VADM_selectItemBool = false;
			VADM_selectLabelBool = true;
		};
		// if (confirmClose == 1) then {
		// 	systemChat "closing app";
		// };
	};

	if (VADM_selectLabelBool) then {
		if (confirmedLabel == 1) then {
			_item = VADM_selectedLabel select 0;
			if (_item == 1) then {
				systemChat "primary objective selected";
			};
			if (_item == 2) then {
				systemChat "secondary objective selected";
			};
			if (_item == 3) then {
				systemChat "staging 1 selected";
			};
			if (_item == 4) then {
				systemChat "staging 2 selected";
			};
			if (_item == 5) then {
				systemChat "alpha point selected";
			};
			if (_item == 6) then {
				systemChat "bravo point selected";
			};
			if (_item == 7) then {
				systemChat "charlie point selected";
			};
			if (_item == 8) then {
				systemChat "delta point selected";
			};
			systemChat "now press 1 to confirm or 2 to go back, or / to close";
			VADM_selectLabelBool = false;
			VADM_confirmBool = true;
		};
	};

	if (VADM_confirmBool) then {
		if (confirmClose == 1) then {
			_item = VADM_confirm select 0;
			if (_item == 1) then {
				systemChat "confirmed";
				_sendItem = VADM_selectedItem select 0;
				_sendLabel = VADM_selectedLabel select 0;
				[_sendItem, _sendLabel] execVM "voiceActivatedDataManager\updateData.sqf";
				VADM_confirmBool = false;
			};
			if (_item == 2) then {
				systemChat "Returned to main menu without making a selection";
				VADM_selectedItem		= [];	
				VADM_selectedLabel		= [];	
				VADM_confirm			= [];
				VADM_confirmBool 		= false;
				VADM_selectItemBool		= true;
			};
		};
	};
	sleep 0.2; 
};	

/*

	// counts / validates the correct numbers are held in each array
	confirmedHeading = count VACF_Heading; // should be 3 // actually this will now be 5 - i.e. adding two decimal places to the input to enhahnce accuracy
	confirmedDistance = count VACF_Distance; // should be 4 // upto 9999m 
	
	// Heading
	if (VACF_headingBool) then {
		if (confirmedHeading == 5) then {
			// systemChat "heading received...";
			// systemChat str VACF_Heading;
			// systemChat "now enter distance";
			VACF_headingBool = false;
			VACF_distanceBool = true;
		};
	};

	// Distance
	if (VACF_distanceBool) then {
		if (confirmedDistance == 4) then {
			// systemChat "distance received...";
			// systemChat str VACF_Distance;
			systemChat "vacf processing...";
			VACF_distanceBool = false;
			VACF_showCoords = true;
		};
	};

	// Progress  
	if (VACF_showCoords) then {
		execVM "voiceActivatedCoordFinder\VACF_prepareCoords.sqf";
		// systemChat "called prepareCoords";
		VACF_showCoords = false;
	};