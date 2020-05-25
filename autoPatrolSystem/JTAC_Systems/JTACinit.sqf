/*
Voice Activated JTAC System (VA-VMS) by Reggaeman 
May 2020

Notes:
This system will enable a player to use VA to create a a CAS Fire Mission using voice commands
Essentially this will be a tool for setting a target location and attact vector, shown on a map (globally)
System feedback is to confirm this to all units (though remoteExec systChat for now)
If this is a mistake in fire mission calling, for now, tough, let it expire and tell your units about your mistake

activate JTAC System 
Input location - 10 Grid 
Input Vactor - 8 cardinal points NE, N NW etc 
Input Target Type - infantry / armour / unknown 
Attack Type - guns / guns and rockets / unload all rockets 
Input danger close - yes or no - yes indicates there are friendly forces near by - no indicates no consideration needed 
Confirm or cancel call at any time 
Marker colour - red green blue yellow orange - to help diff between simultaneous fire missions 
fire mission designation - alpha bravo charlie delta echo - these are used to concel missions after calling 
(missions will time out after 5 minutes anyway)

initially:
CAS fire mission 
Area Recon Misison 

example:
this is jtac requesting an immadiate fire mission
	confirm location
10-grid location is 1 2 4 5 6 3 2 1 4 5 
	thank you, confirm attack vector 
Attack vector north to south / south to north / north east to south west / or no attack vector specified  
	thank you, confirm target type (soft, hard or armour)
confirm target type infantry 
	thank you, confirm helis required (1-5)
Requesting 2 heli attack 
	thank you, confirm weaponry required (gun run, rockets, guns and rockets, rocket dump)
confirm guns and rockets 
	thank you, is this danger close?
Yes, danger close / no danger not close 
	thank you, confirm marker colour (red, green, blue) 
Confirm Red
	thank you, confirm mission designation (alpha to echo)
Confirm designation echo 
	thank you, confirm mission duration (minutes 1-5 or runs 1-5)
Confirm mission duration 3 runs 
	thank you 

fire Mission Echo Red
	helis: 			2
	duration:		3 runs 
	location:		1 2 3 4 3 4 5 5 4 5
	Vector:			NW to SE 
	target type:	infantry 
	ordenance:		guns and rockets 
	risk:			danger not close 

states:
init (input: enter Fire mission, pickup, slingload, repair)

if fire mission:
gridLocation (input: enter 10-grid)
approachVector (input: from)
exitVector (input: to)
targetType (input: infi, motorised, armour) 
heliNumbers (input: 1-5)
ordRequired (input: guns, rocks, guns and rocks, rocket dump)
dangerClose (input yes or no)
markerColour (input: r g b) 
missionID (input: a b c d e)
missionDuration (input 1-5 mins or 1-5 runs)
confirm / cancel

*/

systemChat " ... Voice Activated JTAC System Activated ... ";

// declarations
RGG_JTAC_NumInputBool 	= false;

RGG_JTAC_mission	 	= [];
RGG_JTAC_missionBool 	= false;
RGG_JTAC_grid	 		= [];
RGG_JTAC_gridBool 		= false;
RGG_JTAC_approach	 	= [];
RGG_JTAC_approachBool	= false;
RGG_JTAC_egress		 	= [];
RGG_JTAC_egressBool		= false;
RGG_JTAC_target	 		= [];
RGG_JTAC_targetBool		= false;
RGG_JTAC_ord	 		= [];
RGG_JTAC_ordBool 		= false;
RGG_JTAC_danger	 		= [];
RGG_JTAC_dangerBool		= false;
RGG_JTAC_colour	 		= [];
RGG_JTAC_colourBool		= false;
RGG_JTAC_id	 			= [];
RGG_JTAC_idBool 		= false;

RGG_JTAC_confirm 		= [];
RGG_JTAC_confirmBool	= false;

// removed for now
// RGG_JTAC_duration 		= [];
// RGG_JTAC_durationBool	= false;
// RGG_JTAC_helis	 		= [];
// RGG_JTAC_helisBool 		= false;

// trigger key = " numpad 5"
rgg_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 76)) then {
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_Activate];
	systemChat 'JTAC Systems Activated - Please Confirm Misison Category';
	systemChat '1 - Request Close Air Support Fire Mission';
	systemChat '2 - Request Fireteam Deployment';
	RGG_JTAC_NumInputBool = true;
	RGG_JTAC_missionBool = true; 
	execVM 'autoPatrolSystem\JTAC_Systems\keyDowns.sqf'; 
	execVM 'autoPatrolSystem\JTAC_Systems\keyDownMonitor.sqf'; 
}"];

// 	playSound 'dangerClose1';