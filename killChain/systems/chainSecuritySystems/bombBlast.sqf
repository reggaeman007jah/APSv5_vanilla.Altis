
systemChat "A BOMB HAS BEEN SET - DEFUSE IT NOW!!";

for "_i" from 0 to 180 do {

	// for now just check if blufor units are in the blast zone to cancel the bomb 
	sleep 1;
};


if (tooLate) then {
	_blastCore = _this select 0;
	_blasts = selectRandom [3,4,5,6];
	_ord = "Bo_GBU12_LGB";
	for "_i" from 0 to _blasts do {
		_delay = selectRandom [.03, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
		_distance = selectRandom [1,3,6,9,12,15,18,21,24];
		_direction = random 359;
		_pos = _blastcore getPos [_distance,_direction];
		_boom = _ord createVehicle _pos;	
		sleep _delay;
	};
};
