/*

This system will enable relavant checks like:

Count number of 'taken' points 

Count number of RF platoons 

Count number of Opfor killed 

Count number of injured extracted 

Count number of times AH-6 rearmed 

Have a global cycle that counts blu and opfor in the red zone - this will inform blu RF 

*/


// while {true} do {

// 	_opforCount1 = 0;
// 	_blueforCount1 = 0;
// 	_units = allUnits inAreaArray "Objective 1";
// 	_unitCount1 = count _units;
// 	{
// 		switch ((side _x)) do
// 		{
// 			case EAST: {_opforCount1 = _opforCount1 + 1};
// 			case WEST: {_blueforCount1 = _blueforCount1 + 1};
// 		};
// 	} forEach _units;

// 	sleep 60;
// };
