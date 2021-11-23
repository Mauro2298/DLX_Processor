library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.Types.all;

entity hazard_detection_unit is
	port( RST         : in std_logic;
		  CLK         : in std_logic;
		  ADD_RS1     : in std_logic_vector(4 downto 0); 
		  ADD_RS2     : in std_logic_vector(4 downto 0); 
		  ADD_WR_1      : in std_logic_vector(4 downto 0); 
		  ADD_WR_2      : in std_logic_vector(4 downto 0); 
		  ADD_WR_1_I      : in std_logic_vector(4 downto 0); 
		  ADD_WR_2_I      : in std_logic_vector(4 downto 0); 
	      opCode		  : in std_logic_vector(5 downto 0);
		  Bubble      : out std_logic); -- Bubble signal, raised to '1' to stall the pipeline
        
end hazard_detection_unit;

architecture beh of hazard_detection_unit is
signal Bubble_sig: std_logic := '0';
begin

	Bubble <= Bubble_sig;
	process(RST, ADD_RS1, ADD_RS2, ADD_WR_1, ADD_WR_2, CLK)
	
	variable Count_dec, Count_exe, Stall_decode, Stall_execute : integer := 0;
	begin
               
		if(RST = '0') then
		   Bubble_sig <= '0';
		else	
          if(CLK = '1' and CLK'event) then 
				if(Bubble_sig = '1' and Stall_decode = 1) then
					Count_dec := Count_dec + 1;
				elsif(Bubble_sig = '1' and Stall_execute = 1) then
					Count_exe := Count_exe + 1;
				end if;

				if(Count_exe = 0 and Count_dec = 0) then
			----FIRST BLOCK R/I
			if(Stall_execute = 0) then
				if(opCode = "00000") then
				    if((ADD_WR_1 /= "00000")) then      
						if((ADD_WR_1 = ADD_RS1)or (ADD_WR_1 = ADD_RS2)) then 
	 
							Bubble_sig <= '1';
							Stall_decode := 1;
							Count_dec := 0;
						else
							Bubble_sig <= '0';
						end if;
					end if;
				else
					if((ADD_WR_1_I /= "00000")) then      
						if((ADD_WR_1_I = ADD_RS1)or (ADD_WR_1_I = ADD_RS2)) then 
	 
							Bubble_sig <= '1';
							Stall_decode := 1;
							Count_dec := 0;
						else
							Bubble_sig <= '0';
						end if;
					end if;
				end if;
			end if;
			--END FIRST BLOCK


			--SECOND BLOCK
			if(Stall_decode = 0) then
				if(opCode = "00000") then
				    if((ADD_WR_2 /= "00000")) then      
						if((ADD_WR_2 = ADD_RS1)or (ADD_WR_2 = ADD_RS2)) then 
	 
							Bubble_sig <= '1';
							Stall_execute := 1;
							Count_exe := 0;
						else
							Bubble_sig <= '0';
						end if;
					end if;
				else
					if((ADD_WR_2_I /= "00000")) then      
						if((ADD_WR_2_I = ADD_RS1)or (ADD_WR_2_I = ADD_RS2)) then 
	 
							Bubble_sig <= '1';
							Count_exe := 0;
							Stall_execute := 1;
						else
							Bubble_sig <= '0';
						end if;
					end if;
				end if;
			end if;
			--END SECOND BLOCK
			
			end if; 
			if(Count_dec /= 0 or Count_exe /= 0) then 
				if(Count_dec = 3) then
					Bubble_sig <= '0';
					Count_dec := 0;
					Stall_decode := 0;
				elsif(Count_exe = 3) then
					Bubble_sig <= '0';
					Count_exe := 0;
					Stall_execute := 0;
				end if;
			end if;
end if;
			
			end if;
			
	end process;
end beh;
