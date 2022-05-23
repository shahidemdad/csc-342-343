library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY Emdad_MdShahid_03_02_2022_n_bit_add_sub_flags IS
generic (n : integer := 32);

	PORT( Emdad_MdShahid_03_02_2022_op 			: in STD_LOGIC;
			Emdad_MdShahid_03_02_2022_x 			: in STD_LOGIC_VECTOR(n-1 downto 0);
			Emdad_MdShahid_03_02_2022_y  			: in STD_LOGIC_VECTOR(n-1 downto 0);
			Emdad_MdShahid_03_02_2022_output 	: out STD_LOGIC_VECTOR(n-1 downto 0);
			Emdad_MdShahid_03_02_2022_Overflow	: out STD_LOGIC;
			Emdad_MdShahid_03_02_2022_zero		: out STD_LOGIC;
			Emdad_MdShahid_03_02_2022_negative	: out STD_LOGIC);
			
END Emdad_MdShahid_03_02_2022_n_bit_add_sub_flags;

ARCHITECTURE nbitaddsubflags of Emdad_MdShahid_03_02_2022_n_bit_add_sub_flags IS

SIGNAL Emdad_MdShahid_03_02_2022_p			: STD_LOGIC_VECTOR(n downto 0);

BEGIN
PROCESS(Emdad_MdShahid_03_02_2022_x, Emdad_MdShahid_03_02_2022_y, Emdad_MdShahid_03_02_2022_op)
BEGIN
		if Emdad_MdShahid_03_02_2022_op = '0' then
		Emdad_MdShahid_03_02_2022_p <= ('0' & Emdad_MdShahid_03_02_2022_x) + ('0' & Emdad_MdShahid_03_02_2022_y);
		Emdad_MdShahid_03_02_2022_negative <= '0';
		end if;
		if Emdad_MdShahid_03_02_2022_op = '1' then
			if Emdad_MdShahid_03_02_2022_x < Emdad_MdShahid_03_02_2022_y then
				Emdad_MdShahid_03_02_2022_negative <= '1';
			else
				Emdad_MdShahid_03_02_2022_negative <= '0';
			end if;
				Emdad_MdShahid_03_02_2022_p <= ('0' & Emdad_MdShahid_03_02_2022_x) - ('0' & Emdad_MdShahid_03_02_2022_y);
		end if;
END PROCESS;

Emdad_MdShahid_03_02_2022_output <= Emdad_MdShahid_03_02_2022_p(n-1 downto 0);
Emdad_MdShahid_03_02_2022_Overflow	<= Emdad_MdShahid_03_02_2022_p(n);
Emdad_MdShahid_03_02_2022_zero <= '1' when Emdad_MdShahid_03_02_2022_p(n-1 downto 0) = 0 else '0';

END nbitaddsubflags;