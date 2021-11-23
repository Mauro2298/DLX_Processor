library ieee;
use ieee.std_logic_1164.all;

entity OR_Zero_Det is
	generic (NUM_BIT : integer := 32);
	port (
			A : in std_logic_vector(NUM_BIT-1 downto 0);
			Y : out std_logic
	);
end entity;


architecture Beh of OR_Zero_Det is
constant C : std_logic_vector(NUM_BIT-1 downto 0) := (others => '0');

begin
	process(A)
		begin
			if C = A then
				Y <= '1';
			else
				Y <= '0';
			end if;
		end process;






	--signal Or_Res : std_logic;
--	begin
	--	process(A)
		--	variable tmp : std_logic :='0';
			--begin
			--	for i in NUM_BIT-1 downto 0 loop
			--		tmp := tmp or A(i);
			--	end loop;
			--	Or_Res <= tmp;
	--	end process;
	--Y <= not(Or_Res);
end Beh;

