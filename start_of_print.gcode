;ELEGOO NEPTUNE 4 PRO

M220 S100 ;Set the feed speed to 100%
M221 S100 ;Set the flow rate to 100%
M104 S120 ;Set nozzle temperature to preheat 120
M190 S[bed_temperature_initial_layer_single]
G90 ;Absolute positioning
G28 ;home

G1 Z3  X-10 Y235 F6000 ;Move to edge of the bed

M400 ;finish moves

M109 S[nozzle_temperature_initial_layer] ;Set the right nozzle temp
G92 E0 ;Reset Extruder
M17 E ;Enable stepper motors
G91 ;Incremental positioning
M83 ;override G90 and put the E axis into relative mode independent of the other axes
G1 E50 F200 ;Extrude 50mm
G4 P2000 ;Wait for 2 seconds
G1 X20 F15000 ;Move +20mm the X axis
G1 X-20 ;do the same but opposite
G1 X20
G1 X-20
G1 X20
G1 X-20

; uncomment next section if you have a wire brush on the bottom left corner and want the head to wipe there
;G1 X25 Y0 Z10 F1000
;G28 X0 Y0
;G1 Y50 Z5 F1000
;G1 Y0 Z5 F1000
;G1 Y50 Z5 F1000
;G1 X25 Y50 Z20 F1000 

G90 ;Turns absolute positioning back on
G92 E0 ;Reset Extruder
