_smoke = "SmokeShellYellow" createVehicle position heliTransport;

// [(_this select 0), ["smoke out from respawn", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];

// (_this select 0) addAction ["smoke out from respawn", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]; 