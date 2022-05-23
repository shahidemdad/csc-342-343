-- megafunction wizard: %RAM: 1-PORT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altsyncram 

-- ============================================================
-- File Name: Emdad_23rdMarch2022_lpm_ram_32x32.vhd
-- Megafunction Name(s):
-- 			altsyncram
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 20.1.1 Build 720 11/11/2020 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2020  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Emdad_23rdMarch2022_lpm_ram_32x32 IS
	PORT
	(
		Emdad_23rdMarch2022_address			: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		Emdad_23rdMarch2022_clock				: IN STD_LOGIC  := '1';
		Emdad_23rdMarch2022_data				: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Emdad_23rdMarch2022_wren				: IN STD_LOGIC ;
		Emdad_23rdMarch2022_q					: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END Emdad_23rdMarch2022_lpm_ram_32x32;

ARCHITECTURE SYN OF emdad_23rdmarch2022_lpm_ram_32x32 IS

	SIGNAL Emdad_23rdMarch2022_sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
	Emdad_23rdMarch2022_q    <= Emdad_23rdMarch2022_sub_wire0(31 DOWNTO 0);

	Emdad_23rdMarch2022_altsyncram_component : altsyncram
	GENERIC MAP (
		clock_enable_input_a => "BYPASS",
		clock_enable_output_a => "BYPASS",
		init_file => "Emdad_23rdMarch2022_lpm_ram_32x32.mif",
		intended_device_family => "Cyclone V",
		lpm_hint => "ENABLE_RUNTIME_MOD=NO",
		lpm_type => "altsyncram",
		numwords_a => 32,
		operation_mode => "SINGLE_PORT",
		outdata_aclr_a => "NONE",
		outdata_reg_a => "UNREGISTERED",
		power_up_uninitialized => "FALSE",
		ram_block_type => "M10K",
		read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
		widthad_a => 5,
		width_a => 32,
		width_byteena_a => 1
	)
	PORT MAP (
		address_a => Emdad_23rdMarch2022_address,
		clock0 => Emdad_23rdMarch2022_clock,
		data_a => Emdad_23rdMarch2022_data,
		wren_a => Emdad_23rdMarch2022_wren,
		q_a => Emdad_23rdMarch2022_sub_wire0
	);

END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
-- Retrieval info: PRIVATE: AclrAddr NUMERIC "0"
-- Retrieval info: PRIVATE: AclrByte NUMERIC "0"
-- Retrieval info: PRIVATE: AclrData NUMERIC "0"
-- Retrieval info: PRIVATE: AclrOutput NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_ENABLE NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
-- Retrieval info: PRIVATE: BlankMemory NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
-- Retrieval info: PRIVATE: Clken NUMERIC "0"
-- Retrieval info: PRIVATE: DataBusSeparated NUMERIC "1"
-- Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
-- Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_A"
-- Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
-- Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
-- Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
-- Retrieval info: PRIVATE: MIFfilename STRING "Emdad_23rdMarch2022_lpm_ram_32x32.mif"
-- Retrieval info: PRIVATE: NUMWORDS_A NUMERIC "32"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "2"
-- Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_A NUMERIC "3"
-- Retrieval info: PRIVATE: RegAddr NUMERIC "1"
-- Retrieval info: PRIVATE: RegData NUMERIC "1"
-- Retrieval info: PRIVATE: RegOutput NUMERIC "0"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: SingleClock NUMERIC "1"
-- Retrieval info: PRIVATE: UseDQRAM NUMERIC "1"
-- Retrieval info: PRIVATE: WRCONTROL_ACLR_A NUMERIC "0"
-- Retrieval info: PRIVATE: WidthAddr NUMERIC "5"
-- Retrieval info: PRIVATE: WidthData NUMERIC "32"
-- Retrieval info: PRIVATE: rden NUMERIC "0"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_A STRING "BYPASS"
-- Retrieval info: CONSTANT: CLOCK_ENABLE_OUTPUT_A STRING "BYPASS"
-- Retrieval info: CONSTANT: INIT_FILE STRING "Emdad_23rdMarch2022_lpm_ram_32x32.mif"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ENABLE_RUNTIME_MOD=NO"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
-- Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "32"
-- Retrieval info: CONSTANT: OPERATION_MODE STRING "SINGLE_PORT"
-- Retrieval info: CONSTANT: OUTDATA_ACLR_A STRING "NONE"
-- Retrieval info: CONSTANT: OUTDATA_REG_A STRING "UNREGISTERED"
-- Retrieval info: CONSTANT: POWER_UP_UNINITIALIZED STRING "FALSE"
-- Retrieval info: CONSTANT: RAM_BLOCK_TYPE STRING "M10K"
-- Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_PORT_A STRING "NEW_DATA_NO_NBE_READ"
-- Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "5"
-- Retrieval info: CONSTANT: WIDTH_A NUMERIC "32"
-- Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "1"
-- Retrieval info: USED_PORT: address 0 0 5 0 INPUT NODEFVAL "address[4..0]"
-- Retrieval info: USED_PORT: clock 0 0 0 0 INPUT VCC "clock"
-- Retrieval info: USED_PORT: data 0 0 32 0 INPUT NODEFVAL "data[31..0]"
-- Retrieval info: USED_PORT: q 0 0 32 0 OUTPUT NODEFVAL "q[31..0]"
-- Retrieval info: USED_PORT: wren 0 0 0 0 INPUT NODEFVAL "wren"
-- Retrieval info: CONNECT: @address_a 0 0 5 0 address 0 0 5 0
-- Retrieval info: CONNECT: @clock0 0 0 0 0 clock 0 0 0 0
-- Retrieval info: CONNECT: @data_a 0 0 32 0 data 0 0 32 0
-- Retrieval info: CONNECT: @wren_a 0 0 0 0 wren 0 0 0 0
-- Retrieval info: CONNECT: q 0 0 32 0 @q_a 0 0 32 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL Emdad_23rdMarch2022_lpm_ram_32x32.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Emdad_23rdMarch2022_lpm_ram_32x32.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Emdad_23rdMarch2022_lpm_ram_32x32.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Emdad_23rdMarch2022_lpm_ram_32x32.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Emdad_23rdMarch2022_lpm_ram_32x32_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
