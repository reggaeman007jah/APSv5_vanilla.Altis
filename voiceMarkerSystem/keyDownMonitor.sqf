/*
from:		voiceMarkerSystem\1_vmsInit.sqf
to:			voiceMarkerSystem\
to:			voiceMarkerSystem\ 
to: 		voiceMarkerSystem\

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:

issues:

*/

while {RGG_VMS_NumInputBool} do {
	
	// counts entry of inputted values
	_countRGG_VMS_Distance 	= count RGG_VMS_Distance;
	_countRGG_VMS_Confirm 	= count RGG_VMS_Confirm;
	_countRGG_VMS_Cancel 	= count RGG_VMS_Cancel;

	// distance state
	if (RGG_VMS_DistanceBool) then {
		if (_countRGG_VMS_Distance == 1) then {
			systemChat "VMS Distance confirmed";
			systemChat "Confirm (1) or Cancel (2)";
			// playSound "dangerClose2";
			// playsound via VA 
			RGG_VMS_DistanceBool = false;
			RGG_VMS_ConfirmBool = true;
		};
	};

	// confirm / cancel state 
	if (RGG_VMS_ConfirmBool) then {
		if (_countRGG_VMS_Confirm == 1) then {
			systemChat "selection made";
			_playerLookDir = eyePos player;
			[_playerLookDir] execVM "voiceMarkerSystem\confirmExecute.sqf";
			RGG_VMS_ConfirmBool = false;
		};
		if (_countRGG_VMS_Cancel == 1) then {
			// clear and restart 
		};
	};
	sleep 0.1;
};	
	