library ieee;
use ieee.std_logic_1164.all;

entity emdad_mux_22ndmay2022 is
	port 
	(
		emdad_22ndmay2022_input1		: in std_logic_vector(31 downto 0); 
		emdad_22ndmay2022_input2		: in std_logic_vector(31 downto 0); 
		emdad_22ndmay2022_sel			: in std_logic; 
		emdad_22ndmay2022_output		: out std_logic_vector(31 downto 0) 
	);
end emdad_mux_22ndmay2022;

architecture struct OF emdad_mux_22ndmay2022 is

begin
	with emdad_22ndmay2022_sel select  
	emdad_22ndmay2022_output <= emdad_22ndmay2022_input2 when '1', emdad_22ndmay2022_input1 when others;

end struct;