Library ieee; 
use ieee.std_logic_1164.all; 

entity emdad_1Bit_Comparator is 
	port(emdad_I0, emdad_Il : in std_logic; 
	     emdad_Equal 			: out std_logic;
	     emdad_NotEqual		: out std_logic
	);
end emdad_1Bit_Comparator;

architecture arch of emdad_1Bit_Comparator is
	signal emdad_p0, emdad_p1 : std_logic;
	begin 
		emdad_Equal 	<= emdad_I0 xnor emdad_Il;
		emdad_NotEqual <= not (emdad_I0 xnor emdad_Il); 
end arch;