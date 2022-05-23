library IEEE;
use IEEE.std_logic_1164.all;

entity emdad_April10th_2022_1to2demux_32 is
	generic (emdad_April10th_2022_k: integer := 32);
	port( emdad_April10th_2022_I: in std_logic_vector(emdad_April10th_2022_k-1 downto 0);
			emdad_April10th_2022_SEL: in std_logic;
			emdad_April10th_2022_Q0, emdad_April10th_2022_Q1: out std_logic_vector(emdad_April10th_2022_k-1 downto 0));
end emdad_April10th_2022_1to2demux_32;

architecture arch of emdad_April10th_2022_1to2demux_32 is
	begin
		process(emdad_April10th_2022_I, emdad_April10th_2022_SEL)
			begin
			if emdad_April10th_2022_SEL = '0' then 
				emdad_April10th_2022_Q0 <= emdad_April10th_2022_I;
				emdad_April10th_2022_Q1 <= "00000000000000000000000000000000";
			else 
				emdad_April10th_2022_Q1 <= emdad_April10th_2022_I;
				emdad_April10th_2022_Q0 <= "00000000000000000000000000000000";
			end if;
		end process;
end arch;