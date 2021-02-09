/*
From: initServer.sqf 
*/

// this will spawn a fireteam contantly, and only respawn another team when the previous one has been removed from the "pz1" marker area 
sleep 10;

// systemChat "para spawner activated";
"recon para spawner activated" remoteExec ["systemChat", 0, true];	
sleep 1;
while {true} do {

	_units = allUnits inAreaArray "pz1";
	_unitCount1 = count _units;
	if (_unitCount1 == 0) then {
		// systemChat "paras spawning .............................................!";
		"recon paras spawning ............................................." remoteExec ["hint", 0, true];	

		_float = diag_tickTime;
		_stampToString = str _float;
		_stampToString = createGroup west;
		for "_i" from 1 to 1 do { 
			// "B_W_Soldier_A_F" createUnit [[15074,17244], _indiGroup]; 
			"B_W_Recon_AR_F" createUnit [[15074,17244], _stampToString]; 
			sleep 0.1;
		};
		for "_i" from 1 to 1 do { 
			"B_W_Recon_LAT_F" createUnit [[15074,17244], _stampToString]; 
			sleep 0.1;
		};
		for "_i" from 1 to 1 do { 
			"B_W_Recon_Sharpshooter_F" createUnit [[15074,17244], _stampToString]; 
			sleep 0.1;
		};
		for "_i" from 1 to 1 do { 
			"B_W_Recon_TL_F" createUnit [[15074,17244], _stampToString];  
			sleep 0.1;
		};
		for "_i" from 1 to 1 do { 
			"B_W_Recon_TL_F" createUnit [[15074,17244], _stampToString];  
			sleep 0.1;
		};
		_stampToString move [15129,17195];
		_stampToString setFormation "DIAMOND";
		systemChat "recon squaddies ready .............................................!";
	};

	sleep 60;
};

		// for "_i" from 1 to 1 do { 
		// 	// "B_W_Soldier_A_F" createUnit [[15074,17244], _indiGroup]; 
		// 	"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; B_W_Recon_AR_F
		// 	sleep 0.1;
		// };
		// for "_i" from 1 to 1 do { 
		// 	"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; B_W_Recon_LAT_F
		// 	sleep 0.1;
		// };
		// for "_i" from 1 to 1 do { 
		// 	"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; B_W_Recon_Sharpshooter_F
		// 	sleep 0.1;
		// };
		// for "_i" from 1 to 1 do { 
		// 	"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; B_W_Recon_TL_F B_W_Recon_GL_F
		// 	sleep 0.1;
		// };
		// for "_i" from 1 to 1 do { 
		// 	"B_W_Soldier_A_F" createUnit [[15074,17244], _stampToString]; B_W_Recon_TL_F B_W_Recon_GL_F
		// 	sleep 0.1;
		// };