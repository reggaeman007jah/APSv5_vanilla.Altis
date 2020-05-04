// for debugging only 
/*
This is a simple debug system that will cycle through each unit in-game, without diff between side and flash a little marker over their position 
I took this from an old script, and will be deleted when I am happy with the logic flow and perf 
*/

/*
	_opfor = [];
	{if ((side _x) == east) then {_opfor pushBack _x}} forEach allUnits;
*/
mapOpen = false;

showMapMarkers = 
  {
   _markers = [];
       {
         
        _data = [];
        _markName = name _x;
        _mrk = createMarkerLocal [_markName, position _x];
        _markName setMarkerColorLocal ([side _x, true] call BIS_fnc_sideColor);
        _markName setMarkerShapeLocal "ICON";
        _markName setMarkerTypeLocal "mil_dot";
        _markName setMarkerAlphaLocal 0.1;
        _data pushBack _x;
        _data pushBack _markName;
        _markers pushBack _data;
      } forEach allUnits;	
      
    while {mapOpen} do 
      {
        if !(visibleMap) then {mapOpen = false;};
          {
            _unit = _x select 0; _marker = _x select 1;


             // if ((alive _unit) && (side _unit == east)) then 
             //if (!(alive _unit) && (side _unit == east))then 
             if !(alive _unit) then
                {
                 // _marker setMarkerPosLocal position _unit; 
                  deleteMarkerLocal _marker;                      
                } else
                
                {
                  _marker setMarkerAlphaLocal 1;
                  _marker setMarkerTypeLocal "mil_box";
                  _marker setMarkerPosLocal position _unit; 
                  _marker setMarkerSizeLocal [1.2, 1.2];
                  _marker setMarkerColorLocal "COLORRED";
                  sleep 0.5;
                  _marker setMarkerSizeLocal [0.5, 0.5]; 
                  deleteMarkerLocal _marker; 


                };



                /*if ((!alive _unit) && (side _unit == east)) then
                {
                  _marker setMarkerAlphaLocal 1;
                  _marker setMarkerTypeLocal "mil_box";
                  _marker setMarkerPosLocal position _unit; 
                  _marker setMarkerSizeLocal [0.3, 0.3];
                  _marker setMarkerColorLocal "COLORBLUE";
                };*/

          } forEach _markers; //sleep 5; deleteMarkerLocal _marker;
        sleep 1; // this is the frequency of marker refresh
      };
  };

    while {true} do
    //for "_i" from 0 to 3 do // this might be a way to make this a temp feature?
      {
        if (visibleMap && !mapOpen) then
            {
              mapOpen = true;
              call showMapMarkers;
            };
        sleep 1; // this is the time taken to generate the initial markers via addAction command (or other). or is this every time map is opened?
      }; 
      


/*
{
    removeAllWeapons _x;
  // _x action ["SwitchWeapon", _unit, _unit, 100]; 
   _x addBackpackGlobal "US_Patrol_Pack_EP1";
 

} forEach units group player;
*/