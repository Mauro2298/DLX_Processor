library ieee;
use ieee.std_logic_1164.all;

entity OR2_gen is
	generic (NUM_BIT : integer := 32);
	port (
			A : in std_logic_vector(NUM_BIT-1 downto 0);
			B : in std_logic_vector(NUM_BIT-1 downto 0);
			Y : out std_logic_vector(NUM_BIT-1 downto 0)
	);
end entity;


architecture Beh of OR2_gen is
	begin
		Y <= A or B;
end Beh;

