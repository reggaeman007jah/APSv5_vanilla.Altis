/*
from:		voiceActivatedArty\initialiseVAA.sqf
to:			voiceActivatedArty\clearKeyDowns.sqf
to:			voiceActivatedArty\initialiseVAA.sqf	 
to: 		voiceActivatedArty\execute\confirmExecute.sqf	/ makes booms

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:
unsure if the return loop back to initialiseVAA is correct .. should this go further back?

issues:
Sometimes aborting the call results in a freeze - test this more across all scripts 
*/

while {numericalInputbool} do {

	// ------------------------------------------- VALIDATION CONTROLS START
	// This Val-Ctrl section uses array entries to understand when something has been selected 
	// For example, if confirmedColour == 1, that simply means that a colour has been selected, but does not record the actual colour
	// Also note that not all items are called; HE will never require a colour input for ex.  
	// Further ex. SU will never require radius or number of rounds 
	
	// counts entry of inputted values
	confirmedTypeHE		= count splashArtyTypeHE;
	confirmedTypeSU		= count splashArtyTypeSU;
	// confirmedTypeSU2	= count splashArtyTypeSUx2;
	// confirmedTypeSU3	= count splashArtyTypeSUx3;
	// confirmedTypeSU4	= count splashArtyTypeSUx4;
	confirmedTypeSM		= count splashArtyTypeSM;
	confirmedTypeFL		= count splashArtyTypeFL;

	// this checks for 'any colour'
	confirmedColour	= count splashOrdColour;

	// this checks for the number of digits held in the lat/lon arrays (4 or 5 for SU)
	confirmedLatDigits = count splashCoordsLat;
	confirmedLonDigits = count splashCoordsLon;

	// this checks when Rounds has three numbers
	confirmedRounds	= count splashRounds;

	// this checks when Radius has three numbers
	confirmedRadius	= count splashRadius;

	// this checks whether the call has has a 'final confirmation', and triggers action if yes
	confirmedExecute = count splashConfirm;

	// ------------------------------------------- VALIDATION CONTROLS END

	// TYPE
	if (artyTypeBool) then {

		if (confirmedTypeHE == 1) then {
			systemChat "High Explosive Barrage confirmed";
			systemChat "Confirm latitude";
			// playSound "dangerClose2";
			artyTypeBool = false;
			latCoordInputBool = true;
		};

		if (confirmedTypeSU == 1) then {
			systemChat "Single GBU Hellfire confirmed";
			systemChat "Confirm latitude";
			artyTypeBool = false;
			latCoordInputBool = true;
		};

		// if (confirmedTypeSU2 == 1) then {
		// 	systemChat "Sequenced (x2) GBU Hellfires confirmed";
		// 	systemChat "Confirm latitude";
		// 	artyTypeBool = false;
		// 	latCoordInputBool = true;
		// };

		// if (confirmedTypeSUx3 == 1) then {
		// 	systemChat "Sequenced (x3) GBU Hellfires confirmed";
		// 	systemChat "Confirm latitude";
		// 	artyTypeBool = false;
		// 	latCoordInputBool = true;
		// };

		// if (confirmedTypeSUx4 == 1) then {
		// 	systemChat "Sequenced (x4) GBU Hellfires confirmed";
		// 	systemChat "Confirm latitude";
		// 	artyTypeBool = false;
		// 	latCoordInputBool = true;
		// };

		if (confirmedTypeSM == 1)  then {
			systemChat "Smoke confirmed";
			systemChat "Confirm colour";
			systemChat '1 = white, 2 = red, 3 = green, 4 = blue';
			systemChat '5 = orange, 6 = purple, 7 = yellow, 8 = IR';
			artyTypeBool = false;
			ordColourBool = true;
		};

		if (confirmedTypeFL == 1)  then {
			systemChat "Flares confirmed";
			systemChat "Confirm colour";
			systemChat '1 = white, 2 = red, 3 = green, 4 = blue';
			systemChat '5 = orange, 6 = purple, 7 = yellow, 8 = IR';
			artyTypeBool = false;
			ordColourBool = true;
		};
	};

	// COLOUR
	if (ordColourBool) then {

		if (confirmedColour == 1) then {

			_colour = splashOrdColour select 0;

			if (_colour == 1) then {
				systemChat "white selected";

			};
			if (_colour == 2) then {
				systemChat "red selected";

			};
			if (_colour == 3) then {
				systemChat "green selected";

			};
			if (_colour == 4) then {
				systemChat "blue selected";

			};
			if (_colour == 5) then {
				systemChat "orange selected";

			};
			if (_colour == 6) then {
				systemChat "purple selected";

			};
			if (_colour == 7) then {
				systemChat "yellow selected";

			};
			if (_colour == 8) then {
				systemChat "IR selected";

			};

			systemChat "now enter latitude";

			ordColourBool = false;
			latCoordInputBool = true;
		};
	};

	// LAT
	if (latCoordInputBool) then {

		if (confirmedTypeSU == 1) then {

			if (confirmedLatDigits == 5) then {
				systemChat "5 digit latitude received...";
				systemChat str splashCoordsLat;
				systemChat "now enter longitude";
				
				latCoordInputBool = false;
				lonCoordInputBool = true;
			};

		} else {

			if (confirmedLatDigits == 4) then {

				splashCoordsLat pushback 0;
				systemChat "4 digit latitude received...";
				systemChat str splashCoordsLat;
				// playSound "dangerClose3";
				systemChat "now enter longitude";
				latCoordInputBool = false;
				lonCoordInputBool = true;
			};
		};
	};
	
	// LON
	if (lonCoordInputBool) then {

		if (confirmedTypeSU == 1) then {

			if (confirmedLonDigits == 5) then {
				systemChat "5 digit longitude received...";
				systemChat str splashCoordsLat;
				// next question we should ask here - confirm fire mission or adjust fire 
				// adjustFireBool 
				// if false, then confirmActionBool = true 
				// if true, then adjustingFireBool = true 
				// if adjustingFireBool = true, then inputs are..
				// "left .2 0", or "left .8 5".
				// this adds this amount to the heading value 
				// incomplete - this is wrong ^^

				systemChat "final confirmation needed";
				lonCoordInputBool = false;
				// confirmActionBool = true; // here we add a new step...
				moreOrExecute = true;
			};
			
		} else {

			if (confirmedLonDigits == 4) then {

				splashCoordsLon pushback 0;
				systemChat "4 digit longitude received...";
				systemChat str splashCoordsLat;
				systemChat "now confirm number of rounds";
				// playSound "dangerClose4";
				lonCoordInputBool = false;
				roundsInputBool = true;
			};
		};
	};

	// NEW - ensure baseBools are set 
	if (moreOrExecute) then {
		// you now choose whether to add more to the call, or to execute 
		switch (true) do {	
			case (!shot1Data):  {
				_parsed1Lat = splashCoordsLat joinString "";
				_parsed1Lon = splashCoordsLon joinString "";
				_parsed1Rnd = splashRounds joinString "";
				_parsed1Rad = splashRadius joinString "";
				_parsedLat = parseNumber _parsed1Lat;
				_parsedLon = parseNumber _parsed1Lon;
				_parsedRounds = parseNumber _parsed1Rnd;
				_parsedRadius = parseNumber _parsed1Rad;
				shot1Data = true;
				systemChat "shot 1 confirmed - press 1 for another or 2 to execute or / to cancel";
			};
			case (!shot2Data):  {
				_parsed1Lat2 = splashCoordsLat joinString "";
				_parsed1Lon2 = splashCoordsLon joinString "";
				_parsed1Rnd2 = splashRounds joinString "";
				_parsed1Rad2 = splashRadius joinString "";
				_parsedLat2 = parseNumber _parsed1Lat2;
				_parsedLon2 = parseNumber _parsed1Lon2;
				_parsedRounds2 = parseNumber _parsed1Rnd2;
				_parsedRadius2 = parseNumber _parsed1Rad2;
				shot2Data = true;
				systemChat "shot 1 and 2 confirmed - press 1 for another or 2 to execute or / to cancel";
			};
			case (!shot3Data):  {
				_parsed1Lat3 = splashCoordsLat joinString "";
				_parsed1Lon3 = splashCoordsLon joinString "";
				_parsed1Rnd3 = splashRounds joinString "";
				_parsed1Rad3 = splashRadius joinString "";
				_parsedLat3 = parseNumber _parsed1Lat3;
				_parsedLon3 = parseNumber _parsed1Lon3;
				_parsedRounds3 = parseNumber _parsed1Rnd3;
				_parsedRadius3 = parseNumber _parsed1Rad3;
				shot3Data = true;
				systemChat "shot 1 2 and 3 confirmed - press 1 for one more or 2 to execute or / to cancel";
			};
			case (!shot4Data):  {
				_parsed1Lat4 = splashCoordsLat joinString "";
				_parsed1Lon4 = splashCoordsLon joinString "";
				_parsed1Rnd4 = splashRounds joinString "";
				_parsed1Rad4 = splashRadius joinString "";
				_parsedLat4 = parseNumber _parsed1Lat4;
				_parsedLon4 = parseNumber _parsed1Lon4;
				_parsedRounds4 = parseNumber _parsed1Rnd4;
				_parsedRadius4 = parseNumber _parsed1Rad4;
				shot4Data = true;
				systemChat "4 shots confirmed - that's it - press 2 to execute of / to cancel";
			};
			default {hint "no more mate"};
		};
	};

	// ROUNDS
	if (roundsInputBool) then {

		if (confirmedRounds == 3) then {

			systemChat "rounds received...";
			systemChat str splashRounds;
			systemChat "now enter radius";
			// playSound "dangerClose5";
			roundsInputBool = false;
			radiusInputBool = true;
		};
	};

	// RADIUS
	if (radiusInputBool) then {

		if (confirmedRadius == 3) then {

			systemChat "radius confirmed...";
			systemChat str splashRadius;
			systemChat "press 1 to confirm fire mission";
			// playSound "dangerClose6";
			systemChat "press 0 to ABORT";
			confirmActionBool = true;
			radiusInputBool = false;
		};
	};

	// EXECUTE
	// if (confirmActionBool) then {
	// 		execVM "voiceActivatedArty\confirmExecute.sqf";
	// 		confirmActionBool = false;
	// 	};

	if (confirmActionBool) then {

		if (confirmedExecute == 1) then {

			_goodToGo = splashConfirm select 0;
			
			if (_goodToGo == 1) then {

				if (confirmedTypeHE == 1) then {
					execVM "voiceActivatedArty\execute\confirmExecute.sqf";
					// playSound "dangerClose7";
					confirmActionBool = false;
				};

				if (confirmedTypeSU == 1) then {
					execVM "voiceActivatedArty\execute\confirmExecute.sqf";
					confirmActionBool = false;
				};

				if (confirmedTypeSM == 1)  then {
					execVM "voiceActivatedArty\execute\confirmExecute.sqf";
					confirmActionBool = false;
				};

				if (confirmedTypeFL == 1)  then {
					execVM "voiceActivatedArty\execute\confirmExecute.sqf";
					confirmActionBool = false;
				};
			// ^^ that .. yeah I know .. i know..
			// I may use diff scripts at some point, but I know  
			};

			if (_goodToGo == 0) then {

				execVM 'voiceActivatedArty\clearKeyDowns.sqf';
				systemChat "MISSION ABORT... from last stage of KDM script - feb 2020";
				execVM "voiceActivatedArty\initialiseVAA.sqf";
			};
		};
	};
	
	sleep 0.1;
};	
	