
// systemChat "playing missionLive";
// ["missionLive1", 1000, 1] remoteExec ["say3D"];
// {playSound "missionLive1"} remoteExec ["call",0];

// _sounds = ["thisIsCommand1", "thisIsCommand2", "thisIsCommand3"];
// _sound = selectRandom _sounds;
// {playSound _sound} remoteExec ["call",0];

// sleep 3;

// _sounds = ["patrolNowLive1", "patrolNowLive2"];
// _sound = selectRandom _sounds;
// {playSound _sound} remoteExec ["call",0];

// _sounds = ["patrolNowLive1", "patrolNowLive2"];
// _sound = selectRandom _sounds;

{playSound "thisIsCommand1"} remoteExec ["call",0];

sleep 3;

{playSound "patrolNowLive1"} remoteExec ["call",0];

sleep 4;

{playSound "commandOut"} remoteExec ["call",0];
