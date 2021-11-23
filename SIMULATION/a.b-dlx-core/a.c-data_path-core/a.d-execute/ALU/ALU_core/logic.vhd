library IEEE;
use IEEE.std_logic_1164.all; 


entity logic is
    generic( NUM_BIT : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
     		B:	In	std_logic_vector(NUM_BIT-1 downto 0);
           
		   SEL: In	std_logic_vector(3 downto 0);
		    Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
end logic;

ARCHITECTURE str of logic is 
component NAND4_generic is
    generic( NUM_BIT : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
     		B:	In	std_logic_vector(NUM_BIT-1 downto 0);
            C:  In	std_logic_vector(NUM_BIT-1 downto 0);
			D:  In	std_logic_vector(NUM_BIT-1 downto 0);
		    Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
end component;

component NAND3_generic is
    generic( NUM_BIT : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
     		B:	In	std_logic_vector(NUM_BIT-1 downto 0);
			sel:In	std_logic_vector(NUM_BIT-1 downto 0);
		    Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
end component;

component IV_generic is
    generic( NUM_BIT  : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
		Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
end component;
type array_vector is array (3 downto 0) of std_logic_vector(NUM_BIT-1 downto 0);
signal not_A,not_B : std_logic_vector(NUM_BIT-1 downto 0);
signal s_res : array_vector;
signal nand_res : array_vector ;

begin
    
  s_gen : for i in 0 to 3 generate 
          s_res(i)<= (others=>SEL(i));
          end generate;

iv0 : IV_generic 
      generic map(NUM_BIT)
      port map(A=>A,Y=>not_A);

iv1 : IV_generic 
      generic map(NUM_BIT)
      port map(A=>B,Y=>not_B);

nand1 : NAND3_generic
      generic map(NUM_BIT)
      port map(A=>not_A,B=>not_B,sel=>s_res(0),Y=>nand_res(0));

nand2 : NAND3_generic
      generic map(NUM_BIT)
      port map(A=>not_A,B=>B,sel=>s_res(1),Y=>nand_res(1));
nand3 : NAND3_generic
      generic map(NUM_BIT)
      port map(A=>A,B=>not_B,sel=>s_res(2),Y=>nand_res(2));
nand4 : NAND3_generic
      generic map(NUM_BIT)
      port map(A=>A,B=>B,sel=>s_res(3),Y=>nand_res(3));

nand_final : NAND4_generic
      generic map(NUM_BIT)
      port map(A=>nand_res(0),B=>nand_res(1),C=>nand_res(2),D=>nand_res(3),Y=>Y);

end str;



