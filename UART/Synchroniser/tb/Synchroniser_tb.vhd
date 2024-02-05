library ieee;
use ieee.std_logic_1164.all;

entity Synchroniser_tb is
	generic(
		idle_state : std_logic :='1'
	);
end entity;

architecture rtl of Synchroniser_tb is

signal	clks			:	std_logic := '0';
signal 	rsts			:	std_logic;
signal	asyncs			:	std_logic;


component Synchroniser is
	generic(
		idle_state : std_logic :='1'
	);
	
	port(
		clk			:	in	std_logic;
		rst			:	in	std_logic;
		async			:	in	std_logic; -- BIT INPUT FOR RECIEVER IN UART 
		synced		:	out std_logic
	);
end component;

begin
	
	clks <= not(clks) after 10ns;
	
	UUT: Synchroniser
	generic map(idle_state)
	port map(clks,rsts,asyncs);
			
	test_process:process
	begin
		
		rsts <= '1';
		asyncs <= '1';
		wait for 100ns;
		rsts <= '0';
		wait for 100ns;
		wait for 3ns; -- I want an asyncronous input 
		asyncs <= '0';
		
		wait;
		
		
	end process;


end rtl;