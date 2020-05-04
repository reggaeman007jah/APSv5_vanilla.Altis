/*
from:	??.sqf 
to:		screen render 

purpose:
RSC screen render of initial VACF Title 

notes:
gets overwritten as soon as coord / location data is generated
*/

1 cutRsc ["VACF_h1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VACF_h1")};
_n1 = "AWAITING DATA";

_display = uiNameSpace getVariable "VACF_h1";
_setText = _display displayCtrl 9901;
_setText ctrlSetStructuredText (parseText format ["VACF: %1", _n1]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];
