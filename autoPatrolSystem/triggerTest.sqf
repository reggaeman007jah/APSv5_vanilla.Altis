/*
trigger test 
createTrigger [type, position, makeGlobal]
trigger setTriggerArea [a, b, angle, isRectangle, c]
trigger setTriggerActivation [by, type, repeating]
trigger setTriggerStatements [condition, activation, deactivation]
createGuardedPoint [side, position, objectMapID, vehicle]

_trg = createTrigger ["EmptyDetector", getPos player];
_trg setTriggerArea [5, 5, 0, false];
_trg setTriggerActivation ["CIV", "PRESENT", true];
_trg setTriggerStatements ["this", "hint 'Civilian near player'", "hint 'no civilian near'"];

*/





// _testTrigger_opforPresent = createTrigger ["EmptyDetector", RGG_patrol_obj, true];
// _testTrigger_opforPresent setTriggerArea [20, 20, 0, false];
// _testTrigger_opforPresent setTriggerInterval 5;
// _testTrigger_opforPresent setTriggerActivation ["EAST", "PRESENT", true];
// _testTrigger_opforPresent setTriggerStatements [
// 	"this", 
// 	"systemChat 'OPFOR IN REDZONE'", 
// 	"systemChat 'NO OPFOR IN REDZONE'"
// ]; 