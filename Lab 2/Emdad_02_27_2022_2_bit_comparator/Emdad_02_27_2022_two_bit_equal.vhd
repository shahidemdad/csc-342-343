library ieee;
use ieee.std_logic_1164.all;
entity Emdad_02_27_2022_two_bit_equal_optimization is
port ( a, b : in std_logic_vector(1 downto 0);
aeqb : out std_logic);
end Emdad_02_27_2022_two_bit_equal_optimization;
architecture arch of Emdad_02_27_2022_two_bit_equal_optimization is
begin
aeqb <= ((not a(1) and not b(1)) or (not a(0) and not b(0))) or ((not a(1) and not b(1)) or (a(0) and b(0))) or ((a(1) and b(1)) or (not a(0) and not b(0))) or ((a(1) and b(1)) or (a(0) and b(0)));
end arch;