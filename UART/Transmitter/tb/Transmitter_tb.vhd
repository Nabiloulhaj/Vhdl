library ieee;
use ieee.std_logic_1164.all;


entity Transmitter_tb is
	generic(
		N				 :	integer	:= 8;
		SYS_CLK_FREQ : integer:= 50000000;
		BAUD_RATE    : integer := 115200 -- bit period 8,7 us
	);
end entity;


architecture rtl of Transmitter_tb is


component Transmitter is
	generic(
		N				 :	integer	:= 8;
		SYS_CLK_FREQ : integer:= 50000000;
		BAUD_RATE    : integer := 115200
	);
	port(
		clk		  :		in		std_logic;
		rst		  :		in		std_logic;

		Txstart  	:		in		std_logic;
		TxData	   :		in		std_logic_vector(N-1 downto 0);
		TxDone	   :	   out	std_logic;
		uart_tx_pin	:	   out	std_logic
	);
	
end component;

signal clks 			: std_logic := '0';
signal rsts 			: std_logic;
signal Txstarts		: std_logic;
signal TxDatas			: std_logic_vector(N-1 downto 0);
signal TxDones			: std_logic;
signal uart_tx_pins	: std_logic;



begin

	UUT : Transmitter 
		generic map(N,SYS_CLK_FREQ,BAUD_RATE)
		port map(clks,rsts,Txstarts,TxDatas,TxDones,uart_tx_pins);
		
	
	clks <= not(clks) after 10ns; -- generating clock signal

	test_ptocess:process
	begin
	
		rsts <= '1';
		Txstarts <= '0';
		TxDatas <= (others => '0');
		wait for 100ns;
		rsts <= '0';
		wait for 100ns;
		
		wait until rising_edge(clks);
		Txstarts <= '1'; -- Load_enable
		TxDatas <= x"AA";
		
		wait until rising_edge(clks);
		Txstarts <= '0';
		TxDatas <= (others => '0');
		
		
		wait;
		
		
	end process;
	

end rtl;