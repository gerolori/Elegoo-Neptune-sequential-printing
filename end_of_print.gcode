;PRINT END
G91 ;Relative positioning
G1 E-2 F2700 ;Retract 2mm
G1 E-8 X5 Y5 Z3 F3000 ;Retract and move
G90 ;Absolute positionning
G1 X117.50 Y235 F6000;Finish print, go to center back of bed
G1 Z1 F6000; lower the head to make cooling more effective
M104 S0 ;Turn-off hotend
M140 S0 ;Turn-off bed

;cooling
M106 S255 ;Turn-on fan to cool bed faster
TEMPERATURE_WAIT SENSOR=heater_bed MAXIMUM=29 ;Wait for temperature of bed to bed 29°C
M106 S0 ;Turn-off fan

;clearing bed
G1 Y0 F1000 ;Push the bed backward

;finished
G1 X10 Y117.50 Z10 F6000 ; go near homing coordinates for efficiency
M84 X Y E ;Disable all steppers but Z
