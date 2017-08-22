# Content
I built two packages here,
1. TM4C123 Tiva-C package and its symbol
2. Amplified Hum 900 PRO package and its symbol

## Definitions
* `Package`: the layout of the device used in the PCB
* `Symbol`: the schematic of the device used in designing
* `Device`: the combination of the package and the symbol for a certain part

## EAGLE commands
* to create a rectangle in EAGLE, where first parameter refers to line width, and the other parameters to the coordinates.
* the point you started at, here it is (0 0), you must finish at.
```
WIRE 0.1 (0 0) (0 16.66) (25.70 16.66) (25.70 0) (0 0)
```
##EAGLE shortcuts
* to move a group, select it, then ctrl+Right Click
* to resize board dimension, use move tool
* to connect board bottom to ground, draw a polygon, then name it to GND signal
* select `Ratsnest` to fill up the polygon (it creates a shortest path between points, thus it is filling the GND area)
* `smash` tool lets you explode any component

## Gerber Files
* chose CAM Processor to generate gerber files, each layer (section) has its own device and file extension,
* we want to make the saving path and name as generic as possible, so, %P refers to current path, %N refers to current file name without extension
 * `%P\Gerber\%N.cmp` (Copper, component side) with device `GERBER_RS274X`, layers 1, 17, 18
 * `%P\Gerber\%N.sol` (Copper, solder side) with device `GERBER_RS274X`, layers 16, 17, 18
 * `%P\Gerber\%N.plc` (Silk screen, component side) with device `GERBER_RS274X`, layers 20, 21, 25
 * `%P\Gerber\%N.pls` (Silk screen, solder side) with device `GERBER_RS274X`, layers 20, 22, 26
 * `%P\Gerber\%N.stc` (Solder stop mask, component side) with device `GERBER_RS274X`, layers 29
 * `%P\Gerber\%N.sts` (Solder stop mask, solder side) with device `GERBER_RS274X`, layers 30
 * `%P\Gerber\%N.drd` (Drill file) with device `EXCELLON`, layers 44, 45

 * `%P\Gerber\%N.dri` (Drill Station Info File) – _Usually not needed_
 * `%P\Gerber\%N.gpi` (Photoplotter Info File) – _Usually not needed_

## Pitfalls, taken from Jorge Garcia
_Lost Consistency_: this a common issue, especially for new users. What the error is telling you is that on your schematic you have some pin connected to some signal, however in the board design no such connection exists.
 
Here's a procedure for regaining consistency:
 
To regain consistency run the ERC in the schematic, it will point out all of the consistency errors. Do whatever you have to do to correct them.
* If the errors are missing parts in schematic and board, then erase the parts from either the schematic or the board that way both are the same.
* If there are net issues, again delete or add any traces that may be necessary. If you find that the number of net errors is very large then you can correct them all by using a _netscript_.
 
 1. In your schematic go File->Export-> Netscript. Save the Netscript and make sure you know where it is.
 2. In your board file turn off all of the layers except 19 Unrouted. You should only see your airwires. If you've routed the board you're going to have to ripup everything for this method to work. Once you see all of your airwires, select them as a group and delete them.
 3. Turn all of your layers back on
 4. Now there's an icon at the top of the screen that looks like a sheet of paper with the letters _SCR_, click it. As an alternative, type Script-> Enter in the command line.
 5. Find the netscript we created earlier and run it. You'll see that all of the airwires are back. If you run the ERC again, you'll see that all of the net errors should be gone.
 
 