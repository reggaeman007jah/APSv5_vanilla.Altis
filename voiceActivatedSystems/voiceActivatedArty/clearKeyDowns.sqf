/*
from:		voiceActivatedArty\keyDownMonitor.sqf

purpose:
clears all currently assigned key down event handlers 
(will) also clears down all rendered UI 
lastly, turns VAMP back to 'active (false)'

notes:
this has a cancel EH
*/

_ehRemove0 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd0];
_ehRemove1 	= (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_cnl];
_ehRemove2 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd1];
_ehRemove3 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd2];
_ehRemove4 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd3];
_ehRemove5 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd4];
_ehRemove6 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd5];
_ehRemove7 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd6];
_ehRemove8 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd7];
_ehRemove9 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd8];
_ehRemove10 = (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_kd9];
_ehRemove11 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_cnl];

numericalInputBool 	= false;
vamp 				= false;

1 cutRsc ["default","PLAIN"];
2 cutRsc ["default","PLAIN"];
3 cutRsc ["default","PLAIN"];
4 cutRsc ["default","PLAIN"];
5 cutRsc ["default","PLAIN"];


