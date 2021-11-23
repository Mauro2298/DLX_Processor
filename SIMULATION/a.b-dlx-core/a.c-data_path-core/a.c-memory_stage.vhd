library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;
use ieee.numeric_std.all;
use work.all;

entity memory_stage is 
generic ( DATA_SIZE : integer := 32);
port(  
	   clk, reset_mem : in std_logic;
	   branch_sel_in_mem    : in std_logic;
	   alu_out_reg_in_mem : in  std_logic_vector(DATA_SIZE -1 downto 0);
	   pre_memory_in_mem    : in  std_logic_vector(DATA_SIZE -1 downto 0); 
	   RD_in_mem,RS2_in_mem :in  std_logic_vector( 4 downto 0);
	   NPC_in_mem :in std_logic_vector(DATA_SIZE -1 downto 0);
   
       reg3_mem             : in std_logic;
       CS_mem               : in std_logic;
       RD_WRN_mem           : in std_logic;
	   MUX_PC_mem			: in std_logic;

	   alu_out_reg_mem_out  : out std_logic_vector(DATA_SIZE -1 downto 0);
       data_out_mem         : out  std_logic_vector(DATA_SIZE -1 downto 0); 
	   NPC_mem_out :out std_logic_vector(DATA_SIZE -1 downto 0);
       RD_mem_out,RS2_mem_out : out std_logic_vector( 4 downto 0));
end entity;
		




architecture beh of memory_stage is

 component MUX21_GENERIC is
  generic (NBIT : integer := 32;
           DELAY_MUX: Time := 0 ns);
  Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
  

end component;
component FD_GEN is
        generic (NBIT : integer := 32);
	Port (	D:	In	std_logic_vector(NBIT-1 downto 0);
                ENABLE: In std_logic;
		CK:	In	std_logic;
		RESET:	In	std_logic;
		Q:	Out	std_logic_vector(NBIT-1 downto 0));
end component;

component  memory is
	generic ( N : positive := 8;
			  M : positive := 10 );
	port (
	ADDRESS : IN UNSIGNED ( M - 1 downto 0);
	DATA_IN : IN STD_LOGIC_VECTOR ( N - 1 downto 0);
	DATA_OUT : OUT STD_LOGIC_VECTOR ( N - 1 downto 0);
	RD_WRN,CLOCK, CS,RESET : IN STD_LOGIC
	);
end component;
signal Mux_Sel_out: std_logic;
signal alu_out_reg_mem_out_signal : std_logic_vector(DATA_SIZE-1 downto 0);

begin

mem : memory --0 => write, 1=> read
      generic map (32,32)
      port map(ADDRESS=> unsigned(alu_out_reg_in_mem) ,DATA_IN=>pre_memory_in_mem,DATA_OUT=>data_out_mem,RD_WRN=>RD_WRN_mem,CLOCK=>clk, CS=> CS_mem,RESET=>reset_mem);

out_alu_mem :  FD_GEN 
   generic map (32)
   port map (CK=>clk,RESET=>reset_mem,D=>alu_out_reg_in_mem,ENABLE=>reg3_mem,Q=>alu_out_reg_mem_out_signal);

alu_out_reg_mem_out<=alu_out_reg_mem_out_signal;
--RD
RD_DECODE:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_mem,D=> RD_in_mem,ENABLE=> reg3_mem,Q=>RD_mem_out);
--RS
RS2_DECODE:FD_GEN 
   generic map (5)
   port map (CK=>clk,RESET=>reset_mem,D=> RS2_in_mem,ENABLE=> reg3_mem,Q=>RS2_mem_out);

mux_SEL: MUX21_GENERIC generic map(1, 0 ns)
					port map(A(0) =>'0', B(0)=>branch_sel_in_mem, SEL => MUX_PC_mem, Y(0)=> Mux_Sel_out);

mux_BRANCH: MUX21_GENERIC generic map(32, 0 ns)
					port map(A =>NPC_in_mem, B=>alu_out_reg_in_mem, SEL => Mux_Sel_out, Y=> NPC_mem_out);



end beh;


