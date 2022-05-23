							README File
					(ignore all the qoutation marks for code)

1. locate the file "EMDAD_TAKE_HOME_TEST_1.zip".
2. Extract the file. In the "EMDAD_TAKE_HOME_TEST_1" folder, contains:
	a. Emdad_TAKE_HOME_TEST_1 report
	b. Emdad_VIDEO_TAKE_HOME_TEST_1
	c. Emdad_TAKE_HOME_TEST_1 readme
	d. "Emdad_TAKE_HOME_TEST_1_Codes.zip"
3. Unzip "Emdad_TAKE_HOME_TEST_1_Codes.zip" and the folder contains 3 code zip file
	a. emdad_17thapril2022_C_source codes.zip
	b. emdad_17thapril2022_linux_source codes.zip
	c. emdad_17thapril2022_MIPS_source_codes.zip
4. Extract them and each folder respectively have the code in order.

HOW TO OPEN and USE THE CODE:

MIPS Simulator:
1. Open Mars 4.5 and then go to file -> open -> go to the "emdad_17thapril2022_MIPS_source_codes" and open the files.
2. Select "Run" -> "Assemble" to execute the code.
3. It will open another tab window which contains Data Segment(Memory), Test Segment(Disassembly), Registers window.

Visual Studio Community 2019:
1. Open Visual Studio Community 2019 and then select on "Open a project".
2. Go to the "emdad_17thapril2022_C_source codes" directory and select one of the project you want to open.
3. Go to that selected folder and open the ".sln" extension file which will open the project.
4. Click on "Local Windows Debugger" to run and get the debugging window.
5. It will display registers at the top, disassembly on the left and memory on the right side.

Debugger Linux using GDB:

1. go to the "emdad_17thapril2022_linux_source codes" directory.
2. Open terminal
	a. for the c files, run "gcc -g filename.c", it will create a "a.out" file run it by "./a.out" to get output
	b. for the cpp files, run "g++ -g filename.cpp", it will create a "a.out" file run it by "./a.out" to get output
3. do gdb run to start the program.
4. type "b main" to put a breakpoint in the main function.
5. type "disassemble" to see the disassembly.
6. type "info register" to see the registers.