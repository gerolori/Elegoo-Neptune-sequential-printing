# Elegoo Neptune 4/4 Pro Sequential Printing

A collection of G-code scripts and configuration files to enable sequential/automatic printing on Elegoo Neptune 4 and 4 Pro 3D printers. This allows your printer to complete one print, automatically clear the bed, and start the next job in the queue without manual intervention.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Important Disclaimer](#important-disclaimer)
- [Recommendations](#recommendations)
- [Setup Instructions](#setup-instructions)
  - [1. Purge Bin](#1-purge-bin)
  - [2. Slicer Configuration](#2-slicer-configuration)
  - [3. Klipper Job Queue](#3-klipper-job-queue)
- [Alternative Solutions](#alternative-solutions)
- [How It Works](#how-it-works)

## Features

- **Automatic job queuing** - Queue multiple prints and let them run unattended
- **Smart bed cooling** - Waits for bed to cool to 29°C for easy part removal
- **Auto bed clearing** - Automatically pushes finished prints to the back
- **Proper purging** - Cleans nozzle before each print starts
- **Optimized workflow** - Efficient heating and positioning sequences

## Prerequisites

- **Klipper firmware** running on your Elegoo Neptune 4/4 Pro
- **OpenNept4une** - Required for full automatic printing capability ([upgrade here](https://github.com/OpenNeptune3D/OpenNept4une))
- **Purge bin** - To collect excess filament during nozzle purging
- **Compatible slicer** - Any slicer that supports custom G-code (PrusaSlicer, SuperSlicer, OrcaSlicer, Cura, etc.)

## Important Disclaimer

⚠️ **If you're running the stock Elegoo firmware**, you won't be able to achieve fully automatic printing. The G-code snippets will still work for manual sequential printing, but you won't be able to queue jobs. You could still remotely trigger the next job to simulate the desired behavior.

**To unlock the job queue function of Klipper**, you should upgrade to [OpenNept4une](https://github.com/OpenNeptune3D/OpenNept4une).

## Recommendations

### Build Surface Selection

**Important:** Choosing the right build surface is critical for successful automatic bed clearing.

- **Recommended:** Use the **smooth side** of the PEI bed if you're still using the original
- **Alternative:** Upgrade to a **glass bed** (requires changing the probe too - the original probe works with magnetic PEI only; if not changed, the nozzle will dig into the glass during calibration)
- ⚠️ **Not recommended:** Using the textured PEI bed will potentially **damage your motors** or cause belt skipping due to excessive grip at 29°C

**If you must use the textured PEI:**
- Lower the cooling temperature to 25°C in the `end_of_print.gcode` file
- Understand this is at your own risk and may have mixed results
- Monitor the first few prints to ensure parts release properly

## Setup Instructions

### 1. Purge Bin

A purge bin is required to collect the filament purged during the start sequence.

- [Browse purge bin designs](https://thangs.com/search/neptune%20bin?scope=all) and print one you like
- Any bin that covers the extreme left of the X-axis will work
- Position it at X=-10 (left edge of the bed)

*Tip: Look for bins with a sloped design so purge lines fall to the bottom when cooled.*

### 2. Slicer Configuration

1. Download the `start_of_print.gcode` and `end_of_print.gcode` files from this repository
2. Open your slicer's printer settings
3. Add the content of `start_of_print.gcode` to your **Start G-code** section
4. Add the content of `end_of_print.gcode` to your **End G-code** section
5. Save your printer profile

### 3. Klipper Job Queue

To enable automatic job transitions:

1. Open your `moonraker.conf` file
2. Add the configuration from the provided `moonraker.conf` file in this repository to the appropriate sections:
   ```ini
   [file_manager]
   queue_gcode_uploads: True
   
   [job_queue]
   load_on_startup: False
   automatic_transition: True
   ```
3. **Reboot your printer** for changes to take effect

For more configuration options, see the [official Moonraker documentation](https://moonraker.readthedocs.io/en/latest/configuration/#job_queue).

## Alternative Solutions

### Continuous Print of a Single Object

If you're looking to print multiple copies of the same object automatically (rather than different objects in sequence), check out [continuous-prints-klipper](https://github.com/hessfab/continuous-prints-klipper) - an excellent solution for repetitive printing.

## How It Works

1. **Start sequence:** Preheats bed → homes printer → moves to purge position → purges filament → begins print
2. **Print completes:** End sequence activates
3. **Cooling phase:** Bed cools to 29°C (adjustable) for easy part release
4. **Bed clearing:** Bed moves forward, pushing the part to the back
5. **Next job:** If jobs are queued, the next print starts automatically

---

**License:** CC0 1.0 Universal - Public Domain

**Contributions:** Issues and pull requests are welcome!
