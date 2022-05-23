LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY Emdad_MdShahid_03_02_2022_one_bit_full_adder IS
PORT ( Emdad_MdShahid_03_06_2022_X, Emdad_MdShahid_03_06_2022_Y, Emdad_MdShahid_03_06_2022_Cin : IN STD_LOGIC ;
		Emdad_MdShahid_03_06_2022_sum, Emdad_MdShahid_03_06_2022_Cout									  : OUT STD_LOGIC ) ;
END Emdad_MdShahid_03_02_2022_one_bit_full_adder;

ARCHITECTURE LogicFunc OF Emdad_MdShahid_03_02_2022_one_bit_full_adder IS

signal Emdad_MdShahid_03_06_2022_int1, Emdad_MdShahid_03_06_2022_int2, Emdad_MdShahid_03_06_2022_int3: std_logic;

component Emdad_MdShahid_03_02_2022_half_adder IS
	port (Emdad_MdShahid_03_06_2022_A, Emdad_MdShahid_03_06_2022_B 		: in std_logic;
			Emdad_MdShahid_03_06_2022_Sum, Emdad_MdShahid_03_06_2022_Carry : out std_logic);
end component;

BEGIN
Emdad_MdShahid_03_06_2022_HA_1: Emdad_MdShahid_03_02_2022_half_adder port map(
	Emdad_MdShahid_03_06_2022_X,
	Emdad_MdShahid_03_06_2022_Y,
	Emdad_MdShahid_03_06_2022_int1,
	Emdad_MdShahid_03_06_2022_int2);
	
Emdad_MdShahid_03_06_2022_HA_2: Emdad_MdShahid_03_02_2022_half_adder port map(
	Emdad_MdShahid_03_06_2022_int1,
	Emdad_MdShahid_03_06_2022_Cin,
	Emdad_MdShahid_03_06_2022_Sum,
	Emdad_MdShahid_03_06_2022_int3);
Emdad_MdShahid_03_06_2022_Cout <= Emdad_MdShahid_03_06_2022_int2 OR Emdad_MdShahid_03_06_2022_int3;
END LogicFunc;