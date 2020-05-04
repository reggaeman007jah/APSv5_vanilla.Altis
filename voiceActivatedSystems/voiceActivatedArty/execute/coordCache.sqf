/*
from: 	voiceActivatedArty\execute\confirmExecute.sqf	
to:

purpose:
this will hold the last confirmed coords, enable an 'adjust fire' function, or 'repeat hit'.

notes:
how many should be held here?
if just one, ie the last hit, that is not too bad
*/

_lat = _this select 0;
_lon = _this select 1;
_pos = [_lat, _lon];

RGG_cachedCoords = _pos; 