library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;
use ieee.numeric_std.all;


entity data_path is
generic ( DATA_SIZE : integer := 32);
port( clk : in std_logic;
	  reset : in std_logic;
  	  DP_FUNC : in aluOp;
--- FETCH 
	  DP_PC_enable : in std_logic;
	  DP_NPC_enable: in std_logic;
	  DP_pre_IMMM_enable : in std_logic;
--- DECODE
	  DP_Jump_25	   : in std_logic;
      DP_reg1_enable   : in std_logic;
	  DP_RF_enable     : in std_logic;
	  DP_RF_RS1        : in std_logic;
	  DP_RF_RS2        : in std_logic;
	  DP_RF_WR_RDneg   : in std_logic;
--- EXECUTE 
      DP_muxs1         : in std_logic;
	  DP_muxs2   	   : in std_logic;
      DP_reg2          : in std_logic;
--- MEMORY STAGE 
	  DP_CS            : in std_logic;
	  DP_RD_WRN_mem    : in std_logic;
	  DP_reg3		   : in std_logic;
	  DP_MUX_PC_mem    : in std_logic;
--- WRITE BACK
	  DP_muxs3          : in std_logic;
	  DP_MUX_RD_WR_sel  : in std_logic;
	  DP_MUX_RS2_WR_sel : in std_logic;

--out DP
	  out_branch		: out std_logic;
	  out_bubble        : out std_logic;
	  out_IR_fetch      : out std_logic_vector(DATA_SIZE - 1 downto 0)
    );
end entity;


architecture beh of data_path is 

component fetch is 
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
         
end component;

component decode is
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

end component;

component execute is
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
       




end component;

component memory_stage is 
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
end component;

component WB is
generic ( DATA_SIZE : integer := 32);
port(
		data_in_WB           : in  std_logic_vector(DATA_SIZE -1 downto 0); 
		alu_out_in_WB		 : in  std_logic_vector(DATA_SIZE -1 downto 0); 
		RD_in_WB,RS2_in_WB   : in  std_logic_vector(4 downto 0);
		
		muxs3, MUX_RS2_WR_sel, MUX_RD_WR_sel		 : in std_logic;
		out_MUX_WR : out std_logic_vector(4 downto 0);
		muxs3_out_WB : out std_logic_vector(DATA_SIZE -1 downto 0)
);
end component;

component hazard_detection_unit is
	port( RST         : in std_logic;
		  CLK         : in std_logic;
		  ADD_RS1     : in std_logic_vector(4 downto 0); 
		  ADD_RS2     : in std_logic_vector(4 downto 0); 
		  ADD_WR_1      : in std_logic_vector(4 downto 0); 
		  ADD_WR_2      : in std_logic_vector(4 downto 0); 
		  ADD_WR_1_I      : in std_logic_vector(4 downto 0); 
		  ADD_WR_2_I      : in std_logic_vector(4 downto 0); 
		  opCode		  : in std_logic_vector (5 downto 0);
		  Bubble      : out std_logic); -- Bubble signal, raised to '1' to stall the pipeline
end component;
--fetch
signal NPC_out_fetch_signal :   std_logic_vector(DATA_SIZE -1 downto 0);
signal RS1_signal,RS2_signal       :    std_logic_vector(4 downto 0);
signal out_pre_immA_signal,out_pre_immB_signal:std_logic_vector(DATA_SIZE -1 downto 0);
signal RD_fetch_out_signal,RS2_fetch_out_signal,RS1_fetch_out_signal : std_logic_vector( 4 downto 0);
signal PC_in_fetch_signal :std_logic_vector(DATA_SIZE -1 downto 0);
signal RF_data_in_signal  : std_logic_vector(DATA_SIZE -1 downto 0);
signal RF_ADD_WR_signal   : std_logic_vector( 4 downto 0);
--decode
signal  NPC_decode_out_signal :  std_logic_vector(DATA_SIZE -1 downto 0);
signal	A_decode_out_signal :  std_logic_vector(DATA_SIZE -1 downto 0);
signal	B_decode_out_signal :  std_logic_vector(DATA_SIZE -1 downto 0);
signal	IMM_decode_out_signal : std_logic_vector(DATA_SIZE -1 downto 0);
signal	RD_decode_out_signal,RS2_decode_out_signal :std_logic_vector( 4 downto 0);
--execute 
signal  branch_sel_execute_signal : std_logic :='0';
signal  alu_out_reg_signal        :  std_logic_vector(DATA_SIZE -1 downto 0);
signal pre_memory_out_signal     : std_logic_vector(DATA_SIZE -1 downto 0); 
signal RD_execute_out_signal,RS2_execute_out_signal : std_logic_vector( 4 downto 0);
--memory 
signal alu_out_reg_mem_out_signal,IR_out_signal  : std_logic_vector(DATA_SIZE -1 downto 0);
signal data_out_mem_signal         : std_logic_vector(DATA_SIZE -1 downto 0); 
--signal NPC_mem_out_signal :std_logic_vector(DATA_SIZE -1 downto 0);
signal RD_mem_out_signal,RS2_mem_out_signal : std_logic_vector( 4 downto 0);

signal Bubble_sig : std_logic;

begin

 out_IR_fetch<=IR_out_signal;
 out_bubble <=Bubble_sig;
 out_branch <= branch_sel_execute_signal;



 					

fetch_map : fetch 
			generic map (32)
				port map(reset_fetch=>reset,
				 		 clk =>clk,
						 PC_in_fetch=>PC_in_fetch_signal,
						pre_immediate_enable=>DP_pre_IMMM_enable,
						NPC_enable_fetch =>DP_NPC_enable,
						PC_enable_fetch =>DP_PC_enable,
						NPC_out_fetch=>NPC_out_fetch_signal,
						RS1=>RS1_signal,
						RS2=>RS2_signal,
						out_pre_immA=>out_pre_immA_signal,
						out_pre_immB=>out_pre_immB_signal,
						RD_fetch_out=>RD_fetch_out_signal,
						IR_out=>IR_out_signal,
						RS1_fetch_out =>RS1_fetch_out_signal,
						RS2_fetch_out=>RS2_fetch_out_signal);

decode_map : decode
		    generic map(32)
			port map(      clk=>clk,
						   reset_decode=>reset,
						   NPC_in_decode=>NPC_out_fetch_signal,
						   RS1_in_decode=>RS1_fetch_out_signal,
						   RS2_in_decode=>RS2_fetch_out_signal,
						   pre_immA_in_decode=>out_pre_immA_signal,
					       pre_immB_in_decode=>out_pre_immB_signal,
						   RD_delay_in_decode=>RD_fetch_out_signal,
                           RS2_delay_in_decode=>RS2_fetch_out_signal,
						   RF_data_in=> RF_data_in_signal,
		    			   Jump_25=>DP_Jump_25,
						   reg1_decode=>DP_reg1_enable,
						   RF_enable=> DP_RF_enable,
						   RF_RS1 =>DP_RF_RS1,
						   RF_RS2 =>DP_RF_RS2,
						   RF_WR_RDneg =>DP_RF_WR_RDneg,
						   RF_ADD_WR=>RF_ADD_WR_signal,
						 


						   NPC_decode_out => NPC_decode_out_signal,
						   A_decode_out=>A_decode_out_signal,
						   B_decode_out=>B_decode_out_signal,
						   IMM_decode_out=>IMM_decode_out_signal,
						   RD_decode_out=>RD_decode_out_signal,
						   RS2_decode_out =>RS2_decode_out_signal);


execute_map : execute 
			 generic map(32)
			 port map( reset_execute=>reset,
					   clk=>clk,
					   NPC_in_execute=>NPC_decode_out_signal,
					   A_in_execute =>A_decode_out_signal,
					   B_in_execute =>B_decode_out_signal,
					   IMM_in_execute =>IMM_decode_out_signal,
					   RD_in_execute=>RD_decode_out_signal,
					   RS2_in_execute=>RS2_decode_out_signal,
					   FUNC_tbe => DP_FUNC,
					   muxs1=>DP_muxs1,  
					   muxs2=> DP_muxs2,
					   reg2_execute =>DP_reg2,

					   branch_sel_execute=>branch_sel_execute_signal,
					   alu_out_reg=>alu_out_reg_signal,
					   pre_memory_out=>pre_memory_out_signal, 
					   RD_execute_out=>RD_execute_out_signal,
					   RS2_execute_out=>RS2_execute_out_signal);
		
memory_map : memory_stage 
			 generic map(32)
			 port map( 
						clk =>clk,
						reset_mem => reset,
						branch_sel_in_mem=>branch_sel_execute_signal,
					   alu_out_reg_in_mem=>alu_out_reg_signal,
					   pre_memory_in_mem=>pre_memory_out_signal,
					   RD_in_mem=>RD_execute_out_signal,
					   RS2_in_mem=>RS2_execute_out_signal,
					   NPC_in_mem =>NPC_out_fetch_signal,
					   reg3_mem   => DP_reg3,
                       CS_mem     => DP_CS,            
					   RD_WRN_mem =>DP_RD_WRN_mem,  
        			   MUX_PC_mem => DP_MUX_PC_mem,
					   alu_out_reg_mem_out=>alu_out_reg_mem_out_signal,
					   data_out_mem=>data_out_mem_signal, 
					   NPC_mem_out=>PC_in_fetch_signal,
					   RD_mem_out=>RD_mem_out_signal,
					   RS2_mem_out=>RS2_mem_out_signal);

write_back_map : WB
				 generic map(32)
				 port map(  data_in_WB=> data_out_mem_signal,
							alu_out_in_WB=>alu_out_reg_mem_out_signal,	 
							RD_in_WB=>RD_mem_out_signal,
							RS2_in_WB =>RS2_mem_out_signal,
							MUX_RS2_WR_sel =>DP_MUX_RS2_WR_sel, 
							MUX_RD_WR_sel =>DP_MUX_RD_WR_sel,
							muxs3=>DP_muxs3,
							out_MUX_WR =>RF_ADD_WR_signal,
							muxs3_out_WB=>RF_data_in_signal);



detection : hazard_detection_unit 
	port map ( RST=>reset,CLK=>clk,ADD_RS1 =>RS1_signal,ADD_RS2 =>RS2_signal,ADD_WR_1  =>RD_fetch_out_signal,ADD_WR_2  =>RD_decode_out_signal,ADD_WR_1_I  =>RS2_fetch_out_signal,ADD_WR_2_I  =>RS2_decode_out_signal,Bubble=>Bubble_sig, opCode => IR_out_signal(31 downto 26));

end beh;






