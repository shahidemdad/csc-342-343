library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_std.ALL;

entity emdad_April10th_2022_NBit_AddSub is
	generic(n: integer := 32);
	port( emdad_April10th_2022_a, emdad_April10th_2022_b: in std_logic_vector(n-1 downto 0);
			emdad_April10th_2022_sum: out std_logic_vector(n-1 downto 0);
			emdad_April10th_2022_cin: in std_logic;
			emdad_April10th_2022_op: in std_logic;
			emdad_April10th_2022_cout, emdad_April10th_2022_O, emdad_April10th_2022_N, emdad_April10th_2022_Z: out std_logic);
end emdad_April10th_2022_NBit_AddSub;

architecture nbitaddsub_behav of emdad_April10th_2022_NBit_AddSub is
	signal result: std_logic_vector(n-1 downto 0);
	begin 
		result <= (emdad_April10th_2022_a + emdad_April10th_2022_b) WHEN (emdad_April10th_2022_op = '0') ELSE (emdad_April10th_2022_a - emdad_April10th_2022_b);
		emdad_April10th_2022_cout <= '1'
		WHEN (emdad_April10th_2022_op = '0' AND emdad_April10th_2022_a(n-1) = emdad_April10th_2022_b(n-1) AND result(n-1) /= emdad_April10th_2022_a(n-1)) OR
			  (emdad_April10th_2022_op = '1' AND emdad_April10th_2022_a(n-1) /= emdad_April10th_2022_b(n-1) AND result(n-1) /= emdad_April10th_2022_a(n-1)) ELSE '0';
		emdad_April10th_2022_O <= '1'
		WHEN (emdad_April10th_2022_op = '0' AND emdad_April10th_2022_a(n-1) = emdad_April10th_2022_b(n-1) AND result(n-1) /= emdad_April10th_2022_a(n-1)) OR
			  (emdad_April10th_2022_op = '1' AND emdad_April10th_2022_a(n-1) /= emdad_April10th_2022_b(n-1) AND result(n-1) /= emdad_April10th_2022_a(n-1)) ELSE '0';
		emdad_April10th_2022_sum <= result;
		emdad_April10th_2022_N <= result(n-1);
		
		process(result)
			begin
				if unsigned(result) = "0" then
					emdad_April10th_2022_Z <= '1';
				else
					emdad_April10th_2022_Z <= '0';
				end if;
		end process;
		
end nbitaddsub_behav;