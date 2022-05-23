LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Emdad_MdShahid_mux_2_1_32bit IS
    PORT (A, B : IN STD_LOGIC_VECTOR(31 downto 0);
          X		: IN STD_LOGIC_VECTOR(0 downto 0);
          Y		: OUT STD_LOGIC_VECTOR(31 downto 0));
END Emdad_MdShahid_mux_2_1_32bit;

ARCHITECTURE LogicFunction OF Emdad_MdShahid_mux_2_1_32bit IS
BEGIN
    Y <= (A AND NOT X) OR (B AND X);
END LogicFunction;