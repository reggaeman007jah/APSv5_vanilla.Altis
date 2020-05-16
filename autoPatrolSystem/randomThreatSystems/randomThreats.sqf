/*
spawn random groups of 3 or 4, on outer reaches of battlezone, and send them in 

*/

sleep 90;

systemChat "roamers activated";

while {true} do {

	if (RGG_totalEast < 50) then {
		// get pos in battlezone outer edges 
		_randomEnemySpawnPos = [RGG_patrol_obj, 1100, 1300, 3, 0, 0, 0] call BIS_fnc_findSafePos; 
		systemChat format ["enemy roamers spawned: %1", _randomEnemySpawnPos]; 
		_grp1 = createGroup east;
		_random = random 3;
		_size = _random + 2; // consider using patrolPoints as a multiplier to number of roamers 

		for "_i" from 1 to 1 do {
			_indiGroup = createGroup east;
			_opforTeam = [];
			// _opClasses = ["o_g_soldier_ar_f","o_g_soldier_gl_f","o_g_sharpshooter_f"];
			_opforClass = [
				"O_G_Soldier_A_F",
				"O_G_Soldier_AR_F",
				"O_G_medic_F",
				"O_G_engineer_F",
				"O_G_Soldier_exp_F",
				"O_G_Soldier_GL_F",
				"O_G_Soldier_M_F",
				"O_G_officer_F",
				"O_G_Soldier_F",
				"O_G_Soldier_LAT_F",
				"O_G_Soldier_LAT2_F",
				"O_G_Soldier_lite_F",
				"O_G_Sharpshooter_F",
				"O_G_Soldier_SL_F",
				"O_G_Soldier_TL_F"
			];
			for "_i" from 1 to _size do {
				_unit = selectRandom _opforClass;
				_unit1 = _indiGroup createUnit [_unit, _randomEnemySpawnPos, [], 0.1, "none"];
				_opforTeam pushBack _unit1;
			};
			_ranDist = random 30;
			_ranDir = random 359;
			_unitDest = RGG_patrol_obj getPos [_ranDist, _ranDir];
			_opforTeam doMove _unitDest;
			// _opforTeam setFormation "diamond";
			// why not work?
			// spawnedIndiUnit = spawnedIndiUnit + _groupSize;
		};
	};

	sleep 300;
};

