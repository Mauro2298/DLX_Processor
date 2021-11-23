library IEEE;
use IEEE.std_logic_1164.all; 


entity IV_generic is
    generic( NUM_BIT : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
		   Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
end entity;


architecture BEHAVIORAL of IV_generic is

begin
	
	Y <= not(A);

end BEHAVIORAL;

