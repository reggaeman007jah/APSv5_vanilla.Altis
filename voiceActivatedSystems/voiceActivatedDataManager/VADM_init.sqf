/*
from:	
to:		voiceActivatedDataStore\initialiseVACDS.sqf			

purpose:
possibly not needed 
enables a pre-stage if required .. does not do much harm 
*/

sleep 2;
execVM "voiceActivatedDataManager\initialiseVADM.sqf";
// systemChat "VADS init";