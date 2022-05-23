LIBRARY ieee; 
USE ieee.std_logic_1164.all; 

LIBRARY altera_mf; 
USE altera_mf.altera_mf_components.all; 

ENTITY emdad_Register_File IS
	PORT(
		emdad_address_a : IN STD_LOGIC_VECTOR (4 DOWNTO 0); 
		emdad_address_b : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		emdad_clock : IN STD_LOGIC; 
		emdad_data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0); 
		emdad_data_b : IN STD_LOGIC_VECTOR (31 DOWNTO 0); 
		emdad_wren_a : IN STD_LOGIC := '0';
		emdad_wren_b : IN STD_LOGIC := '0';
		emdad_q_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		emdad_q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END emdad_Register_File ;

ARCHITECTURE SYN OF emdad_Register_File IS

SIGNAL sub_wire0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL sub_wirel : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
	emdad_q_a <= sub_wire0 (31 DOWNTO 0); 
	emdad_q_b <= sub_wirel (31 DOWNTO 0); 
	altsyncram_component : altsyncram 
	GENERIC MAP (
		address_reg_b => "CLOCK0", 
		clock_enable_input_a => "BYPASS", 
		clock_enable_input_b => "BYPASS", 
		clock_enable_output_a => "BYPASS",
		clock_enable_output_b => "BYPASS", 
		indata_reg_b => "CLOCK0", 
		init_file => "emdad_Register_File_Data.mif",
		intended_device_family => "Cyclone v",
		lpm_type => "altsyncram", 
		numwords_a => 32, 
		numwords_b => 32, 
		operation_mode => "BIDIR_DUAL_PORT", 
		outdata_aclr_a => "NONE", 
		outdata_aclr_b => "NONE",
		outdata_reg_a => "UNREGISTERED", 
		outdata_reg_b => "UNREGISTERED", 
		power_up_uninitialized => "FALSE", 
		read_during_write_mode_mixed_ports => "DONT_CARE", 
		read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ", 
		read_during_write_mode_port_b => "NEW_DATA_NO_NBE_READ", 
		widthad_a => 5, 
		widthad_b => 5, 
		width_a => 32, 
		width_b => 32, 
		width_byteena_a => 1, 
		width_byteena_b => 1,
		wrcontrol_wraddress_reg_b => "CLOCK0" 
	)
	PORT MAP (
		address_a => emdad_address_a, 
		address_b => emdad_address_b, 
		clock0 => emdad_clock, 
		data_a => emdad_data_a, 
		data_b => emdad_data_b,
		wren_a => emdad_wren_a, 
		wren_b => emdad_wren_b, 
		q_a => sub_wire0, 
		q_b => sub_wirel
	);

END SYN;