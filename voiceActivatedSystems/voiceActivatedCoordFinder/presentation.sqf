/*
from:	VACF_execute.sqf 
to:		voiceActivatedCoordFinder\RSCnums\RSCText.sqf			/ once, after processing 
to: 	voiceActivatedCoordFinder\VACF_dataStorage.sqf 

purpose:
this ensures that there are aways 5 digits in lat and lon, regardless of prefixed zeros 
depending on the location generated, there may be one or two zeros at the beginning of the data 
this means that they will not be rendered, so this script ensures that there are always 5 digits in a lat or lon
it then pushes the data onward for RSC presentation 

notes:
I need to change the name of this file, to have VACF prefix, but need to check for potential breakages before doing so 
*/

_lan = _this select 0;
_lon = _this select 1;
_stringTestLan	= [_lan] joinString "";
_countTestLan = count _stringTestLan;
_stringTestLon	= [_lon] joinString "";
_countTestLon = count _stringTestLon;

if (_countTestLan == 4) then {
	systemChat "Lat";
	_fiveNum = "0" + _stringTestLan;
	_stringTestLan = _fiveNum;
}; 

if (_countTestLan == 3) then {
	systemChat "Lat";
	_fiveNum = "00" + _stringTestLan;
	_stringTestLan = _fiveNum;
}; 

if (_countTestLon == 4) then {
	_fiveNum = "0" + _stringTestLon;
	_stringTestLon = _fiveNum;
};

if (_countTestLon == 3) then {
	_fiveNum = "00" + _stringTestLon;
	_stringTestLon = _fiveNum;
}; 

// [_stringTestLan, _stringTestLon]execVM "voiceActivatedCoordFinder\RSCnums\RSCText.sqf";
[_stringTestLan, _stringTestLon]execVM "voiceActivatedCoordFinder\VACF_dataStorage.sqf";




















// for "_i" from 1 to 5 do { 

// 	if (_countTestLan == 4) then {
// 		systemChat "Lan";
// 		_fiveNum = "0" + _stringTestLan;
// 		systemChat str _fiveNum;
// 	} else {
// 		systemChat "Lan";
// 		systemChat str _stringTestLan;
// 	};

// 	if (_countTestLon == 4) then {
// 		systemChat "Lon";
// 		_fiveNum = "0" + _stringTestLon;
// 		systemChat str _fiveNum;
// 	} else {
// 		systemChat "Lon";
// 		systemChat str _stringTestLon;
// 	};

// 	sleep 12; 
// };

// execVM "voiceActivatedCoordFinder\RSCText.sqf"



	// if (_countTestLan == 4) then {
	// 	systemChat "Lat";
	// 	_fiveNum = "0" + _stringTestLan;
	// 	_stringTestLan = _fiveNum;
	// 	// systemChat str _stringTestLan;
	// } else {
	// 	// systemChat "Lat";
	// 	// systemChat str _stringTestLan;
	// };

	// if (_countTestLon == 4) then {
	// 	// systemChat "Lon";
	// 	_fiveNum = "0" + _stringTestLon;
	// 	_stringTestLon = _fiveNum;
	// 	// systemChat str _stringTestLon;
	// } else {
	// 	// systemChat "Lon";
	// 	// systemChat str _stringTestLon;
	// };
















// _cnt = count units group player; // returns number of units in player group