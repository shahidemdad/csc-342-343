LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY Emdad_MdShahid_03_02_2022_four_bit_add_sub IS
	port (Emdad_MdShahid_03_02_2022_X			:in std_logic_vector(3 downto 0);
			Emdad_MdShahid_03_02_2022_Y			:in std_logic_vector(3 downto 0);
			Emdad_MdShahid_03_02_2022_Opcode		:in std_logic;
			Emdad_MdShahid_03_02_2022_sum			:out std_logic_vector (3 downto 0);
			Emdad_MdShahid_03_02_2022_Cout		:out std_logic;
			Emdad_MdShahid_03_06_2022_Overflow	:out std_logic);
END Emdad_MdShahid_03_02_2022_four_bit_add_sub;

ARCHITECTURE LogicFunc OF Emdad_MdShahid_03_02_2022_four_bit_add_sub IS
component Emdad_MdShahid_03_02_2022_one_bit_full_adder
	PORT (Emdad_MdShahid_03_06_2022_X, Emdad_MdShahid_03_06_2022_Y, Emdad_MdShahid_03_06_2022_Cin  : IN STD_LOGIC ;
			Emdad_MdShahid_03_06_2022_sum, Emdad_MdShahid_03_06_2022_Cout									  : OUT STD_LOGIC ) ;
end component;

signal Emdad_MdShahid_03_06_2022_A, Emdad_MdShahid_03_06_2022_B, Emdad_MdShahid_03_06_2022_C, Emdad_MdShahid_03_06_2022_D: std_logic;
signal Emdad_MdShahid_03_06_2022_E: std_logic_vector (3 downto 0);
BEGIN
		Emdad_MdShahid_03_06_2022_E <= Emdad_MdShahid_03_02_2022_X XOR Emdad_MdShahid_03_02_2022_Y;
	
	  Emdad_MdShahid_03_02_2022_four_bit_add_sub_FA0: Emdad_MdShahid_03_02_2022_one_bit_full_adder
			 port map(Emdad_MdShahid_03_02_2022_X(0),
						 Emdad_MdShahid_03_06_2022_E(0),
						 Emdad_MdShahid_03_02_2022_Opcode,
						 Emdad_MdShahid_03_02_2022_sum(0),
						 Emdad_MdShahid_03_06_2022_A);

	  Emdad_MdShahid_03_02_2022_four_bit_add_sub_FA1: Emdad_MdShahid_03_02_2022_one_bit_full_adder
			 port map(Emdad_MdShahid_03_02_2022_X(1),
						 Emdad_MdShahid_03_06_2022_E(1),
						 Emdad_MdShahid_03_06_2022_A,
						 Emdad_MdShahid_03_02_2022_sum(1),
						 Emdad_MdShahid_03_06_2022_B);

	  Emdad_MdShahid_03_02_2022_four_bit_add_sub_FA2: Emdad_MdShahid_03_02_2022_one_bit_full_adder
			 port map(Emdad_MdShahid_03_02_2022_X(2),
						 Emdad_MdShahid_03_06_2022_E(2),
						 Emdad_MdShahid_03_06_2022_B,
						 Emdad_MdShahid_03_02_2022_sum(2),
						 Emdad_MdShahid_03_06_2022_C);

	  Emdad_MdShahid_03_02_2022_four_bit_add_sub_FA3: Emdad_MdShahid_03_02_2022_one_bit_full_adder
			 port map(Emdad_MdShahid_03_02_2022_X(3),
						 Emdad_MdShahid_03_06_2022_E(3),
						 Emdad_MdShahid_03_06_2022_C,
						 Emdad_MdShahid_03_02_2022_sum(3),
						 Emdad_MdShahid_03_06_2022_D);
						 
		Emdad_MdShahid_03_06_2022_Overflow <= Emdad_MdShahid_03_06_2022_C XOR Emdad_MdShahid_03_06_2022_D;
		Emdad_MdShahid_03_02_2022_Cout <= Emdad_MdShahid_03_06_2022_D;
END LogicFunc;