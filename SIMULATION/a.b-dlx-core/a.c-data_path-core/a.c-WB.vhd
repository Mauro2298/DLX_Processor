library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Types.all;
use ieee.numeric_std.all;
use work.all;

entity WB is
generic ( DATA_SIZE : integer := 32);
port(
		data_in_WB           : in  std_logic_vector(DATA_SIZE -1 downto 0); 
		alu_out_in_WB		 : in  std_logic_vector(DATA_SIZE -1 downto 0); 
		RD_in_WB,RS2_in_WB   : in  std_logic_vector(4 downto 0);
		
		muxs3,MUX_RS2_WR_sel, MUX_RD_WR_sel		 : in std_logic;

		out_MUX_WR : out std_logic_vector(4 downto 0);
		muxs3_out_WB : out std_logic_vector(DATA_SIZE -1 downto 0)
);
end entity;


architecture beh of WB is
component MUX21_GENERIC is
  generic (NBIT : integer := 32;
           DELAY_MUX: Time := 0 ns);
  Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
  

end component;
signal out_MUX_RS2 : std_logic_vector(4 downto 0);

begin

mux3: MUX21_GENERIC generic map(32, 0 ns)
					port map(A =>data_in_WB, B=>alu_out_in_WB, SEL => muxs3, Y=> muxs3_out_WB);

MUX_RS2_WR: MUX21_GENERIC generic map(5, 0 ns)
					port map(A =>RS2_in_WB, B=>"11111", SEL => MUX_RS2_WR_sel, Y=> out_MUX_RS2);


MUX_RD_WR:  MUX21_GENERIC generic map(5, 0 ns)
					port map(A =>out_MUX_RS2, B=>RD_in_WB, SEL =>MUX_RD_WR_sel, Y=> out_MUX_WR);

end beh;
