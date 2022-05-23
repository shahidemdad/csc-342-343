LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Emdad_23rdMarch2022_32_bit_add_sub_scratch IS
	GENERIC ( n : INTEGER := 32 ) ;

	PORT (
		Emdad_23rdMarch2022_A, Emdad_23rdMarch2022_B : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		Emdad_23rdMarch2022_Clock, Emdad_23rdMarch2022_Reset, Emdad_23rdMarch2022_Sel, Emdad_23rdMarch2022_AddSub : IN STD_LOGIC;
		Emdad_23rdMarch2022_Z : BUFFER STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		Emdad_23rdMarch2022_Overflow : OUT STD_LOGIC
	);
	
END Emdad_23rdMarch2022_32_bit_add_sub_scratch;

ARCHITECTURE Behavior OF Emdad_23rdMarch2022_32_bit_add_sub_scratch IS

SIGNAL Emdad_23rdMarch2022_G, Emdad_23rdMarch2022_H, Emdad_23rdMarch2022_M, Emdad_23rdMarch2022_Areg, Emdad_23rdMarch2022_Breg, Emdad_23rdMarch2022_Zreg, Emdad_23rdMarch2022_AddSubR_n : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

SIGNAL Emdad_23rdMarch2022_SelR, Emdad_23rdMarch2022_AddSubR, Emdad_23rdMarch2022_carryout, Emdad_23rdMarch2022_over_flow : STD_LOGIC ;

COMPONENT Emdad_23rdMarch2022_mux2to1
	GENERIC ( k : INTEGER := 8);

	PORT (
		Emdad_23rdMarch2022_V, Emdad_23rdMarch2022_W : IN STD_LOGIC_VECTOR(k-1 DOWNTO 0) ;
		Emdad_23rdMarch2022_Selm : IN STD_LOGIC ;
		Emdad_23rdMarch2022_F : OUT STD_LOGIC_VECTOR(k-1 DOWNTO 0)
	) ;
END COMPONENT ;

COMPONENT Emdad_23rdMarch2022_adderk
	GENERIC ( k : INTEGER := 8 ) ;
	PORT (
		Emdad_23rdMarch2022_carryin : IN STD_LOGIC ;
		Emdad_23rdMarch2022_X, Emdad_23rdMarch2022_Y : IN STD_LOGIC_VECTOR(k-1 DOWNTO 0) ;
		Emdad_23rdMarch2022_S : OUT STD_LOGIC_VECTOR(k-1 DOWNTO 0) ;
		Emdad_23rdMarch2022_carryout : OUT STD_LOGIC
	) ;
END COMPONENT ;

BEGIN
	PROCESS ( Emdad_23rdMarch2022_Reset, Emdad_23rdMarch2022_Clock )

	BEGIN
			IF Emdad_23rdMarch2022_Reset = '1' then
			Emdad_23rdMarch2022_Areg <= (OTHERS => '0');
			Emdad_23rdMarch2022_Breg <= (OTHERS => '0');
			Emdad_23rdMarch2022_Zreg <= (OTHERS => '0');
			Emdad_23rdMarch2022_SelR <= '0';
			Emdad_23rdMarch2022_AddSubR <= '0';
			Emdad_23rdMarch2022_Overflow <= '0';
		ELSIF Emdad_23rdMarch2022_Clock'EVENT AND Emdad_23rdMarch2022_Clock = '1' THEN
			Emdad_23rdMarch2022_Areg <= Emdad_23rdMarch2022_A;
			Emdad_23rdMarch2022_Breg <= Emdad_23rdMarch2022_B;
			Emdad_23rdMarch2022_Zreg <= Emdad_23rdMarch2022_M;
			Emdad_23rdMarch2022_SelR <= Emdad_23rdMarch2022_Sel;
			Emdad_23rdMarch2022_AddSubR <= Emdad_23rdMarch2022_AddSub;
			Emdad_23rdMarch2022_Overflow <= Emdad_23rdMarch2022_over_flow;
		END IF ;
		END PROCESS ;
		
		nbit_adder: Emdad_23rdMarch2022_adderk
			GENERIC MAP ( k => n )
			PORT MAP ( Emdad_23rdMarch2022_AddSubR, Emdad_23rdMarch2022_G, Emdad_23rdMarch2022_H, Emdad_23rdMarch2022_M, Emdad_23rdMarch2022_carryout ) ;
			
		multiplexer: Emdad_23rdMarch2022_mux2to1
			GENERIC MAP ( k => n )
			PORT MAP ( Emdad_23rdMarch2022_Areg, Emdad_23rdMarch2022_Z, Emdad_23rdMarch2022_SelR, Emdad_23rdMarch2022_G ) ;
			
		Emdad_23rdMarch2022_AddSubR_n <= (OTHERS => Emdad_23rdMarch2022_AddSubR) ;
		
		Emdad_23rdMarch2022_H <= Emdad_23rdMarch2022_Breg XOR Emdad_23rdMarch2022_AddSubR_n ;
		Emdad_23rdMarch2022_over_flow <= Emdad_23rdMarch2022_carryout XOR Emdad_23rdMarch2022_G(n-1) XOR Emdad_23rdMarch2022_H(n-1) XOR Emdad_23rdMarch2022_M(n-1) ;
		Emdad_23rdMarch2022_Z <= Emdad_23rdMarch2022_Zreg ;
END Behavior;