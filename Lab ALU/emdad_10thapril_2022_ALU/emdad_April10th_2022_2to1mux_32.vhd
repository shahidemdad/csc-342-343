library IEEE;
use IEEE.std_logic_1164.all;

entity emdad_April10th_2022_2to1mux_32 is
    generic (emdad_April10th_2022_k: integer := 32);
    port( emdad_April10th_2022_I0, emdad_April10th_2022_I1: in std_logic_vector(emdad_April10th_2022_k-1 downto 0);
            emdad_April10th_2022_SEL: in std_logic;
            emdad_April10th_2022_Q: out std_logic_vector(emdad_April10th_2022_k-1 downto 0));
end emdad_April10th_2022_2to1mux_32;

architecture arch of emdad_April10th_2022_2to1mux_32 is
    begin
        process(emdad_April10th_2022_I0, emdad_April10th_2022_I1, emdad_April10th_2022_SEL)
            begin
            if emdad_April10th_2022_SEL = '0'
                then emdad_April10th_2022_Q <= emdad_April10th_2022_I0;
            else 
                emdad_April10th_2022_Q <= emdad_April10th_2022_I1;
            end if;
        end process;
end arch;