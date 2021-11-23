Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;

use work.all;

entity dlx_cu_HW is
 generic (
    MICROCODE_MEM_SIZE :     integer := 10;  -- Microcode Memory Size
    FUNC_SIZE          :     integer := 11;  -- Func Field Size for R-Type Ops
    OP_CODE_SIZE       :     integer := 6;  -- Op Code Size
    IR_SIZE            :     integer := 32;  -- Instruction Register Size    
    CW_SIZE            :     integer := 19);  -- Control Word Size
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

end dlx_cu_HW;

architecture dlx_cu_rtl of dlx_cu_HW is
                                
  signal IR_opcode : std_logic_vector(5 downto 0);  -- OpCode part of IR
  signal IR_func : std_logic_vector(10 downto 0);   -- Func part of IR when Rtype
  signal cw1, cw_tmp  : std_logic_vector(CW_SIZE-1 downto 0); -- full control word read from cw_mem
  signal cw2 :std_logic_vector(CW_SIZE -1 - 3 downto 0);
  signal cw3 :std_logic_vector(CW_SIZE -1 - 3 -5 downto 0);
  signal cw4 : std_logic_vector(CW_SIZE -1 - 3 -5 -3  downto 0);
  signal cw5 : std_logic_vector(CW_SIZE -1 - 3 -5 -4 -3  downto 0);
  --signal STALL: std_logic := '0';
--definition of the all possible instruction
  
     signal aluOpcode_i,ALUop2,ALUop1: aluOp; -- ALUOP defined in package
 type mem_array is array (natural range <>) of std_logic_vector(CW_SIZE -1 downto 0);

signal cw_mem : mem_array(0 to MICROCODE_MEM_SIZE-1);
	-- Constant used to set the memory, since initial value is not supported in synthesis
	constant CW_MEM_INIT : mem_array(0 to MICROCODE_MEM_SIZE-1) := (	
								"1110111110110001011",--rtype add,sub,sig and uns  0
								"1110111110110001011",--rtype  sge,sle,sne,seq 1
								"1110111111110001001",--ITYPE add,sub,ecc  2
								"1111111111110010001",--j,jr 3
								"1111111101110010001",--jal,jalr 4
								"1110111111110010000",--beq,bez 5
					 			"1110111111111100001",--lw 6
                                "1110111111111000000",--sw 7
                                "1110111111110001001",--sgei,snei,slei,seqi 8
								"0000000000000000000" --nop
							
								);



 
begin  -- dlx_cu_rtl
  cw_mem<=CW_MEM_INIT;
  IR_opcode(5 downto 0) <= IR_IN(31 downto 26);--exctract the OPCODE from IR
  IR_func(10 downto 0)  <= IR_IN(FUNC_SIZE - 1 downto 0);--exctract the FUNC from IR

 --cw1<=cw_mem(to_integer(unsigned(IR_opcode)));
 		FUNC_TO_DO<=aluOpcode_i;
  		
        HW_PC_enable_fetch  <=cw1(18);
		HW_NPC_enable_fetch <=cw1(17);
 		HW_pre_immediate_enable<= cw1(16);
		
	--DECODE
       HW_Jump_25      <=cw2(15);
	   HW_reg1_decode <=cw2(14);
       HW_RF_enable    <=cw2(13);
	   HW_RF_RS1       <=cw2(12);
	   HW_RF_RS2       <=cw2(11);
      
	--EXECUTE
	   HW_muxs1   	   <=cw3(10);
	   HW_muxs2        <=cw3(9);
	   HW_reg2_execute <=cw3(8);

	--MEMORY
	   HW_reg3_mem     <=cw4(7);
       HW_CS_mem       <=cw4(6);
       HW_RD_WRN_mem   <=cw4(5);
       HW_MUX_PC_mem   <=cw4(4);
	--WB 
	   HW_muxs3			<=cw5(3);     
	   HW_MUX_RS2_WR_sel<=cw5(2);        
       HW_MUX_RD_WR_sel	<=cw5(1);  
       HW_RF_WR_RDneg   <=cw5(0);  
      -- stall_out<=STALL;

  
 ALU_OP_CODE_P : process (Rst,IR_opcode, IR_func, bubble_in,Branch_taken)   
   begin  -- process ALU_OP_CODE_P
	            if(bubble_in = '1' and Branch_taken = '0') then 
						cw1 <= (others => '0');
	else
    case IR_opcode is
	           
			    when RTYPE =>

				--RTYPE when opCode is 0
			    case IR_func is
							when RTYPE_SLL => 
											ALUop1 <= LSL;
											cw1<=cw_mem(0);				
                      
						    when RTYPE_SRL=> 
											ALUop1<= RSL;
											cw1<=cw_mem(0);
						    when RTYPE_SRA => 
											 ALUop1 <= RSA; 
										    cw1<=cw_mem(0);												

							when RTYPE_ADD =>
											 ALUop1 <= ADD;
											 cw1<=cw_mem(0);
							when RTYPE_ADDU =>
											 ALUop1 <= ADDU;
											 cw1<=cw_mem(0);
							
						    when RTYPE_SUB=> 
											 ALUop1 <= SUB; 
											  cw1<=cw_mem(0);
						    when RTYPE_SUBU=> 
											 ALUop1 <= SUBU; 
											  cw1<=cw_mem(0);
			   				when RTYPE_AND=> 
											 ALUop1 <=AND_op;
											  cw1<=cw_mem(0);
						    when RTYPE_OR=> 
											ALUop1 <= OR_op; 
										     cw1<=cw_mem(0);
					  		when RTYPE_XOR=> 
											 ALUop1 <=XOR_op ;
											 cw1<=cw_mem(0);
						    when RTYPE_SNE=>
											 ALUop1 <=SNE ; 
											 cw1<=cw_mem(1);
							when RTYPE_SLE=> 
											 ALUop1 <= SLE;
										     cw1<=cw_mem(1);
											 
						    when RTYPE_SGE => 
											 ALUop1 <= SGE; 
											 cw1<=cw_mem(1);
						    when RTYPE_SEQ => 
											 ALUop1 <= SEQ; 
											 cw1<=cw_mem(1);
							when RTYPE_SGT => 
											 ALUop1 <= SGT; 
											 cw1<=cw_mem(1);
						    when RTYPE_SLT => 
											 ALUop1 <= SLT; 
											 cw1<=cw_mem(1);
							when RTYPE_SGEU=> 
											 ALUop1 <= SGEU;
											 cw1<=cw_mem(1);
					        when RTYPE_SLEU=> 

											 ALUop1 <= SLEU;
											 cw1<=cw_mem(1);
							when RTYPE_SGTU=> 
											 ALUop1 <= SGTU;
											 cw1<=cw_mem(1);
						    when RTYPE_SLTU=> 
											 ALUop1 <= SLTU;
											 cw1<=cw_mem(1);
							when RTYPE_MULT => 
											 ALUop1 <= MULT;
											 cw1<=cw_mem(0);

							when others => ALUop1 <= NOP ;
			    end case;
        ----I TYPE
		when  JTYPE_J => 
						    ALUop1<=J;
							cw1<=cw_mem(3);
		
		when  JTYPE_JR => 
						    ALUop1<=JR;
							cw1<=cw_mem(3);

		when JTYPE_JAL =>
							ALUop1 <= JAL;
							cw1<=cw_mem(4);

		when JTYPE_JALR => 
							ALUop1 <= JALR;
							cw1<=cw_mem(4);


		when ITYPE_BEQZ => 
							ALUop1 <= EQ;
							cw1<=cw_mem(5);
		when  ITYPE_BNEZ => 
							ALUop1 <= NE;
							cw1<=cw_mem(5);
							
		when ITYPE_ADDI => 	
 							ALUop1 <= ADD;
							cw1<=cw_mem(2);
		when ITYPE_ADDUI => 	
 							ALUop1 <= ADDU;
							cw1<=cw_mem(2);
		
		when ITYPE_SUBI => 
							ALUop1 <= SUB;
							cw1<=cw_mem(2);
		when ITYPE_SUBUI => 
							ALUop1 <= SUBU;
							cw1<=cw_mem(2);
		when ITYPE_ANDI => 
							ALUop1<= AND_op;
							cw1<=cw_mem(2);
        when ITYPE_ORI => 
							ALUop1 <= OR_op;
							cw1<=cw_mem(2);

        when ITYPE_XORI => 
							ALUop1 <= XOR_op;
							cw1<=cw_mem(2);

        when ITYPE_SLLI=> 
							ALUop1 <= LSL;
                            cw1<=cw_mem(2);
        when ITYPE_SRLI=> 
 							ALUop1 <= RSL;
							cw1<=cw_mem(2);
		when ITYPE_SRAI =>  
							ALUop1 <= RSA;
							cw1<=cw_mem(2);
        when ITYPE_SNEI=> 
							ALUop1 <= SNE;
						    cw1<=cw_mem(8);
							
        when ITYPE_SLEI=> 
							ALUop1 <=SLE;
					   		cw1<=cw_mem(8);
        when ITYPE_SGEI=> 
							ALUop1 <=SGE ;
							cw1<=cw_mem(8);
		when ITYPE_SEQI=> 
   							ALUop1 <=SEQ ;
							cw1<=cw_mem(8);
		when ITYPE_SGTI=> 
							ALUop1 <=SGT ;
							cw1<=cw_mem(8);
	    when ITYPE_SLTI=> 
							ALUop1 <=SLT ;
							cw1<=cw_mem(8);
		when ITYPE_SGEUI=> 
							ALUop1 <= SGEU;
							cw1<=cw_mem(8);
	    when ITYPE_SLEUI=> 
						    ALUop1 <= SLEU;
							cw1<=cw_mem(8);
	    when ITYPE_SGTUI=> 
							ALUop1 <= SGTU;
							cw1<=cw_mem(8);
	    when ITYPE_SLTUI=> 
							ALUop1 <= SLTU;
							cw1<=cw_mem(8);
        when ITYPE_LW=> 
							ALUop1<= LW;
							cw1<=cw_mem(6);
        when ITYPE_SW => 
							ALUop1 <= SW;
							cw1<=cw_mem(7);		
		when ITYPE_MULTI => 
						    ALUop1 <= MULT;
							cw1<=cw_mem(2);
 
		when others => ALUop1 <= NOP;
	 
	 end case;
	end if;
     
	end process ALU_OP_CODE_P;

  -- process to pipeline control words, it assignes the values to the data path control signal depending
  -- on the instruction type at each clock cycle
 CW_PIPE : process(Clk, Rst,bubble_in,Branch_taken)
	begin      
if(Branch_taken = '1') then
					aluOpcode_i <= NOP;
					cw3<=(others=> '0');
end if;                         
		if (Rst = '0') then 
			cw2		<= (others => '0');
			cw3		<= (others => '0');
			cw4		<= (others => '0');
			cw5		<= (others => '0');
			

		elsif (Clk = '1' AND Clk'EVENT) then  	-- rising clock edge
					
			 		
					if(bubble_in = '0') then 
						cw2<= cw1(CW_SIZE -1 - 3 downto 0);     
						ALUop2 <= ALUop1;
						cw3 <= cw2(CW_SIZE -1- 3 -5 downto 0);
						aluOpcode_i<= ALUop2;
						--STALL <= '0';
					else 
  						 cw3<=(others=> '0');
						aluOpcode_i <= NOP;
					end if;
			
					if(Branch_taken = '0') then
						cw4 <= cw3(CW_SIZE -1 -3 -5 -3  downto 0);
					end if;
					    cw5 <= cw4(CW_SIZE -1 -3 -5 -4 -3 downto 0);
			
		end if;
	end process CW_PIPE;
       

end dlx_cu_rtl;
