library IEEE;
use IEEE.std_logic_1164.all;

entity emdad_April10th_2022_RT is
    generic (emdad_April10th_2022_datawidth: integer := 32);
    port (
        emdad_April10th_2022_clock, emdad_April10th_2022_write, emdad_April10th_2022_read, emdad_April10th_2022_enable: in std_logic;
        emdad_April10th_2022_content: in std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0);
        emdad_April10th_2022_result: out std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0));
end emdad_April10th_2022_RT;

architecture arch of emdad_April10th_2022_RT is

    signal emdad_April10th_2022_memory: std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0);

    begin
        P1: process(emdad_April10th_2022_clock, emdad_April10th_2022_write)
        begin
            if(rising_edge(emdad_April10th_2022_clock) and emdad_April10th_2022_write = '1')
                then emdad_April10th_2022_memory <= emdad_April10th_2022_content;
            end if;
        end process P1;

        P2: process(emdad_April10th_2022_read, emdad_April10th_2022_enable, emdad_April10th_2022_memory)
        begin
            if(emdad_April10th_2022_read = '1' and emdad_April10th_2022_enable = '1')
                then emdad_April10th_2022_result <= emdad_April10th_2022_memory;
            elsif(emdad_April10th_2022_enable = '0')
                then emdad_April10th_2022_result <= (others => '0');
            end if;
        end process P2;
end arch;