library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity carryselectblock is
	generic(NBIT : integer := 4);
	Port(
		S: Out std_logic_vector (NBIT-1 downto 0);
		Cin: In std_logic;
		A: in std_logic_vector(NBIT-1 downto 0);
		B: in std_logic_vector(NBIT-1 downto 0));

	
end carryselectblock;

architecture Beh of carryselectblock is

component rca_gen 
generic (
			NBIT : integer := 4;
            DRCAS : 	Time := 0 ns;
	        DRCAC : 	Time := 0 ns);
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0);
		B:	In	std_logic_vector(NBIT-1 downto 0);
		Ci:	In	std_logic;
		S:	Out	std_logic_vector(NBIT-1 downto 0);
        OVF:    Out     std_logic;
		Co:	Out	std_logic);
end component; 

component MUX21_GENERIC 
  generic (NBIT : integer := 32;
           DELAY_MUX: Time := 0 ns);
  Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
  

end component;
signal S0, S1 : std_logic_vector(NBIT-1 downto 0);
signal Co0, Co1, OVF0, OVF1 : std_logic;
begin

	RCA_0 : rca_gen
		generic map(NBIT => NBIT, DRCAS => 0 ns, DRCAC => 0 ns)
		port map(A => A, B => B, Ci => '0', S => S0, OVF => OVF0, Co => Co0);
	RCA_1 : rca_gen
		generic map(NBIT => NBIT, DRCAS => 0 ns, DRCAC => 0 ns)
		port map(A => A, B => B, Ci => '1', S => S1, OVF => OVF1, Co => Co1);
	MUX : MUX21_GENERIC
		generic map (NBIT => NBIT, DELAY_MUX => 0 ns)
		port map(A => S0, B => S1, SEL => Cin, Y => S);
	
	



end Beh;
