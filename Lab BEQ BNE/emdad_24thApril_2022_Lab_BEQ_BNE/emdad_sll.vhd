library work;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY emdad_sll is
    port(
        emdad_PC	: in std_logic_Vector(3 downto 0); 
        emdad_J	: in std_logic_Vector(25 downto 0); 
        emdad_z	: out std_logic_Vector(31 downto 0) 
    );
end emdad_sll;	

architecture arch of emdad_sll is 
    SIGNAL emdad_s: std_logic_vector(31 downto 0);
    
    begin
    emdad_s(31 downto 28) 	<= emdad_PC(3 downto 0);
    emdad_s(27 downto 2) 	<= emdad_J(25 downto 0);
    emdad_s(1 downto 0) 	<= "00";
    emdad_z <= emdad_s;

end arch;