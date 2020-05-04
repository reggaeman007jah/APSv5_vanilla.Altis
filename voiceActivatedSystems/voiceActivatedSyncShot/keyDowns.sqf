/*
from:	voiceActivatedSyncShot\initialiseVASS.sqf
to:		voiceActivatedSyncShot\clearKeyDowns.sqf		/ if cancelled  
to:		voiceActivatedSyncShot\VASS_Init.sqf			/ if cancelled 

purpose:
listens to numpad keypresses, and sends respective values (numpad nums) into arrays 
the array the data is pushed into is dependent on the current state (bool) - this is managed by the monitor 

notes://
something to test - does this need to be bool-driven? Or would these operate just as well by activating and then removing the EH?
*/

if (numericalInputBool) then {

	rgg_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		
		systemChat 'Call Aborted';
		execVM 'voiceActivatedSyncShot\clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_cnl];
		numericalInputBool = false;
		execVM 'voiceActivatedSyncShot\VASS_Init.sqf';
	}"];

	// execVM 'voiceActivatedArty\RSCnums\titleDisplay.sqf';
	// come back to this

	rgg_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {

		systemChat '0';

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 0;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 0;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 0;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 0;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 0;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 0;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 0;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 0;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {

		systemChat '1';

		if (shotCountBool) then {
			shotCount pushBack 1;
		};

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 1;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 1;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 1;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 1;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 1;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 1;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 1;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 1;
			playSound '3DEN_notificationDefault';
		};

		if (executeSyncShotBool) then {
			splashConfirm pushBack 1;
		};
	}"];

	rgg_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {

		systemChat '2';

		if (shotCountBool) then {
			shotCount pushBack 2;
		};

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 2;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 2;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 2;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 2;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 2;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 2;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 2;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 2;
			playSound '3DEN_notificationDefault';
		};

	}"];

	rgg_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
			
		systemChat '3';

		if (shotCountBool) then {
			shotCount pushBack 3;
		};

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 3;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 3;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 3;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 3;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 3;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 3;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 3;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 3;
			playSound '3DEN_notificationDefault';
		};

	}"];

	rgg_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		
		systemChat '4';

		if (shotCountBool) then {
			shotCount pushBack 4;
		};

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 4;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 4;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 4;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 4;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 4;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 4;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 4;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 4;
			playSound '3DEN_notificationDefault';
		};

	}"];

	rgg_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
			
		systemChat '5';

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 5;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 5;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 5;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 5;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 5;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 5;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 5;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 5;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
			
		systemChat '6';

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 6;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 6;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 6;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 6;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 6;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 6;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 6;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 6;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
			
		systemChat '7';

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 7;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 7;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 7;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 7;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 7;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 7;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 7;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 7;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
			
		systemChat '8';

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 8;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 8;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 8;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 8;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 8;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 8;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 8;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 8;
			playSound '3DEN_notificationDefault';
		};
	}"];

	rgg_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
			
		systemChat '9';

		if (shot1LatBool) then {
			splash1CoordsLat pushBack 9;
			playSound '3DEN_notificationDefault';
		};
		if (shot1LonBool) then {
			splash1CoordsLon pushBack 9;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LatBool) then {
			splash2CoordsLat pushBack 9;
			playSound '3DEN_notificationDefault';
		};
		if (shot2LonBool) then {
			splash2CoordsLon pushBack 9;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LatBool) then {
			splash3CoordsLat pushBack 9;
			playSound '3DEN_notificationDefault';
		};
		if (shot3LonBool) then {
			splash3CoordsLon pushBack 9;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LatBool) then {
			splash4CoordsLat pushBack 9;
			playSound '3DEN_notificationDefault';
		};
		if (shot4LonBool) then {
			splash4CoordsLon pushBack 9;
			playSound '3DEN_notificationDefault';
		};
	}"];
};
		

