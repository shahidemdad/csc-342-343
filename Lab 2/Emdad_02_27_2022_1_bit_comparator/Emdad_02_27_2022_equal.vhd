Library ieee;
use ieee.std_logic_1164.all;
entity Emdad_02_27_2022_equal is
port ( I0, I1 : in std_logic;
Eq : out std_logic);
end Emdad_02_27_2022_equal;
architecture arch of Emdad_02_27_2022_equal is
begin
EQ <= ((not I0) and (not I1)) or (I0 and I1);
end arch;