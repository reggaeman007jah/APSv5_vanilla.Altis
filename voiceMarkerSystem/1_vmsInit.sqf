// init for VMS 

systemChat "Voice Activated Marker System Activated";

/*
Notes 
This system will enable a player to use VA to create a temp global marker 
will be based on lookDir and an input of distance 
e.g. if I look to 090 and say "100m" a marker will appear 100m away at 090 
TBC should this use getDir or getRelDir ??
Marker will fade after 1 minute, in 10 second cycles, 0.2 alpha each time, then be deleted perm 
Initially this will be an enemy marker system so a hardcoded symbol and colour will be used
if successful, other markers and colours can be selected with voice
System needs to be activated by triggering a keypress 
which equates to "set visual marker";
once done system is in listen mode 
and needs to be told either "cancel" or "enemy spotted at 100m"
system feedback is to confirm this to all units (though systChat for now)
after doing this, system is closed auto 
If this is a mistake, for now, tough, let it expire and tell your units 

*/

// vars and arrays initialisation
RGG_VMS_Distance		= [];		// holds distance 
RGG_VMS_LookDir			= [];		// holds look direction  
RGG_VMS_Cancel			= [];		// manages cancel action
RGG_VMS_Confirm			= [];		// manages confirm action 
RGG_VMS_NumInputBool 	= false; 	// general keydown state 
RGG_VMS_DistanceBool	= false;	// distance state 
RGG_VMS_ConfirmBool		= false;	// confirm state

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

/*
_vdir = getCameraViewDirection player;
_RGG_adir = _vdir # 0 atan2 _vdir # 1;
RGG_adir = round _RGG_adir;
if (RGG_adir < 0) then {
	RGG_adir = RGG_adir + 360;
};