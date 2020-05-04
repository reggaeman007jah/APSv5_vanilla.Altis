/*
from:	VACF_keyDowns.sqf 
to:		screen render 

purpose:
RSC screen render of data as it is entered by the user  

notes:
I need to change the name of this file, to have VACF prefix, but need to check for potential breakages before doing so 
It could also be moved up one level?

where is the first RSC???
*/

1 cutRsc ["VACF_n1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VACF_n1")};
_n1 = VACF_Heading;
_n2 = VACF_Distance;

_display = uiNameSpace getVariable "VACF_n1";
_setText = _display displayCtrl 9900;
_setText ctrlSetStructuredText (parseText format ["HEADING: %1 DISTANCE: %2", _n1, _n2]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];