# STEP 1 — Install Vivado Properly

First install the correct version of Vivado.

Recommended:

* Vivado ML/HL WebPACK Edition
* Install only:

  * Artix-7 Devices
  * Hardware Manager

The Basys3 uses:

* FPGA Part: `xc7a35tcpg236-1` ([Google Sites][1])

If Basys3 board is not visible later, you must install Digilent board files. ([GitHub][2])

Useful references:

* [Digilent Vivado Installation Guide](https://digilent.com/reference/programmable-logic/guides/installing-vivado-and-sdk?srsltid=AfmBOoqlntj_XhDCwjLJIpF5Je7GavOCP5T-sh5-n-Gp_ndefhTzIbpp&utm_source=chatgpt.com)
* [Digilent Board Files GitHub](https://github.com/Digilent/vivado-boards?utm_source=chatgpt.com)

---

# STEP 2 — Open Vivado

Open:

* Vivado Design Suite

You will see:

* Quick Start Page

Click:

* “Create Project”

---

# STEP 3 — Create New Project

A wizard opens.

## 1. Project Name

Enter:

* Project Name:
  Example:

  * `LED_Blink`
  * `Digital_Clock`
  * `SevenSeg_Display`

Choose folder location carefully.

Recommended:

```text
D:\Vivado_Projects\
```

Avoid:

* Desktop
* OneDrive folders
* Very long paths

Click:

* Next

---

# STEP 4 — Select Project Type

Choose:

* RTL Project

✅ Tick:

* “Do not specify sources at this time”

Click:

* Next

---

# STEP 5 — Select FPGA Board

Now Vivado asks:

* Default Part / Board

## IMPORTANT

Go to:

* Boards Tab

Search:

```text
Basys3
```

Select:

* Basys3

Then click:

* Next

Then:

* Finish

Vivado now creates your project. ([Digilent][3])

---

# IF BASYS3 DOES NOT APPEAR

You must install Digilent board files.

Download:

* [Digilent Board Files Repository](https://github.com/Digilent/vivado-boards?utm_source=chatgpt.com)

Then copy board files into:

```text
C:\Xilinx\Vivado\<version>\data\boards\board_files
```

Restart Vivado.

Alternative:
You can manually choose FPGA part:

```text
xc7a35tcpg236-1
```

This is the exact Basys3 FPGA chip. ([Google Sites][1])

---

# STEP 6 — Vivado Project Window Overview

You will now see:

## Left Side

### Flow Navigator

Contains:

* Add Sources
* Simulation
* Synthesis
* Implementation
* Generate Bitstream
* Program Device

---

# STEP 7 — Add VHDL or Verilog File

## In Flow Navigator:

Click:

```text
Add Sources
```

Then:

```text
Add or Create Design Sources
```

Click:

```text
Create File
```

Choose:

* VHDL OR Verilog

Example:

```text
top.vhd
```

or

```text
top.v
```

Click:

* OK
* Finish

Vivado asks:

* Define Module

Enter:

* Module Name

Example:

```text
top
```

Add ports if needed.

Click:

* OK

---

# STEP 8 — Write Your Code

Example VHDL LED Blink:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port (
        clk : in STD_LOGIC;
        led : out STD_LOGIC
    );
end top;

architecture Behavioral of top is
    signal counter : integer := 0;
begin

process(clk)
begin
    if rising_edge(clk) then
        counter <= counter + 1;

        if counter = 50000000 then
            led <= not led;
            counter <= 0;
        end if;
    end if;
end process;

end Behavioral;
```

Save:

```text
Ctrl + S
```

---

# STEP 9 — Add Constraints File (.xdc)

VERY IMPORTANT STEP.

Without `.xdc`:

* FPGA does not know pin locations.

---

## Add Constraints

Click:

```text
Add Sources
```

Then:

```text
Add or Create Constraints
```

Create:

```text
basys3.xdc
```

---

# STEP 10 — Add Pin Constraints

Example:

```tcl
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN U16 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]
```

Where:

* `W5` = 100 MHz clock
* `U16` = LED0

Basys3 master XDC:

* [Digilent Basys3 XDC Files](https://github.com/Digilent/digilent-xdc?utm_source=chatgpt.com) ([Digilent Forum][4])

---

# STEP 11 — Run Simulation (Optional but Recommended)

Click:

```text
Run Simulation
```

Then:

```text
Run Behavioral Simulation
```

This checks logic before hardware implementation.

---

# STEP 12 — Run Synthesis

Click:

```text
Run Synthesis
```

Wait until completed.

If errors occur:

* Check syntax
* Check missing semicolons
* Check entity/module names

---

# STEP 13 — Run Implementation

Click:

```text
Run Implementation
```

This maps your design onto FPGA hardware.

---

# STEP 14 — Generate Bitstream

Click:

```text
Generate Bitstream
```

This creates:

```text
.bit
```

file used for FPGA programming.

First time may take:

* 5–20 minutes

---

# STEP 15 — Connect Basys3 Board

Use:

* USB cable

Power ON board.

Set jumper:

```text
JTAG
```

position.

---

# STEP 16 — Program FPGA

Click:

```text
Open Hardware Manager
```

Then:

```text
Open Target
→ Auto Connect
```

Vivado detects:

* Basys3 FPGA

Then:

```text
Program Device
```

Select generated `.bit` file.

Click:

```text
Program
```

Your design now runs on FPGA. ([AMD][5])

---

# COMPLETE FPGA FLOW

This is the standard engineering workflow:

```text
Create Project
↓
Write HDL Code
↓
Add Constraints
↓
Simulate
↓
Synthesis
↓
Implementation
↓
Generate Bitstream
↓
Program FPGA
↓
Test Hardware
```

---

# MOST COMMON BEGINNER ERRORS

## 1. Basys3 Not Showing

Cause:

* Missing board files

Fix:

* Install Digilent board files

---

## 2. No LED Output

Cause:

* Wrong pin mapping in XDC

Fix:

* Use correct Basys3 pins

---

## 3. Bitstream Generation Failed

Cause:

* Syntax errors
* Unconnected ports

---

## 4. Hardware Manager Cannot Detect Board

Cause:

* Drivers not installed
* USB issue

Fix:

* Install Digilent Adept Drivers

---

# BEST PRACTICE PROJECT STRUCTURE

```text
Project/
│
├── src/
│   ├── top.vhd
│   ├── counter.vhd
│
├── constraints/
│   ├── basys3.xdc
│
├── sim/
│   ├── tb_top.vhd
│
└── bitstream/
```

---

# WHAT YOU SHOULD BUILD NEXT

Good Basys3 practice projects:

1. LED Blinking
2. Switch to LED
3. Push Button Counter
4. 7 Segment Display
5. Traffic Light Controller
6. UART Communication
7. VGA Output
8. PWM Motor Control
9. Stopwatch
10. Digital Clock

These projects build strong FPGA fundamentals.

---

Helpful official references:

* [Basys3 Programming Guide](https://digilent.com/reference/learn/programmable-logic/tutorials/basys-3-programming-guide/start?srsltid=AfmBOor-lW5Z7has77mk0x9kmH73Oza20whQrY4zgr1BTeTVISZz-n18&utm_source=chatgpt.com)
* [Getting Started with Basys3](https://digilent.com/reference/learn/programmable-logic/tutorials/basys-3-getting-started/start?srsltid=AfmBOoqBGSKFjD7pwkz-J5hgOcd9PiwbjOMw91qwU603ed1uuoWxXDhz&utm_source=chatgpt.com)
* [Basys3 Reference Manual PDF](https://www.amd.com/content/dam/amd/en/documents/university/aup-boards/XUPBasys3/documentation/Basys3_rm_8_22_2014.pdf?utm_source=chatgpt.com)

[1]: https://sites.google.com/a/umn.edu/mxp-fpga/home/vivado-notes/digilent-basys3-board-and-xilinx-artix-7-pin-outs-and-constraint-files?utm_source=chatgpt.com "Digilent BASYS3 Board and Xilinx Artix-7 Pin-Outs and ..."
[2]: https://github.com/Digilent/vivado-boards?utm_source=chatgpt.com "Digilent/vivado-boards"
[3]: https://digilent.com/reference/learn/programmable-logic/tutorials/basys-3-programming-guide/start?srsltid=AfmBOor-lW5Z7has77mk0x9kmH73Oza20whQrY4zgr1BTeTVISZz-n18&utm_source=chatgpt.com "Basys 3 Programming Guide"
[4]: https://forum.digilent.com/topic/26183-cant-select-basys3-board-in-vivado-20231/?utm_source=chatgpt.com "Can't select Basys3 board in Vivado 2023.1 - FPGA"
[5]: https://www.amd.com/content/dam/amd/en/documents/university/aup-boards/XUPBasys3/documentation/Basys3_rm_8_22_2014.pdf?utm_source=chatgpt.com "Basys3™ FPGA Board Reference Manual Overview"
