library ieee;
use ieee.std_logic_1164.all;

entity Emdad_02_27_2022_eight_bit_comparator is
	port ( a, b : in std_logic_vector(7 downto 0);
		aeqb: out std_logic);
end Emdad_02_27_2022_eight_bit_comparator;

architecture arch of Emdad_02_27_2022_eight_bit_comparator is
signal p0, p1, p2, p3 : std_logic;
component Emdad_02_27_2022_eight_bit_comparator is 
	port(a,b: in std_logic_vector(7 downto 0);
	aeqb    : out std_logic);
end component;
begin
	U0: Emdad_02_27_2022_eight_bit_comparator port map(a =>a(1 downto 0), b=>b(1 downto 0), aeqb => p0);
	U1: Emdad_02_27_2022_eight_bit_comparator port map(a =>a(3 downto 2), b=>b(3 downto 2), aeqb => p1);
	U2: Emdad_02_27_2022_eight_bit_comparator port map(a =>a(5 downto 4), b=>b(5 downto 4), aeqb => p2);
	U3: Emdad_02_27_2022_eight_bit_comparator port map(a =>a(7 downto 6), b=>b(7 downto 6), aeqb => p3);
	aeqb <= p0 AND p1 AND p2 AND p3;
end arch;