
// adding this check to ensure this is not being called from anywhere 
hint "YOU SHOULD NOT BE SEEING THIS!";

/* CALL RF ---------------------------------------------------------------------------------------------------

Will replenish lost troops as per trigger rules
Currently fixed number, but may look to into maybe AT if OPFOR have vehicles

To do: mix up types of RF units coming in, LMG, Snipers even Technicals - currently in test 
*/ 

// reference data 
_rfDestination = (_this select 0);
_rfSpawn = (_this select 1);

/*
_rfSpawn = _rfDestination getPos [300,180];//300m south of key fighting point
this works but lets see if I can pass the dynamic start point into this script also
*/

// randomly create type of RF support:
// _typeRF = selectRandom ["Sniper Team", "HMG Team", "Medic Team", "Mixed Team", "Rifleman Team"];
_typeRF = selectRandom ["HMG Team", "Rifleman Team"];

// info
systemChat "Reinforcements are inbound";
systemChat format ["%1 Created", _typeRF];
sleep 1;

// custom heavy gunners
if (_typeRF == "HMG Team") then {
	for "_i" from 1 to 10 do {
		bluGroup = createGroup west;
		_pos = [start, 0, 30] call BIS_fnc_findSafePos;
		_unit = bluGroup createUnit ["b_soldier_ar_f", _pos, [], 0.1, "none"]; 

		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "U_B_CombatUniform_mcam";
		_unit addItemToUniform "FirstAidKit";
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		_unit addItemToUniform "SmokeShell";
		_unit addItemToUniform "SmokeShellGreen";
		for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
		_unit addVest "V_PlateCarrier1_rgr";
		for "_i" from 1 to 5 do {_unit addItemToVest "FirstAidKit";};
		for "_i" from 1 to 10 do {_unit addItemToVest "HandGrenade";};
		_unit addBackpack "B_Carryall_oli";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "SMA_150Rnd_762_M80A1_Tracer";};
		_unit addHeadgear "H_HelmetB";
		_unit addGoggles "rhs_googles_orange";

		_unit addWeapon "sma_minimi_mk3_762tsb";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "sma_spitfire_03_sc_black";
		_unit addWeapon "hgun_P07_F";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "NVGoggles_OPFOR";

		// _unit setFace "WhiteHead_17";
		// _unit setSpeaker "male03eng";

		systemchat "debug --- heavy gunner created";
		sleep 1;

		// orders
		_randomDir = selectRandom [270, 310, 00, 50, 90];
		_randomDist = selectRandom [10, 15, 20];
		_endPoint1 = _rfDestination getPos [_randomDist,_randomDir];
		_unit doMove _endPoint1;

		// behaviour
		_unit setUnitPos "AUTO";
		_unit setBehaviour "AWARE";

		// Debug and loop mgmt
		systemchat "debug - Friendly RF Trooper Created";
		sleep 1;
	};
};

// troopers
if (_typeRF == "Rifleman Team") then {

	for "_i" from 1 to 10 do {
		bluGroup = createGroup west;
		_pos = [_rfSpawn, 0, 40] call BIS_fnc_findSafePos;
		_unit = bluGroup createUnit ["b_soldier_m_f", _pos, [], 0.1, "none"]; 

		// loadout purge
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		// containers
		_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
		_unit addItemToUniform "FirstAidKit";
		_unit addItemToUniform "Chemlight_green";
		for "_i" from 1 to 2 do {_unit addItemToUniform "SMA_30Rnd_556x45_M855A1";};
		_unit addVest "V_TacVest_oli";
		for "_i" from 1 to 12 do {_unit addItemToVest "SMA_30Rnd_556x45_M855A1";};
		_unit addBackpack "B_AssaultPack_mcamo_Ammo";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "FirstAidKit";};
		_unit addItemToBackpack "100Rnd_65x39_caseless_mag";
		_unit addItemToBackpack "NLAW_F";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "MiniGrenade";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
		_unit addItemToBackpack "3Rnd_HE_Grenade_shell";
		_unit addItemToBackpack "10Rnd_338_Mag";
		_unit addItemToBackpack "16Rnd_9x21_Mag";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_SmokeYellow_Grenade_shell";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_mag_rgo";};
		_unit addHeadgear "H_HelmetB_grass";
		_unit addGoggles "G_Bandanna_sport";

		// weapons
		_unit addWeapon "SMA_MK18TAN_GL";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Arco_blk_F";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		// items
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		_unit linkItem "O_NVGoggles_ghex_F";
		
		// orders
		_randomDir = selectRandom [270, 310, 00, 50, 90];
		_randomDist = selectRandom [10, 15, 20];
		_endPoint1 = _rfDestination getPos [_randomDist,_randomDir];
		_unit doMove _endPoint1;

		// behaviour
		_unit setUnitPos "AUTO";
		_unit setBehaviour "AWARE";

		// Debug and loop mgmt
		systemchat "debug - Friendly RF Trooper Created";
		sleep 1;	
	};
};


