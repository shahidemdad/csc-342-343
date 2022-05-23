library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Emdad_02_27_2022_eight_bit_equal_optimization is
	port ( a, b : in std_logic_vector(7 downto 0);
		aeqb, altb, agtb: out std_logic);
end Emdad_02_27_2022_eight_bit_equal_optimization;

architecture arch of Emdad_02_27_2022_eight_bit_equal_optimization is
begin
	aeqb <= '1' when (a=b) else '0';
	altb <= '1' when (a<b) else '0';
	agtb <= '1' when (a>b) else '0';
end arch;