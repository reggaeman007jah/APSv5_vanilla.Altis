/*
from:	voiceActivatedSyncShot\initialiseVASS.sqf
to:		voiceActivatedSyncShot\clearKeyDowns.sqf
to:		voiceActivatedSyncShot\initialiseVASS.sqf	 
to: 	voiceActivatedSyncShot\execute\confirmExecute.sqf	

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:

*/

while {numericalInputbool} do {

	// counts entry of inputted values
	_confirmedNumber = count shotCount; // confirmed number of shots required 

	// data counters
	_shot1LatCount = count splash1CoordsLat;
	_shot1LonCount = count splash1CoordsLon;
	_shot2LatCount = count splash2CoordsLat;
	_shot2LonCount = count splash2CoordsLon;
	_shot3LatCount = count splash3CoordsLat;
	_shot3LonCount = count splash3CoordsLon;
	_shot4LatCount = count splash4CoordsLat;
	_shot4LonCount = count splash4CoordsLon;

	// this checks whether the call has has a 'final confirmation', and triggers action if yes
	_confirmedExecute = count splashConfirm; 


	// SHOT COUNT -----------------------------------------------------------------------------------------------------
	if (shotCountBool) then {
		_shotNumber = shotCount select 0;
		if (_confirmedNumber == 1) then {
			// this proves a number has been submitted but does not yet know the actual number
			if (_shotNumber == 1) then {
				systemChat "you chose 1 shot";
			};
			if (_shotNumber == 2) then {
				systemChat "you chose 2 shots";
			};
			if (_shotNumber == 3) then {
				systemChat "you chose 3 shots";
			};
			if (_shotNumber == 4) then {
				systemChat "you chose 4 shots";
			};
			
			systemChat "enter shot 1 / 5-grid lat";
			shotCountBool = false;
			shot1LatBool = true;
		};
	};

	// shot 1 -----------------------------------------------------------------------------------------------------
	if (shot1LatBool) then {
		if (_shot1LatCount == 5) then {
			systemChat "shot 1 - 5 digit latitude received...";
			systemChat str splash1CoordsLat;
			systemChat "now enter shot 1 longitude";
			shot1LatBool = false;
			shot1LonBool = true;
		};
	};
	if (shot1LonBool) then {
		if (_shot1LonCount == 5) then {
			systemChat "shot 1 - 5 digit longitude received...";
			systemChat str splash1CoordsLon;
			// here we need to know whether to process another shot or go to the execute section 
			_shotNumber = shotCount select 0;
			if (_shotNumber > 1) then {
				systemChat "now enter 5-grid lat for shot 2";
				shot1LonBool = false;
				shot2LatBool = true;
			} else {
				systemChat "press 1 to confirm or press / to cancel";
				shot1LonBool = false;
				executeSyncShotBool = true;
			};
		};
	};

	// shot 2 -----------------------------------------------------------------------------------------------------
	if (shot2LatBool) then {
		if (_shot2LatCount == 5) then {
			systemChat "shot 2 - 5 digit latitude received...";
			systemChat str splash2CoordsLat;
			systemChat "now enter shot 2 longitude";
			shot2LatBool = false;
			shot2LonBool = true;
		};
	};
	if (shot2LonBool) then {
		if (_shot2LonCount == 5) then {
			systemChat "shot 2 - 5 digit longitude received...";
			systemChat str splash2CoordsLon;
			// here we need to know whether to process another shot or go to the execute section 
			_shotNumber = shotCount select 0;
			if (_shotNumber > 2) then {
				systemChat "now enter 5-grid lat for shot 3";
				shot2LonBool = false;
				shot3LatBool = true;
			} else {
				systemChat "press 1 to confirm or press / to cancel";
				shot2LonBool = false;
				executeSyncShotBool = true;
			};
		};
	};

	// shot 3 -----------------------------------------------------------------------------------------------------
	if (shot3LatBool) then {
		if (_shot3LatCount == 5) then {
			systemChat "shot 3 - 5 digit latitude received...";
			systemChat str splash3CoordsLat;
			systemChat "now enter shot 3 longitude";
			shot3LatBool = false;
			shot3LonBool = true;
		};
	};
	if (shot3LonBool) then {
		if (_shot3LonCount == 5) then {
			systemChat "shot 3 - 5 digit longitude received...";
			systemChat str splash3CoordsLon;
			// here we need to know whether to process another shot or go to the execute section 
			_shotNumber = shotCount select 0;
			if (_shotNumber > 3) then {
				systemChat "now enter 5-grid lat for shot 4";
				shot3LonBool = false;
				shot4LatBool = true;
			} else {
				systemChat "press 1 to confirm or press / to cancel";
				shot3LonBool = false;
				executeSyncShotBool = true;
			};
		};
	};

	// shot 4 -----------------------------------------------------------------------------------------------------
	if (shot4LatBool) then {
		if (_shot4LatCount == 5) then {
			systemChat "shot 4 - 5 digit latitude received...";
			systemChat str splash4CoordsLat;
			systemChat "now enter shot 4 longitude";
			shot4LatBool = false;
			shot4LonBool = true;
		};
	};
	if (shot4LonBool) then {
		if (_shot4LonCount == 5) then {
			systemChat "shot 4 - 5 digit longitude received...";
			systemChat str splash4CoordsLon;
			systemChat "press 1 to confirm or press / to cancel";
			shot4LonBool = false;
			executeSyncShotBool = true;
		};
	};

	// FINAL EXECECUTE -----------------------------------------------------------------------------------------------------
	if (executeSyncShotBool) then {
		// should we parse things here before sending downstream?
		if (_confirmedExecute ==1) then {
			
			execVM "voiceActivatedSyncShot\execute\confirmExecute.sqf";
			// playSound "dangerClose7";
			executeSyncShotBool = false;
		};
	};
	sleep 0.1;
};	
	

















	// TYPE
	// if (artyTypeBool) then {

	// 	if (confirmedTypeHE == 1) then {
	// 		systemChat "High Explosive Barrage confirmed";
	// 		systemChat "Confirm latitude";
	// 		// playSound "dangerClose2";
	// 		artyTypeBool = false;
	// 		latCoordInputBool = true;
	// 	};

	// 	if (confirmedTypeSU == 1) then {
	// 		systemChat "GBU Hellfire confirmed";
	// 		systemChat "Confirm latitude";
	// 		artyTypeBool = false;
	// 		latCoordInputBool = true;
	// 	};

	// 	if (confirmedTypeSM == 1)  then {
	// 		systemChat "Smoke confirmed";
	// 		systemChat "Confirm colour";
	// 		systemChat '1 = white, 2 = red, 3 = green, 4 = blue';
	// 		systemChat '5 = orange, 6 = purple, 7 = yellow, 8 = IR';
	// 		artyTypeBool = false;
	// 		ordColourBool = true;
	// 	};

	// 	if (confirmedTypeFL == 1)  then {
	// 		systemChat "Flares confirmed";
	// 		systemChat "Confirm colour";
	// 		systemChat '1 = white, 2 = red, 3 = green, 4 = blue';
	// 		systemChat '5 = orange, 6 = purple, 7 = yellow, 8 = IR';
	// 		artyTypeBool = false;
	// 		ordColourBool = true;
	// 	};
	// };

	// COLOUR
	// if (ordColourBool) then {

	// 	if (confirmedColour == 1) then {

	// 		_colour = splashOrdColour select 0;

	// 		if (_colour == 1) then {
	// 			systemChat "white selected";

	// 		};
	// 		if (_colour == 2) then {
	// 			systemChat "red selected";

	// 		};
	// 		if (_colour == 3) then {
	// 			systemChat "green selected";

	// 		};
	// 		if (_colour == 4) then {
	// 			systemChat "blue selected";

	// 		};
	// 		if (_colour == 5) then {
	// 			systemChat "orange selected";

	// 		};
	// 		if (_colour == 6) then {
	// 			systemChat "purple selected";

	// 		};
	// 		if (_colour == 7) then {
	// 			systemChat "yellow selected";

	// 		};
	// 		if (_colour == 8) then {
	// 			systemChat "IR selected";

	// 		};

	// 		systemChat "now enter latitude";

	// 		ordColourBool = false;
	// 		latCoordInputBool = true;
	// 	};
	// };

	// LAT
	// if (latCoordInputBool) then {

	// 	if (confirmedTypeSU == 1) then {

	// 		if (confirmedLatDigits == 5) then {
	// 			systemChat "5 digit latitude received...";
	// 			systemChat str splashCoordsLat;
	// 			systemChat "now enter longitude";
				
	// 			latCoordInputBool = false;
	// 			lonCoordInputBool = true;
	// 		};

	// 	} else {

	// 		if (confirmedLatDigits == 4) then {

	// 			splashCoordsLat pushback 0;
	// 			systemChat "4 digit latitude received...";
	// 			systemChat str splashCoordsLat;
	// 			// playSound "dangerClose3";
	// 			systemChat "now enter longitude";
	// 			latCoordInputBool = false;
	// 			lonCoordInputBool = true;
	// 		};
	// 	};
	// };
	
	// LON
	// if (lonCoordInputBool) then {

	// 	if (confirmedTypeSU == 1) then {

	// 		if (confirmedLonDigits == 5) then {
	// 			systemChat "5 digit longitude received...";
	// 			systemChat str splashCoordsLat;
	// 			// next question we should ask here - confirm fire mission or adjust fire 
	// 			// adjustFireBool 
	// 			// if false, then confirmActionBool = true 
	// 			// if true, then adjustingFireBool = true 
	// 			// if adjustingFireBool = true, then inputs are..
	// 			// "left .2 0", or "left .8 5".
	// 			// this adds this amount to the heading value 
	// 			// incomplete - this is wrong ^^

	// 			systemChat "final confirmation needed";
	// 			lonCoordInputBool = false;
	// 			confirmActionBool = true;
	// 		};
			
	// 	} else {

	// 		if (confirmedLonDigits == 4) then {

	// 			splashCoordsLon pushback 0;
	// 			systemChat "4 digit longitude received...";
	// 			systemChat str splashCoordsLat;
	// 			systemChat "now confirm number of rounds";
	// 			// playSound "dangerClose4";
	// 			lonCoordInputBool = false;
	// 			roundsInputBool = true;
	// 		};
	// 	};
	// };

	// ROUNDS
	// if (roundsInputBool) then {

	// 	if (confirmedRounds == 3) then {

	// 		systemChat "rounds received...";
	// 		systemChat str splashRounds;
	// 		systemChat "now enter radius";
	// 		// playSound "dangerClose5";
	// 		roundsInputBool = false;
	// 		radiusInputBool = true;
	// 	};
	// };

	// RADIUS
	// if (radiusInputBool) then {

	// 	if (confirmedRadius == 3) then {

	// 		systemChat "radius confirmed...";
	// 		systemChat str splashRadius;
	// 		systemChat "press 1 to confirm fire mission";
	// 		// playSound "dangerClose6";
	// 		systemChat "press 0 to ABORT";
	// 		confirmActionBool = true;
	// 		radiusInputBool = false;
	// 	};
	// };

	// EXECUTE
	// if (confirmActionBool) then {
	// 		execVM "voiceActivatedArty\confirmExecute.sqf";
	// 		confirmActionBool = false;
	// 	};

	// if (confirmActionBool) then {

	// 	if (confirmedExecute == 1) then {

	// 		_goodToGo = splashConfirm select 0;
			
	// 		if (_goodToGo == 1) then {

	// 			if (confirmedTypeHE == 1) then {
	// 				execVM "voiceActivatedArty\execute\confirmExecute.sqf";
	// 				// playSound "dangerClose7";
	// 				confirmActionBool = false;
	// 			};

	// 			if (confirmedTypeSU == 1) then {
	// 				execVM "voiceActivatedArty\execute\confirmExecute.sqf";
	// 				confirmActionBool = false;
	// 			};

	// 			if (confirmedTypeSM == 1)  then {
	// 				execVM "voiceActivatedArty\execute\confirmExecute.sqf";
	// 				confirmActionBool = false;
	// 			};

	// 			if (confirmedTypeFL == 1)  then {
	// 				execVM "voiceActivatedArty\execute\confirmExecute.sqf";
	// 				confirmActionBool = false;
	// 			};
			// ^^ that .. yeah I know .. i know..
			// I may use diff scripts at some point, but I know  
	// 		};

	// 		if (_goodToGo == 0) then {

	// 			execVM 'voiceActivatedArty\clearKeyDowns.sqf';
	// 			systemChat "MISSION ABORT... from last stage of KDM script - feb 2020";
	// 			execVM "voiceActivatedArty\initialiseVAA.sqf";
	// 		};
	// 	};
	// };
	
