
_readyInjured = fullCrew vehicle heliTransport;
{
	_x orderGetIn false;
} forEach _readyInjured;	

{ unassignVehicle _x } forEach crew heliTransport;


