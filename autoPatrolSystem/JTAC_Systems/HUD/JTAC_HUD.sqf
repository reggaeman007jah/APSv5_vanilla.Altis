1 cutRsc ["CAS_1","PLAIN"];
1 cutRsc ["CAS_2","PLAIN"];
1 cutRsc ["CAS_3","PLAIN"];
1 cutRsc ["CAS_4","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "CAS_1")};

/*
this to show CAS pilots:

mission ID / colour text (non dynamic)
ttl (heading)
ttl (dynamic)
intel (heading) (opens / closes lower part)
danger close (heading)
danger close (non dynamic)
grid location (heading)) 
grid location (non dynamic)
target type (heading)
target type (non dynamic)
known threats (heading) 
known threats (non dynamic)
ord required (heading) 
ord required (non dynamic)

your heading (heading))
your heading (dynamic)
target heading (heading))
target heading (dynamic)
target distance (heading))
target distance (dynamic)
attack vector (heading))
attack vector (non dynamic)
exit vector (heading)
exit vector (non dynamic)

exitVector (input: to)


proof of concept - show simple message on-screen of any pilot letting them know there is a live CAS mission 
Remove when mission times out!

*/
_n1 = VACF_Heading;
_n2 = VACF_Distance;

_display = uiNameSpace getVariable "VACF_n1";
_setText = _display displayCtrl 9900;
_setText ctrlSetStructuredText (parseText format ["HEADING: %1 DISTANCE: %2", _n1, _n2]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];




while (CAS_HUD) do {



	sleep .02;
};