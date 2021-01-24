Auto Patrol System v3

April 2020
This is an old project from 2018 I recovered and rebuilt from scratch.

In summary, Blufor and Opfor troops are auto-created and pitted against eachother in a series of clashes.

Blue Marker = permaBase for Blufor troops, and provides respawn point, vehicle respawn, rearm refuel and repair trucks etc
Red Marker (main) = patrol AO, with the center of which the main patrol objective
Dark grey marker = main AO area

You can play along in different ways:
on the ground as a single unit fighting alongside the patrol
on the ground, taking direct control of some/all units using C2, AIC or similar
on the gound in landrovers providing HMG support
in the air providing CAS
in the air providing Medivac (not yet built)
in the air providing smoke-led arty missions and generla observation support
as an observer using indiCam or simmilar

The flow works like this:
blufor units move to a location that is defended by opfor
blufor fights for opfor position, and if successful, waits for opfor reprisals
if successful in repelling this attack, blufor moves to the next key patrol point
if blufor unit numbers are depleted, another platoon (20 units) is created at moves in to support the patrol
in theory this mission can run without any direct intervention (player input) indefinately

--- ^^^ needs updating!

Blacklists
Blacklists can be used to direct the flow of any patrol. Some testing is needed here, but overall I have a proven way to determine where patrols will 'not' spawn
This means that a mission designer can direct the flow of a patrol through certain areas of interest, like towns
This is all managed through markers within the mission itself
Code can also be used but markers are way easier to manage
It is important to ensure that any needed blacklist markers are shown in the blackList array, otherwise the flow will break badly
