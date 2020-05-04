Known Issues

---

Reinforcements will be given move orders on spawn, however if the obj changes while they are en-route, they will not get that change and instead make their way to the older obj, which could waste time
Instead, we need a way to redirect RF if the obj changes

---

Blufor can take a point - however before the 1/2/3/point opfor RF move in, there could be a stalemate where opfor dug-in defenders remain hidden - this breaks the flow
There is an Insurance Move for 1/2/3/Point opfor, there should be something similar for Blufor at this earlier stage

---

There is no direction over the flow of patrol points, and posentially these could drift quite far away fom peraBase.
Granted, this takes a while, but if this was to be on all the time, perhaps some automated transport would be needed?

---

I dont yet know how to make MP addactions

---

I cannot get refuel rearm or repair trucks in the mission as it creates a dependency for Blastcore???

---

I don't yet know how to make injured units detach from the main platoon and stay at tented areas

---

There is no end state

---

Blufor RF system just broke - this happened bc RF are called in only twice, once after taking the initial point and again checked as the opfor QRF heads in.
This broke as the patrol was wiped before they took the initial point, creating a flow breakage
To resolve - build a system that does a blufor count on a cycle, so if this is happening more often, reduce the number of RF created maybe to half ..
