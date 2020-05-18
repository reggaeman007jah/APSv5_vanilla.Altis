systemChat " ... Voice Activated JTAC System Activated ... ";

/\*
Voice Activated JTAC System (VA-VMS) by Reggaeman
May 2020

Notes:
This system will enable a player to use VA to create a a CAS Fire Mission using voice commands
Essentially this will be a tool for setting a target location and attact vector, shown on a map (globally)
System feedback is to confirm this to all units (though remoteExec systChat for now)
If this is a mistake in fire mission calling, for now, tough, let it expire and tell your units about your mistake

activate JTAC System
Input location - 10 Grid
Input Vactor - 8 cardinal points NE, N NW etc
Input Target Type - infantry / armour / unknown
Attack Type - guns / guns and rockets / unload all rockets
Input danger close - yes or no - yes indicates there are friendly forces near by - no indicates no consideration needed
Confirm or cancel call at any time
Marker colour - red green blue yellow orange - to help diff between simultaneous fire missions
fire mission designation - alpha bravo charlie delta echo - these are used to concel missions after calling
(missions will time out after 5 minutes anyway)

initially:
CAS fire mission
Request pickup
Request repair
Request slingload

this is jtac requesting an immadiate fire mission
confirm location
10-grid location is 1 2 4 5 6 3 2 1 4 5
thank you, confirm attack vector
Attack vector north to south / south to north / north east to south west / or no attack vector specified  
 thank you, confirm target type (soft, hard or armour)
confirm target type infantry
thank you, confirm helis required (1-5)
Requesting 2 heli attack
thank you, confirm weaponry required (gun run, rockets, guns and rockets, rocket dump)
confirm guns and rockets
thank you, is this danger close?
Yes, danger close / no danger not close
thank you, confirm marker colour (red, green, blue)
Confirm Red
thank you, confirm mission designation (alpha to echo)
Confirm designation echo
thank you, confirm mission duration (minutes 1-5 or runs 1-5)
Confirm mission duration 3 runs
thank you

fire Mission Echo Red
helis: 2
duration: 3 runs
location: 1 2 3 4 3 4 5 5 4 5
Vector: NW to SE
target type: infantry
ordenance: guns and rockets
risk: danger not close

states:
init (input: enter Fire mission, pickup, slingload, repair)

if fire mission:
gridLocation (input: enter 10-grid)
approachVector (input: from)
exitVector (input: to)
targetType (input: infi, motorised, armour)
heliNumbers (input: 1-5)
ordRequired (input: guns, rocks, guns and rocks, rocket dump)
dangerClose (input yes or no)
markerColour (input: r g b)
missionID (input: a b c d e)
missionDuration (input 1-5 mins or 1-5 runs)
confirm / cancel

else:
gridLocation (input: enter 10-grid)
approachVector (input: cardinal direction)
exitVector (input: cardinal direction)
knownThreats (none, small arms fire, static weapons, AA, mobile AA)
LZ safety (input: green, amber, red)
markerColour (input: r g b)
missionID (input: a b c d e)

if pickup
type (input: units or slingload vehicles)

if units
Number of units to transport (input: 1, 2-4, 5-8, 9-12, 13-20, 21-24)

if slingload
Type of vehicle requiring lifting (only one)

confirm / cancel

if repair
gridLocation (input: enter 10-grid)
approachVector (input: cardinal direction)
exitVector (input: cardinal direction)
knownThreats (none, small arms fire, static weapons, AA, mobile AA)
Number of units to transport (input: 1, 2-4, 5-8, 9-12, 13-20, 21-24)
LZ safety (input: green, amber, red)
markerColour (input: r g b)
missionID (input: a b c d e)
confirm / cancel
