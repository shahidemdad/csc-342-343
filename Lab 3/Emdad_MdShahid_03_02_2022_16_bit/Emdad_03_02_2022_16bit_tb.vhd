LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Emdad_03_02_2022_16bit_tb IS
END Emdad_03_02_2022_16bit_tb;

ARCHITECTURE behavior OF Emdad_03_02_2022_16bit_tb IS


COMPONENT Emdad_03_02_2022_16bit
PORT(
A : IN std_logic_vector(15 downto 0); --16 bit input A
B : IN std_logic_vector(15 downto 0); --16 bit input B
X : OUT std_logic_vector(15 downto 0); --Output
C : OUT std_logic; --carry out
S : IN std_logic --Select Bit
);
END COMPONENT;


--Define Inputs as internal signal
signal A : std_logic_vector(15 downto 0) := (others => '0');
signal B : std_logic_vector(15 downto 0) := (others => '0');
signal S : std_logic := '0';

--Define Outputs as internal signal
signal X : std_logic_vector(15 downto 0);
signal C : std_logic;

BEGIN

uut: Emdad_03_02_2022_16bit PORT MAP (
A => A, -- Definition of the Unit Under Test
B => B,
X => X,
C => C,
S => S
);

stim_proc: process
begin

wait for 100 ns;

-- Define Test inputs:
S<='1';
A<="0000000000100000";
B<="1111111111111111";
wait for 10 ns; --Adding delay of 10 nanoseconds for convinience
S<='0';
--Add several test inputs
A<="0000000000100000";
B<="0111111111111111";
wait for 10 ns;
S<='0';
A<="1111111111111111";
B<="0000000000100000";
-- Here including subtraction operation
wait for 10 ns;
S<='1';
A<="0000000000100000";
B<="0000111111111111";
wait;
end process;

END;