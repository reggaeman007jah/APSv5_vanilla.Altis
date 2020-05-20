/*
from:		voiceMarkerSystem\1_vmsInit.sqf
to:			voiceMarkerSystem\
to:			voiceMarkerSystem\ 
to: 		voiceMarkerSystem\

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:
achievements to IS!

issues:

*/

while {RGG_VMS_NumInputBool} do {
	
	// counts entry of inputted values
	_countRGG_VMS_Category  = count RGG_VMS_Category;
	_countRGG_VMS_Type		= count RGG_VMS_Type;
	_countRGG_VMS_Distance 	= count RGG_VMS_Distance;
	_countRGG_VMS_Confirm 	= count RGG_VMS_Confirm;
	_countRGG_VMS_Cancel 	= count RGG_VMS_Cancel;

	// category state
	if (RGG_VMS_CategoryBool) then {
		if (_countRGG_VMS_Category == 1) then {
			switch (RGG_VMS_Category) do {
				case (1): { systemChat "Blufor Type Selected";  };
				case (2): { systemChat "Indifor Type Selected"; };
				case (3): { systemChat "Opfor Type Selected";   };
			};
			systemChat "Now confirm Marker Type";
			systemChat "1 Infantry";
			systemChat "2 Motorized";
			systemChat "3 Mechanized";
			systemChat "4 Armor";
			systemChat "5 Artillery";
			RGG_VMS_CategoryBool = false;
			RGG_VMS_TypeBool = true;
		};
	};

	// type state
	if (RGG_VMS_TypeBool) then {
		if (_countRGG_VMS_Type == 1) then {
			switch (RGG_VMS_Type) do {
				case (1): { systemChat "Infantry Selected";   };
				case (2): { systemChat "Motorised Selected";  };
				case (3): { systemChat "Mechanised Selected"; };
				case (4): { systemChat "Armour Selected";     };
				case (5): { systemChat "Artillery Selected";  };
			};
			systemChat "now select distance";
			RGG_VMS_TypeBool = false;
			RGG_VMS_DistanceBool = true;
		};
	};

	// distance state
	if (RGG_VMS_DistanceBool) then {
		if (_countRGG_VMS_Distance == 1) then {
			systemChat "Marker Distance confirmed";
			systemChat "Confirm (1) or Cancel (2)";
			RGG_VMS_DistanceBool = false;
			RGG_VMS_ConfirmBool = true;
		};
	};

	// confirm / cancel state 
	if (RGG_VMS_ConfirmBool) then {
		if (_countRGG_VMS_Confirm == 1) then {
			_typeArray = RGG_VMS_Type;
			_type = _typeArray select 0;
			_categoryArray = RGG_VMS_Category;
			_category = _categoryArray select 0;
			_vdir = getCameraViewDirection player;
			_playerLookDir = _vdir # 0 atan2 _vdir # 1;
			_playerLookDir = round _playerLookDir;
			if (_playerLookDir < 0) then {
				_playerLookDir = _playerLookDir + 360;
			};
			_dist = (RGG_VMS_Distance select 0) * 100;
			[_category, _type, _dist, _playerLookDir] execVM "voiceMarkerSystem\confirmExecute.sqf";
			execVM "voiceMarkerSystem\clearKeyDowns.sqf";
			RGG_VMS_ConfirmBool = false;
		};
		if (_countRGG_VMS_Cancel == 1) then {
			// clear and restart 
			execVM "voiceMarkerSystem\clearKeyDowns.sqf";
			execVM "voiceMarkerSystem\confirmExecute.sqf";
		};
	};
	sleep 0.1;
};	