library ieee;
use ieee.std_logic_1164.all;
 
entity Emdad_MdShahid_03_02_2022_4bit_ozn_tb is
end Emdad_MdShahid_03_02_2022_4bit_ozn_tb;
 
architecture signalized_4_bit_test of Emdad_MdShahid_03_02_2022_4bit_ozn_tb is
component Emdad_MdShahid_03_02_2022_n_bit_add_sub
generic (n: integer := 4);
  port (
    Emdad_MdShahid_03_02_2022_op: in std_logic;
    Emdad_MdShahid_03_02_2022_a, Emdad_MdShahid_03_02_2022_b : in std_logic_vector(n-1 downto 0);
    Emdad_MdShahid_03_02_2022_output : out std_logic_vector(n-1 downto 0);
    Emdad_MdShahid_03_02_2022_overflow, Emdad_MdShahid_03_02_2022_zero,
    Emdad_MdShahid_03_02_2022_negative : out std_logic);
end component;
signal p0 : std_logic;
signal p1, p2 : std_logic_vector(4-1 downto 0);
signal psum   : std_logic_vector(4-1 downto 0);
signal pover : std_logic;
signal pzero : std_logic;
signal pneg : std_logic;
signal error  : std_logic := '0';
begin
      uut: Emdad_MdShahid_03_02_2022_n_bit_add_sub port map(
        Emdad_MdShahid_03_02_2022_op => p0, Emdad_MdShahid_03_02_2022_a => p1,
        Emdad_MdShahid_03_02_2022_b => p2, Emdad_MdShahid_03_02_2022_output => psum,
        Emdad_MdShahid_03_02_2022_overflow => pover, Emdad_MdShahid_03_02_2022_zero => pzero,
        Emdad_MdShahid_03_02_2022_negative => pneg);
process
    begin
    --most positive plus 1
    p0 <= '0';
    p1 <= "1111";
    p2 <= "0001";
    wait for 1 ns;
    if (pover = '0' or pzero = '0' or pneg = '1') then
        error <= '1';
    end if;
    wait for 200 ns;
    --most positive minus 1
    p0 <= '1';
    p1 <= "1111";
    p2 <= "0001";
    wait for 1 ns;
    if (pover = '1' or pzero = '1' or pneg = '1') then
        error <= '1';
    end if;
    wait for 200 ns;
    --most negative plus 1
    p0 <= '0';
    p1 <= "1000";
    p2 <= "0001";
    wait for 1 ns;
    if (pover = '1' or pzero = '1' or pneg = '1') then
        error <= '1';
    end if;
    wait for 200 ns;
    --most negative minus 1
    p0 <= '1';
    p1 <= "1111";
    p2 <= "0001";
    wait for 1 ns;
    if (pover = '1' or pzero = '1' or pneg = '1') then
        error <= '1';
    end if;
    wait for 200 ns;
      
     --most positive minus most negative
    p0 <= '1';
    p1 <= "1111";
    p2 <= "1000";
    wait for 1 ns;
    if (pover = '1' or pzero = '1' or pneg = '1') then
        error <= '1';
    end if;
    wait for 200 ns;
     --most positive plus most negative
    p0 <= '0';
    p1 <= "1111";
    p2 <= "1000";
    wait for 1 ns;
    if (pover = '0' or pzero = '1' or pneg = '1') then
        error <= '1';
    end if;
    wait for 200 ns;
     --most positive minus most positive
    p0 <= '1';
    p1 <= "1111";
    p2 <= "1111";
    wait for 1 ns;
    if (pover = '1' or pzero = '0' or pneg = '1') then
        error <= '1';
    end if;
    wait for 200 ns;
       
    if (error = '0') then
        report "No errors detected. Simulation successful" severity
    failure;
    else
    report "Error detected" severity failure;
    end if;
end process;
end signalized_4_bit_test;


