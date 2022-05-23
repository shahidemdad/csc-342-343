library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity emdad_Instruction_Memory_22ndmay2022 is
	port 
	(emdad_22ndmay2022_pc          			: in std_logic_vector(31 downto 0); 
		emdad_22ndmay2022_instruction 		: out std_logic_vector(31 downto 0) 
	);
end emdad_Instruction_Memory_22ndmay2022;

architecture struct of emdad_Instruction_Memory_22ndmay2022 is

	type emdad_22ndmay2022_rom is array (0 to 31) of std_logic_vector(31 downto 0);
	
	signal emdad_22ndmay2022_rom_mem : emdad_22ndmay2022_rom := (
					"00000000000000000000000000000000", 
					"00100100000010110000000000000101",
					"10001101001100010000000000000000",
					"10001101001100100000000000010100",
					"00000010001100100000000000011000",
					"00000000000000001000100000010010",
					"00000010100100011010000000100000",
					"00100001000010000000000000000001",
					"00100001001010010000000000000100",
					"00010101000010111111111111111000", 
					"10101100000101000000000000111100", 
					"00001000000100000000000000001010",
	others => 	"00000000000000000000000000000000");
	
begin
	emdad_22ndmay2022_instruction <= emdad_22ndmay2022_rom_mem(to_integer(unsigned(emdad_22ndmay2022_pc(6 downto 2)))); 
end struct;