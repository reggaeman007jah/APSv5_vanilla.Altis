
_sounds = ["success1"];
_sound = selectRandom _sounds;
{playSound _sound} remoteExec ["call",0];