# protea-parts
Documentation and parts to convert a Kossel Mini to print UV-curing gels
by MsEntropic / Kate Oliver / Scary

This repo contains the 3D printable parts to convert a Kossel Mini 3D printer (Rocholl, forked here) 
to print hydrogels and cure them with a UV mount on the head.

Required modifications:
* Syringe extruder driven by motor compatible with RAMPS board.

#BOM for nozzle dispensing head#

For each line between syringe and nozzle (recommend multiples)
* Male luer lock(or slip, both work)/barb converter union for syringe
* 1m of 2mm/3mm internal diameter silicone tubing
* Barb-male UNC screw thread (current project uses 10/32) union

For nozzle:
* Female UNC screw thread - female luer lock union
* Nozzle housing - 3D printable design provided here, customisable to screwthread-luerlock dimensions
* Modified effector to bear nozzle housing and UV LEDs - provided here

#BOM for UV#

For UV elements:
* UV leds - this project uses 8 in two parallel branches
* Mounted radially on circular PCB 40mm dia with central hole for union and two holes for screws to secure to effector
* Heatsink backing, also with screw holes
* (Optional but recommended) UV focusing unit - made from thin aluminium sheet bent into 40mm dia cylinder and crimped 
(other methods are possible)

If LEDS require >voltage of printer (Kossel mini standard 12V)
* IRL540N MOSFET
* Wire to connect
* Separate power supply sufficient to LEDs

#KNOWN ISSUES: collision between nuts securing nozzle holder and PCB to effector. On my todo list (which is more of a todo matrix).
For a quick fix, just use one nut to secure the nozzle holder.
