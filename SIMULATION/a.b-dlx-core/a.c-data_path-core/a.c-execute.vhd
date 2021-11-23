Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;

use work.all;


entity execute is
generic (  DATA_SIZE : integer := 32);
port(  reset_execute  : in std_logic;
	   clk : std_logic;
       NPC_in_execute : in std_logic_vector(DATA_SIZE -1 downto 0);
	   A_in_execute : in std_logic_vector(DATA_SIZE -1 downto 0);
	   B_in_execute : in std_logic_vector(DATA_SIZE -1 downto 0);
	   IMM_in_execute : in std_logic_vector(DATA_SIZE -1 downto 0);
       RD_in_execute,RS2_in_execute :in std_logic_vector( 4 downto 0);
       FUNC_tbe     : in  aluOp;

       muxs1,muxs2        : in std_logic; 
	   reg2_execute       : in std_logic;

       branch_sel_execute : out std_logic;
	   alu_out_reg        : out std_logic_vector(DATA_SIZE -1 downto 0);
	   pre_memory_out     : out std_logic_vector(DATA_SIZE -1 downto 0); 
	   RD_execute_out,RS2_execute_out :out std_logic_vector( 4 downto 0));
       




end entity;

architecture beh of execute is 

component ALU is
  generic (NUM_BIT : integer := 32);
  port 	 ( FUNC: IN aluOp;
           DATA1, DATA2: IN std_logic_vector(NUM_BIT-1 downto 0);
		   NPC_IN : IN std_logic_vector(NUM_BIT-1 downto 0);

  		   SEL_BRANCH: OUT std_logic ;
           DATA_OUT: OUT std_logic_vector(NUM_BIT-1 downto 0));
end component;

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

signal out_mux1,out_mux2 : std_logic_vector(DATA_SIZE -1 downto 0);
signal out_branch, out_branch_2 : std_logic;
signal out_alu    : std_logic_vector(DATA_SIZE -1 downto 0);

begin

mux1: MUX21_GENERIC 
       generic map(32,0 ns)
       port map(A=>NPC_in_execute ,B=>A_in_execute,SEL=>muxs1,Y=>out_mux1);

mux2: MUX21_GENERIC 
       generic map(32,0 ns)
       port map(A=>B_in_execute ,B=>IMM_in_execute,SEL=>muxs2,Y=>out_mux2);

ALU_map : ALU
      generic map(32)
       port map(FUNC=>FUNC_TBE, DATA1=>out_mux1, DATA2=>out_mux2,NPC_IN=>NPC_in_execute, SEL_BRANCH=>out_branch,DATA_OUT=>out_alu);

branch_reg : FD_GEN 
   generic map (1)
   port map (CK=>clk,RESET=>reset_execute,D(0)=>out_branch,ENABLE=>'1',Q(0)=>branch_sel_execute);

alu_out :  FD_GEN 
   generic map (32)
   port map (CK=>clk,RESET=>reset_execute,D=>out_alu,ENABLE=>reg2_execute,Q=>alu_out_reg);

pre_imm:  FD_GEN 
   generic map (32)
   port map (CK=>clk,RESET=>reset_execute,D=>B_in_execute,ENABLE=>reg2_execute,Q=>pre_memory_out );

--RD
RD_DECODE:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_execute,D=>RD_in_execute,ENABLE=>reg2_execute,Q=>RD_execute_out);
--RS
RS2_DECODE:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_execute,D=>RS2_in_execute,ENABLE=>reg2_execute,Q=>RS2_execute_out);
end beh;





