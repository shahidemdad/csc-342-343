LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY Emdad_23rdMarch2022_mux2to1 IS

GENERIC ( k : INTEGER := 8 ) ;
	PORT (
		Emdad_23rdMarch2022_V, Emdad_23rdMarch2022_W : IN STD_LOGIC_VECTOR(k-1 DOWNTO 0) ;
		Emdad_23rdMarch2022_Selm : IN STD_LOGIC ;
		Emdad_23rdMarch2022_F : OUT STD_LOGIC_VECTOR(k-1 DOWNTO 0)
	) ;
END Emdad_23rdMarch2022_mux2to1 ;

ARCHITECTURE Behavior OF Emdad_23rdMarch2022_mux2to1 IS

BEGIN
	PROCESS ( Emdad_23rdMarch2022_V, Emdad_23rdMarch2022_W, Emdad_23rdMarch2022_Selm )
	BEGIN
		IF Emdad_23rdMarch2022_Selm = '0' THEN
			Emdad_23rdMarch2022_F <= Emdad_23rdMarch2022_V ;
		ELSE
			Emdad_23rdMarch2022_F <= Emdad_23rdMarch2022_W ;
		END IF ;
	END PROCESS ;
END Behavior ;