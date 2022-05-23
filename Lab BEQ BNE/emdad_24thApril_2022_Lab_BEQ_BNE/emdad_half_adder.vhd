library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity emdad_half_adder is 
	port (emdad_x, emdad_y : in std_logic;
	      emdad_sum, emdad_carry : out std_logic);
end emdad_half_adder;

architecture arch of emdad_half_adder is 
begin 
	emdad_sum <= emdad_x xor emdad_y;
	emdad_carry <= emdad_x and emdad_y;	
end arch;