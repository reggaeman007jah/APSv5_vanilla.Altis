/*
Roamer Alerts 

This will take the given arg - _randomEnemySpawnPos - and create a voice alert based on the grid refernce 
Players can then take action accordingly (or ignore)
_pos = getPos player; 
_xPos = _pos select 0; 
_testPos = str _xPos; 
_target = _testPos select [1,1]; 
hint str _target;

Notes:
	Moved _randomEnemySpawnPos = _this select 0; up one scope to enable the ELSE clause to use it - it bugged out before 

*/

// only arg - relevant pos that informs the voice alert 
_randomEnemySpawnPos = _this select 0;

if (!BESILENT) then {
	if (!COMMANDSPEAKING) then {
		
		_gap = 0.8;

		_posX = _randomEnemySpawnPos select 0;
		_posY = _randomEnemySpawnPos select 1;

		_posXstring = str _posX;
		_posYstring = str _posY;

		_x1 = _posXstring select [0,1];
		_x2 = _posXstring select [1,1];
		_x3 = _posXstring select [2,1];
		_y1 = _posYstring select [0,1];
		_y2 = _posYstring select [1,1];
		_y3 = _posYstring select [2,1];

		_posArray = [];
		_posArray pushBack _x1;
		_posArray pushBack _x2;
		_posArray pushBack _x3;
		_posArray pushBack _y1;
		_posArray pushBack _y2;
		_posArray pushBack _y3;

		{playSound "thisIsCommand1"} remoteExec ["call",0];

		sleep 2.6;

		{playSound "enemyAtGrid"} remoteExec ["call",0];

		sleep 2.7;

		{
			// systemChat "ROAMER TEST --------------------------------------- !!!";
			// systemChat str _x;
			switch (_x) do {
				case ("0"): { {playSound "num0"} remoteExec ["call",0]; sleep _gap; };
				case ("1"): { {playSound "num1"} remoteExec ["call",0]; sleep _gap; };
				case ("2"): { {playSound "num2"} remoteExec ["call",0]; sleep _gap; };
				case ("3"): { {playSound "num3"} remoteExec ["call",0]; sleep _gap; };
				case ("4"): { {playSound "num4"} remoteExec ["call",0]; sleep _gap; };
				case ("5"): { {playSound "num5"} remoteExec ["call",0]; sleep _gap; };
				case ("6"): { {playSound "num6"} remoteExec ["call",0]; sleep _gap; };
				case ("7"): { {playSound "num7"} remoteExec ["call",0]; sleep _gap; };
				case ("8"): { {playSound "num8"} remoteExec ["call",0]; sleep _gap; };
				case ("9"): { {playSound "num9"} remoteExec ["call",0]; sleep _gap; };
				default { systemChat "ERROR - number not found..."; };
			};
		} forEach _posArray;

		sleep 0.8;

		{
			switch (_x) do {
				case ("0"): { {playSound "num0"} remoteExec ["call",0]; sleep _gap; };
				case ("1"): { {playSound "num1"} remoteExec ["call",0]; sleep _gap; };
				case ("2"): { {playSound "num2"} remoteExec ["call",0]; sleep _gap; };
				case ("3"): { {playSound "num3"} remoteExec ["call",0]; sleep _gap; };
				case ("4"): { {playSound "num4"} remoteExec ["call",0]; sleep _gap; };
				case ("5"): { {playSound "num5"} remoteExec ["call",0]; sleep _gap; };
				case ("6"): { {playSound "num6"} remoteExec ["call",0]; sleep _gap; };
				case ("7"): { {playSound "num7"} remoteExec ["call",0]; sleep _gap; };
				case ("8"): { {playSound "num8"} remoteExec ["call",0]; sleep _gap; };
				case ("9"): { {playSound "num9"} remoteExec ["call",0]; sleep _gap; };
				default { systemChat "ERROR - number not found..."; };
			};
		} forEach _posArray;

		sleep 1.4;

		{playSound "commandOut"} remoteExec ["call",0];

	} else {
		sleep 10;
		[_randomEnemySpawnPos] execVM "killchain\systems\roamerAlerts\roamerAlerts.sqf"; 
		// this is to try to re-run this quickly, while also not overlapping more phase-based alerts 
	};

};



