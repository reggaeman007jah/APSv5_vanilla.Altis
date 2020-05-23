// typeOf vehicle player == "B_Heli_Light_01_F (RGG_Heli5)" && (player distance thistrigger) < 500
/*
B_W_Soldier_A_F
B_W_Soldier_GL_F
B_W_HeavyGunner_F
B_W_soldier_M_F
*/

// systemChat "pickup systems running";

// _pos = [12828.3,16712.1,0];
// _transport1 = "B_Heli_Light_01_F" createVehicle _pos;
// _transport1 setVehicleVarName "transport1";
// transport1 = _transport1;
// // systemChat "unit test created";
// sleep 2;

// [13382,16911,-5.72205e-006] new pos 

// _offroad setVehicleVarName "MyFerrari";
// MyFerrari = _offroad;

// while {true} do {

//   // just an alt check
// 	_HELI1ATL1 = (getPosATL transport1) select 2;
// 	_HELI1ATL1 = round _HELI1ATL1;
// 	systemChat str _HELI1ATL1;

// 	sleep 1;
// };

 
// hanger spawn point where they are created 
// [15074,17244]

// pickup point where they wait for pickup 
/*
[15221,17085] groupBlu1
[15206,17074] groupBlu2
[15192,17060] groupBlu3
[15178,17045] groupBlu4
[15165,17031] groupBlu5
*/
// deploymentMissionIsActive = false;
// systemChat "testing in 10";

// sleep 60;

// initially, check to see if the mission is considered 'live' - i.e. if it is live, then do not spawn more units!
// I have a feeling this logic needs some more thought?!
// deploymentMissionIsActive = false;

// _indiGroup = createGroup independent;

// if (!deploymentMissionIsActive) then {
//   systemChat "squaddies ready for pickup";

//   for "_i" from 1 to 1 do { 
//     // "B_W_Soldier_A_F" createUnit [[15074,17244], _indiGroup]; 
//     "B_W_Soldier_A_F" createUnit [[15074,17244], _indiGroup]; 
//     sleep 0.1;
//   };
//   for "_i" from 1 to 1 do { 
//     "B_W_Soldier_GL_F" createUnit [[15074,17244], _indiGroup]; 
//     sleep 0.1;
//   };
//   for "_i" from 1 to 1 do { 
//     "B_W_HeavyGunner_F" createUnit [[15074,17244], _indiGroup]; 
//     sleep 0.1;
//   };
//   for "_i" from 1 to 1 do { 
//     "B_W_soldier_M_F" createUnit [[15074,17244], _indiGroup]; 
//     sleep 0.1;
//   };

//   _indiGroup move [15122,17197];
//   _indiGroup setFormation "STAG COLUMN";
// };

// think about how you can create and designate a group that is named after the UID of the player .. so that group always and only ever belongs to that player 

deploymentMission = true;
initPhase = true;
pickup = false;
wait = false;
dropoff = false;
complete = false;
_myHeli = transport1;


while {deploymentMission} do {

  // alt check
	_HELI1ATL1 = (getPosATL _myHeli) select 2;
	_HELI1ATL1 = round _HELI1ATL1;
	systemChat str _HELI1ATL1;
   
  if (initPhase) then {
    if (_HELI1ATL1 > 10) then {

      // COUNT UNITS IN PZ1 - IF UNITS, THEN DO NOT SPAWN
      _units = allUnits inAreaArray "PZ1";
      _unitCount1 = count _units;

      if (_unitCount1 == 0) then {
          systemChat "squaddies spawning .............................................!";
          _float = diag_tickTime;
          // _float2 = random 10000;
          // _uniqueStamp = [_float, _float2];
          // _stampToString = str _uniqueStamp;
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

        initPhase = false;
        pickup = true;
    };
  };
 
  // first state - PICKUP 
  // need a distance check on the pickup zone
	if (pickup) then {
		if ((_HELI1ATL1) < 1) then {
			_extractLocation = position transport1;
			_extractMarker = createMarker ["extract", _extractLocation];
			_extractMarker setMarkerShape "ELLIPSE";
			_extractMarker setMarkerColor "ColorGreen";
			_extractMarker setMarkerSize [50, 50];

      // an attempt to ensure the leader gets in first 
      // _unitLeader = leader _indiGroup;
      // _unitLeader assignAsCargo _myHeli;
      // [_unitLeader] orderGetIn true;

			_units = allUnits inAreaArray "extract";
			{
				_x assignAsCargo _myHeli;
			} forEach _units;	
			_units orderGetIn true;

			pickup = false;
			wait = true;
		};
    systemChat "Pick up troops at PZ";
	};

  // second state - WAIT / BOARD / TRANSIT
	if (wait) then {

		if ((_HELI1ATL1) > 10) then {
			wait = false;
			dropoff = true;
			deleteMarker "extract";
		};
		systemChat "Troops boarding and en-route";
	};

  // third state - DISEMBARK
	if (dropoff) then {

    systemChat "Get the troops on the ground";

		if ((_HELI1ATL1) < 1) exitWith {
			_extractLocation = position transport1;
			_extractMarker = createMarker ["extract", _extractLocation];
			_extractMarker setMarkerShape "ELLIPSE";
			_extractMarker setMarkerColor "ColorRed";
			_extractMarker setMarkerSize [50, 50];

      // _UnitLeader = leader groupBlu1;
      // _UnitLeader orderGetIn false;
      dropoff = false;
      complete = true;
	    // deploymentMission = false;

      // order getOut 
      { unassignVehicle _x } forEach crew transport1;;
      _units = allUnits inAreaArray "extract";
      _units orderGetIn false;
      // sleep 5;
      // {
      //   // _x assignAsCargo _myHeli;
      //   _dir = random 359;
      //   _movePos = _myHeli getPos [30,_dir];
      //   _units doMove _movePos;
      // } forEach _units;	
     
		};

	};

  /*
  stavrosMilBaseVirtualUnits = 0;
  athiraMilBaseVirtualUnits = 0;
  friniMilBaseVirtualUnits = 0;
  lakkaMilBaseVirtualUnits = 0;
  */

  if (complete) then {
    _pos = getMarkerPos "extract";
    _safeDelete = transport1 distance _pos;

		if ((_safeDelete) > 100) then {

    		_pos = getMarkerPos "extract";
        deleteMarker "extract";
        // _nearestMarker = [allMapMarkers, _pos] call BIS_fnc_nearestPosition;
        // _units = allUnits inAreaArray _nearestMarker;
        // _deployedUnits = count _units;
        // systemChat str _nearestMarker;
        // hint str _deployedUnits;

        // if (_nearestMarker == "StavrosMilBase") then {
        //   systemChat "Stavros Mil-Base Deployment Complete";
        //   stavrosMilBaseVirtualUnits = stavrosMilBaseVirtualUnits + _deployedUnits;
        //   publicVariable "stavrosMilBaseVirtualUnits";
        //   systemChat format ["Stavros Mil-Base now has %1 virtual units", stavrosMilBaseVirtualUnits];
        // };
        // if (_nearestMarker == "LakkaMilBase") then {
        //   systemChat "Lakka Mil-Base Deployment Complete";
        //   lakkaMilBaseVirtualUnits = lakkaMilBaseVirtualUnits + _deployedUnits;
        //   publicVariable "lakkaMilBaseVirtualUnits";
        //   systemChat format ["Lakka Mil-Base now has %1 virtual units", lakkaMilBaseVirtualUnits];
        // };
        // if (_nearestMarker == "AthiraMilBase") then {
        //   systemChat "Athira Mil-Base Deployment Complete";
        //   athiraMilBaseVirtualUnits = athiraMilBaseVirtualUnits + _deployedUnits;
        //   publicVariable "athiraMilBaseVirtualUnits";
        //   systemChat format ["Athira Mil-Base now has %1 virtual units", athiraMilBaseVirtualUnits];
        // };
        // if (_nearestMarker == "FriniMilBase") then {
        //   systemChat "Frini Mil-Base Deployment Complete";
        //   friniMilBaseVirtualUnits = friniMilBaseVirtualUnits + _deployedUnits;
        //   publicVariable "friniMilBaseVirtualUnits";
        //   systemChat format ["Frini Mil-Base now has %1 virtual units", friniMilBaseVirtualUnits];
        // };

        // cleanup
	    	// {
        //   deleteVehicle _x
        // } forEach nearestObjects [_pos, ["all"], 200];

 
        complete = false;
        initPhase = true;
        // deploymentMission = false;
        // execVM "autoPatrolSystem\pickupSystems\pickup.sqf";
      };
		};
  
	sleep 2;
};




	

        // dropoff = false;
        // deploymentMission = false;


        // here we end the DROPOFF state, loop state. 
        // also mark the overall mission as complete and base populated 
        // dropoff = false;
        // deploymentMission = false;
        // deploymentMissionSuccess = true;
        // lakkaMilBasePopulated = true;

        // _lakkaMilBaseHealth setMarkerShapeLocal "ELLIPSE";
        // _lakkaMilBaseHealth setMarkerColorLocal "ColorGreen";
        // _lakkaMilBaseHealth setMarkerSizeLocal [250, 250];
      // };



// _units = allUnits inAreaArray "pz1";
// {
// 	_x assignAsCargo vehicle player;
// 	sleep 0.2;
// } forEach _units;	
// _units orderGetIn true;

/*
this addaction ["Slingload Supplies to Local Civilian Areas", { "scripts\missions\slingLoad_mission.sqf" remoteExec ["BIS_fnc_execVM", 2] }];
this addaction ["Carry Out Large Scale Troop Deployment", { "scripts\missions\largeScaleDeployment.sqf" remoteExec ["BIS_fnc_execVM", 2] }];

