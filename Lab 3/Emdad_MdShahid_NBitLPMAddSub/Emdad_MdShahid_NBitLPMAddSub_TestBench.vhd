library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;

entity Emdad_03_06_22_NBitLPMAddSubTestBench is
end Emdad_03_06_22_NBitLPMAddSubTestBench;

architecture arch_test of Emdad_03_06_22_NBitLPMAddSubTestBench is
component Emdad_03_02_22_NBitLPMAddSub IS
	generic (N: integer := 16);
	PORT (add_sub		: IN STD_LOGIC ;
		cin		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		cout		: OUT STD_LOGIC ;
		overflow	: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END component;
signal s_add_sub, s_cin, s_cout, s_overflow: STD_LOGIC;
signal s_dataa, s_datab, s_result: STD_LOGIC_VECTOR(16-1 DOWNTO 0);
	
begin
	U1: Emdad_03_02_22_NBitLPMAddSub PORT MAP(s_add_sub, s_cin, s_dataa, s_datab, s_cout, s_overflow, s_result);
	vectors: PROCESS
	BEGIN	
		s_cin <= '0';
		-- a. Most Positive N bit integer + 1
		s_add_sub <= '0';
		s_dataa <= "0111111111111111";
		s_datab <= "0000000000000001";
		WAIT FOR 100 ns;
		-- b. Most Positive N bit integer - 1
		s_add_sub <= '1';
		s_dataa <= "0111111111111111";
		s_datab <= "0000000000000001";
		WAIT FOR 100 ns;
		-- c. Most Negative N bit integer + 1
		s_add_sub <= '0';
		s_dataa <= "1000000000000000";
		s_datab <= "0000000000000001";
		WAIT FOR 100 ns;
		-- d. Most Negative N bit integer ? 1
		s_add_sub <= '1';
		s_dataa <= "1000000000000000";
		s_datab <= "0000000000000001";
		WAIT FOR 100 ns;
		-- e. Most Positive N bit integer - Most Negative N bit integer
		s_add_sub <= '1';
		s_dataa <= "0111111111111111";
		s_datab <= "1000000000000000";
		WAIT FOR 100 ns;
		-- f. Most Positive N bit integer + Most Negative N bit integer
		s_add_sub <= '0';
		s_dataa <= "0111111111111111";
		s_datab <= "1000000000000000";
		WAIT FOR 100 ns;
		-- g. Most Positive N bit integer - Most Positive N bit integer 
		s_add_sub <= '1';
		s_dataa <= "0111111111111111";
		s_datab <= "0111111111111111";
		WAIT FOR 100 ns;
	WAIT;
	END PROCESS;
end arch_test;

