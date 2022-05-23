library ieee;
use ieee.std_logic_1164.all;

entity Emdad_14thmarch_RAM1PORT_tb is
end Emdad_14thmarch_RAM1PORT_tb;

architecture arch_test of Emdad_14thmarch_RAM1PORT_tb is
component Emdad_14thMarch_RAM1PORT IS
    PORT (address: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            clock: IN STD_LOGIC;
            data: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            wren: IN STD_LOGIC ;
            q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
end component;
signal clock, wren: STD_LOGIC;
signal data, address, q: STD_LOGIC_VECTOR (3 DOWNTO 0);

begin
    U1: Emdad_14thMarch_RAM1PORT PORT MAP(address, clock, data, wren, q);
    vectors: PROCESS
    BEGIN
-- A
     	clock <= '0';
     	wren <= '0';
	data <= "0001";
      	address <= "1010";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '0';
	data <= "0001";
      	address <= "1010";
	WAIT FOR 20 ps;

     	clock <= '0';
     	wren <= '1';
	data <= "0001";
      	address <= "1010";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '1';
	data <= "0001";
      	address <= "1010";
	WAIT FOR 20 ps;

--B
     	clock <= '0';
     	wren <= '0';
	data <= "0010";
      	address <= "1011";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '0';
	data <= "0010";
      	address <= "1011";
	WAIT FOR 20 ps;

     	clock <= '0';
     	wren <= '1';
	data <= "0010";
      	address <= "1011";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '1';
	data <= "0010";
      	address <= "1011";
	WAIT FOR 20 ps;

--C
     	clock <= '0';
     	wren <= '0';
	data <= "0011";
      	address <= "1100";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '0';
	data <= "0011";
      	address <= "1100";
	WAIT FOR 20 ps;

     	clock <= '0';
     	wren <= '1';
	data <= "0011";
      	address <= "1100";
	WAIT FOR 20 ps;

     	clock <= '0';
     	wren <= '1';
	data <= "0011";
      	address <= "1100";
	WAIT FOR 20 ps;

--D
     	clock <= '0';
     	wren <= '0';
	data <= "0100";
      	address <= "1101";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '0';
	data <= "0100";
      	address <= "1101";
	WAIT FOR 20 ps;

     	clock <= '0';
     	wren <= '1';
	data <= "0100";
      	address <= "1101";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '1';
	data <= "0100";
      	address <= "1101";
	WAIT FOR 20 ps;

--E
     	clock <= '0';
     	wren <= '0';
	data <= "0101";
      	address <= "1110";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '0';
	data <= "0101";
      	address <= "1110";
	WAIT FOR 20 ps;

     	clock <= '0';
     	wren <= '1';
	data <= "0101";
      	address <= "1110";
	WAIT FOR 20 ps;

     	clock <= '1';
     	wren <= '1';
	data <= "0101";
      	address <= "1110";
	WAIT FOR 20 ps;
    WAIT;
    END PROCESS;
end arch_test;