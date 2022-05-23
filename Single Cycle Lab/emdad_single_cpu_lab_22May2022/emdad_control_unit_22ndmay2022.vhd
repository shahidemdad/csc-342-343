library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY emdad_control_unit_22ndmay2022 IS

	PORT 
	(
		emdad_22ndmay2022_func, emdad_22ndmay2022_opcode: IN std_logic_vector(5 DOWNTO 0); 
		emdad_22ndmay2022_shiftAmount: IN std_logic_vector(4 DOWNTO 0); 
		emdad_22ndmay2022_jump		: OUT std_logic;
		emdad_22ndmay2022_RegDst		: OUT std_logic;
		emdad_22ndmay2022_Branch_EQ	: OUT std_logic;
		emdad_22ndmay2022_Branch_NE	: OUT std_logic;
		emdad_22ndmay2022_MemtoReg	: OUT std_logic;
		emdad_22ndmay2022_ALUsrc		: OUT std_logic;
		emdad_22ndmay2022_RegWrite	: OUT std_logic;
		emdad_22ndmay2022_MemWrite	: OUT std_logic;
		emdad_22ndmay2022_PCsrc		: out std_logic;
		emdad_22ndmay2022_ALUOp		: OUT std_logic_vector(3 downto 0);
		emdad_22ndmay2022_Shift		: OUT std_logic_vector(4 downto 0)
	);
	
END emdad_control_unit_22ndmay2022;

ARCHITECTURE struct OF emdad_control_unit_22ndmay2022 IS

BEGIN
	emdad_22ndmay2022_Shift		<= emdad_22ndmay2022_shiftAmount WHEN ((emdad_22ndmay2022_opcode = "000000") AND
	(emdad_22ndmay2022_func = "000000" OR emdad_22ndmay2022_func = "000010" OR emdad_22ndmay2022_func = "000011")) ELSE "00000"; 
	emdad_22ndmay2022_RegDst		<= '0' WHEN (emdad_22ndmay2022_opcode = "000000") ELSE '1'; 
	emdad_22ndmay2022_ALUsrc		<= '0' WHEN (emdad_22ndmay2022_opcode = "000000" or 
	(emdad_22ndmay2022_opcode = "000100") or (emdad_22ndmay2022_opcode = "000101")) ELSE '1'; 
	emdad_22ndmay2022_MemWrite	<= '1' WHEN (emdad_22ndmay2022_opcode = "101011") ELSE '0'; 
	emdad_22ndmay2022_RegWrite	<= '0' WHEN (emdad_22ndmay2022_opcode = "101011" 
	or emdad_22ndmay2022_opcode = "000100" or emdad_22ndmay2022_opcode = "000101" or emdad_22ndmay2022_opcode = "000010") ELSE '1'; 
	emdad_22ndmay2022_MemtoReg	<= '1' WHEN (emdad_22ndmay2022_opcode = "100011") ELSE '0';
	emdad_22ndmay2022_jump		<= '1' WHEN (emdad_22ndmay2022_opcode = "000010") ELSE '0'; 
	emdad_22ndmay2022_Branch_EQ	<= '1' WHEN (emdad_22ndmay2022_opcode = "000100") ELSE '0'; 
	emdad_22ndmay2022_Branch_NE	<= '1' WHEN (emdad_22ndmay2022_opcode = "000101") ELSE '0';
	emdad_22ndmay2022_PCsrc <= '1' WHEN(emdad_22ndmay2022_opcode = "101011") ELSE '0';
	emdad_22ndmay2022_ALUOp  <= "0000" WHEN (emdad_22ndmay2022_opcode = "001000") ELSE ---addi---
	                        "0000" WHEN (emdad_22ndmay2022_func = "100000" AND emdad_22ndmay2022_opcode = "000000") ELSE ---add
	                        "0001" WHEN (emdad_22ndmay2022_opcode = "001001") ELSE ---addiu
	                        "0001" WHEN (emdad_22ndmay2022_opcode = "101011") ELSE ---sw
	                        "0001" WHEN (emdad_22ndmay2022_opcode = "100011") ELSE ---lw
	                        "0001" WHEN (emdad_22ndmay2022_func = "100001" AND emdad_22ndmay2022_opcode = "000000") ELSE ---addu
	                        "0010" WHEN (emdad_22ndmay2022_opcode = "000100") ELSE ---beq
	                        "0010" WHEN (emdad_22ndmay2022_opcode = "000101") ELSE ---bne
	                        "0010" WHEN (emdad_22ndmay2022_func = "100010" AND emdad_22ndmay2022_opcode = "000000") ELSE ---sub
	                        "0011" WHEN (emdad_22ndmay2022_func = "100011" AND emdad_22ndmay2022_opcode = "000000") ELSE ---subu
	                        "0100" WHEN (emdad_22ndmay2022_opcode = "001100") ELSE ---andi
	                        "0100" WHEN (emdad_22ndmay2022_func = "100100" AND emdad_22ndmay2022_opcode = "000000") ELSE ---and
	                        "0101" WHEN (emdad_22ndmay2022_func = "100111" AND emdad_22ndmay2022_opcode = "000000") ELSE ---nor
	                        "0110" WHEN (emdad_22ndmay2022_opcode = "001101") ELSE ---ori
	                        "0110" WHEN (emdad_22ndmay2022_func = "100101" AND emdad_22ndmay2022_opcode = "000000") ELSE ---or
	                        "0111" WHEN (emdad_22ndmay2022_func = "000000" AND emdad_22ndmay2022_opcode = "000000") ELSE ---sll
	                        "1000" WHEN (emdad_22ndmay2022_func = "000010" AND emdad_22ndmay2022_opcode = "000000") ELSE ---srl
	                        "1001" WHEN (emdad_22ndmay2022_func = "000011" AND emdad_22ndmay2022_opcode = "000000") ELSE ---sra
	                        "1010" WHEN (emdad_22ndmay2022_func = "011000" AND emdad_22ndmay2022_opcode = "000000") ELSE ---MUL
	                        "1011" WHEN (emdad_22ndmay2022_func = "011010" AND emdad_22ndmay2022_opcode = "000000") ELSE ---DIV
							(OTHERS => '0');
END struct;