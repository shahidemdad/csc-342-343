LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY Emdad_MdShahid_mux_2_1 IS
	PORT(A, B, X : IN BIT ;
			Y		 : OUT BIT);
END Emdad_MdShahid_mux_2_1 ;

ARCHITECTURE LogicFunction OF Emdad_MdShahid_mux_2_1 IS
BEGIN
    Y <= (A AND NOT X) OR (B AND X);
END LogicFunction ;