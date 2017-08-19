# Content
I built two packages here,
1. TM4C123 Tiva-C package and its symbol
2. Amplified Hum 900 PRO package and its symbol

## Definitions
`Package`: the layout of the device used in the PCB
`Symbol`: the schematic of the device used in designing
`Device`: the combination of the package and the symbol for a certain part

## EAGLE commands
* to create a rectangle in EAGLE, where first parameter refers to line width, and the other parameters to the coordinates.
* the point you started at, here it is (0 0), you must finish at.
```
WIRE 0.1 (0 0) (0 16.66) (25.70 16.66) (25.70 0) (0 0)
```