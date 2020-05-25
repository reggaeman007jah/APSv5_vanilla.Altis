
/*

RGG_fieldbases = holds all taken base points 

sapperCheck = true; - this needs to be the outcome to trigger back the saper check - ensures only one attack at a time to deal with 

if this is running, it means an attack has been triggered 

determine target 

determine attack force 

send force to chosen base 

set counter when this is triggered 

ensure group is set to stealth 

track when opfor is in the base core marker area (create if does not exist)

set counter when they get there 

check after 10 minutes 

if they are, then move them to their origin (this also needs a marker) and start explosive timer 

get pos of each item at base - set exp on each item 

determine how these can be turned off 

if not turned off, set bombs off and alert all players a base has been lost 


*/


// select random base target location (exclusing current front line fob)

// create spawn point 

// create target marker 

// create sappers 

// set sapper behaviour and move orders 

// determine target items - check are these items held in an array anywhere? 

// alert players that local intel is suggesting an attack is immenent but no exact details given 

// start check to see if they make it to target // also in same check see if team is still alive - active 

// if any of the team are still alive, they will try to damage the base 

// if all of the team are destroyed, the threat is closed and players notified soon after, sapper bool reset 

// if any of the team make it to the core, a timer starts 

// timer is two minutes and all players alerted 

// after two minutes, opfor run off back to their origin, and eventually get grabbed by the insurance order 

// after five minutes, destroy base with explosions 

// ensure a detection script is running - any blufor units near a base should alert all players if any opfor spotted 

// if players can get to the base after an activation they can try to defuse the bomb - there should be an object placed with an addaction 

// the addaction should offer three questions - if all correct answers, bomb is defused - if any wrong, bomb is accelerated with 20 seconds to get away! 

// a dsetroyed base means that you cannot spawn from there, there are no repair or medics, and the RF delay is x3 

// so if two bases are destroyed, that is x3 x3 

// there should be a sapper fob, secret and standalone - if that is found, then all sapper missions stop for a hour, after which another sapper fob is created 

