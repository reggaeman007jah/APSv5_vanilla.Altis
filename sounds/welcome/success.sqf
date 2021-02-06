// {playSound "success1"} remoteExec ["call",0];

// sleep 1;

// _sounds = ["opforNeutralised1", "opforNeutralised2"];
// _sound = selectRandom _sounds;
// {playSound _sound} remoteExec ["call",0];

// sleep 3;

// {playSound "commandOut"} remoteExec ["call",0];

// sleep 120;

// _sounds = ["thisIsCommand1", "thisIsCommand2", "thisIsCommand3"];
// _sound = selectRandom _sounds;
// {playSound _sound} remoteExec ["call",0];

// sleep 3;

// _sounds = ["patrolMoving1", "patrolMoving2"];
// _sound = selectRandom _sounds;
// {playSound _sound} remoteExec ["call",0];

// sleep 3.2;

// {playSound "commandOut"} remoteExec ["call",0];
COMMANDSPEAKING = true;

sleep 1;

{playSound "opforNeutralised1"} remoteExec ["call",0];

sleep 3;

{playSound "commandOut"} remoteExec ["call",0];

sleep 3;

COMMANDSPEAKING = false;

sleep 100;

COMMANDSPEAKING = true;

sleep 20;

{playSound "thisIsCommand1"} remoteExec ["call",0];

sleep 3;

{playSound "patrolMoving1"} remoteExec ["call",0];

sleep 3.2;

{playSound "commandOut"} remoteExec ["call",0];

sleep 3;

COMMANDSPEAKING = false;