/*
From: initServer.sqf 
*/

waitUntil { isEngineOn transport1; }; 
execVM "autoPatrolSystem\pickupSystems\pickup.sqf";