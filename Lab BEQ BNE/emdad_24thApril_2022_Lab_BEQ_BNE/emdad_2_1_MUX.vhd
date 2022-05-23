library work;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY emdad_2_1_MUX is
    port(
        emdad_4, emdad_4_IMM  : in std_logic_Vector(31 downto 0); 
        emdad_cond				: in std_logic;
        emdad_out					: out std_logic_Vector(31 downto 0) 
    );
end emdad_2_1_MUX;

architecture arch of emdad_2_1_MUX is 

    begin
    emdad_out <= emdad_4 when emdad_cond = '0' ELSE emdad_4_IMM;
    
end arch;