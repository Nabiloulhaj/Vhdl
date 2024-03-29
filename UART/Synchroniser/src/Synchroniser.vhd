library ieee;
use ieee.std_logic_1164.all;


entity Synchroniser is
	generic(
		idle_state : std_logic :='1'
	);
	
	port(
		clk			:	in	std_logic;
		rst			:	in	std_logic;
		async			:	in	std_logic; -- BIT INPUT FOR RECIEVER IN UART
		synced		:	out std_logic
	);
	
end entity;


architecture rtl of Synchroniser is

signal temp: std_logic_vector(1 downto 0);

begin

	synced <= temp(1);
	
	Synchroniser_process:process(clk,rst) is
	begin
		if rst = '1' then
			temp <= (others => idle_state);
		elsif rising_edge(clk) then
			temp(0) <= async;
			temp(1) <= temp(0);
			-- temp <= temp(0) & async; 
		end if;
		
	end process;


end rtl;