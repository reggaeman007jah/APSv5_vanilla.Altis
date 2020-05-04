/*
from:		voiceActivatedArty\keyDownMonitor.sqf
to:			voiceActivatedArty\execute\executeHE.sqf
to:			voiceActivatedArty\execute\executeSU.sq
to:			voiceActivatedArty\execute\executeSM.sqf			/ not tested 
to:			voiceActivatedArty\execute\executeFLARES.sqf		/ not active
to:			voiceActivatedArty\execute\coordCache.sqf

purpose:
does some number parsing 
relays the entered data to player 
sends data to the execute script
it also sends data to a cache for further functions like - adjust fire 

the idea here is to be able to take and store the data from previous step, then either ask them to submit again or full close down 
call

notes:
*/

execVM "voiceActivatedArty\clearKeyDowns.sqf";
sleep 1;
execVM "voiceActivatedArty\initialiseVAA.sqf";

// if (artyType == SURGICAL) then {
// 	_parsed1Lat = splashCoordsLat joinString "0";
// 	_parsed1Lon = splashCoordsLon joinString "0";
// 	_parsed1Rnd = splashRounds joinString "0";
// 	_parsed1Rad = splashRadius joinString "0";
// } else {

//};

// this really needs to be a display!


/*
These next four sections enable the storing of 4 difference versions of a fire mission, effectively reusing the globals vars 
We need a system to recognise if any of these are 'filled' to either move onto to the next bucket, or to say "sorry, no more allowed"
*/

// SWITCH IS NEEDED HERE!!
// if this works this will really show the power of the switch ..
// compare to a run of if/thens ... switch will break out as soon as there's a match, which is exactly what we need here

// _randomNumber = floor random 1000;

// switch (true) do
// {	case (_randomNumber > 500):  {hint "more than 500"};
// 	case (_randomNumber < 500):  {hint "less than 500"};
// 	case (_randomNumber == 500): {hint "exactly 500"};
// };




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
	};
	default {hint "no more mate"};
};

// I need to now offer the player to re-do another shot, or continue with the fire mission 
systemChat "thank you for the selection - do you want another, or do you want to execute?";
systemChat "press 1 to add another shot, or press 2 to confirm and execute";



// shot 1 

// 	_parsed1Lat = splashCoordsLat joinString "";
// 	_parsed1Lon = splashCoordsLon joinString "";
// 	_parsed1Rnd = splashRounds joinString "";
// 	_parsed1Rad = splashRadius joinString "";
// 	_parsedLat = parseNumber _parsed1Lat;
// 	_parsedLon = parseNumber _parsed1Lon;
// 	_parsedRounds = parseNumber _parsed1Rnd;
// 	_parsedRadius = parseNumber _parsed1Rad;
// 	shot1Data = true;

// // shot 2

// 	_parsed1Lat2 = splashCoordsLat joinString "";
// 	_parsed1Lon2 = splashCoordsLon joinString "";
// 	_parsed1Rnd2 = splashRounds joinString "";
// 	_parsed1Rad2 = splashRadius joinString "";
// 	_parsedLat2 = parseNumber _parsed1Lat2;
// 	_parsedLon2 = parseNumber _parsed1Lon2;
// 	_parsedRounds2 = parseNumber _parsed1Rnd2;
// 	_parsedRadius2 = parseNumber _parsed1Rad2;
// 	shot2Data = true;


// // shot 3
// 	_parsed1Lat3 = splashCoordsLat joinString "";
// 	_parsed1Lon3 = splashCoordsLon joinString "";
// 	_parsed1Rnd3 = splashRounds joinString "";
// 	_parsed1Rad3 = splashRadius joinString "";
// 	_parsedLat3 = parseNumber _parsed1Lat3;
// 	_parsedLon3 = parseNumber _parsed1Lon3;
// 	_parsedRounds3 = parseNumber _parsed1Rnd3;
// 	_parsedRadius3 = parseNumber _parsed1Rad3;
// 	shot3Data = true;

// // shot 4
// 	_parsed1Lat4 = splashCoordsLat joinString "";
// 	_parsed1Lon4 = splashCoordsLon joinString "";
// 	_parsed1Rnd4 = splashRounds joinString "";
// 	_parsed1Rad4 = splashRadius joinString "";
// 	_parsedLat4 = parseNumber _parsed1Lat4;
// 	_parsedLon4 = parseNumber _parsed1Lon4;
// 	_parsedRounds4 = parseNumber _parsed1Rnd4;
// 	_parsedRadius4 = parseNumber _parsed1Rad4;
// 	shot4Data = true;




if (confirmedTypeHE == 1) then {
	systemChat "HE Rounds inbound";
	sleep 0.2;
	systemChat "Coords:";
	sleep 0.2;
	systemChat str _parsedLat;
	systemChat str _parsedLon;
	sleep 0.2;
	systemChat "Rounds:";
	sleep 0.2;
	systemChat str _parsedRounds;
	sleep 0.2;
	systemChat "Radius:";
	sleep 0.2;
	systemChat str _parsedRadius;
	sleep 0.2;
	systemChat "stand by...";
	sleep 5;
	[_parsedLat, _parsedLon, _parsedRounds, _parsedRadius] execVM "voiceActivatedArty\execute\executeHE.sqf";
	systemChat "incoming...";
};

if (confirmedTypeSU == 1) then {
	systemChat "Surgical Strike inbound";
	sleep 0.2;
	systemChat "Coords:";
	sleep 0.2;
	systemChat str _parsedLat;
	systemChat str _parsedLon;
	sleep 0.2;
	systemChat "stand by...";
	sleep 5;
	[_parsedLat, _parsedLon] execVM "voiceActivatedArty\execute\executeSU.sqf";
	// store SU coords in memory
	[_parsedLat, _parsedLon] execVM "voiceActivatedArty\execute\coordCache.sqf";
	systemChat "incoming...";
};

if (confirmedTypeSM == 1) then {
	systemChat "Smoke inbound";
	sleep 0.2;
	systemChat str splashOrdColour;
	systemChat "Coords:";
	sleep 0.2;
	systemChat str _parsedLat;
	systemChat str _parsedLon;
	sleep 0.2;
	systemChat "Number:";
	sleep 0.2;
	systemChat str _parsedRounds;
	sleep 0.2;
	systemChat "Radius:";
	sleep 0.2;
	systemChat str _parsedRadius;
	sleep 0.2;
	systemChat "stand by...";
	sleep 5;
	[_parsedLat, _parsedLon, _parsedRounds, _parsedRadius] execVM "voiceActivatedArty\execute\executeSM.sqf";
	systemChat "incoming...";
};


// we want the above to run, send data to execute ... but then also fire keyDownMon again.. 













// if (confirmedTypeFL == 1) then {
// 	systemChat "Flares inbound";
// 	sleep 0.2;
// 	systemChat str ordColour;
// 	systemChat "Coords:";
// 	sleep 0.2;
// 	systemChat str _parsedLat;
// 	systemChat str _parsedLon;
// 	sleep 0.2;
// 	systemChat "Number:";
// 	sleep 0.2;
// 	systemChat str _parsedRounds;
// 	sleep 0.2;
// 	systemChat "Radius:";
// 	sleep 0.2; // interval???
// 	systemChat str _parsedRadius;
// 	sleep 0.2;
// 	systemChat "stand by...";
// 	sleep 5;
// 	[_parsedLat, _parsedLon, _parsedRounds, _parsedRadius] execVM "voiceActivatedArty\execute\executeFLARES.sqf";
// 	systemChat "incoming...";
// };
