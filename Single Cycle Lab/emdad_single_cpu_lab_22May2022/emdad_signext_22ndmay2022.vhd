library ieee;
use ieee.std_logic_1164.all;

entity emdad_signext_22ndmay2022 is 
	port(
		emdad_22ndmay2022_in		:	in std_logic_vector(15 downto 0);
		emdad_22ndmay2022_out	:	out std_logic_vector(31 downto 0)
	);
end emdad_signext_22ndmay2022;

architecture struct of emdad_signext_22ndmay2022 is 

begin

	emdad_22ndmay2022_out <= x"0000" & emdad_22ndmay2022_in when emdad_22ndmay2022_in(15) = '0' else x"FFFF" & emdad_22ndmay2022_in;

end struct; 