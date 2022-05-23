library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

entity emdad_April10th_2022_bitwise_op is
	generic(N: integer := 32);
	port(
		emdad_April10th_2022_I0, emdad_April10th_2022_I1, emdad_April10th_2022_ext: in std_logic_vector (N-1 downto 0); --32 bit register inputs
		emdad_April10th_2022_Imm: in std_logic_vector (15 downto 0); --16 bit immediate
		emdad_April10th_2022_op: in std_logic_vector(3 downto 0); --Operation Code
		emdad_April10th_2022_Q: out std_logic_vector (N-1 downto 0); --32 bit register output
		emdad_April10th_2022_Z: out std_logic := '0'; --Zero flag
		emdad_April10th_2022_N: out std_logic := '0'; --Negative flag 
		emdad_April10th_2022_O: out std_logic := '0'); --Overflow flag 
end emdad_April10th_2022_bitwise_op;

architecture arch of emdad_April10th_2022_bitwise_op is
	signal result: std_logic_vector (N-1 downto 0);
	begin
		P1: process(emdad_April10th_2022_I0, emdad_April10th_2022_I1, emdad_April10th_2022_op, result)
			begin
				case emdad_April10th_2022_op is
					when "0110"=> result <= emdad_April10th_2022_I0 AND emdad_April10th_2022_I1; -- and
					when "0111"=> result <= emdad_April10th_2022_I0 AND emdad_April10th_2022_ext; -- andi
					when "1000"=> result <= emdad_April10th_2022_I0 NOR emdad_April10th_2022_I1; -- nor
					when "1001"=> result <= emdad_April10th_2022_I0 OR emdad_April10th_2022_I1; -- or
					when "1010"=> result <= emdad_April10th_2022_I0 OR emdad_April10th_2022_ext; --ori
					when "1011"=> result <= std_logic_vector(shift_left(unsigned(emdad_April10th_2022_I1), to_integer(unsigned(emdad_April10th_2022_Imm)))); -- sll
					when "1100"=> result <= std_logic_vector(shift_right(unsigned(emdad_April10th_2022_I1), to_integer(unsigned(emdad_April10th_2022_Imm)))); -- srl
					when "1101"=> result <= std_logic_vector(shift_right(signed(emdad_April10th_2022_I1), to_integer(unsigned(emdad_April10th_2022_Imm)))); -- sra
					when others=> result <= x"00000000";
					end case;
		emdad_April10th_2022_Q <= result;
		end process;
end arch;