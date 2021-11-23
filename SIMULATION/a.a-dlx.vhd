library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;
use ieee.numeric_std.all;
use work.all;



entity dlx is
	generic ( ADDR_SIZE 	: integer := 32;			
		  DATA_SIZE 	: integer := 32);  
	port    (
		  CLK     		: in std_logic;
		  RESET    		: in std_logic
	    );

end entity;


architecture beh of DLX IS
component dlx_cu_HW is
 generic (
    MICROCODE_MEM_SIZE :     integer := 10;  -- Microcode Memory Size
    FUNC_SIZE          :     integer := 11;  -- Func Field Size for R-Type Ops
    OP_CODE_SIZE       :     integer := 6;  -- Op Code Size
    IR_SIZE            :     integer := 32;  -- Instruction Register Size    
    CW_SIZE            :     integer := 18);  -- Control Word Size
  port (
    Clk                : in  std_logic;  -- Clock
    Rst                : in  std_logic;  -- Reset:Active-Low

    -- Instruction Register
    IR_IN              : in  std_logic_vector(IR_SIZE - 1 downto 0);
    bubble_in          : in std_logic;
    Branch_taken	   : in std_logic;
	  FUNC_TO_DO       : out  aluOp;
    --FETCH
	 	HW_pre_immediate_enable: out std_logic;
		HW_NPC_enable_fetch    :out std_logic;
		HW_PC_enable_fetch     :out std_logic;
	--DECODE
       HW_Jump_25     : out std_logic;
	   HW_reg1_decode : out  std_logic;
       HW_RF_enable   : out  std_logic;
	   HW_RF_RS1      : out  std_logic;
	   HW_RF_RS2      : out  std_logic;
       HW_RF_WR_RDneg : out  std_logic;
	--EXECUTE
	   HW_muxs1   	   : out  std_logic; 
	   HW_muxs2        : out  std_logic; 
	   HW_reg2_execute : out  std_logic;

	--MEMORY
	   HW_reg3_mem             : out  std_logic;
       HW_CS_mem               : out  std_logic;
       HW_RD_WRN_mem           : out  std_logic;
       HW_MUX_PC_mem           : out  std_logic;
	--WB 
	   HW_muxs3				 : out  std_logic;        
	   HW_MUX_RS2_WR_sel     : out  std_logic;          
       HW_MUX_RD_WR_sel		 : out  std_logic              
   );

end component;

component data_path is
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
	  DP_MUX_PC_mem : in std_logic;
--- WRITE BACK
	  DP_muxs3          : in std_logic;
	  DP_MUX_RD_WR_sel  : in std_logic;
	  DP_MUX_RS2_WR_sel : in std_logic;

--out DP
	  out_bubble        : out std_logic;
	  out_branch		: out std_logic;
	  out_IR_fetch      : out std_logic_vector(DATA_SIZE - 1 downto 0)
    );
end component;
signal out_IR_fetch_signal : std_logic_vector(DATA_SIZE - 1 downto 0);
signal out_bubble_signal : std_logic;
signal  out_branch_signal   : std_logic:='0';
signal DP_FUNC_signal : aluOp;
signal DP_PC_enable_signal,DP_NPC_enable_signal,DP_pre_IMMM_enable_signal,DP_Jump_25_signal,DP_reg1_enable_signal,
	  DP_RF_enable_signal,DP_RF_RS1_signal,DP_RF_RS2_signal, DP_RF_WR_RDneg_signal,DP_muxs1_signal, DP_MUX_PC_mem_signal, DP_muxs2_signal,DP_reg2_signal,DP_CS_signal,DP_RD_WRN_mem_signal,DP_reg3_signal,DP_muxs3_signal,DP_MUX_RD_WR_sel_signal,
DP_MUX_RS2_WR_sel_signal: std_logic;
begin

cu : dlx_cu_HW
    generic map(10,11,6,32,19)
	port map( Clk=> CLK,
		Rst=>RESET ,
		IR_IN=>out_IR_fetch_signal,
		bubble_in => out_bubble_signal, 
        Branch_taken => out_branch_signal, 
	    FUNC_TO_DO=>DP_FUNC_signal,
    --FETCH
	 	HW_pre_immediate_enable=>DP_pre_IMMM_enable_signal,
		HW_NPC_enable_fetch=>DP_NPC_enable_signal,
		HW_PC_enable_fetch =>DP_PC_enable_signal,
	--DECODE
       HW_Jump_25     =>DP_Jump_25_signal,
	   HW_reg1_decode =>DP_reg1_enable_signal,
       HW_RF_enable   => DP_RF_enable_signal,
	   HW_RF_RS1      =>DP_RF_RS1_signal,
	   HW_RF_RS2      =>DP_RF_RS2_signal,
       HW_RF_WR_RDneg => DP_RF_WR_RDneg_signal, 
	--EXECUTE
	   HW_muxs1   	   =>DP_muxs1_signal,
	   HW_muxs2        =>DP_muxs2_signal,
	   HW_reg2_execute =>DP_reg2_signal,

	--MEMORY
	   HW_reg3_mem     =>DP_reg3_signal,      
       HW_CS_mem       =>DP_CS_signal,    
       HW_RD_WRN_mem   =>DP_RD_WRN_mem_signal, 
       HW_MUX_PC_mem   =>DP_MUX_PC_mem_signal,       
	--WB 
	   HW_muxs3		   =>DP_muxs3_signal,	      
	   HW_MUX_RS2_WR_sel  =>  DP_MUX_RS2_WR_sel_signal,   
       HW_MUX_RD_WR_sel	  =>DP_MUX_RD_WR_sel_signal);     

dp: data_path
	generic map(32)
	port map(clk =>CLK,reset=>RESET,DP_FUNC=>DP_FUNC_signal,

	  DP_PC_enable    =>DP_PC_enable_signal,
	  DP_NPC_enable   =>DP_NPC_enable_signal,
	  DP_pre_IMMM_enable =>DP_pre_IMMM_enable_signal,

	  DP_Jump_25	  =>DP_Jump_25_signal,
      DP_reg1_enable  =>DP_reg1_enable_signal,
	  DP_RF_enable    =>DP_RF_enable_signal,
	  DP_RF_RS1       =>DP_RF_RS1_signal,
	  DP_RF_RS2       =>DP_RF_RS2_signal,
	  DP_RF_WR_RDneg  =>DP_RF_WR_RDneg_signal,
      DP_muxs1        =>DP_muxs1_signal,
	  DP_muxs2   	  =>DP_muxs2_signal,
      DP_reg2         =>DP_reg2_signal,
	  DP_CS           =>DP_CS_signal,
	  DP_RD_WRN_mem   =>DP_RD_WRN_mem_signal,
      DP_MUX_PC_mem   =>DP_MUX_PC_mem_signal, 
	  DP_reg3		  =>DP_reg3_signal,
	  DP_muxs3        =>DP_muxs3_signal,
	  DP_MUX_RD_WR_sel=>DP_MUX_RD_WR_sel_signal,
	  DP_MUX_RS2_WR_sel=>DP_MUX_RS2_WR_sel_signal,
	  out_bubble=>out_bubble_signal,
	  out_branch => out_branch_signal,   
	  out_IR_fetch=>out_IR_fetch_signal);


end beh;
