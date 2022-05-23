library IEEE; 
use IEEE. STD_LOGIC_1164.ALL; 

entity emdad_full_adder is 
	port (emdad_a, emdad_b, emdad_c : in std_logic;
	      emdad_sumFA, emdad_carryFA : out std_logic);
end emdad_full_adder;

architecture arch of emdad_full_adder is 
component emdad_half_adder 
port (emdad_x , emdad_y: in std_logic;
      emdad_sum, emdad_carry: out std_logic); 
end component;
signal emdad_sumSignalhal, emdad_carrysignalhal, 
       emdad_sumsignalhA2 , emdad_carrysignalhA2 : std_logic;
begin
H1: emdad_half_adder port map (emdad_x=>emdad_a , emdad_y=>emdad_b, emdad_sum =>emdad_sumsignalhal, 
			        emdad_carry => emdad_carrysignalHal);
H2: emdad_half_adder port map (emdad_x => emdad_sumsignalhal , emdad_y=> emdad_c, emdad_sum => 
			        emdad_sumsignalHA2, emdad_carry => emdad_carrysignalhA2);
emdad_sumFA <= emdad_sumsignalHA2;
emdad_carryFA <= emdad_carrysignalhA2 or emdad_carrysignalhal; 
end arch;