/*
Here we enable a pilot (MH-6) to be able to land, and run an addAction check to ID and then drawn in any injured units. 

As an aside, we can also think about moving injured units to a set location automatically. this will make medivac missions easier.



*/

_medivacPos = getPos heliTransport;
_medivac = createMarker ["medivac", _medivacPos];
_medivac setMarkerShape "ELLIPSE";
_medivac setMarkerColor "ColorBlue";
_medivac setMarkerSize [70, 70];
_medivac setMarkerAlpha 0.5;

_damageTrigger = 0.4; // change this value to set what constitutes an evac-worthy injury level

_readyInjured = allUnits inAreaArray "medivac";
{
	_inj = getDammage _x;
	if ((_inj) >= _damageTrigger) then {
		{
			_x assignAsCargo heliTransport;
			sleep 0.2;
		} forEach _readyInjured;
		_readyInjured orderGetIn true;
	};
} forEach _readyInjured;

deleteMarker "medivac";

		// _units = allUnits inAreaArray "extract";
		// {
		// 	_x assignAsCargo heli2;
		// 	sleep 0.2;
		// } forEach _units;	
		// _units orderGetIn true;