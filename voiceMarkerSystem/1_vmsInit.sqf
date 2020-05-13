// init for VMS 
systemChat " ... Voice Activated Marker System Activated ... ";

/*
Notes 
This system will enable a player to use VA to create a temp global marker 
Essentially this will be a spotting tool for faction and types (e.g, opfor infi, blufor tanks etc)
will be based on lookDir and an input of distance 
e.g. if I look to 090 and say "100m" a marker will appear 100m away at 090 
Marker will fade and then be deleted perm 
Initially this will be an enemy marker system so a hardcoded symbol and colour will be used
if successful, other markers and colours can be selected with voice
System needs to be activated by triggering a keypress 
which equates to "set visual marker";
once done system is in listen mode 
and needs to be told either "cancel" or "enemy spotted at 100m"
system feedback is to confirm this to all units (though systChat for now)
after doing this, system is closed auto 
If this is a mistake, for now, tough, let it expire and tell your units 

toDo:
enable multiple markers at once!
check whether all EHs are needed (cancel?)
decide on global alerts to MP players 
decide on audio alerts to players (.ogg or within VA)
complete cancel operation 
enable a delete option while in map - for any player 
enable system to show other info like "attack here", "move there" or "this direction"
*/

// declarations
RGG_VMS_Distance		= [];		// holds distance value fed from Voice Attack
RGG_VMS_LookDir			= [];		// holds look direction fed from player look direction
RGG_VMS_Confirm			= [];		// manages confirm action 
RGG_VMS_Cancel			= [];		// manages cancel action
/*
RGG_VMS_Faction			= [];		// holds faction info 
RGG_VMS_Type			= [];		// holds type info (1-infantry, 2-light armour, 3 - heavy armour)
*/

RGG_VMS_NumInputBool 	= false; 	// manages general keydown state 
RGG_VMS_DistanceBool	= false;	// manages distance state 
RGG_VMS_ConfirmBool		= false;	// manages confirm/cancel state

// key = "4"
rgg_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 75)) then {
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_Activate];
	systemChat 'VMS Activated - Please Confirm Distance';
	RGG_VMS_DistanceBool = true;
	RGG_VMS_NumInputBool = true; 
	execVM 'voiceMarkerSystem\keyDowns.sqf'; 
	execVM 'voiceMarkerSystem\keyDownMonitor.sqf'; 
}"];

// 	playSound 'dangerClose1';
