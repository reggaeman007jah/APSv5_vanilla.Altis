1 cutRsc ["VAAS_h1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAAS_h1")};
_n1 = "CONFIRM TYPE";

_display = uiNameSpace getVariable "VAAS_h1";
_setText = _display displayCtrl 99002;
_setText ctrlSetStructuredText (parseText format ["VAAS: %1", _n1]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];
