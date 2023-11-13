library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftRegisterChain is
	generic( 
		CHAIN_LENGTH : integer := 4
	);
	port(
		clk	:	in	std_logic;
		rst	:	in	std_logic;
		en		:	in std_logic;
		Din	:	in std_logic;
		Dout	: 	out std_logic_vector(CHAIN_LENGTH-1 downto 0)
	);
end entity;

architecture rtl of ShiftRegisterChain is
begin
	shiftregisterprocess: process(rst,clk)
	begin
		if rst ='1' then
			Dout <= (others =>'0');
		elsif rising_edge(clk) then
			if en ='1' then
				Dout <= Din & Dout(Dout'left downto 1);
			end if;
		end if;
	end process;
end rtl;
 
