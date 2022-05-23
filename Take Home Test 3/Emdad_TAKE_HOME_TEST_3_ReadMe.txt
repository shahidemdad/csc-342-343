							README File
					(ignore all the qoutation marks for code)

1. locate the file "EMDAD_TAKE_HOME_TEST_3.zip".
2. Extract the file. In the "EMDAD_TAKE_HOME_TEST_3" folder, contains:
	a. Emdad_TAKE_HOME_TEST_3 report
	b. Emdad_VIDEO_TAKE_HOME_TEST_3
	c. Emdad_TAKE_HOME_TEST_3_ReadMe
	d. "Emdad_TAKE_HOME_TEST_3_Codes.zip"
3. Unzip "Emdad_TAKE_HOME_TEST_3_Codes.zip" and the folder contains 2 code folder, each folder respectively have the code in order.
	a. Emdad_15thMay2022_c++_code
	b. Emdad_15thMay2022_linux_code

HOW TO OPEN and USE THE CODE:

Visual Studio Community 2019:
1. Open Visual Studio Community 2019 and then select on "create a project".
2. Click file -> add file -> go to "Emdad_15thMay2022_c++_code" and add the 3 files contained in the file.
4. Click on "Local Windows Debugger" to run 
5. It will display window console with the output.
6. Change the array size in the "Emdad_Source.cpp" file to see the runtime for different array sizes.

Linux using g++:

1. go to the "Emdad_15thMay2022_linux_code" directory.
2. Open terminal and run "g++ -S Emdad_DotProductPointer.cpp" to create the Emdad_DotProductPointer.s file
	a. run "g++ -o0 Emdad_Source.cpp Emdad_DotProductPointer.cpp -o a.out", it will create a "a.out" file run it by "./a.out" to get output. It will give output for non-optimized code. Change
	b. run "g++ -o1 Emdad_Source.cpp Emdad_DotProductPointer.cpp -o a.out", it will create a "a.out" file run it by "./a.out" to get output. It will give output for compiler optimized code.
	c. run "g++ -o2 Emdad_Source.cpp Emdad_DotProductPointer.cpp -o a.out", it will create a "a.out" file run it by "./a.out" to get output. It will give output for manually optimized code.
	d. run "g++ -o3 Emdad_Source.cpp Emdad_DotProductPointer.cpp -o a.out", it will create a "a.out" file run it by "./a.out" to get output. It will give output for VDPSS instruction code.
3. Change the array size in the "Emdad_Source.cpp" file to see the runtime for different array sizes. You will follow back 2 again.