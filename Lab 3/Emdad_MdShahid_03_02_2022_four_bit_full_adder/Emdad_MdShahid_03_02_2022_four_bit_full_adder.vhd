library  ieee;
use  ieee.std_logic_1164.all;

entity Emdad_MdShahid_03_02_2022_four_bit_full_adder IS
     port (Emdad_MdShahid_03_02_2022_four_bit_full_adder_X, Emdad_MdShahid_03_02_2022_four_bit_full_adder_Y : in std_logic_vector(3 downto 0);
           Emdad_MdShahid_03_02_2022_four_bit_full_adder_Cin																: in std_logic; 
			  Emdad_MdShahid_03_02_2022_four_bit_full_adder_sum: out std_logic_vector (3 downto 0);
           Emdad_MdShahid_03_02_2022_four_bit_full_adder_Cout: out std_logic);
     end Emdad_MdShahid_03_02_2022_four_bit_full_adder;

architecture fouradder_structure of Emdad_MdShahid_03_02_2022_four_bit_full_adder is

     signal Emdad_MdShahid_03_02_2022_four_bit_full_adder_C: std_logic_vector (2 downto 0);

component Emdad_MdShahid_03_02_2022_one_bit_full_adder
	PORT ( Emdad_MdShahid_03_06_2022_X, Emdad_MdShahid_03_06_2022_Y, Emdad_MdShahid_03_06_2022_Cin : IN STD_LOGIC ;
			Emdad_MdShahid_03_06_2022_sum, Emdad_MdShahid_03_06_2022_Cout									  : OUT STD_LOGIC ) ;
end component;

begin
           Emdad_MdShahid_03_02_2022_four_bit_full_adder_FA0: Emdad_MdShahid_03_02_2022_one_bit_full_adder
                port map (Emdad_MdShahid_03_02_2022_four_bit_full_adder_X(0),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_Y(0),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_Cin,
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_sum(0),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_C(0));

           Emdad_MdShahid_03_02_2022_four_bit_full_adder_FA1: Emdad_MdShahid_03_02_2022_one_bit_full_adder
                port map (Emdad_MdShahid_03_02_2022_four_bit_full_adder_X(1),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_Y(1),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_C(0),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_sum(1),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_C(1));

           Emdad_MdShahid_03_02_2022_four_bit_full_adder_FA2: Emdad_MdShahid_03_02_2022_one_bit_full_adder
                port map (Emdad_MdShahid_03_02_2022_four_bit_full_adder_X(2),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_Y(2),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_C(1),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_sum(2),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_C(2));

           Emdad_MdShahid_03_02_2022_four_bit_full_adder_FA3: Emdad_MdShahid_03_02_2022_one_bit_full_adder
                port map (Emdad_MdShahid_03_02_2022_four_bit_full_adder_X(3),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_Y(3),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_C(2),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_sum(3),
					 Emdad_MdShahid_03_02_2022_four_bit_full_adder_Cout);

end fouradder_structure;