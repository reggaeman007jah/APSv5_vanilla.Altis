/*
This file sets up some basic mission-flow params 
one/two/threePoint relates to states I use to determine how many directions the retalliation should psawn from 

April 2020
monitorDefence is a mission state - it needs to be declared at this early stage as it is used by an Insurance System, and needs to be declared (as false)
in order to work - but check this is actually the case! Maybe try deleting it and see if it throws an error

toDo / April 2020 / confirm why I now do not need the commented out RF trigger value below 
*/

// RGG_reinforcementTrigger = 10;

// position blacklist - prevents overlapping of patrol points 
RGG_patrolPositionBlacklist = ["nowest"];
// RGG_patrolPositionBlacklist = ["blacklist4","blacklist3","blacklist2","blacklist1","nosouth","nowest"];
// RGG_patrolPositionBlacklist = ["blacklist4","blacklist3","blacklist2","blacklist1","nosouth","nowest","noeast"];
// RGG_patrolPositionBlacklist = ["blacklist4","blacklist3","blacklist2","blacklist1"];

// [[500,500],[12500,450]] // bottom edge boundary 
// [[500,12500],[12500,12450]] // top edge boundary 
// [[500,12500],[500,550]] // right edge boundary 
// [[12500,12500],[12550,500]] // left edge boundary
// [[500,3300],[12500,3000]],[[500,500],[12500,450]],[[500,12500],[12500,12450]],[[500,12500],[500,550]],[[12500,12500],[12550,500]],
// [[500,3300],[12500,3000]] // test lower third 

// Manages total count of groups created 
RGG_totalOpforGroups = [];
RGG_totalIndiforGroups = [];
publicVariable "RGG_totalOpforGroups";
publicVariable "RGG_totalIndiforGroups";

// opfor RF gen system
ONEPOINT = false;
TWOPOINT = false;
THREEPOINT = false;

// mission state 
monitorDefence = false;

// base-counter var for tracking how many missions have been completed 
patrolPointsTaken = 0;
publicVariable "patrolPointsTaken";


// base-counter var for tracking how many times RF have been called in 
reinforcementsCalled = 0;
publicVariable "reinforcementsCalled";


// base-counter var for tracking how many patrols have been totally wiped out while in-field 
lostPatrols = 0;

// bool to track if a patrol has been lost
LOSTPATROL = false;

// you could maybe also track mission time on each 'take' to track time for each mission point?

// field bases array
fieldBases = [];

// mission status 
// there are a few different stages of the mission, these states will track the current task 
MISSIONTASK = "Setting up initial patrol";
publicVariable "MISSIONTASK";


// track created units  
spawnedIndiUnit = 0;
spawnedOpforUnit = 0;
publicVariable "spawnedIndiUnit";
publicVariable "spawnedOpforUnit";

