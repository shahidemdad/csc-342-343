library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity emdad_alu_22ndmay2022 is
	port 
	(
		emdad_22ndmay2022_input1				: in std_logic_vector(31 downto 0);
		emdad_22ndmay2022_input2				: in std_logic_vector(31 downto 0);
		emdad_22ndmay2022_op			 			: in std_logic_vector(3 downto 0);  
		emdad_22ndmay2022_shift        		: in std_logic_vector(4 downto 0);  
		emdad_22ndmay2022_alu_result   		: out std_logic_vector(31 downto 0);
		emdad_22ndmay2022_HI_LO_result 		: out std_logic_vector(63 downto 0);
		emdad_22ndmay2022_zero		 			: out std_logic
	);
end emdad_alu_22ndmay2022;

architecture struct of emdad_alu_22ndmay2022 is

	signal emdad_22ndmay2022_result	: std_logic_vector(31 downto 0);
	signal emdad_22ndmay2022_reminder, emdad_22ndmay2022_quotient: std_logic_vector(31 downto 0);
	
begin

emdad_22ndmay2022_result <=	std_logic_vector(signed(emdad_22ndmay2022_input1) - signed(emdad_22ndmay2022_input2))		when (emdad_22ndmay2022_op = "0010")	else -- SUB
			std_logic_vector(signed(emdad_22ndmay2022_input1) + signed(emdad_22ndmay2022_input2))		when (emdad_22ndmay2022_op = "0000")	else --ADD
			emdad_22ndmay2022_input1 AND emdad_22ndmay2022_input2 	when (emdad_22ndmay2022_op = "0100")	else --AND
			emdad_22ndmay2022_input1 NOR emdad_22ndmay2022_input2 	when (emdad_22ndmay2022_op = "0101")	else --NOR
			emdad_22ndmay2022_input1 OR emdad_22ndmay2022_input2	when (emdad_22ndmay2022_op = "0110")	else --OR
			std_logic_vector(unsigned(emdad_22ndmay2022_input1) + unsigned(emdad_22ndmay2022_input2))	when (emdad_22ndmay2022_op = "0001") 	else -- ADDU
			std_logic_vector(unsigned(emdad_22ndmay2022_input1) - unsigned(emdad_22ndmay2022_input2))	when (emdad_22ndmay2022_op = "0011")	else --SUBU
			std_logic_vector(shift_right(unsigned(emdad_22ndmay2022_input2), to_integer(unsigned(emdad_22ndmay2022_shift))))	when (emdad_22ndmay2022_op = "1000")	else --SRL
			std_logic_vector(shift_left(unsigned(emdad_22ndmay2022_input2), to_integer(unsigned(emdad_22ndmay2022_shift))))	when (emdad_22ndmay2022_op = "0111")	else --SLL
			std_logic_vector(shift_right(signed(emdad_22ndmay2022_input2), to_integer(unsigned(emdad_22ndmay2022_shift))))		when (emdad_22ndmay2022_op = "1001")	else --SRA			 
			(others => '0');


process (emdad_22ndmay2022_op, emdad_22ndmay2022_input2)
begin
	if (emdad_22ndmay2022_op = "1011") then
		emdad_22ndmay2022_quotient<= std_logic_vector(unsigned(emdad_22ndmay2022_input1) / unsigned(emdad_22ndmay2022_input2));
		emdad_22ndmay2022_reminder<= std_logic_vector(unsigned(emdad_22ndmay2022_input1) rem unsigned(emdad_22ndmay2022_input2));
		emdad_22ndmay2022_HI_LO_result <= emdad_22ndmay2022_reminder & emdad_22ndmay2022_quotient;
	elsif(emdad_22ndmay2022_op = "1010") then
		emdad_22ndmay2022_HI_LO_result <= std_logic_vector(unsigned(emdad_22ndmay2022_input1) * unsigned(emdad_22ndmay2022_input2)); 
	end if;
end process;

emdad_22ndmay2022_zero       <= '1' when emdad_22ndmay2022_result = x"00000000" else '0'; 
emdad_22ndmay2022_alu_result <= emdad_22ndmay2022_result;

end struct;