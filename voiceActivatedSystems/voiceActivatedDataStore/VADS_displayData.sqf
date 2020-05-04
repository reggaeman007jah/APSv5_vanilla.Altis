/*
from:	voiceActivatedDataStore\initialiseVADS.sqf
to:		on-screen display		

purpose:
initial render instructions for all held VACF data 

notes:


*/

/*
notes from VACF...

Draft of the system used to store data from VACF 

Aim to store upto 8 line items of data 

An array can hold the data, then count the array items to generate required numbers 

Need to be able to show and hide data storage 

data storage should show (as a list) when you 'activate GPS tracker'

Every time you enter a coord, a new item apprears on the left, until 10 items, after which the oldest is removed 

You can simply let the system store and cycle the data, or you can say "open data manager"

"o d m" will enable you to (using voice) allocate labels to each data item 

"o d m"

"select 6"

assign label / delete / pin (will not delete - you can only pin one for now)

if "a l" you get a new choice of items - alpha, bravo, main objective, secondary staging etc 

for now, only 8 or 9 choices, including a "go back" option 

ok, so now I think, when you open VACF, you see a read-only view of teh current data held in the VADSS data storage system 

When you call a co-ord, you see it go to the top of the data list 

(should you need to close it automatically?)
(maybe have a flashing system briefly, then auto-close)

To manage the data, you should call the new VADS system, to assign labels etc.

But you can also view the data in VAAS, when making calls ... you could also view VADSS in other modules too maybe..

so first thing I need to build is a system that keeps upto 10 items, and then cycles older ones out when new ones arrive 


*/



/*
from:	presentation.sqf 
to:		screen render - left list 

purpose:
RSC screen render of stored data 

notes:

*/

_countData = count VAMP_dataList; // determines how many items we have in the data list 

// if we have ten items, we delete the oldest one 
// as we are using pushback, with the newest item at the back of the array, we delete position 0 as the oldest item 
// if (_countData == 10) then {
// 	systemChat "deleting oldest data:";
// 	_countData = _countData deleteAt 0;
// 	systemChat str _countData;
// };

// now we use the data parsed to us from presentation.sqf 
// _lat = _this select 0;
// _lon = _this select 1;
// _newItem = _lat + _lon; // this links them together as one string 
// VAMP_dataList pushBack _newItem; // this pushes the new single item to the rear of the array
// systemChat "pushback data done";
// systemChat str VAMP_dataList;

// wrapper
// _header = "VA Data Storage";
// _footer = "Select an item, then label";

// now we need a line for each item in the array (including empty items)
// we populate them by using array position selectors 
// VADS_entry1 = VAMP_dataList select 7;
// VADS_entry2 = VAMP_dataList select 6;
// VADS_entry3 = VAMP_dataList select 5;
// VADS_entry4 = VAMP_dataList select 4;
// VADS_entry5 = VAMP_dataList select 3;
// VADS_entry6 = VAMP_dataList select 2;
// VADS_entry7 = VAMP_dataList select 1;
// VADS_entry8 = VAMP_dataList select 0;

VADS_entry1 =  ((VAMP_dataList select 7) select 0);
VADS_entry2 =  ((VAMP_dataList select 6) select 0);
VADS_entry3 =  ((VAMP_dataList select 5) select 0);
VADS_entry4 =  ((VAMP_dataList select 4) select 0);
VADS_entry5 =  ((VAMP_dataList select 3) select 0);
VADS_entry6 =  ((VAMP_dataList select 2) select 0);
VADS_entry7 =  ((VAMP_dataList select 1) select 0);
VADS_entry8 =  ((VAMP_dataList select 0) select 0);

VADS_label1 =  ((VAMP_dataList select 7) select 1);
VADS_label2 =  ((VAMP_dataList select 6) select 1);
VADS_label3 =  ((VAMP_dataList select 5) select 1);
VADS_label4 =  ((VAMP_dataList select 4) select 1);
VADS_label5 =  ((VAMP_dataList select 3) select 1);
VADS_label6 =  ((VAMP_dataList select 2) select 1);
VADS_label7 =  ((VAMP_dataList select 1) select 1);
VADS_label8 =  ((VAMP_dataList select 0) select 1);

// allocate display layers
disableSerialization;
20 cutRsc ["VADS_header","PLAIN"];
21 cutRsc ["VADS_line1","PLAIN"];
22 cutRsc ["VADS_line2","PLAIN"];
23 cutRsc ["VADS_line3","PLAIN"];
24 cutRsc ["VADS_line4","PLAIN"];
25 cutRsc ["VADS_line5","PLAIN"];
26 cutRsc ["VADS_line6","PLAIN"];
27 cutRsc ["VADS_line7","PLAIN"];
28 cutRsc ["VADS_line8","PLAIN"];
29 cutRsc ["VADS_footer","PLAIN"];

30 cutRsc ["VADS_RSClabelheader","PLAIN"];
31 cutRsc ["VADS_RSClabel1","PLAIN"];
32 cutRsc ["VADS_RSClabel2","PLAIN"];
33 cutRsc ["VADS_RSClabel3","PLAIN"];
34 cutRsc ["VADS_RSClabel4","PLAIN"];
35 cutRsc ["VADS_RSClabel5","PLAIN"];
36 cutRsc ["VADS_RSClabel6","PLAIN"];
37 cutRsc ["VADS_RSClabel7","PLAIN"];
38 cutRsc ["VADS_RSClabel8","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VADS_line1")};

// left render 
_display = uiNameSpace getVariable "VADS_header";
_setText = _display displayCtrl 990000;
_setText ctrlSetStructuredText (parseText format ["VADS"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

_display = uiNameSpace getVariable "VADS_line1";
_setText = _display displayCtrl 990001;
_setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2", VADS_entry1, VADS_label1]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

_display = uiNameSpace getVariable "VADS_line2";
_setText = _display displayCtrl 990002;
_setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",VADS_entry2, VADS_label2]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

_display = uiNameSpace getVariable "VADS_line3";
_setText = _display displayCtrl 990003;
_setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",VADS_entry3, VADS_label3]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

_display = uiNameSpace getVariable "VADS_line4";
_setText = _display displayCtrl 990004;
_setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",VADS_entry4, VADS_label4]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

_display = uiNameSpace getVariable "VADS_line5";
_setText = _display displayCtrl 990005;
_setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",VADS_entry5, VADS_label5]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

_display = uiNameSpace getVariable "VADS_line6";
_setText = _display displayCtrl 990006;
_setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",VADS_entry6, VADS_label6]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

_display = uiNameSpace getVariable "VADS_line7";
_setText = _display displayCtrl 990007;
_setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",VADS_entry7, VADS_label7]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

_display = uiNameSpace getVariable "VADS_line8";
_setText = _display displayCtrl 990008;
_setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",VADS_entry8, VADS_label8]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_line9";
// _setText = _display displayCtrl 9900009;
// _setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",_entry9, _entry9Label]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_line10";
// _setText = _display displayCtrl 9900010;
// _setText ctrlSetStructuredText (parseText format ["Grid: %1 / Type: %2",_entry10, _entry10Label]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_footer";
// _setText = _display displayCtrl 990011;
// _setText ctrlSetStructuredText (parseText format ["Select and Edit Point"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

/*
_arr = [1,2,3];
_arr pushBack 4;
hint str _arr; //[1,2,3,4]

_arr = [1,2,3];
_rem = _arr deleteAt 1;
hint str [_rem, _arr]; //[2,[1,3]]990028
*/

// right render 
// _display = uiNameSpace getVariable "VADS_RSClabelheader";
// _setText = _display displayCtrl 990020;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_RSClabel1";
// _setText = _display displayCtrl 990021;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_RSClabel2";
// _setText = _display displayCtrl 990022;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_RSClabel3";
// _setText = _display displayCtrl 990023;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_RSClabel4";
// _setText = _display displayCtrl 990024;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_RSClabel5";
// _setText = _display displayCtrl 990025;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_RSClabel6";
// _setText = _display displayCtrl 990026;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_RSClabel7";
// _setText = _display displayCtrl 990027;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// _display = uiNameSpace getVariable "VADS_RSClabel8";
// _setText = _display displayCtrl 990028;
// _setText ctrlSetStructuredText (parseText format ["Tac-Points"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];


