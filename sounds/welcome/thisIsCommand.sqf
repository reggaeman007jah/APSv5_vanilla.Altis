// playSound ["thisIsCommand1", TRUE, 0];

// systemChat "playing thisIsCommand";
// ["thisIsCommand1", 1000, 1] remoteExec ["say3D"];
// {playSound "thisIsCommand1"} remoteExec ["call",0];

// _sounds = ["thisIsCommand1", "thisIsCommand2", "thisIsCommand3"];
// _sound = selectRandom _sounds;
// {playSound _sound} remoteExec ["call",0];

COMMANDSPEAKING = true;

{playSound "thisIsCommand1"} remoteExec ["call",0];

sleep 3;

COMMANDSPEAKING = false;