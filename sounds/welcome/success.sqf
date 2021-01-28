// {playSound "success1"} remoteExec ["call",0];

sleep 1;

_sounds = ["opforNeutralised1", "opforNeutralised2"];
_sound = selectRandom _sounds;
{playSound _sound} remoteExec ["call",0];

sleep 3;

{playSound "commandOut"} remoteExec ["call",0];

sleep 120;

_sounds = ["thisIsCommand1", "thisIsCommand2", "thisIsCommand3"];
_sound = selectRandom _sounds;
{playSound _sound} remoteExec ["call",0];

sleep 3;

_sounds = ["patrolMoving1", "patrolMoving2"];
_sound = selectRandom _sounds;
{playSound _sound} remoteExec ["call",0];

sleep 3.2;

{playSound "commandOut"} remoteExec ["call",0];