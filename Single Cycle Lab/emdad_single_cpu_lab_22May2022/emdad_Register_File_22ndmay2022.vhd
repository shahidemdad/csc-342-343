library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity emdad_Register_File_22ndmay2022 is
	port 
	(
		emdad_22ndmay2022_clk		        		: in std_logic;
		emdad_22ndmay2022_regwrite          	: in std_logic; 
		emdad_22ndmay2022_writeRegister 			: in std_logic_vector(4 downto 0); 
		emdad_22ndmay2022_writeData      		: in std_logic_vector(31 downto 0); 
		emdad_22ndmay2022_ReadRegister1			: in std_logic_vector(4 downto 0);  
		emdad_22ndmay2022_ReadRegister2 			: in std_logic_vector(4 downto 0);  
		emdad_22ndmay2022_ReadData1	  			: out std_logic_vector(31 downto 0);
		emdad_22ndmay2022_ReadData2 				: out std_logic_vector(31 downto 0) 
	); 
end emdad_Register_File_22ndmay2022;

architecture struct of emdad_Register_File_22ndmay2022 is

	type emdad_22ndmay2022_reg is array (0 to 31) of std_logic_vector (31 downto 0);  
	signal emdad_22ndmay2022_mem : emdad_22ndmay2022_reg:= (others => (others => '0'));
	
begin
	process (emdad_22ndmay2022_clk)
	begin
		if (rising_edge(emdad_22ndmay2022_clk)) then
			if (emdad_22ndmay2022_regwrite = '1') then  
				emdad_22ndmay2022_mem(to_integer(unsigned(emdad_22ndmay2022_writeRegister))) <= emdad_22ndmay2022_writeData; 
			end if;
		end if;
	end process;
	emdad_22ndmay2022_ReadData1 <= (others => '0') when emdad_22ndmay2022_ReadRegister1 = "00000" else emdad_22ndmay2022_mem(to_integer(unsigned(emdad_22ndmay2022_ReadRegister1)));
	emdad_22ndmay2022_ReadData2 <= (others => '0') when emdad_22ndmay2022_ReadRegister2 = "00000" else emdad_22ndmay2022_mem(to_integer(unsigned(emdad_22ndmay2022_ReadRegister2)));

end struct;