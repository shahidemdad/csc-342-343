library ieee; 
use ieee.std_logic_1164.all; 

entity emdad_equal is 
	port (emdad_RS, emdad_RT	: in std_logic_vector (31 downto 0); 
	      emdad_OP					: in std_logic_vector (5 downto 0); 
	      emdad_Cond 				: out std_logic);
end emdad_equal;

architecture arch of emdad_equal is 

component emdad_1Bit_Comparator port(
	     emdad_I0, emdad_Il : in std_logic; 
	     emdad_Equal 			: out std_logic;
	     emdad_NotEqual 		: out std_logic);
end component; 

signal emdad_eq, emdad_neq : std_logic_vector (31 downto 0); 
BEGIN
	F1: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (0), emdad_Il => emdad_RT (0), 
	emdad_Equal => emdad_eq (0), emdad_NotEqual => emdad_neq (0));
	F2: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (1), emdad_Il => emdad_RT (1), 
	emdad_Equal => emdad_eq (1), emdad_NotEqual => emdad_neq (1));
	F3: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (2), emdad_Il => emdad_RT (2), 
	emdad_Equal => emdad_eq (2), emdad_NotEqual => emdad_neq (2));
	F4: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (3), emdad_Il => emdad_RT (3), 
	emdad_Equal => emdad_eq (3), emdad_NotEqual => emdad_neq (3));
	F5: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (4), emdad_Il => emdad_RT (4), 
	emdad_Equal => emdad_eq (4), emdad_NotEqual => emdad_neq (4));
	F6: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (5), emdad_Il => emdad_RT (5), 
	emdad_Equal => emdad_eq (5), emdad_NotEqual => emdad_neq (5));
	F7: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (6), emdad_Il => emdad_RT (6), 
	emdad_Equal => emdad_eq (6), emdad_NotEqual => emdad_neq (6));
	F8: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (7), emdad_Il => emdad_RT (7), 
	emdad_Equal => emdad_eq (7), emdad_NotEqual => emdad_neq (7));
	F9: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (8), emdad_Il => emdad_RT (8),
	emdad_Equal => emdad_eq (8), emdad_NotEqual => emdad_neq (8));
	F10: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (9), emdad_Il => emdad_RT (9), 
	emdad_Equal => emdad_eq (9), emdad_NotEqual => emdad_neq (9));
	F11: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (10), emdad_Il => emdad_RT (10), 
	emdad_Equal => emdad_eq (10), emdad_NotEqual => emdad_neq (10));
	F12: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (11), emdad_Il => emdad_RT (11), 
	emdad_Equal => emdad_eq (11), emdad_NotEqual => emdad_neq (11));
	F13: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (12), emdad_Il => emdad_RT (12), 
	emdad_Equal => emdad_eq (12), emdad_NotEqual => emdad_neq (12));
	F14: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (13), emdad_Il => emdad_RT (13), 
	emdad_Equal => emdad_eq (13), emdad_NotEqual => emdad_neq (13));
	F15: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (14), emdad_Il => emdad_RT (14), 
	emdad_Equal => emdad_eq (14), emdad_NotEqual => emdad_neq (14));
	F16: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (15), emdad_Il => emdad_RT (15), 
	emdad_Equal => emdad_eq (15), emdad_NotEqual => emdad_neq (15));
	F17: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (16), emdad_Il => emdad_RT (16), 
	emdad_Equal => emdad_eq (16), emdad_NotEqual => emdad_neq (16));
	F18: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (17), emdad_Il => emdad_RT (17), 
	emdad_Equal => emdad_eq (17), emdad_NotEqual => emdad_neq (17));
	F20: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (18), emdad_Il => emdad_RT (18), 
	emdad_Equal => emdad_eq (18), emdad_NotEqual => emdad_neq (18));
	F19: emdad_1bit_Comparator port map (emdad_I0 => emdad_RS (19), emdad_Il => emdad_RT (19), 
	emdad_Equal => emdad_eq (19), emdad_NotEqual => emdad_neq (19));
	F21: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (20), emdad_Il => emdad_RT (20), 
	emdad_Equal => emdad_eq (20), emdad_NotEqual => emdad_neq (20));
	F22: emdad_1bit_Comparator port map (emdad_I0 => emdad_RS (21), emdad_Il => emdad_RT (21), 
	emdad_Equal => emdad_eq (21), emdad_NotEqual => emdad_neq (21));
	F23: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (22), emdad_Il => emdad_RT (22), 
	emdad_Equal => emdad_eq (22), emdad_NotEqual => emdad_neq (22));
	F24: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (23), emdad_Il => emdad_RT (23), 
	emdad_Equal => emdad_eq (23), emdad_NotEqual => emdad_neq (23));
	F25: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (24), emdad_Il => emdad_RT (24), 
	emdad_Equal => emdad_eq (24), emdad_NotEqual => emdad_neq (24));
	F26: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (25), emdad_Il => emdad_RT (25),
	emdad_Equal => emdad_eq (25), emdad_NotEqual => emdad_neq (25));
	F27: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (26), emdad_Il => emdad_RT (26), 
	emdad_Equal => emdad_eq (26), emdad_NotEqual => emdad_neq (26));
	F28: emdad_1Bit_comparator port map (emdad_I0 => emdad_rs (27), emdad_Il => emdad_RT (27), 
	emdad_Equal => emdad_eq (27), emdad_NotEqual => emdad_neq (27));
	F29: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (28), emdad_Il => emdad_RT (28), 
	emdad_Equal => emdad_eq (28), emdad_NotEqual => emdad_neq (28));
	F30: emdad_1Bit_comparator port map (emdad_I0 => emdad_RS (29), emdad_Il => emdad_RT (29), 
	emdad_Equal => emdad_eq (29), emdad_NotEqual => emdad_neq (29));
	F31: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (30), emdad_Il => emdad_RT (30), 
	emdad_Equal => emdad_eq (30), emdad_NotEqual => emdad_neq (30));
	F32: emdad_1Bit_Comparator port map (emdad_I0 => emdad_RS (31), emdad_Il => emdad_RT (31), 
	emdad_Equal => emdad_eq (31), emdad_NotEqual => emdad_neq (31));

emdad_cond <= (emdad_eq (0) and emdad_eq (1) and emdad_eq (2) and emdad_eq (3) and emdad_eq (4) 
and emdad_eq (5) and emdad_eq (6) and emdad_eq (7) and emdad_eq (8) and emdad_eq (9) and emdad_eq (10) 
and emdad_eq (11) and emdad_eq (12) and emdad_eq (13) and emdad_eq (14) and emdad_eq (15) and emdad_eq (16) 
and emdad_eq (17) and emdad_eq (18) and emdad_eq (19) and emdad_eq (20) and emdad_eq (21) and emdad_eq (22) 
and emdad_eq (23) and emdad_eq (24) and emdad_eq (25) and emdad_eq (26) and emdad_eq (27) and emdad_eq (28)
and emdad_eq (29) and emdad_eq (30) and emdad_eq (31)) WHEN emdad_OP = "000100"
ELSE (emdad_neq (0) or emdad_neq (1) or emdad_neq (2) or emdad_neq (3) or emdad_neq (4) or emdad_neq (5) 
or emdad_neq (6) or emdad_neq (7) or emdad_neq (8) or emdad_neq (9) or emdad_neq (10) or emdad_neq (11) 
or emdad_neq (12) or emdad_neq (13) or emdad_neq (14) or emdad_neq (15) or emdad_neq (16) 
or emdad_neq (17) or emdad_neq (18) or emdad_neq (19) or emdad_neq (20) or emdad_neq (21) 
or emdad_neq (22) or emdad_neq (23) or emdad_neq (24) or emdad_neq (25) or emdad_neq (26) 
or emdad_neq (27) or emdad_neq (28) or emdad_neq (29) or emdad_neq (30) 
or emdad_neq (31)) WHEN emdad_OP = "000101"; 

end arch;