library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.Types.all;


entity IR is
	generic (
		RAM_SIZE	: integer := 100;								-- IRAM size (in words)
		I_SIZE		: integer := 32					-- IRAM word size (in bits)
	);
	port (
		Rst 		: in  std_logic;								-- Reset (active-low)
		Addr		: in  std_logic_vector(I_SIZE - 1 downto 0);
		Dout		: out std_logic_vector(I_SIZE - 1 downto 0)
	);
end IR;

architecture Behavioural of IR is
	
	-- Content of IR (32 bits) to have a NOP
	constant NOP_Instr : integer := conv_integer(unsigned(ITYPE_NOP & "00" & X"000000"));

	type RAMtype is array (0 to RAM_SIZE - 1) of integer;
	signal IRAM_mem : RAMtype;

begin
	
	-- In the datapath, PC is incremented by 4 to go forward of one instruction; in this
	-- memory, instructions are addressed by integers. For this reason, the number represented by the Program Counter has to be divided by 4 to
	-- correctly address instructions in the IRAM
	Dout <= conv_std_logic_vector(IRAM_mem(conv_integer(unsigned(Addr))/4),I_SIZE);

	FILL_MEM_P: process (Rst)
		file asm_file		: text;
		variable file_line 	: line;
		variable index 		: integer := 0;
		variable line_unsgn	: std_logic_vector(I_SIZE-1 downto 0);
	begin
	
		if (Rst = '0') then
			IRAM_mem <= (OTHERS => NOP_Instr);							-- initilize all instructions to NOP
		else 
			file_open(asm_file, "/home/ms21.8/Desktop/GR01_DLX_PRO/SIMULATION/test_bench/Branch.asm.mem", READ_MODE);				-- Open asm file in read mode
			while (not endfile(asm_file)) loop
			
				readline(asm_file, file_line);							-- Read a line from text file
				hread(file_line, line_unsgn);							-- Transpose hex data of line to unsigned
				IRAM_mem(index) <= conv_integer(unsigned(line_unsgn));	-- Store int value in memory @ index
				index := index + 1;
			end loop;
			
			file_close(asm_file);
		end if;
		
	end process FILL_MEM_P;

end Behavioural;
