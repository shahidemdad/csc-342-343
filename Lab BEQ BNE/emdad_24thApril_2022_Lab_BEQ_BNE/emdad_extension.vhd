library work; 
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity emdad_extension is 
	port (emdad_imm_input	: in std_logic_vector (15 downto 0); 
	      emdad_Q 				: out std_logic_vector (31 downto 0)
	);
end emdad_extension;

architecture arch of emdad_extension is
	signal extended: std_logic_vector(31 downto 0);
	begin
	emdad_Q <= std_logic_vector(resize(signed(emdad_imm_input), extended'length));
end arch;