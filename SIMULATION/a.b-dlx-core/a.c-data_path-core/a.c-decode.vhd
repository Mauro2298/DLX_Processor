library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;
use ieee.numeric_std.all;
use work.all;

entity decode is
generic ( DATA_SIZE : integer := 32);
port ( clk : in std_logic;
	   reset_decode: in std_logic;
	   NPC_in_decode :in std_logic_vector(DATA_SIZE -1 downto 0);
	   RS1_in_decode,RS2_in_decode:  in   std_logic_vector(4 downto 0);
	   pre_immA_in_decode,pre_immB_in_decode :in std_logic_vector(DATA_SIZE -1 downto 0);
	   RD_delay_in_decode,RS2_delay_in_decode :in std_logic_vector( 4 downto 0);
       RF_data_in  : in std_logic_vector(DATA_SIZE -1 downto 0);
	   RF_ADD_WR   : in std_logic_vector( 4 downto 0);

       Jump_25     : in std_logic;
	   reg1_decode : in std_logic;
       RF_enable   : in std_logic;
	   RF_RS1      : in std_logic;
	   RF_RS2      : in std_logic;
       RF_WR_RDneg : in std_logic;



	  
       NPC_decode_out : out std_logic_vector(DATA_SIZE -1 downto 0);
	   A_decode_out : out std_logic_vector(DATA_SIZE -1 downto 0);
	   B_decode_out : out std_logic_vector(DATA_SIZE -1 downto 0);
	   IMM_decode_out : out std_logic_vector(DATA_SIZE -1 downto 0);
       RD_decode_out,RS2_decode_out :out std_logic_vector( 4 downto 0));

end entity;


architecture beh of decode is

component FD_GEN is
        generic (NBIT : integer := 32);
	Port (	D:	In	std_logic_vector(NBIT-1 downto 0);
                ENABLE: In std_logic;
		CK:	In	std_logic;
		RESET:	In	std_logic;
		Q:	Out	std_logic_vector(NBIT-1 downto 0));
end component;

component MUX21_GENERIC is
  generic (NBIT : integer := 32;
           DELAY_MUX: Time := 0 ns);
  Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
  

end component;

component register_file is
generic ( N : integer := 64;
		M : integer := 5
);
 port ( CLK: 		IN std_logic;
         RESET: 	IN std_logic;
	 ENABLE: 	IN std_logic;
	 RD1: 		IN std_logic;
	 RD2: 		IN std_logic;
	 WR: 		IN std_logic;
	 ADD_WR: 	IN std_logic_vector(M-1 downto 0);
	 ADD_RD1: 	IN std_logic_vector(M-1 downto 0);
	 ADD_RD2: 	IN std_logic_vector(M-1 downto 0);
	 DATAIN: 	IN std_logic_vector(N-1 downto 0);
     OUT1: 		OUT std_logic_vector(N-1 downto 0);
	 OUT2: 		OUT std_logic_vector(N-1 downto 0));
end component;

signal in_A,in_B,out_mux_imm : std_logic_vector(DATA_SIZE -1 downto 0);


begin

RF_map : register_file 
         generic map(32,5)
         port map(CLK=>clk,RESET=>reset_decode,ENABLE=>RF_enable,RD1=>RF_RS1,RD2=>RF_RS2,WR=>RF_WR_RDneg,ADD_WR=> RF_ADD_WR ,DATAIN=> RF_data_in,ADD_RD1=>RS1_in_decode,ADD_RD2=>RS2_in_decode,OUT1=>in_A,OUT2=>in_B);

--NPC
FF_NPC: FD_GEN 
   generic map (32)
   port map (CK=>clk,RESET=>reset_decode,D=>NPC_in_decode,ENABLE=>reg1_decode,Q=> NPC_decode_out);

   
--FFA
FF_A:FD_GEN 
   generic map (32)
   port map (CK=>clk,RESET=>reset_decode,D=>in_A,ENABLE=>reg1_decode,Q=> A_decode_out);
--FFB
FF_B:FD_GEN 
   generic map (32)
   port map (CK=>clk,RESET=>reset_decode,D=>in_B,ENABLE=>reg1_decode,Q=> B_decode_out);

MUX_FF : MUX21_GENERIC 
       generic map(32,0 ns)
       port map(A=>pre_immA_in_decode,B=>pre_immB_in_decode,SEL=>Jump_25,Y=>out_mux_imm);
--FF IMM
FF_IMM: FD_GEN 
   generic map (32)
   port map (CK=>clk,RESET=>reset_decode,D=>out_mux_imm,ENABLE=>reg1_decode,Q=> IMM_decode_out);
--RD
RD_DECODE:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_decode,D=> RD_delay_in_decode,ENABLE=>reg1_decode,Q=>RD_decode_out);
--RS
RS2_DECODE:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_decode,D=>RS2_delay_in_decode,ENABLE=>reg1_decode,Q=>RS2_decode_out);




end beh;






