library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity p4_adder is
generic (NBIT : integer := 32);
port(	A : in std_logic_vector(NBIT-1 downto 0);
		B : in std_logic_vector(NBIT-1 downto 0);
		Cin: in std_logic;
		S :	out	std_logic_vector(NBIT-1 downto 0);
		Cout : out std_logic
	);
end p4_adder;

architecture beh of p4_adder is

component SUM_GENERATOR is
		generic (
			NBIT_PER_BLOCK: integer := 4;
			NBLOCKS:	integer := 8);
		port (
			A:	in	std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
			B:	in	std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
			Ci:	in	std_logic_vector(NBLOCKS-1 downto 0);
			S:	out	std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0));
end component;

component CarryGeneratorBlock is
generic (NBIT : integer := 32);
port(	A : in std_logic_vector(NBIT-1 downto 0);
		B : in std_logic_vector(NBIT-1 downto 0);
		Cin: in std_logic;
		Cout : out std_logic_vector(NBIT/4-1 downto 0);
		Cout_P4_adder : out std_logic
	);
end component;
signal cout_sig : std_logic_vector(NBIT/4-1 downto 0);

begin 

carry_gen : CarryGeneratorBlock 
           generic map(NBIT=>NBIT)
           Port Map (A=>A,B=>B,Cin=>Cin,Cout=>cout_sig, Cout_P4_adder => Cout);


sum_gen : SUM_GENERATOR 
           generic map (NBIT_PER_BLOCK=>4,NBLOCKS=>8)
           Port Map (A=>A,B=>B,Ci=>cout_sig,S=>S);


end beh;
