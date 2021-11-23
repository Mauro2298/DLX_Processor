library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity PropagateGenerateBlock is
port( Prev_G : in std_logic;
	  Prev_P : in std_logic;
 	  Current_G : in std_logic;
	  Current_P: in std_logic;
	  P_Out: out std_logic;
		Gen_Out: out std_logic);
end PropagateGenerateBlock;

architecture beh of PropagateGenerateBlock is

begin

Gen_Out <= Current_G or (Current_P and Prev_G);
P_Out <= Prev_P and Current_P;

end beh;
