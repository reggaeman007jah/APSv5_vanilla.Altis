// this will spawn a fireteam contantly, and only respawn another team when the previous one has been removed from the "pz1" marker area 

systemChat "para spawner activated";

while {true} do {

	_units = allUnits inAreaArray "PZ1";
	_unitCount1 = count _units;
	if (_unitCount1 == 0) then {
		systemChat "paras spawning .............................................!";
		_float = diag_tickTime;
		_stampToString = str _float;
		_stampToString = createGroup west;
		for "_i" from 1 to 1 do { 
			// "B_W_Soldier_A_F" createUnit [[15074,17244], _indiGroup]; 
			"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; 
			sleep 0.1;
		};
		for "_i" from 1 to 1 do { 
			"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; 
			sleep 0.1;
		};
		for "_i" from 1 to 1 do { 
			"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; 
			sleep 0.1;
		};
		for "_i" from 1 to 1 do { 
			"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; 
			sleep 0.1;
		};
		_stampToString move [15129,17195];
		_stampToString setFormation "COLUMN";
		systemChat "squaddies ready .............................................!";
	};

	sleep 60;
};

