LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY Emdad_03_02_22_NBitLPMAddSub IS

PORT (  add_sub		: IN STD_LOGIC ;
	cin		: IN STD_LOGIC ;
	dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
	datab		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
	cout		: OUT STD_LOGIC ;
	overflow	: OUT STD_LOGIC ;
	result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END Emdad_03_02_22_NBitLPMAddSub;

ARCHITECTURE SYN OF Emdad_03_02_22_NBitLPMAddSub IS

	SIGNAL sub_wire0 : STD_LOGIC ;
	SIGNAL sub_wire1 : STD_LOGIC;
	SIGNAL sub_wire2 : STD_LOGIC_VECTOR (15 DOWNTO 0);

COMPONENT lpm_add_sub
	GENERIC ( 
		lpm_direction : STRING;
		lpm_hint : STRING;
		lpm_representation : STRING;
		lpm_type : STRING;
		lpm_width : NATURAL);

	PORT (  add_sub		: IN STD_LOGIC ;
		cin		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		cout		: OUT STD_LOGIC ;
		overflow	: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
	END COMPONENT;

BEGIN
	cout <= sub_wire0;
	overflow <= sub_wire1;
	result <= sub_wire2(15 DOWNTO 0);
	
	lpm_add_sub_component : lpm_add_sub
	GENERIC MAP (
		lpm_direction => "UNUSED",
		lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		lpm_representation => "UNSIGNED",
		lpm_type => "LPM_ADD_SUB",
		lpm_width => 16)

	PORT MAP (
		add_sub => add_sub,
		cin => cin,
		dataa => dataa,
		datab => datab,
		cout => sub_wire0,
		overflow => sub_wire1,
		result => sub_wire2 );
	END SYN;
	
