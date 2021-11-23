library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Shifter is

	generic (NUM_BIT : integer := 32);
	port (
			A: in std_logic_vector(NUM_BIT-1 downto 0);
			B: in std_logic_vector(NUM_BIT-1 downto 0);
			SEL: in std_logic_vector(1 downto 0);
			Y: out std_logic_vector(NUM_BIT-1 downto 0) 
	);

end entity;


architecture Beh of Shifter is 

	begin
   process(A,B,SEL) 
    begin
	case SEL is
		when "00" => Y <= std_logic_vector(unsigned(A) sll to_integer(unsigned(B)));
		when "01" => Y <= std_logic_vector(unsigned(A) srl to_integer(unsigned(B)));
		when others => Y <= to_stdlogicvector(to_bitvector(A) sra to_integer(unsigned(B)));
   end case;
  end process;

end Beh;
