library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY Emdad_MdShahid_03_02_2022_4bit_ozn is
generic (n : integer := 4);

	PORT( Emdad_MdShahid_03_02_2022_x, Emdad_MdShahid_03_02_2022_y : in STD_LOGIC_VECTOR(n-1 downto 0);
		Emdad_MdShahid_03_02_2022_sum  : out STD_LOGIC_VECTOR(n-1 downto 0);
		Emdad_MdShahid_03_02_2022_obit : in STD_LOGIC;
		Emdad_MdShahid_03_02_2022_carry, Emdad_MdShahid_03_02_2022_overflow : out STD_LOGIC);
			
END Emdad_MdShahid_03_02_2022_4bit_ozn;

ARCHITECTURE nbitaddsub of Emdad_MdShahid_03_02_2022_4bit_ozn IS

	SIGNAL c: std_logic_vector(n downto 0);
	Signal d: std_logic_vector(n-1 downto 0);

	BEGIN
	d <= Emdad_MdShahid_03_02_2022_y xor Emdad_MdShahid_03_02_2022_obit & Emdad_MdShahid_03_02_2022_obit & Emdad_MdShahid_03_02_2022_obit & Emdad_MdShahid_03_02_2022_obit;
	c(0) <= Emdad_MdShahid_03_02_2022_obit;
	Emdad_MdShahid_03_02_2022_sum <= Emdad_MdShahid_03_02_2022_x xor d xor c(n-1 downto 0);
	c(n downto 1) <= (Emdad_MdShahid_03_02_2022_x and d) or (c(n-1 downto 0) and (Emdad_MdShahid_03_02_2022_x xor d));
	Emdad_MdShahid_03_02_2022_carry <= c(n);
	Emdad_MdShahid_03_02_2022_overflow <= c(n-1) xor c(n);
END nbitaddsub;
	
