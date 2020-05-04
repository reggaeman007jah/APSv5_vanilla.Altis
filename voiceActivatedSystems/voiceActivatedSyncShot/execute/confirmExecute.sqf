hint "confirm execute";

systemChat str splash1CoordsLat;
systemChat str splash1CoordsLon;
systemChat str splash2CoordsLat;
systemChat str splash2CoordsLon;
systemChat str splash3CoordsLat;
systemChat str splash3CoordsLat;
systemChat str splash4CoordsLat;
systemChat str splash4CoordsLat;

// concat individual string data 
_parsed1Lat = splash1CoordsLat joinString "";
_parsed1Lon = splash1CoordsLon joinString "";
_parsed2Lat = splash2CoordsLat joinString "";
_parsed2Lon = splash2CoordsLon joinString "";
_parsed3Lat = splash3CoordsLat joinString "";
_parsed3Lon = splash3CoordsLon joinString "";
_parsed4Lat = splash4CoordsLat joinString "";
_parsed4Lon = splash4CoordsLon joinString "";

// parse string data into enum
_1parsedLat = parseNumber _parsed1Lat;
_1parsedLon = parseNumber _parsed1Lon;
_2parsedLat = parseNumber _parsed2Lat;
_2parsedLon = parseNumber _parsed2Lon;
_3parsedLat = parseNumber _parsed3Lat;
_3parsedLon = parseNumber _parsed3Lon;
_4parsedLat = parseNumber _parsed4Lat;
_4parsedLon = parseNumber _parsed4Lon;

// combine enums into location data
_strike1 = [_1parsedLat, _1parsedLon];
_strike2 = [_2parsedLat, _2parsedLon];
_strike3 = [_3parsedLat, _3parsedLon];
_strike4 = [_4parsedLat, _4parsedLon];

RGG_reset = {
	sleep 2;
	systemChat "clearing data";
	execVM "voiceActivatedSyncShot\clearKeyDowns.sqf";
	execVM "voiceActivatedSyncShot\VASS_init.sqf";
};

sleep 20;

_shotNumber = shotCount select 0;

if (_shotNumber == 1) then {
	// shot 1
	_finalStrike1 = "Bo_GBU12_LGB" createVehicle _strike1;
	call RGG_reset;
};

if (_shotNumber == 2) then {
	// shot 2
	_finalStrike1 = "Bo_GBU12_LGB" createVehicle _strike1;
	sleep 1;
	_finalStrike2 = "Bo_GBU12_LGB" createVehicle _strike2;
	call RGG_reset;
};

if (_shotNumber == 3) then {
	// shot 3
	_finalStrike1 = "Bo_GBU12_LGB" createVehicle _strike1;
	sleep 1.9;
	_finalStrike2 = "Bo_GBU12_LGB" createVehicle _strike2;
	sleep 1;
	_finalStrike3 = "Bo_GBU12_LGB" createVehicle _strike3;
	call RGG_reset;
};

if (_shotNumber == 4) then {
	// shot 4
	_finalStrike1 = "Bo_GBU12_LGB" createVehicle _strike1;
	sleep 1;
	_finalStrike2 = "Bo_GBU12_LGB" createVehicle _strike2;
	sleep 1.5;
	_finalStrike3 = "Bo_GBU12_LGB" createVehicle _strike3;
	sleep 1.2;
	_finalStrike4 = "Bo_GBU12_LGB" createVehicle _strike4;
	call RGG_reset;
};






/*

RGG_callSyncShot = {
	
	params ["_shell", "_origin", "_radius", "_count"];

	while {_count = _count - 1; _count >= 0} do {

		private _int = selectRandom [1, 2, 4, 8];
		private _dir = random 360;
		private _rad = 1;
		private _prj = _shell createVehicle (_origin getPos [_rad, _dir]);		
		sleep _int;
		[_origin] execVM "voiceActivatedArty\execute\damageMaker.sqf";
	};


	numericalInputBool = false;
	deleteMarker "gun1";
	// execVM "voiceActivatedArty\initialiseVAA.sqf";
	
};

["Bo_GBU12_LGB", _pos, 1, 1] call RGG_callSyncShot;