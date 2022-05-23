LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- comments: example of the buzzer circuit of fig. 2
entity Emdad_MdShahid_Buzzer is
     port (DOOR, IGNITION, SBELT: in std_logic;
    WARNING: out std_logic);
end Emdad_MdShahid_Buzzer;

architecture structural of Emdad_MdShahid_Buzzer is
 -- Declarations
component AND2
    port (in1, in2: in std_logic;
        out1: out std_logic);
    end component;
component OR2
    port (in1, in2: in std_logic;
        out1: out std_logic);
 end component;
component NOT1
    port (in1: in std_logic;
        out1: out std_logic);
end component;
-- declaration of signals used to interconnect gates
signal DOOR_NOT, SBELT_NOT, B1, B2: std_logic;
begin
-- Component instantiations statements
    WARNING <= (not DOOR and IGNITION) or (not SBELT and IGNITION);
end structural;