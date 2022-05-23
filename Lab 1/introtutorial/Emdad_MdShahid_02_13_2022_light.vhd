LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY Emdad_MdShahid_02_13_2022_light IS
	PORT(x1, x2 : IN STD_LOGIC ;
			f		: OUT STD_LOGIC);
END Emdad_MdShahid_02_13_2022_light ;

ARCHITECTURE LogicFunction OF Emdad_MdShahid_02_13_2022_light IS
BEGIN
	f <= (x1 AND NOT x2) OR (NOT x1 AND x2) ;
END LogicFunction ;
