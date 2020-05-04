/*
from:	voiceActivatedCoordFinder\VACF_prepareCoords.sqf 
to:		voiceActivatedCoordFinder\VACF_clearKeyDowns.sqf 		/ once, to cancel all existing KDEHs 
to:		voiceActivatedCoordFinder\presentation.sqf 				/ once, to send data for presentation 
to:		voiceActivatedCoordFinder\initialiseVACF.sqf 			/ once, to restart the prcess again 

purpose:	
initiate the removal of existing keydowns for this module 
initiate the listener for this again 
RGG_callVACF function calcs the payload - 10-grid based on playerPos 
this converts data back into string, for on-screen pres  
*/

_VACF_heading = _this select 0;
_VACF_distance = _this select 1;

execVM "voiceActivatedCoordFinder\VACF_clearKeyDowns.sqf";
systemChat "processing data...";
sleep 1;

RGG_callVACF = {
	_VACF_result = player getPos [_VACF_distance, _VACF_heading];
	systemChat str _VACF_result;
	_lan = _VACF_result select 0;
	_lon = _VACF_result select 1;
	_lan = floor _lan;
	_lon = floor _lon;
	_stringify = [];
	_stringify pushback [_lan, _lon];
	[_lan, _lon] execVM "voiceActivatedCoordFinder\presentation.sqf"
};
[_VACF_heading, _VACF_distance] call RGG_callVACF;


// _countData = count VAMP_dataList; // determines how many items we have in the data list 

// systemChat "items in VAMP_dataList after data entry and just before re-init:";
// systemChat str _countData;

hint "initialising VACF";
execVM "voiceActivatedCoordFinder\initialiseVACF.sqf";


























// _lat = _this select 0;
// _lon = _this select 1;
// _rnd = _this select 2;
// _radi = _this select 3;
// _pos = [_lat, _lon];

// // createMarker
// deleteMarker "gun1";
// _marker1 = createMarker ["gun1", _pos];
// _marker1 setMarkerShapeLocal "ELLIPSE";
// _marker1 setMarkerColorLocal "ColorRed";
// _marker1 setMarkerSizeLocal [100, 100];
// _marker1 setMarkerAlphaLocal 0.9;

// // function
// RGG_callVACF = {
	
// 	numericalInput = false;
	
// 	params ["_shell", "_origin", "_radius", "_count"];

// 	while {_count = _count - 1; _count >= 0} do {

// 		private _int = selectRandom [1, 2, 4, 8];
// 		private _dir = random 360;
// 		private _rad = random _radius;
// 		private _prj = _shell createVehicle (_origin getPos [_rad, _dir]);		
// 		sleep _int;
// 	};
// 	systemChat "barrage over";

// 	numericalInputBool = false;
// 	deleteMarker "gun1";
// 	// execVM "voiceActivatedArty\initialiseVAA.sqf";
// 	systemChat "reactivating initVAA after calling strike";	
// 	execVM "voiceActivatedArty\initialiseVAA.sqf";
// };

// ["R_80mm_HE", _pos, _radi, _rnd] call RGG_callVACF;
