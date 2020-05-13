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
			_vdir = getCameraViewDirection player;
			_playerLookDir = _vdir # 0 atan2 _vdir # 1;
			_playerLookDir = round _playerLookDir;
			if (_playerLookDir < 0) then {
				_playerLookDir = _playerLookDir + 360;
			};
			_dist = (RGG_VMS_Distance select 0) * 100;
			// _dist = 200;
			[_dist, _playerLookDir] execVM "voiceMarkerSystem\confirmExecute.sqf";
			systemChat format ["player look dir is:%1", _playerLookDir];
			systemChat format ["marker distance is:%1", _dist];
			execVM "voiceMarkerSystem\clearKeyDowns.sqf";
			// execVM "voiceMarkerSystem\1_vmsInit.sqf";

			RGG_VMS_ConfirmBool = false;
		};
		if (_countRGG_VMS_Cancel == 1) then {
			// clear and restart 
		};
	};
	sleep 0.1;
};	

/*
_vdir = getCameraViewDirection player;
__playerLookDir = _vdir # 0 atan2 _vdir # 1;
_playerLookDir = round __playerLookDir;
if (_playerLookDir < 0) then {
	_playerLookDir = _playerLookDir + 360;
};