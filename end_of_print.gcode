;PRINT END
G91 ;Relative positionning
G1 E-2 F2700 ;Retract a bit
G1 E-8 X5 Y5 Z3 F3000 ;Retract
G90 ;Absolute positionning
G1 X117.50 Y235 F6000;Finish print
M106 S0 ;Turn-off fan
M104 S0 ;Turn-off hotend
M140 S0 ;Turn-off bed

:G4 P900000 ; Wait for 10*60 seconds to cool down bed
TEMPERATURE_WAIT SENSOR=heater_bed MAXIMUM=29 ;Wait for temperature of bed to be 29°C

G1 Z1 F600 ;Lower the head to 1mm
G1 Y0 F500 ;Push the bed backward

G1 X10 Y10 Z10 F6000 ; go near homing coordinates for efficiency

M84 X Y E ;Disable all steppers but Z
