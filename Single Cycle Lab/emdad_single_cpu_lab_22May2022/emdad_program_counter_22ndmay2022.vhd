library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity emdad_program_counter_22ndmay2022 is 
	port(
		emdad_22ndmay2022_clk, emdad_22ndmay2022_reset					:	in std_logic;
		emdad_22ndmay2022_jump, emdad_22ndmay2022_branch				:	in std_logic;
		emdad_22ndmay2022_instruction, emdad_22ndmay2022_imm_Ext		:	in std_logic_vector(31 downto 0);
		emdad_22ndmay2022_pc														:	out std_logic_vector(31 downto 0)
	);
end emdad_program_counter_22ndmay2022;

architecture struct of emdad_program_counter_22ndmay2022 is 

signal emdad_22ndmay2022_current_pc: std_logic_vector(31 downto 0);

begin

process (emdad_22ndmay2022_clk, emdad_22ndmay2022_reset)
begin
	if (emdad_22ndmay2022_reset = '1') then
		emdad_22ndmay2022_current_pc <= (others => '0'); 
	elsif (rising_edge(emdad_22ndmay2022_clk)) then
		if(emdad_22ndmay2022_branch ='1')then 
			emdad_22ndmay2022_current_pc <= emdad_22ndmay2022_current_pc + x"00000004" + (emdad_22ndmay2022_imm_Ext(29 downto 0) & "00");
		elsif (emdad_22ndmay2022_jump = '1') then
			emdad_22ndmay2022_current_pc <= (emdad_22ndmay2022_current_pc and x"F0000000") or ("0000" & emdad_22ndmay2022_instruction(25 downto 0) & "00");
		else
			emdad_22ndmay2022_current_pc <= emdad_22ndmay2022_current_pc + x"00000004";
		end if;
	end if;
end process;

emdad_22ndmay2022_pc <= emdad_22ndmay2022_current_pc;
end struct; 