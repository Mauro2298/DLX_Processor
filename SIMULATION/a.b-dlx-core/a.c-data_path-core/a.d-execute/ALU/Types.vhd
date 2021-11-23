

library ieee;
use ieee.std_logic_1164.all;


package Types is

    
	
	constant Nbit_OPCODE	: integer := 6;		
	constant Nbit_FUNC  	: integer := 11;	


	
	constant RTYPE   	: std_logic_vector(Nbit_OPCODE - 1 downto 0) := "000000"; 	-- 0x00
    constant RTYPE_SLL : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000000100"; 	-- 0x04
    constant RTYPE_SRL  : std_logic_vector(Nbit_FUNC - 1 downto 0) := "00000000110"; 	-- 0x06
    constant RTYPE_SRA : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000000111"; 	-- 0x07

    constant RTYPE_ADD : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000100000"; 	-- 0x20
	constant RTYPE_ADDU: std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000100001"; 	-- 0x21
    constant RTYPE_SUB  : std_logic_vector(Nbit_FUNC - 1 downto 0) := "00000100010"; 	-- 0x22
	constant RTYPE_SUBU : std_logic_vector(Nbit_FUNC - 1 downto 0) := "00000100011"; 	-- 0x23
   	constant RTYPE_AND  : std_logic_vector(Nbit_FUNC - 1 downto 0) := "00000100100"; 	-- 0x24
    constant RTYPE_OR : std_logic_vector(Nbit_FUNC - 1 downto 0) :=   "00000100101"; 	-- 0x25
    constant RTYPE_XOR : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000100110"; 	-- 0x26
	constant RTYPE_SEQ : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000101000"; 	-- 0x28
    constant RTYPE_SNE : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000101001"; 	-- 0x29
	constant RTYPE_SLT : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000101010"; 	-- 0x2A
	constant RTYPE_SGT : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000101011"; 	-- 0x2B
	constant RTYPE_SLE : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000101100"; 	-- 0x2C
    constant RTYPE_SGE : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000101101"; 	-- 0x2D
 	constant RTYPE_SLTU : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000111010"; 	-- 0x3A
    constant RTYPE_SGTU : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000111011"; 	-- 0x3B
	constant RTYPE_SLEU : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000111100"; 	-- 0x3C
    constant RTYPE_SGEU : std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000111101"; 	-- 0x3D

    constant RTYPE_MULT: std_logic_vector(Nbit_FUNC - 1 downto 0) :=  "00000001110";	-- 0x0E
	constant RTYPE_MULTU: std_logic_vector(Nbit_FUNC - 1 downto 0):=  "00000010110";	-- 0x16

	
	constant RTYPE_MULTUI: std_logic_vector(Nbit_FUNC - 1 downto 0):= "11111000000";	-- 0x18
	
    constant ITYPE_MULTI: std_logic_vector(Nbit_OPCODE - 1 downto 0)   :=  "100000";	-- 0x17
	constant JTYPE_J 	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "000010";	-- 0x02
	constant JTYPE_JAL 	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "000011";	-- 0x03
	constant JTYPE_JR 	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "010010"; 	-- 0x12 (pro)
	constant JTYPE_JALR	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "010011"; 	-- 0x13 (pro)
	-- I-Type instruction - OPCODE field                                 
	constant ITYPE_BEQZ : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "000100";	-- 0x04
	constant ITYPE_BNEZ : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "000101";	-- 0x05
	constant ITYPE_ADDI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "001000"; 	-- 0x08
	constant ITYPE_ADDUI: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "001001"; 	-- 0x09 (pro)
	constant ITYPE_SUBI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "001010"; 	-- 0x0A
	constant ITYPE_SUBUI: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "001011"; 	-- 0x0B (pro)
	constant ITYPE_ANDI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "001100"; 	-- 0x0C
	constant ITYPE_ORI 	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "001101"; 	-- 0x0D
	constant ITYPE_XORI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "001110"; 	-- 0x0E
	
	constant ITYPE_SLLI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "010100"; 	-- 0x14
	constant ITYPE_NOP 	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "010101"; 	-- 0x15
	constant ITYPE_SRLI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "010110"; 	-- 0x16
	constant ITYPE_SRAI	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "010111"; 	-- 0x17 (pro)
	constant ITYPE_SEQI	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "011000"; 	-- 0x18 (pro)
	constant ITYPE_SNEI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "011001"; 	-- 0x19
	constant ITYPE_SLTI	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "011010"; 	-- 0x1A (pro)
	constant ITYPE_SGTI	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "011011"; 	-- 0x1B (pro)
	constant ITYPE_SLEI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "011100"; 	-- 0x1C
	constant ITYPE_SGEI : std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "011101"; 	-- 0x1D
	constant ITYPE_LW 	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "100011"; 	-- 0x23
	constant ITYPE_SW 	: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "101011"; 	-- 0x2B
	constant ITYPE_SLTUI: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "111010"; 	-- 0x3A (pro)
	constant ITYPE_SGTUI: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "111011"; 	-- 0x3B (pro)
	constant ITYPE_SLEUI: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "111100"; 	-- 0x3C (pro)
	constant ITYPE_SGEUI: std_logic_vector(Nbit_OPCODE - 1 downto 0) :=  "111101"; 	-- 0x3D (pro)

	-- R-Type instruction - FUNC field
	
	

	-- Implicit encoding for ALU OpCode
	type aluOp is (
		NOP,
        MULT,-- integer multiplication
		LSL, 	-- left shift logical
		RSL, 	-- right shift logical
		RSA,	-- right shift arithmetical
		ADD,	-- integer addition
		SUB,	-- integer subtraction
		AND_op,	-- bitwise and
		OR_op,	-- bitwise or
		XOR_op,	-- bitwise xor
		EQ,		-- check if A==B		
		NE,		-- check if A!=B
		LT,		-- check if A<B 		
		GT,     -- check if A>B			
		LE,		-- check if A<=B
		GE,		-- check if A>=B
	    J,
		JAL,
	    JALR,
		JR,
		LW,
		SW,
		SEQ,
		SNE,
        SGE,
		SGEU,
        SLE,
		SLEU,
		SGT,
		SGTU,
		SLT,
		SLTU,
        ADDU,
	    SUBU,
		MULTU
		
	);

end Types;
