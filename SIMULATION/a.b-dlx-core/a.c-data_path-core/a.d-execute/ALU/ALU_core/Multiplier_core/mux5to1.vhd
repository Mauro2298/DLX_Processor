library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux5to1 is
generic (NBIT : integer := 32);
port( A : in std_logic_vector(NBIT-1 downto 0);
	  An : in std_logic_vector(NBIT-1 downto 0);
	  A2 : in std_logic_vector(NBIT-1 downto 0);
	  An2 : in std_logic_vector(NBIT-1 downto 0);
	  Zero : in std_logic_vector(NBIT-1 downto 0);
	  sel : in std_logic_vector(2 downto 0);
	  Output : out std_logic_vector(NBIT-1 downto 0)
	  
);


end entity;



architecture beh of mux5to1 is
begin

Output <= 	Zero when sel = "000" else
			A when sel = "001" else
			A2 when sel = "010" else
			An2 when sel = "011" else
			An when sel = "100";
			

end beh;
