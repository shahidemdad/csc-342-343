library work; 
use work.emdad_adder_package.all; 
library IEEE; 
use IEEE. STD_LOGIC_1164.ALL; 

entity emdad_32_bit_adder is
	generic (n :integer :=32); 
	port(emdad_x, emdad_y : in std_logic_vector (n-1 downto 0); 
	     emdad_cin : in std_logic; 
	     emdad_s : out std_logic_vector (n-1 downto 0);
	     emdad_cout : out std_logic);
end emdad_32_bit_adder;

architecture arch of emdad_32_bit_adder is
signal emdad_C, emdad_ycin, emdad_sTemp : std_logic_vector (n-1 downto 0); 
begin
FA: for i in 0 to n-1 generate 
	emdad_ycin(i) <= emdad_y (i) xor emdad_cin; 
	I1: IF (i = 0) generate
		F1: emdad_full_adder port map (emdad_a =>emdad_x(i), emdad_b =>emdad_ycin(i), 
					        emdad_c=>emdad_cin, emdad_sumFA => emdad_sTemp(i),
					        emdad_carryFA =>emdad_c(i));
		emdad_s(i) <= emdad_sTemp(i); 
	end generate I1;
	I2: IF ((i <n-1) and (i > 0)) generate
		F1: emdad_full_adder port map (emdad_a => emdad_x(i), emdad_b => emdad_ycin(i), 
					        emdad_c=>emdad_c(i-1), emdad_sumFA => emdad_sTemp(i), 
					        emdad_carryFA =>emdad_c(i));
		emdad_s (i) <= emdad_sTemp (i); 
	end generate I2;
	I3: IF (i = n-1) generate
		F2: emdad_full_adder port map (emdad_a =>emdad_x(i), emdad_b=>emdad_ycin(i), 
					        emdad_c=>emdad_c(i-1), emdad_sumFA =>emdad_sTemp(i), 
					        emdad_carryFA =>emdad_c(i));
		emdad_cout <= emdad_c(i);
		emdad_s (i) <= emdad_sTemp(i); 
	end generate I3; 
end generate FA; 
end arch;