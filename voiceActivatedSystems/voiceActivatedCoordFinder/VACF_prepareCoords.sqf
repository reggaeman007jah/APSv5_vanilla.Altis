/*
from:	voiceActivatedCoordFinder\VACF_keyDownMonitor.sqf
to:		voiceActivatedCoordFinder\VACF_execute.sqf 				/ once, after all calcs are done  

purpose:	
the data held so far is string, in separate values 
here I combine the values using joinString, into one string, then i turn the consolidated strings into a numerical value 
I also divide the heading by 100, to give me 2 decimal points from the 5 digit heading 
*/

_parsed_VACF_Heading	= VACF_Heading joinString "";
_parsed_VACF_Distance 	= VACF_Distance joinString "";

_parsed_VACF_Heading	= parseNumber _parsed_VACF_Heading;
_parsed_VACF_Heading	= _parsed_VACF_Heading / 100;
_parsed_VACF_Distance	= parseNumber _parsed_VACF_Distance;

[_parsed_VACF_Heading, _parsed_VACF_Distance] execVM "voiceActivatedCoordFinder\VACF_execute.sqf";


