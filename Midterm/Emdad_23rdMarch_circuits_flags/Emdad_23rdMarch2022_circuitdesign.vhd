LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Emdad_23rdmarch2022_circuitdesign IS
	PORT
	(
		Emdad_23rdmarch2022_address_a, Emdad_23rdmarch2022_address_b: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Emdad_23rdmarch2022_clock		: IN STD_LOGIC  := '1';
		Emdad_23rdmarch2022_data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Emdad_23rdmarch2022_wren		: IN STD_LOGIC ;
		Emdad_23rdmarch2022_add_sub		: IN STD_LOGIC ;
		Emdad_23rdmarch2022_overflow		: OUT STD_LOGIC;
		Emdad_23rdmarch2022_zero		: out STD_LOGIC;
		Emdad_23rdmarch2022_negative		: out STD_LOGIC;
		Emdad_23rdmarch2022_q		   	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END Emdad_23rdmarch2022_circuitdesign;

ARCHITECTURE ARCH OF Emdad_23rdmarch2022_circuitdesign IS

SIGNAL Emdad_23rdmarch2022_output_a, Emdad_23rdmarch2022_output_b: STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL Emdad_23rdmarch2022_answer     				 : STD_LOGIC_VECTOR (31 DOWNTO 0);

Component Emdad_23rdmarch2022_datamemory IS
	PORT
	(
		Emdad_23rdmarch2022_address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Emdad_23rdmarch2022_clock		: IN STD_LOGIC  := '1';
		Emdad_23rdmarch2022_data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Emdad_23rdmarch2022_wren		: IN STD_LOGIC ;
		Emdad_23rdmarch2022_q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END Component;

Component Emdad_23rdmarch2022_LPM_add_sub IS
	PORT
	(
		Emdad_23rdmarch2022_add_sub		: IN STD_LOGIC ;
		Emdad_23rdmarch2022_dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Emdad_23rdmarch2022_datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Emdad_23rdmarch2022_overflow		: OUT STD_LOGIC ;
		Emdad_23rdmarch2022_result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END Component;

BEGIN

read_a: Emdad_23rdmarch2022_datamemory port map (Emdad_23rdmarch2022_address_a,
																	Emdad_23rdmarch2022_clock,
																	Emdad_23rdmarch2022_data, 
																	Emdad_23rdmarch2022_wren,
																	Emdad_23rdmarch2022_output_a);
read_b: Emdad_23rdmarch2022_datamemory port map (Emdad_23rdmarch2022_address_b,
																	Emdad_23rdmarch2022_clock,
																	Emdad_23rdmarch2022_data, 
																	Emdad_23rdmarch2022_wren,
																	Emdad_23rdmarch2022_output_b);
																	
add_sub: Emdad_23rdmarch2022_LPM_add_sub port map(Emdad_23rdmarch2022_add_sub,
																	Emdad_23rdmarch2022_output_a,
																	Emdad_23rdmarch2022_output_b,
																	Emdad_23rdmarch2022_overflow,
																	Emdad_23rdmarch2022_q
																	);


Emdad_23rdmarch2022_negative <= Emdad_23rdmarch2022_answer(31);
    Emdad_23rdmarch2022_zero <= '1' when(Emdad_23rdmarch2022_answer=x"00000000") else '0';
END ARCH;
																	