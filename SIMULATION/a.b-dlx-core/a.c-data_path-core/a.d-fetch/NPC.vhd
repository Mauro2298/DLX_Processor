library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
--use IEEE.math_real.all;
use WORK.Types.all;


entity NPC is 
  generic ( DATA_SIZE : integer :=32 );
  port ( NPC_in : in std_logic_vector(DATA_SIZE-1 downto 0);
		 NPC_enable : in std_logic;
	     NPC_out: out std_logic_vector(DATA_SIZE-1 downto 0)
       );
end entity;


architecture beh of NPC is 
signal NPC_temp : std_logic_vector(DATA_SIZE-1 downto 0):="11111111111111111111111111111100";
begin 


NPC_proc:process(NPC_in,NPC_enable)
		 begin 
         if NPC_enable ='1' then 
		NPC_temp<=NPC_in + std_logic_vector(to_unsigned(4,32));
         end if;
end process;

NPC_out<=NPC_temp;

end beh;
		

		 
         
		 
