LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Emdad_MdShahid_02_15_2022_Majority IS
PORT ( x1, x2, x3 : IN STD_LOGIC;
	f 	: OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE Behaviour OF Emdad_MdShahid_02_15_2022_Majority IS
BEGIN
f <= (x1 AND x2) OR (x1 AND x3) OR (x2 AND x3);
END Behaviour;
