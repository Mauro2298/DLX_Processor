library IEEE;
use IEEE.std_logic_1164.all; 


entity NAND3_generic is
    generic( NUM_BIT : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
     		B:	In	std_logic_vector(NUM_BIT-1 downto 0);
			sel:In	std_logic_vector(NUM_BIT-1 downto 0);
		    Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
end NAND3_generic;


architecture BEHAVIORAL of NAND3_generic is

begin
	
	Y <= not ( A AND B AND sel);

end BEHAVIORAL;

