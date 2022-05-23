library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
entity emdad_Data_Memory_22ndmay2022 is
	port 
	(
		emdad_22ndmay2022_clk				: in std_logic;
		emdad_22ndmay2022_address			: in std_logic_Vector(31 downto 0);
		emdad_22ndmay2022_Writedata		: in std_logic_Vector(31 downto 0);
		emdad_22ndmay2022_MemWrite			: in std_logic; 
		emdad_22ndmay2022_ReadData			: out std_logic_Vector(31 downto 0) 
	);
end emdad_Data_Memory_22ndmay2022;

architecture struct of emdad_Data_Memory_22ndmay2022 is

	type emdad_22ndmay2022_data is array (0 to 15) of std_logic_vector (31 downto 0);
	SIGNAL emdad_22ndmay2022_mem : emdad_22ndmay2022_data := (
	--x and y are only for the dot product 
	--if the operation is not dot product then these are not two vectors just 10 random values
	"00000000000000000000000000100000", --x1
	"00000000000000000000000000110000", --x2
	"00000000000000000000000000100101", --x3
	"00000000000000000000000000110101", --x4
	"00000000000000000000000000011000", --x5
	"00000000000000000000000001101000", --y1
	"00000000000000000000000000011001", --y2
	"00000000000000000000000000101000", --y3
	"00000000000000000000000000010110", --y4
	"00000000000000000000000000001001", --y5
	OTHERS => (OTHERS => '0'));
	--initialize the two arrays
	
begin
	process (emdad_22ndmay2022_clk)
	begin
		if (rising_edge(emdad_22ndmay2022_clk)) then
			if (emdad_22ndmay2022_MemWrite = '1') then 
				emdad_22ndmay2022_mem(to_integer(unsigned(emdad_22ndmay2022_address(5 downto 2)))) <= emdad_22ndmay2022_Writedata;
			end if;
		end if;
	end process;
	emdad_22ndmay2022_ReadData <= emdad_22ndmay2022_mem(to_integer(unsigned(emdad_22ndmay2022_address(5 downto 2))));
end struct;