library IEEE;
use IEEE.std_logic_1164.all;

entity emdad_14march22_NRegister_VHDL is
generic (N: integer := 32);
port(
    emdad_14march22_clk  : in std_logic;
    emdad_14march22_wren : in std_logic; 
    emdad_14march22_rden : in std_logic; 
    emdad_14march22_chen : in std_logic;
    emdad_14march22_data : in std_logic_vector (N-1 downto 0);
    emdad_14march22_q : out std_logic_vector(N-1 downto 0)
);
end emdad_14march22_NRegister_VHDL;
architecture arch of emdad_14march22_NRegister_VHDL is
    signal emdad_14march22_storage : std_logic_vector(N-1 downto 0);
begin
    process(emdad_14march22_clk)
    begin
        if(rising_edge(emdad_14march22_clk) and emdad_14march22_wren = '1')
        then emdad_14march22_storage <= emdad_14march22_data;
        end if;
    end process;
    process(emdad_14march22_rden, emdad_14march22_chen, emdad_14march22_storage)
    begin
        if (emdad_14march22_rden = '1' and emdad_14march22_chen = '1')
            then emdad_14march22_q <= emdad_14march22_storage;
        elsif(emdad_14march22_chen = '0')
            then emdad_14march22_q <= (others => 'Z');
            end if;
        end process;
    end arch; 