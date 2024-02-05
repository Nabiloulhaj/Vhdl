library ieee;
use ieee.std_logic_1164.all;

entity Serialiser_Shift_register is -- PISO
	generic(
		N					: integer	:= 8;
		DEFAULT_STATE  : std_logic :='1'
	);

	port(
		clk		:	in	std_logic;
		rst		:	in std_logic;
		Shift_en	:	in std_logic;
	   load_en	:	in	std_logic;
		Din		:	in std_logic_vector(N-1 downto 0);
		Dout		:	out std_logic
	);
end entity;

architecture rtl of Serialiser_Shift_register is

signal temp : std_logic_vector(N-1 downto 0);

begin
	 
	dout <= temp(0);
	
	serialiser_process:process(rst, clk)
	begin
		if rst = '1' then
			temp <= (others => DEFAULT_STATE);
		elsif rising_edge(clk) then
			if load_en = '1' then
				temp <= Din;
			elsif Shift_en = '1' then
				temp <= DEFAULT_STATE & temp(temp'left downto 1);
			end if;
		end if;
	
	end process;


end rtl;