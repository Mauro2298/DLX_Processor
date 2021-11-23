library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity CarryGeneratorBlock is
generic (NBIT : integer := 32);
port(	A : in std_logic_vector(NBIT-1 downto 0);
		B : in std_logic_vector(NBIT-1 downto 0);
		Cin: in std_logic;
		Cout : out std_logic_vector(NBIT/4-1 downto 0);
		Cout_P4_adder : out std_logic
	);
end CarryGeneratorBlock;

architecture Beh of CarryGeneratorBlock is

type PGNetwork is array (NBIT-1 downto 0) of std_logic_vector(1 downto 0);
type PandG is array (NBIT-1 downto 0) of std_logic_vector(NBIT/2 downto 0);


component GenerateBlock 
port( Prev_G : in std_logic;
 	  Current_G : in std_logic;
	  Current_P: in std_logic;
	  Gen_Out: out std_logic);
end component;

component PropagateGenerateBlock 
port( Prev_G : in std_logic;
	  Prev_P : in std_logic;
 	  Current_G : in std_logic;
	  Current_P: in std_logic;
	  P_Out: out std_logic;
	  Gen_Out: out std_logic);
end component;

signal PGN : PGNetwork;
signal Propagate_Stage : PandG;
signal Generate_Stage : PandG;
constant Rows : integer := integer(ceil(log2(real(NBIT))));


begin


PGNGenerate : for i in 0 to NBIT-1 generate
	rigaA : if i = 0 generate
	PGN(i)(0) <= A(i) xor B(i); --Propagate
	PGN(i)(1) <= (A(i) and B(i)) or ((A(i) xor B(i)) and Cin); --Generate
	end generate;
	rigaB :if i > 0 generate
	PGN(i)(0) <= A(i) xor B(i); --Propagate
	PGN(i)(1) <= A(i) and B(i); --Generate
	end generate;
end generate; 

GenerateRows : for i in 0 to Rows-1 generate
		RigaL2 : if i <= 2 generate -- This generate is for the first 3 rows after the PGN is created since they are always the same
		ForRigaL2 : for j in 0 to NBIT/(2**(i+1))-1 generate
			CheckRiga: if i = 0 generate
				RigaS0:	if j = 0 generate
							GenA1 : GenerateBlock
									port map(PGN(j)(1), PGN(j+1)(1), PGN(j+1)(0), Generate_Stage(i)(j));
						end generate;
				RigaG0: if j > 0 generate
							PropA1 : PropagateGenerateBlock
								port map(PGN(j*2)(1), PGN(j*2)(0), PGN(j*2+1)(1), PGN(j*2+1)(0), Propagate_Stage(i)(j-1), Generate_Stage(i)(j));
						end generate;
						end generate;
				CheckRiga_2: if i > 0 generate
						
				RigaS0_2:	if j = 0 generate
							GenA1_2 : GenerateBlock
									port map(Generate_Stage(i-1)(0), Generate_Stage(i-1)(1), Propagate_Stage(i-1)(0), Generate_Stage(i)(j));
						end generate;
				RigaG0_2: if j > 0 generate
							PropA1_2 : PropagateGenerateBlock
								port map(Generate_Stage(i-1)(j*2),Propagate_Stage(i-1)(j*2-1),Generate_Stage(i-1)(j*2+1),Propagate_Stage(i-1)(j*2), Propagate_Stage(i)(j-1), Generate_Stage(i)(j));
						end generate;
						end generate;
					end generate;
				end generate;
		Riga4 : if i = 3 generate
			Carry_Gen : for j in 0 to 1 generate
				CG : GenerateBlock
					port map(Generate_Stage(i-1)(0), Generate_Stage(i-2+j)(2-j), Propagate_Stage(i-2+j)(1-j), Generate_Stage(i)(j));
			end generate Carry_Gen;
			Prop_Gen : for j in 0 to 4*Rows-19 generate -- 4*Rows-19 number of propagate that we need to generate depending on the number of bits
				Even_index : if j = 0 or j = 2 or j = 4 generate
					PG1 : PropagateGenerateBlock
						port map(Generate_Stage(i-1)(j+2), Propagate_Stage(i-1)(j+1), Generate_Stage(i-2)(2*j+6), Propagate_Stage(i-2)(2*j+5), Propagate_Stage(i)(j), Generate_Stage(i)(j+2));
				end generate Even_Index;
				Odd_index : if j = 1 or j = 3 or j = 5 generate
					PG2 : PropagateGenerateBlock
						port map(Generate_Stage(i-1)(j+1), Propagate_Stage(i-1)(j), Generate_Stage(i-1)(j+2), Propagate_Stage(i-1)(j+1), Propagate_Stage(i)(j), Generate_Stage(i)(j+2));
				end generate Odd_Index;
			end generate Prop_Gen;
		end generate Riga4;	

	Riga5 : if i = 4 generate
		Carry_Gen_2 : for j in 0 to 1 generate
			CG2 : GenerateBlock
					port map(Generate_Stage(i-1)(1), Generate_Stage(i-(3-j))(4-2*j), Propagate_Stage(i-(3-j))(3-2*j), Generate_Stage(i)(j));
		end generate Carry_Gen_2;
			CG3 : GenerateBlock -- I separate the last 2 since they don't match any index expression
					port map(Generate_Stage(i-1)(1), Generate_Stage(i-1)(2), Propagate_Stage(i-1)(0), Generate_Stage(i)(2));
			CG4 : GenerateBlock 
					port map(Generate_Stage(i-1)(1), Generate_Stage(i-1)(3), Propagate_Stage(i-1)(1), Generate_Stage(i)(3));
		Prop_Gen_2 : if Rows > 5 generate -- I check if i'm not at the last row, in case i stop
			P_Gen_2 : for j in 0 to 1 generate
			PG3 : GenerateBlock
					port map(Generate_Stage(i-1)(4), Generate_Stage(i-(3-j))(8-2*j), Propagate_Stage(i-(3-j))(8-2*j), Generate_Stage(i)(j+4));
		end generate P_Gen_2;
			PG4 : PropagateGenerateBlock -- I separate the last 2 since they don't match any index expression
					port map(Generate_Stage(i-1)(4),Propagate_Stage(i-1)(2), Generate_Stage(i-1)(6), Propagate_Stage(i-1)(4), Propagate_Stage(i)(2),Generate_Stage(i)(6));
			PG5 : PropagateGenerateBlock 
					port map(Generate_Stage(i-1)(4),Propagate_Stage(i-1)(2), Generate_Stage(i-1)(7), Propagate_Stage(i-1)(5), Propagate_Stage(i)(3),Generate_Stage(i)(7));
		end generate Prop_Gen_2;
	end generate Riga5;
	
	Riga6: if i = 5 generate
		Carry_Gen_3 : for j in 0 to 1 generate -- first 2 carry's
			CG5 : GenerateBlock
				port map(Generate_Stage(i-1)(3), Generate_Stage(4-j)(8-4*j), Propagate_Stage(4-j)(7-4*j), Generate_Stage(i)(j));
		end generate Carry_Gen_3;
		Carry_Gen_4 : for j in 0 to 1 generate -- second 2 carry's
			CG6 : GenerateBlock
				port map(Generate_Stage(i-1)(3), Generate_Stage(i-2)(4+j), Propagate_Stage(i-2)(2+j), Generate_Stage(i)(j+2));
		end generate Carry_Gen_4;
		Carry_Gen_5 : for j in 0 to 3 generate -- last 4 carry's
			CG7 : GenerateBlock
				port map(Generate_Stage(i-1)(3), Generate_Stage(i-1)(4+j), Propagate_Stage(i-1)(j), Generate_Stage(i)(j+4));
		end generate Carry_Gen_5;
	end generate Riga6;	


end generate;

		
Cout <= (0 => Cin, 1 => Generate_Stage(1)(0)) when Rows = 3 else
		(0 => Cin, 1 => Generate_Stage(1)(0), 2 => Generate_Stage(2)(0), 3 => Generate_Stage(3)(0)) when Rows = 4 else
		(0 => Cin, 1 => Generate_Stage(1)(0), 2 => Generate_Stage(2)(0), 3 => Generate_Stage(3)(0), 4 => Generate_Stage(3)(1), 5 => Generate_Stage(4)(0), 6 => Generate_Stage(4)(1), 7 => Generate_Stage(4)(2)) when Rows = 5 else
		(0 => Cin, 1 => Generate_Stage(1)(0), 2 => Generate_Stage(2)(0), 3 => Generate_Stage(3)(0), 4 => Generate_Stage(3)(1), 5 => Generate_Stage(4)(0), 6 => Generate_Stage(4)(1), 7 => Generate_Stage(4)(2), 8 => Generate_Stage(4)(3), 9 => Generate_Stage(5)(0), 10 => Generate_Stage(5)(1), 11 => Generate_Stage(5)(2), 12 => Generate_Stage(5)(3), 13 => Generate_Stage(5)(4), 14 => Generate_Stage(5)(5), 15 => Generate_Stage(5)(6));

Cout_P4_adder <= Generate_Stage(Rows-1)(0) when Rows < 4 else
				Generate_Stage(3)(1) when Rows = 4 else
				Generate_Stage(4)(3) when Rows = 5 else
				Generate_Stage(5)(7);



end architecture;
