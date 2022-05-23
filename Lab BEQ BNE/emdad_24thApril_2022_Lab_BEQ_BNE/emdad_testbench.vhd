library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY emdad_testbench is
end emdad_testbench;

architecture arch of emdad_testbench is 

    component emdad_Main_unit is
        port(
            emdad_instruction : in std_logic_vector (31 downto 0);
            emdad_clk: in std_logic;
            emdad_wren: in std_logic;
            emdad_rden: in std_logic;
            emdad_pc_chen: in std_logic;
            emdad_nextInstruction: out std_logic_vector(31 downto 0)
        );
    end component;

    SIGNAL emdad_instruction : std_logic_vector(31 downto 0);
    SIGNAL emdad_clk: std_logic;
    SIGNAL emdad_wren: std_logic;
    SIGNAL emdad_rden: std_logic;
    SIGNAL emdad_pc_chen: std_logic;
    SIGNAL emdad_nextInstruction: std_logic_vector(31 downto 0);
    
    begin
			process
			begin
            emdad_instruction <= "00010010001101000000000011111111";
            emdad_clk <= '1';
            wait for 50 ps;
            emdad_clk <= '0';
            wait for 50 ps;
			end process;
        
			process
			begin
            emdad_wren <= '0';
            wait for 100 ps;
            emdad_wren <= '1';
            wait for 100 ps;
        end process;
        
			process
			begin
            emdad_pc_chen <= '0';
            wait for 600 ps;
            emdad_pc_chen <= '1';
            wait;
			end process;
        
			process
			begin
            emdad_rden <= '0';
            wait for 200 ps;
            emdad_rden <= '1';
            wait for 200 ps;
			end process;
        
			F1: emdad_Main_unit port map(
            emdad_instruction => emdad_instruction,
            emdad_clk => emdad_clk,
            emdad_wren => emdad_wren,
            emdad_rden => emdad_rden,
            emdad_pc_chen => emdad_pc_chen,
            emdad_nextInstruction => emdad_nextInstruction
        );
        
end arch;