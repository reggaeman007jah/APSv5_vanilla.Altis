// [_this, ["Greetings Yo!", {hint "Hello You!"}]] remoteExec ["addAction"];
sleep 2; 

REARMONSPAWN = true;

_heli = _this select 0;
[_heli, ["<t color='#FF0000'>DROP RED SMOKE</t>", {_smoke = "SmokeShellRed" createVehicle position (_this select 0);},nil,1.9,true,true,"","true", 2]] remoteExec ["addAction"];
[_heli, ["<t color='#00FF00'>DROP GREEN SMOKE</t>", {_smoke = "SmokeShellGreen" createVehicle position (_this select 0);},nil,1.9,true,true,"","true", 2]] remoteExec ["addAction"];
[_heli, ["<t color='#0000FF'>DROP BLUE SMOKE</t>", {_smoke = "SmokeShellBlue" createVehicle position (_this select 0);},nil,1.9,true,true,"","true", 2]] remoteExec ["addAction"];
[_heli, ["<t color='#FFA500'>DROP ORANGE SMOKE</t>", {_smoke = "SmokeShellOrange" createVehicle position (_this select 0);},nil,1.9,true,true,"","true", 2]] remoteExec ["addAction"];
[_heli, ["<t color='#FFFF00'>DROP YELLOW SMOKE</t>", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);},nil,1.9,true,true,"","true", 2]] remoteExec ["addAction"];
[_heli, ["<t color='#6D00C1'>DROP PURPLE SMOKE</t>", {_smoke = "SmokeShellPurple" createVehicle position (_this select 0);},nil,1.9,true,true,"","true", 2]] remoteExec ["addAction"];
[_heli, ["DROP WHITE SMOKE", {_smoke = "SmokeShellWhite" createVehicle position (_this select 0);},nil,1.9,true,true,"","true", 2]] remoteExec ["addAction"];
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

