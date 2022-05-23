library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

entity emdad_April10th_2022_ALU is
	generic(N: integer := 32);
	port(
		emdad_April10th_2022_clk: in std_logic;
		emdad_April10th_2022_RS_i, emdad_April10th_2022_RT_i, emdad_April10th_2022_MDR_i: in std_logic_vector (N-1 downto 0); 
		emdad_April10th_2022_Imm: in std_logic_vector (15 downto 0);
		emdad_April10th_2022_op: in std_logic_vector(3 downto 0);
		emdad_April10th_2022_RD_i: out std_logic_vector (N-1 downto 0);
		emdad_April10th_2022_RD_out: out std_logic_vector (N-1 downto 0);
		emdad_April10th_2022_Z: out std_logic := '0';
		emdad_April10th_2022_N: out std_logic := '0';
		emdad_April10th_2022_O: out std_logic := '0');
end emdad_April10th_2022_ALU;

architecture arch of emdad_April10th_2022_ALU is
	signal cout, z_temp0, n_temp0, o_temp0, z_temp1, n_temp1, o_temp1, z_temp2, n_temp2, o_temp2, z_temp3, n_temp3, o_temp3,
				z_temp4, n_temp4, o_temp4, z_temp5, n_temp5, o_temp5, z_temp6, n_temp6, o_temp6, mar_wren, mdr_wren : std_logic := '0';
	signal temp0, temp1, temp2, temp3, temp4, temp5, temp6: std_logic_vector (N-1 downto 0);
	signal RS_o, RT_o, RT_out, RD_i, ext_o, MAR_o, MDR_o: std_logic_vector (N-1 downto 0);
	signal imm_o: std_logic_vector (15 downto 0);
	
	component emdad_April10th_2022_RD is
		generic (emdad_April10th_2022_datawidth: integer := 32);
		port (
			emdad_April10th_2022_clock, emdad_April10th_2022_write, emdad_April10th_2022_read, emdad_April10th_2022_enable: in std_logic;
			emdad_April10th_2022_content: in std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0);
			emdad_April10th_2022_result: out std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0));
	end component;

	component emdad_April10th_2022_RT is
		generic (emdad_April10th_2022_datawidth: integer := 32);
		port (
			emdad_April10th_2022_clock, emdad_April10th_2022_write, emdad_April10th_2022_read, emdad_April10th_2022_enable: in std_logic;
			emdad_April10th_2022_content: in std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0);
			emdad_April10th_2022_result: out std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0));
	end component;

	component emdad_April10th_2022_RS is
		generic (emdad_April10th_2022_datawidth: integer := 32);
		port (
			emdad_April10th_2022_clock, emdad_April10th_2022_write, emdad_April10th_2022_read, emdad_April10th_2022_enable: in std_logic;
			emdad_April10th_2022_content: in std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0);
			emdad_April10th_2022_result: out std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0));
	end component;

	component emdad_April10th_2022_IMM16 is
		generic (emdad_April10th_2022_Imm_size: integer := 16);
		port (
			emdad_April10th_2022_clock, emdad_April10th_2022_write, emdad_April10th_2022_read, emdad_April10th_2022_enable: in std_logic;
			emdad_April10th_2022_In: in std_logic_vector(emdad_April10th_2022_Imm_size-1 downto 0);
			emdad_April10th_2022_out: out std_logic_vector(emdad_April10th_2022_Imm_size-1 downto 0));
	end component;
	
	component emdad_April10th_2022_Sign_Extend is
	port( emdad_April10th_2022_I: in std_logic_vector(15 downto 0);
			emdad_April10th_2022_Q: out std_logic_vector(31 downto 0));
	end component;
	
	component emdad_April10th_2022_MAR is
		generic (emdad_April10th_2022_datawidth: integer := 32);
		port (
			emdad_April10th_2022_clock, emdad_April10th_2022_write, emdad_April10th_2022_read, emdad_April10th_2022_enable: in std_logic;
			emdad_April10th_2022_content: in std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0);
			emdad_April10th_2022_ext: in std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0);
			emdad_April10th_2022_result: out std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0));
	end component;
	
	component emdad_April10th_2022_MDR is
		generic (emdad_April10th_2022_datawidth: integer := 32);
		port (
			emdad_April10th_2022_clock, emdad_April10th_2022_write, emdad_April10th_2022_read, emdad_April10th_2022_enable: in std_logic;
			emdad_April10th_2022_content: in std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0);
			emdad_April10th_2022_result: out std_logic_vector(emdad_April10th_2022_datawidth-1 downto 0));
	end component;
	
	component emdad_April10th_2022_NBit_AddSub is
		generic(n: integer := 32);
		port( emdad_April10th_2022_a, emdad_April10th_2022_b: in std_logic_vector(n-1 downto 0);
				emdad_April10th_2022_sum: out std_logic_vector(n-1 downto 0);
				emdad_April10th_2022_cin: in std_logic;
				emdad_April10th_2022_op: in std_logic;
				emdad_April10th_2022_cout, emdad_April10th_2022_O, emdad_April10th_2022_N, emdad_April10th_2022_Z: out std_logic);
	end component;
	
	component emdad_April10th_2022_bitwise_op is
		generic(N: integer := 32);
		port(
			emdad_April10th_2022_I0, emdad_April10th_2022_I1, emdad_April10th_2022_ext: in std_logic_vector (N-1 downto 0); 
			emdad_April10th_2022_Imm: in std_logic_vector (15 downto 0); 
			emdad_April10th_2022_op: in std_logic_vector(3 downto 0); 
			emdad_April10th_2022_Q: out std_logic_vector (N-1 downto 0); 
			emdad_April10th_2022_Z: out std_logic := '0';
			emdad_April10th_2022_N: out std_logic := '0';
			emdad_April10th_2022_O: out std_logic := '0');
	end component;
	
	begin
		
		RD: emdad_April10th_2022_RD generic map (emdad_April10th_2022_datawidth => 32)
		port map (emdad_April10th_2022_clk, '1', '1', '1', RD_i, emdad_April10th_2022_RD_i);
		RS: emdad_April10th_2022_RS generic map (emdad_April10th_2022_datawidth => 32)
		port map (emdad_April10th_2022_clk, '1', '1', '1', emdad_April10th_2022_RS_i, RS_o);
		RT: emdad_April10th_2022_RT generic map (emdad_April10th_2022_datawidth => 32)
		port map (emdad_April10th_2022_clk, '1', '1', '1', emdad_April10th_2022_RT_i, RT_o);
		imm: emdad_April10th_2022_IMM16 generic map (emdad_April10th_2022_Imm_size => 16)
		port map (emdad_April10th_2022_clk, '1', '1', '1', emdad_April10th_2022_Imm, imm_o);
		ext: emdad_April10th_2022_Sign_Extend port map (emdad_April10th_2022_Imm, ext_o);
		MAR: emdad_April10th_2022_MAR generic map (emdad_April10th_2022_datawidth => 32)
		port map (emdad_April10th_2022_clk, '1', '1', '1', RS_o, ext_o, MAR_o);
		MDR: emdad_April10th_2022_MDR generic map (emdad_April10th_2022_datawidth => 32)
		port map (emdad_April10th_2022_clk, '1', '1', '1', emdad_April10th_2022_MDR_i, MDR_o);
		
		
		add: emdad_April10th_2022_NBit_AddSub generic map (n => 32) port map (RS_o, RT_o, temp0, '0', '0', cout, o_temp0, n_temp0, z_temp0);
		addi: emdad_April10th_2022_NBit_AddSub generic map (n => 32) port map (RS_o, ext_o, temp1, '0', '0', cout, o_temp1, n_temp1, z_temp1);
		addiu: emdad_April10th_2022_NBit_AddSub generic map (n => 32) port map (RS_o, ext_o, temp2, '0', '0', cout, o_temp2, n_temp2, z_temp2);
		addu: emdad_April10th_2022_NBit_AddSub generic map (n => 32) port map (RS_o, RT_o, temp3, '0', '0', cout, o_temp3, n_temp3, z_temp3);
		sub: emdad_April10th_2022_NBit_AddSub generic map (n => 32) port map (RS_o, RT_o, temp4, '0', '1', cout, o_temp4, n_temp4, z_temp4);
		subu: emdad_April10th_2022_NBit_AddSub generic map (n => 32) port map (RS_o, RT_o, temp5, '0', '1', cout, o_temp5, n_temp5, z_temp5);
		bit_op: emdad_April10th_2022_bitwise_op generic map (N => 32) port map (RS_o, RT_o, ext_o, imm_o, emdad_April10th_2022_op, temp6, z_temp6, n_temp6,  o_temp6);
		
		
		P1: process(temp0, temp1, temp2, temp3, temp4, temp5, temp6)
			begin
				case emdad_April10th_2022_op is
					when "0000"=> emdad_April10th_2022_RD_out <= temp0; emdad_April10th_2022_O <= o_temp0;
					emdad_April10th_2022_N <= n_temp0; emdad_April10th_2022_Z <= z_temp0;
					when "0001"=> RT_out <= temp1; emdad_April10th_2022_O <= o_temp1; emdad_April10th_2022_N <= n_temp1; emdad_April10th_2022_Z <= z_temp1;
					when "0010"=> RT_out <= temp2; emdad_April10th_2022_O <= '0'; emdad_April10th_2022_N <= n_temp2;
					emdad_April10th_2022_Z <= z_temp2;
					when "0011"=> emdad_April10th_2022_RD_out <= temp3; emdad_April10th_2022_O <= '0';
					emdad_April10th_2022_N <= n_temp3; emdad_April10th_2022_Z <= z_temp3;
					when "0100"=> emdad_April10th_2022_RD_out <= temp4; emdad_April10th_2022_O <= o_temp4;
					emdad_April10th_2022_N <= n_temp4; emdad_April10th_2022_Z <= z_temp4;
					when "0101"=> emdad_April10th_2022_RD_out <= temp5; emdad_April10th_2022_O <= '0'; emdad_April10th_2022_N <= n_temp5;
					emdad_April10th_2022_Z <= z_temp5;
					when "0110" | "1000" | "1001"| "1011" | "1100" | "1101" => emdad_April10th_2022_RD_out <= temp6;
					emdad_April10th_2022_O <= o_temp6; emdad_April10th_2022_N <= n_temp6; emdad_April10th_2022_Z <= z_temp6;
					when "0111" | "1010" => RT_out <= temp6; emdad_April10th_2022_O <= o_temp6;
					emdad_April10th_2022_N <= n_temp6; emdad_April10th_2022_Z <= z_temp6;
					when "1110" => RT_out <= MAR_o; 
					when "1111" => RT_out <= MDR_o;
					when others => emdad_April10th_2022_RD_out <= x"00000000";
				end case;
			end process;
end arch;