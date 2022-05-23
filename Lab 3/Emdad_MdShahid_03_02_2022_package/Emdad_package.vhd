library ieee;
USE ieee.std_logic_vector.all;

package Emdad_package is

component Emdad
	port (Emdad_cin, Emdad_x, Emdad_y : in std_logic;
			Emdad_s, Emdad_cout			 : out std_logic);
end component;

end Emdad_package;