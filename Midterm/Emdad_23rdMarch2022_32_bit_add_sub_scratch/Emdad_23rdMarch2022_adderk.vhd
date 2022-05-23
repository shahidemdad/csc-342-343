LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;

ENTITY Emdad_23rdMarch2022_adderk IS

	GENERIC ( k : INTEGER := 8 ) ;
	PORT (
		Emdad_23rdMarch2022_carryin : IN STD_LOGIC ;
		Emdad_23rdMarch2022_X, Emdad_23rdMarch2022_Y : IN STD_LOGIC_VECTOR(k-1 DOWNTO 0) ;
		Emdad_23rdMarch2022_S : OUT STD_LOGIC_VECTOR(k-1 DOWNTO 0) ;
		Emdad_23rdMarch2022_carryout : OUT STD_LOGIC ) ;
END Emdad_23rdMarch2022_adderk ;

ARCHITECTURE Behavior OF Emdad_23rdMarch2022_adderk IS

SIGNAL Emdad_23rdMarch2022_Sum : STD_LOGIC_VECTOR(k DOWNTO 0) ;

BEGIN

Emdad_23rdMarch2022_Sum <= ('0' & Emdad_23rdMarch2022_X) + ('0' & Emdad_23rdMarch2022_Y) + Emdad_23rdMarch2022_carryin ;
Emdad_23rdMarch2022_S <= Emdad_23rdMarch2022_Sum(k-1 DOWNTO 0) ;
Emdad_23rdMarch2022_carryout <= Emdad_23rdMarch2022_Sum(k) ;

END Behavior ;