library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;
use ieee.numeric_std.all;
use work.all;

entity tb is 
end entity;


architecture beh of tb is 
component dlx is
	generic ( ADDR_SIZE 	: integer := 32;			
		  DATA_SIZE 	: integer := 32);  
	port    (
		  CLK     		: in std_logic;
		  RESET    		: in std_logic
	    );

end component;


signal   clk  : std_logic :='0';
signal  reset : std_logic :='0';

begin 

map_port : dlx
           generic map(32,32)
		   port map(CLK=>clk,RESET=>reset);

clk<= not(clk) after 200 ns ; 

reset<= '1' after  400 ns;

end beh;


