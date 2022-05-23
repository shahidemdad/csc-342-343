							README File
					(ignore all the qoutation marks for code)

1. locate the file "EMDAD_TAKE_HOME_TEST_2.zip".
2. Extract the file. In the "EMDAD_TAKE_HOME_TEST_1" folder, contains:
	a. Emdad_TAKE_HOME_TEST_2 report
	b. Emdad_VIDEO_TAKE_HOME_TEST_2
	c. Emdad_TAKE_HOME_TEST_2 readme
	d. "Emdad_TAKE_HOME_TEST_2_Codes.zip"
3. Unzip "Emdad_TAKE_HOME_TEST_2_Codes.zip" and the folder contains 2 code folder, each folder respectively have the code in order.
	a. emdad_25thapril2022_C_source_codes
	b. emdad_25thapril2022_linux_source_codes

HOW TO OPEN and USE THE CODE:

MIPS Simulator:
1. Open Mars 4.5 and then go to file -> open -> go to the "Emdad_TAKE_HOME_TEST_2_Codes" and open "emdad_25thApril_gcd.asm"
2. Select "Run" -> "Assemble" to execute the code.
3. It will open another tab window which contains Data Segment(Memory), Test Segment(Disassembly), Registers window.

Visual Studio Community 2019:
1. Open Visual Studio Community 2019 and then select on "Open a project".
2. Go to the "emdad_25thapril2022_C_source code" directory and open the folder.
3. Open the "emdad_25thApril_gcd.sln" extension file which will open the project.
4. Click on "Local Windows Debugger" to run and get the debugging window.
5. It will display registers at the top, disassembly on the left and memory on the right side.

Debugger Linux using GDB:

1. go to the "emdad_25thApril2022_linux_source_code" directory.
2. Open terminal and run "gcc -g filename.c", it will create a "a.out" file run it by " gdb a.out" to get output
3. do gdb run to start the program.
4. type "breakout main" to put a breakpoint in the main function.
5. type "disassemble" to see the disassembly.
6. type "info registers" to see the registers.
7.
8.