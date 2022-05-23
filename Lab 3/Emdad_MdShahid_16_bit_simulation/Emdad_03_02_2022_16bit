library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Emdad_03_02_2022_16bit is
port(A,B:in std_logic_vector(15 downto 0); --two 16 bit inputs
X:out std_logic_vector(15 downto 0); --output
C:out std_logic; --carry output
S:in std_logic); --Select Bit to define Addition or subtraction

end Emdad_03_02_2022_16bit;

architecture Behavioral of Emdad_03_02_2022_16bit is
signal Y:std_logic_vector(16 downto 0); -- Define internal signal Y
begin
process (A,B,S) --Process with process variables A, B, and S
begin

case S is
when '0' => --S=0 defines the subtraction operation
Y<=('0' & A)-('0' & B);
when others => --S=1 defines the Addition operation
Y<=('0' & A)+('0' & B);
end case;
end process;
C<=Y(16); -- Assignment of the 17th bit as carry out
X<=Y(15 downto 0); -- Assignment of the 1 to 16th bit as 16-bit sum or difference
end Behavioral;