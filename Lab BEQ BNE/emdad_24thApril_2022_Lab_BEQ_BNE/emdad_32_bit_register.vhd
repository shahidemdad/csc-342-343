library IEEE; 
use IEEE.std_logic_1164.all; 

entity emdad_32_bit_register is 
	port(emdad_clk, emdad_wren, emdad_rden, emdad_chen : in std_logic; 
	     emdad_data : in std_logic_vector (31 downto 0);
	     emdad_q : out std_logic_vector (31 downto 0));
end emdad_32_bit_register;

architecture arch of emdad_32_bit_register is
signal emdad_storage : std_logic_vector (31 downto 0);
begin
	process (emdad_clk) 
	begin 
		if (rising_edge (emdad_clk) and emdad_wren = '1')
			then emdad_storage <= emdad_data; 
		end if; 
	end process;
	process (emdad_rden,emdad_chen,emdad_storage) 
	begin 
		if (emdad_rden = '1' and emdad_chen = '1')
			then emdad_q <= emdad_storage; 
		elsif (emdad_chen = '0')
			then emdad_q <= (others => 'Z'); 
		end if; 
	end process;
end arch;