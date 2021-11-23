library ieee;
use ieee.std_logic_1164.all;

entity Comparator is
	generic (NUM_BIT : integer := 32);
	port (
				Sum : in std_logic_vector(NUM_BIT-1 downto 0);
				Cout: in std_logic;
				EQ: out std_logic;
				NE: out std_logic;
				LE: out std_logic;
				GE: out std_logic;
				GT: out std_logic;
				LT: out std_logic
	);
end entity;


architecture Struct of Comparator is

	component OR2_gen is
		generic (NUM_BIT : integer := 32);
		port (
				A : in std_logic_vector(NUM_BIT-1 downto 0);
				B : in std_logic_vector(NUM_BIT-1 downto 0);
				Y : out std_logic_vector(NUM_BIT-1 downto 0)
		);
	end component;
	
	component AND2_gen is
		generic (NUM_BIT : integer := 32);
		port (
				A : in std_logic_vector(NUM_BIT-1 downto 0);
				B : in std_logic_vector(NUM_BIT-1 downto 0);
				Y : out std_logic_vector(NUM_BIT-1 downto 0)
		);
	end component;

	component IV_generic is
    generic( NUM_BIT : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
		   Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
	end component;

	component OR_Zero_Det is
	generic (NUM_BIT : integer := 32);
	port (
			A : in std_logic_vector(NUM_BIT-1 downto 0);
			Y : out std_logic
	);
	end component;
	
	signal Cout_Inv, Zero_Det, Zero_Det_Inv : std_logic;
	
	begin
	Inv1 : 	IV_generic
			generic map(1)
			port map(A(0) => Cout, Y(0) => Cout_Inv);

	LT <= Cout_Inv;	

	ZD:		OR_Zero_Det
			generic map (NUM_BIT)
			port map(A => Sum, Y => Zero_Det);
	
	EQ <= Zero_Det;
    NE<= NOT(Zero_Det);
	
	OR_LE: 	OR2_gen
			generic map(1)
			port map(A(0) => Zero_Det, B(0) => Cout_Inv, Y(0)=> LE);

	Inv2: 	IV_generic
			generic map(1)
			port map(A(0) => Zero_Det, Y(0) => Zero_Det_Inv); 

	AND_GT: AND2_gen
			generic map(1)
			port map(A(0) => Cout, B(0) => Zero_Det_Inv, Y(0) => GT);
	
	GE <= Cout; 
			

end Struct;














