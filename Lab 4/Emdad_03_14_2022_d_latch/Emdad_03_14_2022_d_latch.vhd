-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Sun Mar 13 20:30:03 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Emdad_03_14_2022_d_latch_VHDL IS 
	PORT
	(
		E :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		PRN :  IN  STD_LOGIC;
		CLRN :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC
	);
END Emdad_03_14_2022_d_latch_VHDL;

ARCHITECTURE bdf_type OF Emdad_03_14_2022_d_latch_VHDL IS 


BEGIN 

PROCESS(CLRN,PRN,E,D)
BEGIN
IF (CLRN = '0') THEN
	Q <= '0';
ELSIF (PRN = '0') THEN
	Q <= '1';
ELSIF (E = '1') THEN
	Q <= D;
END IF;
END PROCESS;

END bdf_type;