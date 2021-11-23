library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_unsigned.all;
--use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
--use IEEE.math_real.all;
use IEEE.std_logic_signed.all;
use WORK.Types.all;

entity ALU is
  generic (NUM_BIT : integer := 32);
  port 	 ( FUNC: IN aluOp;
           DATA1, DATA2: IN std_logic_vector(NUM_BIT-1 downto 0);
		   NPC_IN : IN std_logic_vector(NUM_BIT-1 downto 0);

  		   SEL_BRANCH: OUT std_logic ;
           DATA_OUT: OUT std_logic_vector(NUM_BIT-1 downto 0));
end ALU;



architecture Beh of ALU is

component Comparator is
	generic (NUM_BIT : integer := 32);
	port (
				Sum : in std_logic_vector(NUM_BIT-1 downto 0);
				Cout: in std_logic;
				EQ: out std_logic;
				NE: out std_logic;
				LE: out std_logic;
				GE: out std_logic;
				GT: out std_logic;
				LT: out std_logic
	);
end component;

component logic is
    generic( NUM_BIT : integer := 32);
   
	Port (	A:	In	std_logic_vector(NUM_BIT-1 downto 0);
     		B:	In	std_logic_vector(NUM_BIT-1 downto 0);
		   	SEL: In	std_logic_vector(3 downto 0);
		    Y:	Out	std_logic_vector(NUM_BIT-1 downto 0));
end component;

component BOOTHMUL is
generic (NBIT : integer := 16);
port(
	A : in std_logic_vector(NBIT-1 downto 0);
	B : in std_logic_vector(NBIT-1 downto 0);
	P : out std_logic_vector(NBIT*2-1 downto 0)

);

end component;

component p4_adder is
generic (NBIT : integer := 32);
port(	A : in std_logic_vector(NBIT-1 downto 0);
		B : in std_logic_vector(NBIT-1 downto 0);
		Cin: in std_logic;
		S :	out	std_logic_vector(NBIT-1 downto 0);
		Cout : out std_logic
	);
end component;

component Shifter is

	generic (NUM_BIT : integer := 32);
	port (
			A: in std_logic_vector(NUM_BIT-1 downto 0);
			B: in std_logic_vector(NUM_BIT-1 downto 0);
			SEL: in std_logic_vector(1 downto 0);
			Y: out std_logic_vector(NUM_BIT-1 downto 0) 
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


signal SEL_shift: std_logic_vector(1 downto 0);
signal SEL_logic: std_logic_vector(3 downto 0);
-----
--ADDER
signal Cin_Adder, Cout_Adder:std_logic;
signal comp_in :std_logic_vector(NUM_BIT-1 downto 0);
signal Adder_A,Adder_B,Adder_out :std_logic_vector(NUM_BIT-1 downto 0);
signal Adder_A_un,Adder_B_un,A_UNS,B_UNS,temp1,temp2:std_logic_vector(NUM_BIT-1 downto 0);
--LOGIC
signal Logic_A,Logic_B,Logic_out:std_logic_vector(NUM_BIT-1 downto 0);
--COMPARATOR 
signal Comparator_sum:std_logic_vector(NUM_BIT-1 downto 0);
signal EQ_sig, NE_sig, LE_sig, GT_sig, LT_sig, GE_sig , Cout_sig: std_logic;
--MULTIPLIER
signal Mul_out:std_logic_vector(NUM_BIT-1 downto 0);
signal Mul_A,Mul_B :std_logic_vector(NUM_BIT/2-1 downto 0);
--SHIFTER
signal Shifter_A,Shifter_B,Shifter_out:std_logic_vector(NUM_BIT-1 downto 0);


signal SEL_EQ_NE : std_logic;


begin
 
temp1<=abs(DATA1);
temp2<=abs(DATA2);
mux_sign_A: MUX21_GENERIC
           generic map(32,0 ns)
		 	port map(A=>DATA1,B=>temp1,SEL=>DATA1(31),Y=>A_UNS);

mux_sign_B: MUX21_GENERIC
           generic map(32,0 ns)
		 	port map(A=>DATA2,B=>temp2,SEL=>DATA2(31),Y=>B_UNS);

 comp :Comparator
        generic map(NUM_BIT)
        port map(Sum=>comp_in,Cout=>Cout_sig,EQ=>EQ_sig,NE=>NE_sig,LE=>LE_sig,GT=>GT_sig,LT=>LT_sig,GE=>GE_sig
        );

MUL: BOOTHMUL
		generic map(NUM_BIT/2)
		port map(A => Mul_A, B=>Mul_B, P=>Mul_out);
ADDER: p4_adder
		generic map(NUM_BIT)
		port map(A=> Adder_A, B=>Adder_B, Cin => Cin_Adder, S=> Adder_out, Cout => Cout_Adder);

SHIFT: Shifter
		generic map(NUM_BIT)
		port map(A => Shifter_A, B => Shifter_B, SEL => SEL_shift, Y => Shifter_out);
LOG: logic
		generic map (NUM_BIT)
		port map(A=> Logic_A, B=> Logic_B, SEL => SEL_logic, Y => LOGIC_out); 


P_ALU: process (FUNC, DATA1, DATA2,Adder_out,comp_in,A_UNS,B_UNS)
    variable temp : std_logic_vector(NUM_BIT/2-1 downto 0);
    begin
    case FUNC is
	
	
	when MULT =>  Mul_A<= DATA1(NUM_BIT/2-1 downto 0);
   				  Mul_B<= DATA2(NUM_BIT/2-1 downto 0);
				  
                  
             
	when RSL =>	Shifter_A<= DATA1;
				Shifter_B<= DATA2;
				SEL_shift<="01";
  				
    when LSL => Shifter_A<= DATA1;
				Shifter_B<= DATA2;
				SEL_shift<="00";

	when RSA => Shifter_A<= DATA1;
				Shifter_B<= DATA2;
				SEL_shift<="10";

	when ADD => Adder_A<= DATA1;
				Adder_B<= DATA2;
				Cin_Adder<= '0';
    when ADDU => Adder_A<= A_UNS;
				 Adder_B<= B_UNS;
				 Cin_Adder<= '0';

	when SUB =>	Adder_A<= DATA1;
				Adder_B<= not(DATA2);
				Cin_Adder<= '1';
    when SUBU => Adder_A<= A_UNS;
				 Adder_B<= not(B_UNS);
				 Cin_Adder<= '1';
	when MULTU => Mul_A<= A_UNS(NUM_BIT/2-1 downto 0);
   				  Mul_B<= B_UNS(NUM_BIT/2-1 downto 0);

	when AND_op =>	Logic_A<=DATA1;
					Logic_B<=DATA2;
					SEL_logic<="1000";
					
	when OR_op =>	Logic_A<=DATA1;
					Logic_B<=DATA2;
					SEL_logic<="1110";

	when XOR_op =>  Logic_A<=DATA1;
					Logic_B<=DATA2;
					SEL_logic<="0110";

    when SW =>      Adder_A<= DATA1;
				    Adder_B<= DATA2;
				    Cin_Adder<= '0';

	when LW =>      Adder_A<= DATA1;
					Adder_B<= DATA2;
					Cin_Adder<= '0';

	when EQ =>		Adder_A<= NPC_IN - "00000000000000000000000000000100";
					Adder_B<= DATA2;
					comp_in<=DATA1;
					
					Cin_Adder<= '0';
	
	when NE =>		Adder_A<= NPC_IN - "00000000000000000000000000000100";
					Adder_B<= DATA2;
					comp_in<=DATA1;
					
					Cin_Adder<= '0';
	when LT =>		Adder_A<= DATA1;
					Adder_B<= DATA2;
					Cin_Adder<= '0';
		
	when GT =>     Adder_A<= DATA1;
					Adder_B<= DATA2;
					Cin_Adder<= '0';
		
	when LE =>	    Adder_A<= DATA1;
					Adder_B<= DATA2;
					Cin_Adder<= '0';

	when GE=>		Adder_A<= DATA1;
					Adder_B<= DATA2;
					Cin_Adder<= '0';
    when J=>    	
					Adder_A<= NPC_IN - "00000000000000000000000000000100";
					Adder_B<= DATA2;
					Cin_Adder<= '0';
					

     when JAL=>    	
					Adder_A<= NPC_IN - "00000000000000000000000000000100";
					Adder_B<= DATA2;
					Cin_Adder<= '0';
     when JALR=>
					Adder_A<= DATA1;
					Adder_B<= "00000000000000000000000000000000";
					Cin_Adder<= '0';
	 when JR=>
					Adder_A<= DATA1;
					Adder_B<= "00000000000000000000000000000000";
					Cin_Adder<= '0';
     when SNE =>
					Adder_A<= DATA1;
					Adder_B<= not(DATA2);
					Cin_Adder<= '1';
					comp_in<=Adder_out;
				
	when SGE =>
					Adder_A<= DATA1;
					Adder_B<= not(DATA2);
					Cin_Adder<= '1';
				    comp_in<=Adder_out;
  	when SGEU => 
					Adder_A<= A_UNS;
					Adder_B<= not(B_UNS);
					Cin_Adder<= '1';
				    comp_in<=Adder_out;
   					
					
	when SLE =>
					Adder_A<= DATA1;
					Adder_B<= not(DATA2);
					Cin_Adder<= '1';
                    comp_in<=Adder_out;
    when SLEU =>
					Adder_A<= A_UNS;
					Adder_B<= not(B_UNS);
					Cin_Adder<= '1';
                    comp_in<=Adder_out;
    when SGT =>
					Adder_A<= DATA1;
					Adder_B<= not(DATA2);
					Cin_Adder<= '1';
                    comp_in<=Adder_out;
	when SGTU =>
					Adder_A<= A_UNS;
					Adder_B<= not(B_UNS);
					Cin_Adder<= '1';
                    comp_in<=Adder_out;
	when SLT =>
					Adder_A<= DATA1;
					Adder_B<= not(DATA2);
					Cin_Adder<= '1';
                    comp_in<=Adder_out;	
	when SLTU =>
					Adder_A<= A_UNS;
					Adder_B<= not(B_UNS);
					Cin_Adder<= '1';
                    comp_in<=Adder_out;				
	when SEQ =>	
					Adder_A<= DATA1;
					Adder_B<= not(DATA2);
					Cin_Adder<= '1';
                    comp_in<=Adder_out;
			
          								            

	when NOP =>	
    when others => null;
    end case; 
  end process P_ALU;

P_ALU_compare: process (FUNC, DATA1, DATA2,Cout_Adder,Adder_out,comp_in)
  
  
  begin
    case FUNC is
	
	when EQ =>		comp_in<=DATA1;
					Cout_sig<=Cout_Adder;
					
					
	when NE =>		comp_in<=DATA1;
					Cout_sig<=Cout_Adder;
					

	when LT =>		comp_in<=Adder_out;	
					Cout_sig<=Cout_Adder;
					

	when GT =>      comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
					
		
	when LE =>	    comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
					

	when GE=>		comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
   when SNE =>
				    comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
				
	when SGE =>
					comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
    WHEN SGEU =>
				    comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
	when SLE =>
					comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
	when SGT =>
					comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
    when SLT =>
					comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
	when SLEU =>
					comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
	when SGTU =>
					comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
    when SLTU =>
					comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
	when SEQ =>	
					comp_in<=Adder_out;
					Cout_sig<=Cout_Adder;
   
					

    when others => null;
    end case; 
  end process P_ALU_compare;

P_ALU_out: process (FUNC,Mul_out,DATA1,DATA2,Shifter_out,Adder_out,Logic_out,EQ_sig,NE_sig,LT_sig,GT_sig,LE_sig,GE_sig,A_UNS,B_UNS)
  
  variable temp : std_logic_vector(NUM_BIT-1 downto 0);
  
  begin
    
    temp := (others=> '0');
    case FUNC is

    when EQ =>	    SEL_BRANCH<=EQ_sig;
					DATA_OUT<= Adder_out;
					
	when NE =>		SEL_BRANCH<=NE_sig;
					DATA_OUT<= Adder_out;

	when RSL =>	DATA_OUT<=Shifter_out;
				SEL_BRANCH <= '0';
    when MULT => DATA_OUT<= Mul_out;
				SEL_BRANCH <= '0';
     when MULTU => DATA_OUT<= Mul_out;
				SEL_BRANCH <= '0';
    when LSL =>DATA_OUT<=Shifter_out;
				SEL_BRANCH <= '0';
	when RSA =>DATA_OUT<=Shifter_out;
				SEL_BRANCH <= '0';
	when ADD =>DATA_OUT<= Adder_out;
				SEL_BRANCH <= '0';
    when ADDU => DATA_OUT<= Adder_out;
				SEL_BRANCH <= '0';
	when SUB =>		DATA_OUT<= Adder_out;
				SEL_BRANCH <= '0';
     when SUBU =>DATA_OUT<= Adder_out;
				SEL_BRANCH <= '0';
    when J =>		DATA_OUT<= Adder_out;
					SEL_BRANCH<='1';
	when JAL =>		DATA_OUT<= Adder_out;
					SEL_BRANCH<='1';
	 when JALR=>	DATA_OUT<= Adder_out;
					SEL_BRANCH<='1';
	when JR=>	DATA_OUT<= Adder_out;
					SEL_BRANCH<='1';
	when LW  =>		DATA_OUT<= Adder_out;
				SEL_BRANCH <= '0';
	when SW  =>		DATA_OUT<= Adder_out;
				SEL_BRANCH <= '0';

    when SNE =>     DATA_OUT<= "0000000000000000000000000000000" & NE_sig;
				SEL_BRANCH <= '0';
	when SGT => 	DATA_OUT<= "0000000000000000000000000000000" & GT_sig;
				    SEL_BRANCH <= '0';	
	when SGTU => 	DATA_OUT<= "0000000000000000000000000000000" & GT_sig;
				    SEL_BRANCH <= '0';		
	when SLT => 	DATA_OUT<= "0000000000000000000000000000000" & LT_sig;
				    SEL_BRANCH <= '0';		
	when SLTU => 	DATA_OUT<= "0000000000000000000000000000000" & LT_sig;
				    SEL_BRANCH <= '0';	
    when SGE =>     DATA_OUT<= "0000000000000000000000000000000" & GE_sig;
				    SEL_BRANCH <= '0';
    when SGEU =>  DATA_OUT<=   "0000000000000000000000000000000" & GE_sig;
				   SEL_BRANCH <= '0';

    when SLE =>     DATA_OUT<= "0000000000000000000000000000000" & LE_sig;
				SEL_BRANCH <= '0';
    when SLEU=>     DATA_OUT<= "0000000000000000000000000000000" & LE_sig;
				SEL_BRANCH <= '0';
    when SEQ =>	  DATA_OUT<= "0000000000000000000000000000000" & EQ_sig;
				SEL_BRANCH <= '0';   
	when AND_op =>	DATA_OUT<= Logic_out;
				SEL_BRANCH <= '0';
	when OR_op =>   DATA_OUT<= Logic_out;
				SEL_BRANCH <= '0';
	when XOR_op =>  DATA_OUT<= Logic_out;
				SEL_BRANCH <= '0';
	when NOP => NULL;
				SEL_BRANCH <= '0';
	when others =>		
					DATA_OUT<=Adder_out;
				SEL_BRANCH <= '0';	
	
    end case; 
  end process P_ALU_out;




end Beh;
