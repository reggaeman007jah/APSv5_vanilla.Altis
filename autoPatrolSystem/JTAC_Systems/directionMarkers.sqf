_anchor = 		_this select 0;
_attack1 = 		_this select 1;
_attack2 = 		_this select 2;
_attack3 = 		_this select 3;
_attack4 = 		_this select 4;
_attack5 = 		_this select 5;
_exit1 = 		_this select 6;
_exit2 = 		_this select 7;
_exit3 = 		_this select 8;
_colourLabel = 	_this select 9;
_entryVec1 = 	_this select 10;
_exitVec = 		_this select 11;

_entryVec = _entryVec1 + 180;
_sleep = 0.4;

for "_i" from 1 to 10 do { 

	_mk1 = createMarker ["attack1", _attack1];
	_mk1 setMarkerType "mil_arrow2";
	_mk1 setMarkerDir _entryVec;
	// _mk1 setMarkerShape "ELLIPSE";
	// _mk1 setMarkerSize [20,20];
	_mk1 setMarkerColor _colourLabel;
	sleep _sleep;

	deleteMarker _mk1;

	_mk2 = createMarker ["attack1", _attack2];
	_mk2 setMarkerType "mil_arrow2";
	_mk2 setMarkerDir _entryVec;
	// _mk2 setMarkerShape "ELLIPSE";
	// _mk2 setMarkerSize [20,20];
	_mk2 setMarkerColor _colourLabel;
	sleep _sleep;
	deleteMarker _mk2;

	_mk3 = createMarker ["attack2", _attack3];
	// _mk3 setMarkerShape "ELLIPSE";
	_mk3 setMarkerType "mil_arrow2";
	_mk3 setMarkerDir _entryVec;
	// _mk3 setMarkerSize [20,20];
	_mk3 setMarkerColor _colourLabel;
	sleep _sleep;
	deleteMarker _mk3;

	_mk4 = createMarker ["attack3", _attack4];
	// _mk4 setMarkerShape "ELLIPSE";
	_mk4 setMarkerType "mil_arrow2";
	_mk4 setMarkerDir _entryVec;
	// _mk4 setMarkerSize [20,20];
	_mk4 setMarkerColor _colourLabel;
	sleep _sleep;
	deleteMarker _mk4;

	_mk5 = createMarker ["attack4", _attack5];
	// _mk5 setMarkerShape "ELLIPSE";
	_mk5 setMarkerType "mil_arrow2";
	_mk5 setMarkerDir _entryVec;
	// _mk5 setMarkerSize [20,20];
	_mk5 setMarkerColor _colourLabel;
	sleep _sleep;
	deleteMarker _mk5;

	sleep _sleep;

	_mk6 = createMarker ["attack5", _exit1];
	// _mk6 setMarkerShape "ELLIPSE";
	// _mk6 setMarkerSize [20,20];
	_mk6 setMarkerType "mil_arrow2";
	_mk6 setMarkerDir _exitVec;
	_mk6 setMarkerColor _colourLabel;
	_mk6 setMarkerAlpha 0.9;
	sleep _sleep;
	deleteMarker _mk6;

	_mk7 = createMarker ["attack6", _exit2];
	// _mk7 setMarkerShape "ELLIPSE";
	// _mk7 setMarkerSize [20,20];
	_mk7 setMarkerType "mil_arrow2";
	_mk7 setMarkerDir _exitVec;
	_mk7 setMarkerColor _colourLabel;
	_mk7 setMarkerAlpha 0.7;
	sleep _sleep;
	deleteMarker _mk7;

	_mk8 = createMarker ["attack7", _exit3];
	// _mk8 setMarkerShape "ELLIPSE";
	// _mk8 setMarkerSize [20,20];
	_mk8 setMarkerType "mil_arrow2";
	_mk8 setMarkerDir _exitVec;
	_mk8 setMarkerColor _colourLabel;
	_mk8 setMarkerAlpha 0.5;
	sleep _sleep;
	deleteMarker _mk8;

	sleep 1;
};


// deleteMarker _testMarker2;
// deleteMarker _testMarker3;
// deleteMarker _testMarker4;
// deleteMarker _testMarker5;
// deleteMarker _testMarker6;
// deleteMarker _testMarker7;







// 		_tempMarker = createMarker [_stampToString, _10Grid];
// _tempMarker setMarkerText " --<-- Attack";
// 		// _tempMarker setMarkerShape "ELLIPSE";
// 		// _tempMarker setMarkerType "mil_triangle";
// 		_tempMarker setMarkerType "mil_destroy";
// 		// _tempMarker setMarkerSize [20, 20];
// 		// _tempMarker setMarkerAlpha 0.8;
// 		_tempMarker setMarkerColor _markerCol;
// 		_angle = _angle + 5;
// 		_tempMarker setMarkerDir _angle;