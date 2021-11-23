library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Encoder is
port(
B : in std_logic_vector(2 downto 0);
Output : out std_logic_vector(2 downto 0)
	
);


end entity;


architecture beh of Encoder is

begin

Output <= 	"000" when (B = "000" or B = "111") else --Zero
			"001" when (B = "001"  or B = "010") else --A 
			"010" when B = "011" else --2A
			"011" when B = "100" else -- -2A
			"100" when (B = "101" or B = "110"); -- -A


end beh;
