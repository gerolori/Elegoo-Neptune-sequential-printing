# Elegoo Neptune 4/4 Pro sequential printing
Guide on how to setup sequential printing on Neptune 4/4 Pro
DISCLAIMER: if you're running the stock Elegoo firmware you won't be able to achieve fully automatic printing. The g-code snippets will still work but you won't be able to queue any jobs. You could still remotely trigger the next job to simulate the desired behaviour.
To unlock the job queue function of Klipper you should upgrade to [OpenNept4ne](https://github.com/OpenNeptune3D/OpenNept4une)

## Raccomandation
Use the smooth part of the PEI bed if you're still using the original. Consider upgrading to a glass one (this requires to change the probe too, the original one works with the magnetic PEI, if not changed the nozzle will dig into the glass when calibrating). Using the normal textured PEI bed will potentially damage you motors (or make your belts skip) as it has too much grip to self release at 29°C. If you can only use the textured one do it at your own risk (you may have more success with lowering to 25°C for a full release of the part).

# Instructions
### Purge bin
[Click here](https://thangs.com/search/neptune%20bin?scope=all) for some exampple of bins, print any that you like. Any bin that will cover the extreme left of the x axis will work. I'll eventually release mine with a slope so that the purge lines will fall to the bottom when cold.
### Slicer settings
Put the start_of_print.gcode and end_of_print.gcode in the respective sections of your printer settings in your slicer.
### Klipper job queue mode
Have a look at the [documentation]([url](https://moonraker.readthedocs.io/en/latest/configuration/)) as there are many more options to run this. If you want simple continuous print when starting a print, then add the moonraker.conf text in the right section of your moonraker.conf. Remember to reboot your printer for the changes to take effect.
## Continuous print of a single object
If you're looking to specify a number of copies and having the printer print them automatically, go take a look at [this awesome repository](https://github.com/hessfab/continuous-prints-klipper)
