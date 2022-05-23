library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

package emdad_adder_package is
component emdad_half_adder
	port (emdad_x, emdad_y : in std_logic;
	      emdad_sum, emdad_carry : out std_logic);
	end component; 
component emdad_full_adder
	port (emdad_a, emdad_b, emdad_c : in std_logic;
	      emdad_sumFA, emdad_carryFA : out std_logic);
	end component; 
end package emdad_adder_package;