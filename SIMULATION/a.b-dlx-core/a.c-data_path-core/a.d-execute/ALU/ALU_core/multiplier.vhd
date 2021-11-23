library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity BOOTHMUL is
generic (NBIT : integer := 16);
port(
	A : in std_logic_vector(NBIT-1 downto 0);
	B : in std_logic_vector(NBIT-1 downto 0);
	P : out std_logic_vector(NBIT*2-1 downto 0)

);

end entity;


architecture beh of BOOTHMUL is

type SignalVectors is array (NBIT/2-1 downto 0) of std_logic_vector(2*NBIT-1 downto 0);
type SignalVectors_mux_in is array (NBIT*2-1 downto 0) of std_logic_vector(2*NBIT-1 downto 0);
type SignalVectors_enc is array (NBIT/2-1 downto 0) of std_logic_vector(2 downto 0);

component p4_adder is
generic (NBIT : integer := 32);
port(	A : in std_logic_vector(NBIT-1 downto 0);
		B : in std_logic_vector(NBIT-1 downto 0);
		Cin: in std_logic;
		S :	out	std_logic_vector(NBIT-1 downto 0);
		Cout : out std_logic
	);
end component;

component Encoder is
port(
B : in std_logic_vector(2 downto 0);
Output : out std_logic_vector(2 downto 0)
);
end component;

component mux5to1 is
generic (NBIT : integer := 32);
port( A : in std_logic_vector(NBIT-1 downto 0);
	  An : in std_logic_vector(NBIT-1 downto 0);
	  A2 : in std_logic_vector(NBIT-1 downto 0);
	  An2 : in std_logic_vector(NBIT-1 downto 0);
	  Zero : in std_logic_vector(NBIT-1 downto 0);
	  sel : in std_logic_vector(2 downto 0);
	  Output : out std_logic_vector(NBIT-1 downto 0)
	  
);
end component;

signal enc_out : SignalVectors_enc;
signal mux_out, sum_out : SignalVectors;
signal Zero: std_logic_vector(2*NBIT-1 downto 0);
signal Couts : std_logic_vector(NBIT/2-2 downto 0);
signal Cins : std_logic;
signal Input_mux: SignalVectors_mux_in;
signal first_enc : std_logic_vector(2 downto 0);
begin
Input_mux(0) <= std_logic_vector(resize(signed(A), 2*NBIT));
Input_mux(1) <= std_logic_vector(unsigned((not Input_mux(0))+1));
Zero<=(others => '0');
Cins <= '0';
first_enc <= B(1) & B(0) & '0';
enc_gen : for i in 0 to NBIT/2-1 generate
		enc_gen1 :if i = 0 generate	
		enc1 : Encoder
			port map (first_enc, enc_out(i));
		end generate;
		enc_gen2 :if i > 0 generate
		enc2 : Encoder
			port map (B(2*i+1 downto 2*i-1), enc_out(i));
		end generate;
end generate;


mux_gen : for i in 0 to NBIT/2-1 generate
		mux_gen1 :if i = 0 generate
		Input_mux(i+2) <= std_logic_vector(shift_left(unsigned(Input_mux(0)),1));
		Input_mux(i+3) <= std_logic_vector(shift_left(unsigned(Input_mux(1)),1)); 
		mux1 : mux5to1 	generic map (NBIT => NBIT*2)
				port map (Input_mux(i), Input_mux(i+1), Input_mux(i+2), Input_mux(i+3), Zero, enc_out(i), mux_out(i));
		end generate;
		mux_gen2 :if i > 0 generate
		Input_mux(i*4) <=std_logic_vector(shift_left(unsigned(Input_mux(i*4-2)),1));
		Input_mux(i*4+1)<=std_logic_vector(shift_left(unsigned(Input_mux(i*4-1)),1));
		Input_mux(i*4+2)<=std_logic_vector(shift_left(unsigned(Input_mux(i*4)),1));
		Input_mux(i*4+3)<=std_logic_vector(shift_left(unsigned(Input_mux(i*4+1)),1));			
		mux2 : 	mux5to1 generic map (NBIT => NBIT*2)
				port map (Input_mux(i*4), Input_mux(i*4+1), Input_mux(i*4+2), Input_mux(i*4+3), Zero, enc_out(i), mux_out(i));			
			
		end generate;
end generate;


sum_gen : for i in 0 to NBIT/2-2 generate
		sum_gen1 :if i = 0 generate
			sum1 : p4_adder generic map (NBIT => NBIT*2)
					port map (mux_out(i), mux_out(i+1), Cins, sum_out(i), Couts(i)); 
		end generate;
		sum_gen2 :if i > 0 generate
			sum2 : p4_adder generic map (NBIT => NBIT*2)
					port map (mux_out(i+1), sum_out(i-1), Cins, sum_out(i), Couts(i)); 
		end generate;

		end generate;
P <= sum_out(NBIT/2-2);                     

end beh;
