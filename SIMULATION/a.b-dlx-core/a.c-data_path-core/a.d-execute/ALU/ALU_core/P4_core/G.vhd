library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity GenerateBlock is
port( Prev_G : in std_logic;
 	  Current_G : in std_logic;
	  Current_P: in std_logic;
		Gen_Out: out std_logic);
end GenerateBlock;

architecture beh of GenerateBlock is

begin

Gen_Out <= Current_G or (Current_P and Prev_G);

end beh;
