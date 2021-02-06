
sleep 2; 

REARMONSPAWN = true; // switch this to turn off the no-ammo system on respawn 

_heli = _this select 0;
// [_heli, ["<t color='#FF0000'>DROP RED SMOKE</t>", {_smoke = "SmokeShellRed" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [_heli, ["<t color='#00FF00'>DROP GREEN SMOKE</t>", {_smoke = "SmokeShellGreen" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [_heli, ["<t color='#0000FF'>DROP BLUE SMOKE</t>", {_smoke = "SmokeShellBlue" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [_heli, ["<t color='#FFA500'>DROP ORANGE SMOKE</t>", {_smoke = "SmokeShellOrange" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [_heli, ["<t color='#FFFF00'>DROP YELLOW SMOKE</t>", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [_heli, ["<t color='#6D00C1'>DROP PURPLE SMOKE</t>", {_smoke = "SmokeShellPurple" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// [_heli, ["DROP WHITE SMOKE", {_smoke = "SmokeShellWhite" createVehicle position (_this select 0);}]] remoteExec ["addAction"];

// _caller = _this select 1;
// _objPos = getPosATL _caller;
// _atl = _objPos select 2;

// if (_atl > 2) then {
// 	[_heli, ["<t color='#FF0000'>DROP RED SMOKE</t>", {_smoke = "SmokeShellRed" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// 	[_heli, ["<t color='#00FF00'>DROP GREEN SMOKE</t>", {_smoke = "SmokeShellGreen" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// 	[_heli, ["<t color='#0000FF'>DROP BLUE SMOKE</t>", {_smoke = "SmokeShellBlue" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// 	[_heli, ["<t color='#FFA500'>DROP ORANGE SMOKE</t>", {_smoke = "SmokeShellOrange" createVehicle position (_this select 0)}]] remoteExec ["addAction"];
// 	[_heli, ["<t color='#FFFF00'>DROP YELLOW SMOKE</t>", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// 	[_heli, ["<t color='#6D00C1'>DROP PURPLE SMOKE</t>", {_smoke = "SmokeShellPurple" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// 	[_heli, ["DROP WHITE SMOKE", {_smoke = "SmokeShellWhite" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
// };



// [_heli, ["<t color='#FF0000'>DROP RED SMOKE</t>", {
// 	_objPos = getPosATL _caller;
// 	_atl = _objPos select 2;

// 	if (_atl > 2) then {
// 		_smoke = "SmokeShellRed" createVehicle position (_this select 0);
// 	} else {
// 		systemChat "not allowed!! no smokes for you";
// 	};
// }]] remoteExec ["addAction"];
	// [_heli, ["<t color='#00FF00'>DROP GREEN SMOKE</t>", {_smoke = "SmokeShellGreen" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
	// [_heli, ["<t color='#0000FF'>DROP BLUE SMOKE</t>", {_smoke = "SmokeShellBlue" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
	// [_heli, ["<t color='#FFA500'>DROP ORANGE SMOKE</t>", {_smoke = "SmokeShellOrange" createVehicle position (_this select 0)}]] remoteExec ["addAction"];
	// [_heli, ["<t color='#FFFF00'>DROP YELLOW SMOKE</t>", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
	// [_heli, ["<t color='#6D00C1'>DROP PURPLE SMOKE</t>", {_smoke = "SmokeShellPurple" createVehicle position (_this select 0);}]] remoteExec ["addAction"];
	// [_heli, ["DROP WHITE SMOKE", {_smoke = "SmokeShellWhite" createVehicle position (_this select 0);}]] remoteExec ["addAction"];

[_heli, ["<t color='#FF0000'>DROP RED SMOKE</t>", {_smoke = "SmokeShellRed" createVehicle position (_this select 0);},nil,0,false,true,"","true", 5]] remoteExec ["addAction"];
[_heli, ["<t color='#00FF00'>DROP GREEN SMOKE</t>", {_smoke = "SmokeShellGreen" createVehicle position (_this select 0);},nil,0,false,true,"","true", 5]] remoteExec ["addAction"];
[_heli, ["<t color='#0000FF'>DROP BLUE SMOKE</t>", {_smoke = "SmokeShellBlue" createVehicle position (_this select 0);},nil,0,false,true,"","true", 5]] remoteExec ["addAction"];
[_heli, ["<t color='#FFA500'>DROP ORANGE SMOKE</t>", {_smoke = "SmokeShellOrange" createVehicle position (_this select 0);},nil,0,false,true,"","true", 5]] remoteExec ["addAction"];
[_heli, ["<t color='#FFFF00'>DROP YELLOW SMOKE</t>", {_smoke = "SmokeShellYellow" createVehicle position (_this select 0);},nil,0,false,true,"","true", 5]] remoteExec ["addAction"];
[_heli, ["<t color='#6D00C1'>DROP PURPLE SMOKE</t>", {_smoke = "SmokeShellPurple" createVehicle position (_this select 0);},nil,0,false,true,"","true", 5]] remoteExec ["addAction"];
[_heli, ["DROP WHITE SMOKE", {_smoke = "SmokeShellWhite" createVehicle position (_this select 0);},nil,0,false,true,"","true", 5]] remoteExec ["addAction"];

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

