library IEEE;
use IEEE.std_logic_1164.all; 


entity NAND4_generic is
    generic( NUM_BIT : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
     		B:	In	std_logic_vector(NUM_BIT-1 downto 0);
            C:  In	std_logic_vector(NUM_BIT-1 downto 0);
			D:  In	std_logic_vector(NUM_BIT-1 downto 0);
		    Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
end NAND4_generic;


architecture BEHAVIORAL of NAND4_generic is

begin
	
	Y <= not ( A AND B AND C AND D);

end BEHAVIORAL;

