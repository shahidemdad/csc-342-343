library work;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY emdad_controller is
    port(
        emdad_J					: in std_logic_Vector(31 downto 0); 
        emdad_BEQBNE				: in std_logic_Vector(31 downto 0); 
        emdad_OP					: in std_logic_Vector(5 downto 0);
        emdad_nextInstruction : out std_logic_Vector(31 downto 0)
    );
end emdad_controller;

architecture arch of emdad_controller is 
    SIGNAL emdad_s: std_logic_vector(31 downto 0);
    
    begin
    emdad_s <= emdad_J when emdad_OP 	= "000010"
    ELSE
    emdad_BEQBNE when emdad_OP 			= "000100"
    ELSE
    emdad_BEQBNE when emdad_OP 			= "000101";
    
    emdad_nextInstruction <= emdad_s;
        
end arch;