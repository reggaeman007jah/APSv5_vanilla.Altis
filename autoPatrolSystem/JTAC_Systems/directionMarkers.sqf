_anchor = _this select 0;
_attack1 = _this select 1;
_attack2 = _this select 2;
_attack3 = _this select 3;
_exit1 = _this select 4;
_exit2 = _this select 5;
_exit3 = _this select 6;


// _testMarker1 = createMarker ["anchor", _anchor];
// _testMarker1 setMarkerShape "ELLIPSE";
// _testMarker1 setMarkerSize [20,20];
// _testMarker1 setMarkerColor "colorRed";


for "_i" from 1 to 20 do { 
_testMarker2 = createMarker ["attack1", _attack1];
_testMarker2 setMarkerShape "ELLIPSE";
_testMarker2 setMarkerSize [20,20];
_testMarker2 setMarkerColor "colorRed";
sleep 0.2;
deleteMarker _testMarker2;

_testMarker3 = createMarker ["attack2", _attack2];
_testMarker3 setMarkerShape "ELLIPSE";
_testMarker3 setMarkerSize [20,20];
_testMarker3 setMarkerColor "colorRed";
sleep 0.2;
deleteMarker _testMarker3;

_testMarker4 = createMarker ["attack3", _attack3];
_testMarker4 setMarkerShape "ELLIPSE";
_testMarker4 setMarkerSize [20,20];
_testMarker4 setMarkerColor "colorRed";
sleep 0.2;
deleteMarker _testMarker4;

_testMarker7 = createMarker ["attack6", _exit3];
_testMarker7 setMarkerShape "ELLIPSE";
_testMarker7 setMarkerSize [20,20];
_testMarker7 setMarkerColor "colorRed";
sleep 0.2;
deleteMarker _testMarker7;

_testMarker6 = createMarker ["attack5", _exit2];
_testMarker6 setMarkerShape "ELLIPSE";
_testMarker6 setMarkerSize [20,20];
_testMarker6 setMarkerColor "colorRed";
sleep 0.2;
deleteMarker _testMarker6;

_testMarker5 = createMarker ["attack4", _exit1];
_testMarker5 setMarkerShape "ELLIPSE";
_testMarker5 setMarkerSize [20,20];
_testMarker5 setMarkerColor "colorRed";
sleep 0.2;
deleteMarker _testMarker5;

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