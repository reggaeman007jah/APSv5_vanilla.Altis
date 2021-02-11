hint "pickup config running";
"Transport Heli Init" remoteExec ["hint", 0, true];

sleep 2;
_heli = _this select 0;

_heli setVehicleVarName "transport2a"; 
transport2a = _heli;
deploymentMission2 = false;
initPhase2 = false;
pickup2 = false;
wait2 = false;
dropoff2 = false;
complete2 = false;

// initialise pickup scripts 
"Transport 2 Heli Ready" remoteExec ["hint", 0, true];
format ["Debug - Heli Var: %1", _heli] remoteExec ["systemChat", 0];

sleep 5;

waitUntil { isEngineOn transport2a; }; 
execVM "autoPatrolSystem\pickupSystems\pickup2.sqf";
