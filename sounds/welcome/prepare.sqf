// {playSound "prepare1"} remoteExec ["call",0];

// _sounds = ["pointTakenPrepare1", "pointTakenPrepare2", "pointTakenPrepare3"];
// _sound = selectRandom _sounds;
// {playSound _sound} remoteExec ["call",0];

// _sounds = ["pointTakenPrepare1", "pointTakenPrepare2", "pointTakenPrepare3"];
// _sound = selectRandom _sounds;

COMMANDSPEAKING = true;

{playSound "pointTakenPrepare1"} remoteExec ["call",0];

sleep 7;

{playSound "commandOut"} remoteExec ["call",0];

sleep 3;

COMMANDSPEAKING = false;