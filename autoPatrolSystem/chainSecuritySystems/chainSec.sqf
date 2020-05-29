/*
chainSec manages the patrolling of previously taken patrol points. Blufor units will be created and will move from one to the next 
this team will manage any reaction to sappers or hostile specops attacks on FOBs 
choose an old patrol point and spawn sappers 2km out 
then alert all players of the appx grid 
sappers should be on stealth 
if sappers get to a patrol point core, they destroy the base 
to know if RF can happen, all bases must be true 
so we need an array to track all bases 
if a patrol point is taken, that point is deleted from the base array 
if the base array count does not match patrol points taken, then you have a break in the chain 

to recapture a lost base, you need 5 friendlies in the core for 2 mins  (starter idea) 
you then get your point back, but no repair or rearm, or heal .. just the point is returned. 
see if you can add crate box or tent wrecks here

so, we need to track taken base points !!
RGG_fieldbases is the array that stores base points 

so, when we have three points, we check each 5 minutes for sappers - the liklihood of sappers goes up the more links we have and the longer our supply route is 
but you might get hit early also ..
Game is based on 6 links (typical session) then after that keep 6 chances 
3 points = 10%
4 points = 20%
5 points = 30%
6+ points = 40%
check every 10 minutes 

if you get a hit, then choose a point that is at risk - here we capture the number of the item in the array 
we keep this number, as we will delete it if sappers are successful.
we need another array to store broken links - RGG_brokenLinks 

we also need to turn the marker colour red! or at least place anotehr marker over the top that can be deleted if taken back 

if we have the intel perk, then we get a rough grid .. if we have no intel, we just get told about the base threat from local sources 

so, establish a sapper op 
establish base target 
inform players 
move sappers to base 
if sappers are in core for 1 minute, blow up base and remove base location from array, breaking chain 
if sappers are destroyed, nothing happens (well, remove red warning marker)


*/

// wait for patrolPointsTaken == 3 
// spawn from main base 
// on arrival chekc points, if higher, move to next 
// if at any stage specops detected they will head to that base immediately 
sleep 10;

sapperCheck = true;

while {true} do {
	systemChat "sapperTest running";
	if (sapperCheck) then {
		if (patrolPointsTaken >0) then {
			switch (patrolPointsTaken) do {
				case (1): {
					_chance = random 99;
					if (_chance >20) then {
						hint "1 bases = sappers coming in on 20%";
						SAPPERS = true;
						sapperCheck = false;
					} else {
						hint "1 bases = no sappers on 20%";
					};
				};
				case (2): {
					_chance = random 99;
					if (_chance >20) then {
						hint "2 bases = sappers coming in on 20%";
						SAPPERS = true;
						sapperCheck = false;
					} else {
						hint "2 bases = no sappers on 20%";
					};
				};
				case (3): {
					_chance = random 99;
					if (_chance >20) then {
						hint "3 bases = sappers coming in on 20%";
						SAPPERS = true;
						sapperCheck = false;
					} else {
						hint "3 bases = no sappers on 20%";
					};
				};
				case (4): {
					_chance = random 99;
					if (_chance >25) then {
						hint "4 bases = sappers coming in on 25%";
						SAPPERS = true;
						sapperCheck = false;
					} else {
						hint "4 bases = no sappers on 30%";
					};
				};
				case (5): {
					_chance = random 99;
					if (_chance >30) then {
						hint "5 bases = sappers coming in on 30%";
						SAPPERS = true;
						sapperCheck = false;
					} else {
						hint "5 bases = no sappers on 40%";
					};
				};
				default {
					_chance = random 99;
					if (_chance >35) then {
						hint "6 bases = sappers coming in on 35%";
						SAPPERS = true;
						sapperCheck = false;
					} else {
						hint "6 bases = no sappers on 50%";
					};
				};
			};
		} else {
			hint "not enough bases to warrent sappers right now - you ok";
		};

		if (SAPPERS) then {
			execVM "autoPatrolSystem\chainSecuritySystems\attackBase.sqf";
			
		};
	};
	sleep 600; 
};
