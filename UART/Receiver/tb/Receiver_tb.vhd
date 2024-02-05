library ieee;
use ieee.std_logic_1164.all;

entity Receiver_tb is
	generic(
		SYS_CLK_FREQ        : integer := 50000000;
		BAUD_RATE           : integer := 115200;
		N						  : integer :=8
	);

end entity;

architecture rtl of Receiver_tb is

component Receiver is
	generic(
		SYS_CLK_FREQ        : integer := 50000000;
		BAUD_RATE           : integer := 115200;
		N						  : integer :=8
	);
	port(
		clk			:	in	std_logic;
		rst			:	in	std_logic;
		RxIRQClear	:	in std_logic;
		UARTRx		:	in std_logic; -- Asynchronous signal transmitted by comm port of our pc
		RxIRQ			:	out std_logic;
		RxData		:	out std_logic_vector(N -1 downto 0)
	);

end component;

signal	clks			:	std_logic:='0';
signal	rsts			:	std_logic;
signal	RxIRQClears	:	std_logic;
signal	UARTRxs		:	std_logic; -- Asynchronous signal transmitted by comm port of our pc
signal	RxIRQs		:  std_logic;
signal	RxDatas		:	std_logic_vector(N -1 downto 0);

signal PcData			: std_logic_vector(7 downto 0) := x"AA";

begin 
	
	clks <= not(clks) after 10ns;
	
	UUT: Receiver
	generic map(SYS_CLK_FREQ,BAUD_RATE,N)
	port map(clks,rsts,RxIRQClears,UARTRxs,RxIRQs,RxDatas);
	
	test_process: process
	begin
		rsts <= '1';
		RxIRQClears <= '0';
		UARTRxs <= '1';
		RxIRQs <= '1';
		wait for 100ns;
		rsts <= '0';
		wait for 100ns;
		
		-- Start Bit 
		UARTRxs <= '0';
		wait for 8.7us;
		
		for i in 0 to N-1 loop
			-- Data bits
			UARTRxs <= pcdata(i);
			wait for 8.7us;
		end loop;
		
		-- Stop Bit 
		UARTRxs <= '1';
		wait for 8.7us;
		
		wait for 50ns;
		wait until rising_edge(clks);
		RxIRQClears <= '1';
		wait until rising_edge(clks);
		RxIRQClears <= '0';
		
		
	
		wait;
	end process;


end rtl;