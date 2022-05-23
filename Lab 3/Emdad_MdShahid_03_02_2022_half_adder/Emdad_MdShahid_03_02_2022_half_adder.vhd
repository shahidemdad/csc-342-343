library ieee;
use ieee.std_logic_1164.all;
entity Emdad_MdShahid_03_02_2022_half_adder is
	port (Emdad_MdShahid_03_06_2022_A, Emdad_MdShahid_03_06_2022_B       : in std_logic;
			Emdad_MdShahid_03_06_2022_Sum, Emdad_MdShahid_03_06_2022_Carry : out std_logic);
end Emdad_MdShahid_03_02_2022_half_adder;

architecture BEHAV_FA of Emdad_MdShahid_03_02_2022_half_adder is

begin
-- Process P1 that defines the first half adder
P1: process (Emdad_MdShahid_03_06_2022_A, Emdad_MdShahid_03_06_2022_B)
begin
Emdad_MdShahid_03_06_2022_sum <= Emdad_MdShahid_03_06_2022_A xor Emdad_MdShahid_03_06_2022_B;
end process;

-- Process P2 that defines the second half adder and the OR -- gate
P2: process (Emdad_MdShahid_03_06_2022_A, Emdad_MdShahid_03_06_2022_B)
begin
Emdad_MdShahid_03_06_2022_Carry <=  Emdad_MdShahid_03_06_2022_A and Emdad_MdShahid_03_06_2022_B;
end process;
end BEHAV_FA;