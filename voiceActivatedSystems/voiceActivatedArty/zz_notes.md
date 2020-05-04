next task, write scripts to enable multi-strikes to happem simulteneously

This will only affect SU for now

You can currently choose a single SU strike - you need to also be able to select MULTI-STRIKE

Then question is - how many for a combined strike? 2, 3 or 4?

New arrays are needed here:

SU2nd = [];
SU3rd = [];
SU4th = [];

each will hold only one coord, hopefully reducing more code.

ie each strike will be held in its own array.

If single - no change needed.
