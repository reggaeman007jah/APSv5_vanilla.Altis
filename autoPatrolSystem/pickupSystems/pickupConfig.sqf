hint "pickup config running";
sleep 1;
_heli = _this select 0;

_heli setVehicleVarName "transport1"; 
transport1 = _heli;
deploymentMission = false;
initPhase = false;
pickup = false;
wait = false;
dropoff = false;
complete = false;

// initialise pickup scripts 
hint "re-running pickup";
sleep 5;

waitUntil { isEngineOn transport1; }; 
execVM "autoPatrolSystem\pickupSystems\pickup.sqf";