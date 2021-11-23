Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;

use work.all;

entity fetch is 
  generic ( DATA_SIZE : integer := 32);
  port    ( reset_fetch:in std_logic;
			clk :       in std_logic;
			PC_in_fetch:in std_logic_vector(DATA_SIZE -1 downto 0);
		
			
			pre_immediate_enable:in std_logic;
			NPC_enable_fetch    :in std_logic;
			PC_enable_fetch     :in std_logic;
			
			NPC_out_fetch : out   std_logic_vector(DATA_SIZE -1 downto 0);
			RS1,RS2       :  out    std_logic_vector(4 downto 0);
			out_pre_immA,out_pre_immB :out std_logic_vector(DATA_SIZE -1 downto 0);
			RD_fetch_out,RS2_fetch_out,RS1_fetch_out :out std_logic_vector( 4 downto 0);

			IR_out        : out std_logic_vector(DATA_SIZE - 1 downto 0));
         
end entity;


architecture beh of fetch is 

component NPC is 
  generic ( DATA_SIZE : integer :=32 );
  port ( NPC_in : in std_logic_vector(DATA_SIZE-1 downto 0);
		 NPC_enable : in std_logic;
	     NPC_out: out std_logic_vector(DATA_SIZE-1 downto 0)
       );
end component;

component FD_GEN is
        generic (NBIT : integer := 32);
	Port (	D:	In	std_logic_vector(NBIT-1 downto 0);
                ENABLE: In std_logic;
		CK:	In	std_logic;
		RESET:	In	std_logic;
		Q:	Out	std_logic_vector(NBIT-1 downto 0));
end component;

component IR is
	generic (
		RAM_SIZE	: integer := 100;								-- IRAM size (in words)
		I_SIZE		: integer := 32					-- IRAM word size (in bits)
	);
	port (
		Rst 		: in  std_logic;								-- Reset (active-low)
		Addr		: in  std_logic_vector(I_SIZE - 1 downto 0);
		Dout		: out std_logic_vector(I_SIZE - 1 downto 0)
	);
end component;

component MUX21_GENERIC is
  generic (NBIT : integer := 32;
           DELAY_MUX: Time := 0 ns);
  Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
  

end component;

signal  temp1,temp1_neg,temp2,temp2_neg: std_logic_vector(DATA_SIZE -1  downto 0);
signal  muxsign1_out,muxsign2_out       :std_logic_vector(DATA_SIZE -1  downto 0);

signal  NPC_out,PC_out					:std_logic_vector(DATA_SIZE -1  downto 0);
signal  IR_out_signal 							:std_logic_vector(DATA_SIZE -1  downto 0);
signal RD,RS2_temp, RS1_temp                      :std_logic_vector(4  downto 0);
signal IMMEDIATE                        :std_logic_vector(15 downto 0);
signal IMMEDIATE_JUMP                   :std_logic_vector(25 downto 0);          

begin
   
-- data dispatch 
  RS1<=IR_out_signal(25 downto 21);
  RS1_temp<=IR_out_signal(25 downto 21);
  RS2_temp<=IR_out_signal(20 downto 16);
  RS2<= IR_out_signal(20 downto 16);
  RD <=IR_out_signal(15 downto 11);
  IMMEDIATE<=IR_out_signal(15 downto 0);
  IMMEDIATE_JUMP<=IR_out_signal(25 downto 0);

	temp1    <="0000000000000000" & IMMEDIATE; -- positive immediate  25 bit for the jump 
	temp1_neg<="1111111111111111" & IMMEDIATE; -- negative immediate  25 bit for the jump 
	temp2    <="000000" & IMMEDIATE_JUMP;      -- positive immediate  16 bit for the jump 
	temp2_neg<="111111" & IMMEDIATE_JUMP;      -- negative immediate  16 bit for the jump 

--mux to distinguish the sign 16 bit
mux_sign1: MUX21_GENERIC 
       generic map(32,0 ns)
       port map(A=>temp1,B=>temp1_neg,SEL=>IMMEDIATE(15),Y=>muxsign1_out);
--mux to distinguish the sign 26 bit
mux_sign2: MUX21_GENERIC 
       generic map(32,0 ns)
       port map(A=>temp2,B=>temp2_neg,SEL=>IMMEDIATE_JUMP(25),Y=>muxsign2_out);

pre_immA : FD_GEN --16
   generic map (32)
   port map (CK=>clk,RESET=>reset_fetch,D=>muxsign1_out,ENABLE=>pre_immediate_enable ,Q=>out_pre_immA);

pre_immB : FD_GEN --25
   generic map (32)
   port map (CK=>clk,RESET=>reset_fetch,D=>muxsign2_out,ENABLE=>pre_immediate_enable ,Q=>out_pre_immB);

--IRAM
IRAM_MAP : IR 
   generic map(100,32)
   port map(Rst=>reset_fetch,Addr=>PC_out,Dout=>IR_out_signal);

IR_out<=IR_out_signal;

--PC 
PC : FD_GEN 
   generic map (32)
   port map (CK=>clk,RESET=>reset_fetch,D=>PC_in_fetch,ENABLE=>PC_enable_fetch,Q=>PC_out);
--NPC
NPC_map : NPC
   generic map (32)
   port map (NPC_in=>PC_out,NPC_enable=>NPC_enable_fetch,NPC_out=>NPC_out_fetch);
   

RD_FETCH:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_fetch,D=>RD,ENABLE=>pre_immediate_enable,Q=>RD_fetch_out);
RS2_FETCH:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_fetch,D=>RS2_temp,ENABLE=>pre_immediate_enable,Q=>RS2_fetch_out);
RS1_FETCH:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_fetch,D=>RS1_temp,ENABLE=>pre_immediate_enable,Q=>RS1_fetch_out);
end beh;





