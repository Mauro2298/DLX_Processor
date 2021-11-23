 library IEEE;
use IEEE.std_logic_1164.all; 
--use WORK.constants.all;

entity FD_GEN is
        generic (NBIT : integer := 32);
	Port (	D:	In	std_logic_vector(NBIT-1 downto 0);
                ENABLE: In std_logic;
		CK:	In	std_logic;
		RESET:	In	std_logic;
		Q:	Out	std_logic_vector(NBIT-1 downto 0));
end FD_GEN;


architecture BEH1 of FD_GEN is -- flip flop D with syncronous reset

begin
	PSYNCH: process(CK,RESET)
	begin
	  if CK'event and CK='1' then -- positive edge triggered:
	    if RESET='0' then -- active high reset 
	      Q <= (others => '0'); 
	    else if ENABLE = '1' then
	      Q <= D; -- input is written on output
              end if;
	    end if;
	  end if;
	end process;

end BEH1;

