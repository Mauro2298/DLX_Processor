library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SUM_GENERATOR is
		generic (
			NBIT_PER_BLOCK: integer := 4;
			NBLOCKS:	integer := 8);
		port (
			A:	in	std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
			B:	in	std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
			Ci:	in	std_logic_vector(NBLOCKS-1 downto 0);
			S:	out	std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0));
end SUM_GENERATOR;

architecture Beh of SUM_GENERATOR is

component carryselectblock
	generic(NBIT : integer := 4);
	Port(
		S: Out std_logic_vector (NBIT-1 downto 0);
		Cin: In std_logic;
		A: in std_logic_vector(NBIT-1 downto 0);
		B: in std_logic_vector(NBIT-1 downto 0));
end component;

begin

BLOCKS : for i in 0 to NBLOCKS-1 generate
	CSB : carryselectblock
		generic map(NBIT => NBIT_PER_BLOCK)
		port map(A => A((i+3 + 3*i) downto (i*3+i)), B => B((i+3 + 3*i) downto (i*3+i)), Cin => Ci(i), S => S((i+3 + 3*i) downto (i*3+i)));
end generate;


end Beh;
