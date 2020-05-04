/*
This is meant to ensure that new units are created and sent in to support depleted teams in the field 
however I now see this is an expensive check, and also very inefficient 

toDo / April 2002 / develop a better system to trigger RF 
Initial idea - run this same code but only at the start of each mission phase, rather than every 180 seconds!
*/

/*

// April 2020 / following code is switched off until new system is tested 

while {true} do {

	sleep 180;
	systemChat "checking RF";

	// checks to see if any new units should be created and sent towards the current objective - these will be created from main base, not from last obj 
	// the concept here is that the further away from the main base you are, the longer RF take to arrive, making firther OBJ efforts more difficult 

	// check if there are any new units needed to be created - if not, just send what is there to the next obj, if not enough, create more here 
	_bluCount = west countSide allUnits;

	if ((_bluCount) < 8)  then // this is the decider-value as to whether the second round of enemy moves in
	{
		hint "RF INBOUND";
		[RGG_initStartPos] execVM "autoPatrolSystem\createFriendlyUnits.sqf";
		systemchat "debug --- friendly units created";
		"MP debug --- friendly units created" remoteExec ["systemChat", 0, true];
	};
};

*/