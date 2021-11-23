library IEEE;
use IEEE.std_logic_1164.all;

entity MUX21_GENERIC is
  generic (NBIT : integer := 32;
           DELAY_MUX: Time := 0 ns);
  Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
  

end MUX21_GENERIC;

architecture BEHAVIORAL of MUX21_GENERIC is
  signal tmp: std_logic_vector(NBIT-1 downto 0);
begin
  tmp <= A when SEL = '0' else B;
  Y <= tmp after DELAY_MUX;

end BEHAVIORAL;



