library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity emdad_April10th_2022_Sign_Extend is
	port( emdad_April10th_2022_I: in std_logic_vector(15 downto 0);
			emdad_April10th_2022_Q: out std_logic_vector(31 downto 0));
end emdad_April10th_2022_Sign_Extend;

architecture arch of emdad_April10th_2022_Sign_Extend is
	signal extended: std_logic_vector(31 downto 0);
	
	begin
		emdad_April10th_2022_Q <= std_logic_vector(resize(signed(emdad_April10th_2022_I), extended'length));
end arch;