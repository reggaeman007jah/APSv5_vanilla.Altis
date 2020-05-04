/*
from:		executeSU.sqf 
to:

purpose:
to inflict more damage around the impact point, as the vanilla GBU does surprisingly little damage 

notes:
*/

_impact = _this select 0;

// hint str _impact;
/*
// createMarker
deleteMarker "blast1";
_marker1 = createMarker ["blast1", _pos];
_marker1 setMarkerShapeLocal "ELLIPSE";
// _marker1 setMarkerColorLocal "ColorRed";
_marker1 setMarkerSizeLocal [100, 100];
_marker1 setMarkerAlphaLocal 0.1;

/*
all units inAreaArray
setDamage 1;
*/

_marker1 = createMarker ["blast1", _impact];
_marker1 setMarkerShapeLocal "ELLIPSE";
_marker1 setMarkerColorLocal "ColorRed";
_marker1 setMarkerSizeLocal [40, 40];
_marker1 setMarkerAlphaLocal 0.1;

_units = allUnits inAreaArray "blast1";
{
	_x setDamage 1;
	// sleep 0.1;
} forEach _units;	

_marker2 = createMarker ["blast2", _impact];
_marker2 setMarkerShapeLocal "ELLIPSE";
_marker2 setMarkerColorLocal "ColorRed";
_marker2 setMarkerSizeLocal [60, 60];
_marker2 setMarkerAlphaLocal 0.5;

_units = allUnits inAreaArray "blast2";
{
	_x setDamage 0.7;
	// sleep 0.1;
} forEach _units;

deleteMarker "blast1";
deleteMarker "blast2";