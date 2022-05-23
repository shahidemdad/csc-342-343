LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY emdad_instruction_register_22ndmay2022 IS
	PORT 
	(
		emdad_22ndmay2022_instruction														: IN std_logic_vector(31 DOWNTO 0); 
		emdad_22ndmay2022_opcode, emdad_22ndmay2022_funct 							: OUT std_logic_vector(5 DOWNTO 0);
		emdad_22ndmay2022_shift																: OUT std_logic_vector(4 DOWNTO 0);
		emdad_22ndmay2022_IMM																: OUT std_logic_vector(15 DOWNTO 0);
		emdad_22ndmay2022_RS, emdad_22ndmay2022_RT, emdad_22ndmay2022_RD		: OUT std_logic_vector(4 DOWNTO 0)

	);
END emdad_instruction_register_22ndmay2022;

ARCHITECTURE struct OF emdad_instruction_register_22ndmay2022 IS
BEGIN

	emdad_22ndmay2022_opcode  <= emdad_22ndmay2022_instruction(5 DOWNTO 0);	
	emdad_22ndmay2022_funct	<= emdad_22ndmay2022_instruction(31 DOWNTO 26);
	emdad_22ndmay2022_shift	<= emdad_22ndmay2022_instruction(10 DOWNTO 6);
	emdad_22ndmay2022_IMM		<= emdad_22ndmay2022_instruction(15 DOWNTO 0);
	emdad_22ndmay2022_RS		<= emdad_22ndmay2022_instruction(25 DOWNTO 21);
	emdad_22ndmay2022_RT		<= emdad_22ndmay2022_instruction(20 DOWNTO 16);
	emdad_22ndmay2022_RD		<= emdad_22ndmay2022_instruction(15 DOWNTO 11);	
END struct;