library IEEE;
use IEEE.std_logic_1164.all;

entity Serialiser is
	generic(
		datawidth : integer
	);
	port(
		clk	:	in		std_logic;
		rst	:	in		std_logic;
		en		:	in		std_logic;
		load	:	in		std_logic;
		Din	:	in		std_logic_vector(datawidth-1 downto 0);
		Dout	:	out	st_logic
	);
end entity;

architecture rtl of Serialiser is
	signal DataRegister : std_logic_vector(datawidth-1 downto 0);
begin
	SerialiserProces : process(rst,clk)
	begin
		if rst='1' then
			DataRegister <= (others => '0');
		elsif rising_edge(clk) then
			if load='0' then
				DataRegister <= Din;
			elsif en='1' then
				DataRegister <= '0' & DataRegister(datawidth-1 downto 1);
			end if;
		end if;
	end process;
	Dout <= DataRegister(0);
end rtl;
			
