-- memory

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity memory is
	generic ( N : positive := 8;
			  M : positive := 10 );
	port (
	ADDRESS : IN UNSIGNED ( M - 1 downto 0);
	DATA_IN : IN STD_LOGIC_VECTOR ( N - 1 downto 0);
	DATA_OUT : OUT STD_LOGIC_VECTOR ( N - 1 downto 0);
	RD_WRN,CLOCK, CS,RESET : IN STD_LOGIC
	);
end memory;
	
	
	architecture beh of memory is
type MEM_ARRAY is array (0 to 2*M-1) of STD_LOGIC_VECTOR(N-1 downto 0);
signal MEM: MEM_ARRAY;
begin
memory_beh: process (CLOCK) is
begin--
    
	if CLOCK'event and CLOCK = '1' then
        if RESET ='0' then 
 			MEM <= (OTHERS => (OTHERS => '0'));
        end if;
		if CS = '1' then
			if RD_WRN = '0' then
				MEM (to_integer(ADDRESS)) <= DATA_IN;
			else
				DATA_OUT <= MEM(to_integer(ADDRESS));
			end if;
		end if;
	end if;
	end process;
	end beh;

		
	


