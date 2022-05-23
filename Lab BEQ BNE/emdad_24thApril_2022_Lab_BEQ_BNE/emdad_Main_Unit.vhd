library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USe IEEE.NUMERIC_STD.ALL;

ENTITY emdad_Main_unit is
    port(
        emdad_instruction : in std_logic_vector (31 downto 0);
        emdad_clk: in std_logic;
        emdad_wren: in std_logic;
        emdad_rden: in std_logic;
        emdad_pc_chen: in std_logic;
        emdad_nextInstruction: out std_logic_vector(31 downto 0)
    );

end emdad_Main_unit;


architecture arch of emdad_Main_unit is
    component emdad_32_bit_register
        port(
            emdad_clk, emdad_wren, emdad_rden, emdad_chen : in std_logic; 
            emdad_data : in std_logic_vector (31 downto 0);
            emdad_q : out std_logic_vector (31 downto 0)
        );
    end component;
    
    component emdad_Register_File
        PORT
        (
            emdad_address_a : IN STD_LOGIC_VECTOR (4 DOWNTO 0); 
            emdad_address_b : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            emdad_clock : IN STD_LOGIC; 
            emdad_data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0); 
            emdad_data_b : IN STD_LOGIC_VECTOR (31 DOWNTO 0); 
            emdad_wren_a : IN STD_LOGIC := '0';
            emdad_wren_b : IN STD_LOGIC := '0';
            emdad_q_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            emdad_q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
        );
    end component;
    
    component emdad_extension
	port (emdad_imm_input : in std_logic_vector (15 downto 0); 
	      emdad_Q : out std_logic_vector (31 downto 0));
    end component;
    
    component emdad_equal
        port (emdad_RS, emdad_RT: in std_logic_vector (31 downto 0); 
        emdad_OP: in std_logic_vector (5 downto 0); 
        emdad_Cond : out std_logic);
    end component;
    
    component emdad_sll
        port(
            emdad_PC: in std_logic_Vector(3 downto 0); 
            emdad_J: in std_logic_Vector(25 downto 0); 
            emdad_z: out std_logic_Vector(31 downto 0) 
        );
    end component;
    
    component emdad_controller
        port(
            emdad_J: in std_logic_Vector(31 downto 0); 
            emdad_BEQBNE: in std_logic_Vector(31 downto 0); 
            emdad_OP: in std_logic_Vector(5 downto 0);
            emdad_nextInstruction : out std_logic_Vector(31 downto 0)
        );
    end component;
    
    component emdad_32_bit_adder
    generic(n:integer :=32);
        port(emdad_x, emdad_y : in std_logic_vector (n-1 downto 0); 
        emdad_cin : in std_logic; 
        emdad_s : out std_logic_vector (n-1 downto 0);
        emdad_cout : out std_logic);
    end component;
    
    component emdad_2_1_MUX
        port(
            emdad_4, emdad_4_IMM : in std_logic_Vector(31 downto 0); 
            emdad_cond: in std_logic;
            emdad_out: out std_logic_Vector(31 downto 0) 
        );
    end component;
    
    -- PC DATA
    SIGNAL emdad_PCINOUT : STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL emdad_PC_MUX_output : STD_LOGIC_VECTOR (31 downto 0);
    
    
    -- OPCODE RT RS REGISTER DATA
    SIGNAL emdad_InstructionRegister_out : STD_LOGIC_VECTOR (31 downto 0) ;
    SIGNAL emdad_OPCODE: STD_LOGIC_VECTOR (5 downto 0);
    SIGNAL emdad_RSADDRESS: STD_LOGIC_VECTOR (4 downto 0);
    SIGNAL emdad_RTADDRESS: STD_LOGIC_VECTOR (4 downto 0);
    SIGNAL emdad_IMM_DATA : STD_LOGIC_VECTOR (15 downto 0);
    SIGNAL emdad_PC_HIGHER_ORDER : STD_LOGIC_VECTOR (3 downto 0) ;
    SIGNAL emdad_JUMP: STD_LOGIC_VECTOR (25 downto 0);
    SIGNAL emdad_IMM_EXTENDED: STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL emdad_RSREGISTERFILE_OUT: STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL emdad_RTREGISTERFILE_OUT: STD_LOGIC_VECTOR (31 downto 0);
    
    -- ADDING LOGIC SIGNALS
    SIGNAL emdad_ADD_4  : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL emdad_ADD_IMM: STD_LOGIC_VECTOR (31 DOWNTO 0);
    
    -- COMPARATOR SIGNALS
    SIGNAL emdad_CONDITIONAL : std_logic;
    
    -- JUMP SIGNAL
    SIGNAL emdad_JUMP_INSTRUCTION : STD_LOGIC_VECTOR (31 DOWNTO 0);
    
    -- CONTROLLER OUTPUT
    SIGNAL emdad_Controller_Out : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL emdad_temp_pcinout : STD_LOGIC_VECTOR (31 DOWNTO 0);
    
    BEGIN
    
        emdad_temp_pcinout <= x"00000000" WHEN emdad_pc_chen = '0' ELSE emdad_pcinout;
    
        emdad_OPCODE <= emdad_InstructionRegister_out (31 downto 26);
        emdad_RSADDRESS <= emdad_InstructionRegister_out (25 downto 21);
        emdad_RTADDRESS <= emdad_InstructionRegister_out (20 downto 16);
        emdad_IMM_DATA  <= emdad_InstructionRegister_out (15 downto 0);
        emdad_JUMP      <= emdad_InstructionRegister_out (25 downto 0);
        emdad_PC_HIGHER_ORDER <= "0000" when emdad_pc_chen ='0' ELSE emdad_pcinout(31 downto 28);
        
        F1: emdad_32_bit_register port map (
            emdad_clk => emdad_clk,
            emdad_wren => emdad_wren,
            emdad_rden => emdad_rden,
            emdad_chen => '1',
        emdad_data => emdad_instruction,
        emdad_q => emdad_InstructionRegister_out
        );
        
        F2: emdad_Register_File port map(
        emdad_clock => emdad_clk,
        emdad_address_a => emdad_RSADDRESS,
        emdad_address_b => emdad_RTADDRESS,
        emdad_data_a => x"00000000",
        emdad_data_b => x"00000000",
        emdad_wren_a => '0',
        emdad_wren_b => '0',
        emdad_q_a => emdad_RSREGISTERFILE_OUT,
        emdad_q_b => emdad_RTREGISTERFILE_OUT
        );
        
        F3: emdad_equal port map(
        emdad_RS => emdad_RSREGISTERFILE_OUT,
        emdad_RT => emdad_RTREGISTERFILE_OUT,
        emdad_OP => emdad_OPCODE,
        emdad_Cond => emdad_CONDITIONAL
        );
        
        F4: emdad_extension port map(
            emdad_imm_input=> emdad_IMM_DATA,
            emdad_Q => emdad_IMM_EXTENDED
        );
        
        F5: emdad_32_bit_adder port map(
            emdad_x => emdad_temp_pcinout,
            emdad_y => x"00000004",
            emdad_cin => '0',
            emdad_s => emdad_ADD_4
        );
        
        F6: emdad_sll port map(
            emdad_PC => emdad_PC_HIGHER_ORDER,
            emdad_J => emdad_JUMP,
            emdad_z => emdad_JUMP_INSTRUCTION
        );
        
        F7: emdad_32_bit_adder port map(
            emdad_x => emdad_ADD_4,
            emdad_y => emdad_IMM_EXTENDED,
            emdad_cin => '0',
            emdad_s => emdad_ADD_IMM
        );
        
        F8: emdad_2_1_MUX port map(
            emdad_4 => emdad_ADD_4,
            emdad_4_IMM => emdad_ADD_IMM,
            emdad_cond => emdad_CONDITIONAL,
            emdad_out => emdad_PC_MUX_output
        );
        
        F9: emdad_controller port map(
            emdad_J => emdad_JUMP_INSTRUCTION,
            emdad_BEQBNE => emdad_PC_MUX_output,
            emdad_OP => emdad_OPCODE,
            emdad_nextInstruction => emdad_Controller_Out
        );
        
        F10: emdad_32_bit_register port map(
            emdad_clk => emdad_clk,
            emdad_wren => emdad_wren,
            emdad_rden => emdad_rden,
            emdad_chen => emdad_pc_chen,
            emdad_data => emdad_controller_out,
            emdad_q => emdad_PCInout
        );
        
        emdad_nextInstruction <= emdad_PCInout;
end arch;