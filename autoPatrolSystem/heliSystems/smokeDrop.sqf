// [_this, ["Greetings Yo!", {hint "Hello You!"}]] remoteExec ["addAction"];
sleep 2; 

REARMONSPAWN = true;

_heli = _this select 0;
[_heli, ["Deploy Yellow Smoke", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
[_heli, ["Deploy Green Smoke", {_smoke = "SmokeShellGreen" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
[_heli, ["Deploy Blue Smoke", {_smoke = "SmokeShellBlue" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
[_heli, ["Deploy Orange Smoke", {_smoke = "SmokeShellOrange" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
[_heli, ["Deploy Purple Smoke", {_smoke = "SmokeShellPurple" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
[_heli, ["Deploy White Smoke", {_smoke = "SmokeShellWhite" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [(_this select 0), ["Deploy Yellow Smoke", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [(_this select 0), ["Deploy Green Smoke", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [(_this select 0), ["Deploy Blue Smoke", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [(_this select 0), ["Deploy Orange Smoke", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [(_this select 0), ["Deploy Purple Smoke", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [(_this select 0), ["Deploy White Smoke", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];


// _smoke = "SmokeShellYellow" createVehicle position heliTransport;

if (REARMONSPAWN) then {

	_heli setVehicleAmmo 0;

};