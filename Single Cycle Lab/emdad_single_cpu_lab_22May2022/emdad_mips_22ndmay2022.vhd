library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY emdad_mips_22ndmay2022 IS
	PORT 
	(
		emdad_22ndmay2022_CLK, emdad_22ndmay2022_RESET		: IN std_logic; 
		emdad_22ndmay2022_ALU_Result, emdad_22ndmay2022_PC	: OUT std_logic_vector(31 DOWNTO 0) -- result
	);
END emdad_mips_22ndmay2022;

ARCHITECTURE struct OF emdad_mips_22ndmay2022 IS
	SIGNAL emdad_22ndmay2022_current_pc																														: std_logic_vector(31 DOWNTO 0);
	SIGNAL emdad_22ndmay2022_Instruction																													: std_logic_vector(31 DOWNTO 0);
	SIGNAL emdad_22ndmay2022_ALU_2																															: std_logic_vector(31 DOWNTO 0); 
	SIGNAL emdad_22ndmay2022_ALU_Out																															: std_logic_vector(31 DOWNTO 0); 
	SIGNAL emdad_22ndmay2022_HI_LO_Result																													: std_logic_vector(63 DOWNTO 0); 
	SIGNAL emdad_22ndmay2022_ALU_Z																															: std_logic; 
	SIGNAL emdad_22ndmay2022_Data_Mem_Out																													: std_logic_vector(31 DOWNTO 0);
	SIGNAL emdad_22ndmay2022_RegFile_W_Addr																												: std_logic_vector(4 DOWNTO 0); 
	SIGNAL emdad_22ndmay2022_RegFile_W_Data																												: std_logic_vector(31 DOWNTO 0); 
	SIGNAL emdad_22ndmay2022_write_back_data																												: std_logic_vector(31 DOWNTO 0);
	SIGNAL emdad_22ndmay2022_RegFile_Data1																													: std_logic_vector(31 DOWNTO 0); 
	SIGNAL emdad_22ndmay2022_RegFile_Data2																													: std_logic_vector(31 DOWNTO 0); 
	SIGNAL emdad_22ndmay2022_SigExt																															: std_logic_vector(31 DOWNTO 0);
	SIGNAL emdad_22ndmay2022_mflo,emdad_22ndmay2022_mfhi																								: std_logic; 
	SIGNAL emdad_22ndmay2022_ALUOp																															: std_logic_vector(3 downto 0);
	SIGNAL emdad_22ndmay2022_Shift, emdad_22ndmay2022_ShiftA, emdad_22ndmay2022_RS, emdad_22ndmay2022_RT,emdad_22ndmay2022_RD	: std_logic_vector(4 downto 0);
	SIGNAL emdad_22ndmay2022_OP, emdad_22ndmay2022_Func																								: std_logic_vector(5 downto 0);
	SIGNAL emdad_22ndmay2022_IMM																																: std_logic_vector(15 downto 0);
	SIGNAL emdad_22ndmay2022_Branch																															: std_logic;
	SIGNAL emdad_22ndmay2022_Jump																																: std_logic; 
	SIGNAL emdad_22ndmay2022_RegDst																															: std_logic; 
	SIGNAL emdad_22ndmay2022_Branch_EQ																														: std_logic; 
	SIGNAL emdad_22ndmay2022_Branch_NE																														: std_logic; 
	SIGNAL emdad_22ndmay2022_MemtoReg																														: std_logic; 
	SIGNAL emdad_22ndmay2022_ALUsrc																															: std_logic;
	SIGNAL emdad_22ndmay2022_RegWrite																														: std_logic;
	SIGNAL emdad_22ndmay2022_MemWrite																														: std_logic;
	SIGNAL emdad_22ndmay2022_PCsrc	 																														: std_logic;
	
BEGIN

	InstMem_Inst : ENTITY work.emdad_Instruction_Memory_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_current_pc,
		emdad_22ndmay2022_Instruction);

	RegFile_Inst : ENTITY work.emdad_Register_File_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_CLK,
		emdad_22ndmay2022_RegWrite,
		emdad_22ndmay2022_RegFile_W_Addr,
		emdad_22ndmay2022_RegFile_W_Data,
		emdad_22ndmay2022_RS, emdad_22ndmay2022_RT,
		emdad_22ndmay2022_RegFile_Data1, 
		emdad_22ndmay2022_RegFile_Data2);

	IR_Inst : ENTITY work.emdad_instruction_register_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_Instruction,
		emdad_22ndmay2022_OP,
		emdad_22ndmay2022_Func,
		emdad_22ndmay2022_ShiftA,
		emdad_22ndmay2022_IMM,
		emdad_22ndmay2022_RS,
		emdad_22ndmay2022_RT, 
		emdad_22ndmay2022_RD);

	Cont_Inst : ENTITY work.emdad_control_unit_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_OP,
		emdad_22ndmay2022_Func,
		emdad_22ndmay2022_ShiftA,
		emdad_22ndmay2022_Jump,
		emdad_22ndmay2022_RegDst,
		emdad_22ndmay2022_Branch_EQ, 
		emdad_22ndmay2022_Branch_NE,
		emdad_22ndmay2022_MemtoReg,
		emdad_22ndmay2022_ALUsrc,
		emdad_22ndmay2022_RegWrite,
		emdad_22ndmay2022_MemWrite,
		emdad_22ndmay2022_PCsrc, 
		emdad_22ndmay2022_ALUOp,
		emdad_22ndmay2022_Shift);

	ALU_Inst : ENTITY work.emdad_alu_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_RegFile_Data1,
		emdad_22ndmay2022_ALU_2, 
		emdad_22ndmay2022_ALUOp,
		emdad_22ndmay2022_Shift,
		emdad_22ndmay2022_ALU_Out,
		emdad_22ndmay2022_HI_LO_Result, 
		emdad_22ndmay2022_ALU_Z);

	DMem_Inst : ENTITY work.emdad_Data_Memory_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_CLK,
		emdad_22ndmay2022_ALU_Out,
		emdad_22ndmay2022_RegFile_Data2,
		emdad_22ndmay2022_MemWrite,
		emdad_22ndmay2022_Data_Mem_Out);

	Mux_1 : ENTITY work.emdad_mux_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_RegFile_Data2,
		emdad_22ndmay2022_SigExt,
		emdad_22ndmay2022_ALUsrc, 
		emdad_22ndmay2022_ALU_2);

	Mux_2 : ENTITY work.emdad_mux_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_ALU_Out,
		emdad_22ndmay2022_Data_Mem_Out,
		emdad_22ndmay2022_MemtoReg,
		emdad_22ndmay2022_write_back_data);

	Mux_3 : ENTITY work.emdad_mux_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_write_back_data,
		emdad_22ndmay2022_HI_LO_Result(31 downto 0),
		emdad_22ndmay2022_mflo,
		emdad_22ndmay2022_RegFile_W_Data);

	SignExt_Inst : ENTITY work.emdad_signext_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_IMM,
		emdad_22ndmay2022_SigExt);

	Program_Counter_Inst : ENTITY work.emdad_program_counter_22ndmay2022
		PORT MAP(
		emdad_22ndmay2022_CLK,
		emdad_22ndmay2022_RESET,
		emdad_22ndmay2022_Jump,
		emdad_22ndmay2022_Branch, 
		emdad_22ndmay2022_Instruction, 
		emdad_22ndmay2022_SigExt,
		emdad_22ndmay2022_current_pc );


	emdad_22ndmay2022_mflo <=	'1' when (emdad_22ndmay2022_Instruction(5 DOWNTO 0) = "010010") else '0';
	emdad_22ndmay2022_mfhi <=	'1' when (emdad_22ndmay2022_Instruction(5 DOWNTO 0) = "010001") else '0';
	emdad_22ndmay2022_RegFile_W_Addr <= emdad_22ndmay2022_RT when (emdad_22ndmay2022_RegDst = '1') else emdad_22ndmay2022_RD;
	emdad_22ndmay2022_Branch		<= ((emdad_22ndmay2022_ALU_Z ) and (emdad_22ndmay2022_Branch_EQ )) or ( (not(emdad_22ndmay2022_ALU_Z)) and (emdad_22ndmay2022_Branch_NE));
	emdad_22ndmay2022_ALU_Result  <= emdad_22ndmay2022_ALU_Out;
	emdad_22ndmay2022_PC			<= emdad_22ndmay2022_current_pc;
 
END struct;
