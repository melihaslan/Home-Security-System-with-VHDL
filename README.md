# Home-Security-System-with-VHDL

VHDL Projects
The aim of this project is to design and implement a security system using VHDL.
Demonstration of the working system should be simulated in Vivado. Simulations must
include every possible case of the project.

Description of the Project
Imagine a security system for a house. As a resident, you are able to set up a password to
your security system. When you exit your house, you can arm the security system. If the
system is armed, when you returned and entered to your house, you need to enter correct
password to disarm security system. You will have 30 clock cycle and 3 trials to enter the
correct password. If you enter wrong passwords three times or if you do not enter a
correct password within 30 clock cycle, an alarm goes off with a signal saying that the
system is attempted to be breached.

System Requirements
- Password: a 3-digit decimal number (from 000 to 999)
- Maximum allowed number of attempt failure is 2
- Duration for password entry to disarm: 30 clock cycle
- There should be reset button, which returns the system to the initial states and settings
The system will have 4 modes;

1 - IDLE MODE
Status LED indicates that user in the IDLE mode by blinking one in 1 clock cycle.
From this mode, you can either go to arm mode, or password setup mode.

2 - PASSWORD SETUP MODE
A push button should be assigned for entering this mode.
The status LED should be OFF.
Password should be entered via switches in BCD.
Each of the password digits cannot be larger than 9 (e.g. A, B, ... , F in
hexadecimal should not be displayed as they are). You need to determine what to
do if entered password digits are larger than 9.
When the same push button is pressed in this mode, the password will be
recorded to the system, and it goes back to the idle mode.

3 - ARM MODE
A push button should be assigned for entering this mode.
The status LED should be ON continuously.

4 - DOOR OPEN MODE
A push button should be assigned for entering this mode.
You can enter this mode only from the arm mode.
When the door is open, the timer should start counting down from 30 seconds.
The a second status LED that indicates door is open should be ON continuously.
A password will be entered by setting a BCD number via switches and by pressing
a push button.
If a correct password is entered, system goes back to the idle mode.
When a wrong password is entered, it is indicated by one LED, and the system
stays in the door open mode.
When a wrong password is entered second time, it is indicated by one more LED,
and the system stays in the door open mode.
When a wrong password is entered third time, 3 LEDs should start blinking one in 1 clock cycle.
If 30 clock cycle passes without a correct password being entered, 3 LEDs should
start blinking one in 1 clock cycle.
When system gives alarm, it can only go IDLE mode by pressing reset button.
