
// _sounds = ["RFInbound"];
// _sound = selectRandom _sounds;
{playSound "RFInbound"} remoteExec ["call",0];

sleep 4;

{playSound "commandOut"} remoteExec ["call",0];