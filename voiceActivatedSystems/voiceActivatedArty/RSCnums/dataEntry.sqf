/*
from:	VAAS_keyDowns.sqf 
to:		screen render 

purpose:
RSC screen render of data as it is entered by the user  

notes:

*/

// -----------------------------------------------------------------------
// ------------ declare display buckets
// -----------------------------------------------------------------------

1 cutRsc ["VAAS_n1","PLAIN"]; // coord display 
2 cutRsc ["VAAS_t1", "PLAIN"]; // ord type display  
3 cutRsc ["VAAS_c1", "PLAIN"]; // confirm / cancel 
waitUntil {!isNull (uiNameSpace getVariable "VAAS_n1")};


// -----------------------------------------------------------------------
// ------------ declare display vars
// -----------------------------------------------------------------------

// type display vars (note: this should be a switch!)
confirmedTypeHE	= count splashArtyTypeHE;
confirmedTypeSU	= count splashArtyTypeSU;
confirmedTypeSM	= count splashArtyTypeSM;
confirmedTypeFL	= count splashArtyTypeFL;

_t1 = "test";

if (confirmedTypeHE == 1) then {
	_t1 = "High Explosive Barrage confirmed";
};

if (confirmedTypeSU == 1) then {
	_t1 =  "GBU Hellfire confirmed";
};

if (confirmedTypeSM == 1)  then {
	_t1 =  "Smoke confirmed";
};

if (confirmedTypeFL == 1)  then {
	_t1 =  "Flares confirmed";
};

// coord display vars
_n1 = splashCoordsLat;
_n2 = splashCoordsLon;

// confirm or cancel 
_c1 = "CONFIRM";
_c2 = "CANCEL";


// -----------------------------------------------------------------------
// ------------ render displays
// -----------------------------------------------------------------------

// coord display instructions
_display = uiNameSpace getVariable "VAAS_n1";
_setText = _display displayCtrl 99001;
_setText ctrlSetStructuredText (parseText format ["LAT: %1 LON: %2", _n1, _n2]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

// ord type display instructions 
_display = uiNameSpace getVariable "VAAS_t1";
_setText = _display displayCtrl 99003;
_setText ctrlSetStructuredText (parseText format ["REQUESTING: %1", _t1]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

// confirm / cancel 
_display = uiNameSpace getVariable "VAAS_c1";
_setText = _display displayCtrl 99004;
_setText ctrlSetStructuredText (parseText format ["%1 --- %2", _c1, _c2]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];