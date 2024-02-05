library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity TopLevelModule_tb is
	generic(
		N				 :	integer	:= 8;
		SYS_CLK_FREQ : integer  := 50000000;
		BAUD_RATE    : integer  := 115200
	);

end entity;

architecture rtl of TopLevelModule_tb is

component TopLevelModule is
	generic(
		N				 :	integer	:= 8;
		SYS_CLK_FREQ : integer  := 50000000;
		BAUD_RATE    : integer  := 115200
	);
	port(
		clk			:	in	std_logic;
		rst			:	in	std_logic;
		
		uart_rx_pin :	in std_logic;
		uart_tx_pin :	out std_logic
		
	);

end component;

signal clks 			: std_logic := '0';
signal rsts 			: std_logic;
signal uart_rx_pins 	: std_logic;
signal uart_tx_pins 	: std_logic;
signal TransmittedData	: std_logic_vector(N-1 downto 0);
signal DataTransmittedToPC	: std_logic_vector(N-1 downto 0);


begin

	clks <= not(clks) after 10ns;

	UUT: TopLevelModule
	generic map(N,SYS_CLK_FREQ,BAUD_RATE)
	port map(clks,rsts,uart_rx_pins,uart_tx_pins);
	
	SerialToParallel:process
	
	begin
		-- Waiting for the start bit
		wait until falling_edge(uart_tx_pins);
		
		-- waiting untill the middle of the start bit
		wait for 4.3us;
		
		for i in 0 to N-1 loop
			-- waiting untill the middle of the next bit
			wait for 8.7us;
			-- capture the value of the next bit into TransmittedData
			TransmittedData(i) <= uart_tx_pins;
		end loop;
		
		-- Waiting for the Stop Bit
		wait for 8.7us;
		
		DataTransmittedToPC <= TransmittedData;
		
	end process;
	
	test_process:process
	
		variable TransmitDataVector : std_logic_vector(N-1 downto 0);
		
		procedure TRANSMIT_CHARACTER
		(
			constant TransmitData : in integer
		) is
		begin
			TransmitDataVector := std_logic_vector(to_unsigned(TransmitData,N));
			-- Start Bit 
			uart_rx_pins <= '0';
			wait for 8.7us;
			
			for i in 0 to N-1 loop
				-- Data bits
				uart_rx_pins <= TransmitDataVector(i);
				wait for 8.7us;
			end loop;
			
			-- Stop Bit 
			uart_rx_pins <= '1';
			wait for 8.7us;
			
		end procedure;
		
	begin
		rsts <= '1';
		uart_rx_pins <= '1';
		wait for 100ns;
		rsts <= '0';
		wait for 100ns;
		
		for i in 0 to 255 loop
			TRANSMIT_CHARACTER(i);
		end loop;
		wait;
	end process;

end rtl;