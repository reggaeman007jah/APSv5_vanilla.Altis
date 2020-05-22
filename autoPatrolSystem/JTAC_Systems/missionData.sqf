// [_dataPos, _missionData, _missionTypeLabel, _ID_Label, _colourLabel] execVM "autoPatrolSystem\JTAC_Systems\missionData.sqf";

_anchor = _this select 0;
_missionType = _this select 1;
_missionID = _this select 2;
_missionCol = _this select 3;
_missionTarget = _this select 4;
_missionOrd = _this select 5;
_missionDanger = _this select 6;
_missionData = _missionType + " / " + _missionID + " " + _missionCol + " / " + _missionTarget + " / " + _missionOrd + " / " + _missionDanger;

// _tempDataMarker = createMarker [_stampToString, _dataPos];
_tempDataMarker = createMarker ["tempData", _anchor];
_tempDataMarker setMarkerText _missionData;
// _tempDataMarker setMarkerText " <<< DESTROY";
_tempDataMarker setMarkerType "mil_dot";
// _tempDataMarker setMarkerShape "ellipse";
// _tempDataMarker setMarkerSize [20,20];
// _tempDataMarker setMarkerColor "colorRed";
// _tempDataMarker setMarkerText _missionData;

// "Marker1" setMarkerText "You are here.";
// _tempDataMarker setMarkerColor _missionCol;
sleep 60;
	// sleep 0.1;
deleteMarker _tempDataMarker;