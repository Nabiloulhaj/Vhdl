library ieee;
use ieee.std_logic_1164.all;

-- we need to make carefull that baudclk and UARTRx(async) are not syncronized,
-- that's why need to make sure that the baudclk signal appear on the middle of bit_period
-- we will write a process for that falling_edge_detect

entity Receiver is
	generic(
		N				 :	integer	:= 8;
		SYS_CLK_FREQ : integer  := 50000000;
		BAUD_RATE    : integer  := 115200
	);
	port(
		clk			:	in	std_logic;
		rst			:	in	std_logic;
		RxIRQClear	:	in std_logic;
		UARTRx		:	in std_logic; -- Asynchronous signal transmitted by comm port of our pc
		RxIRQ			:	out std_logic; -- ACKNOWLEDGMENT
		RxData		:	out std_logic_vector(N-1 downto 0)
	);

end entity;


architecture rtl of Receiver is

COMPONENT Synchroniser is
	generic(
		idle_state : std_logic :='1'
	);
	
	port(
		clk			:	in	std_logic;
		rst			:	in	std_logic;
		async			:	in	std_logic; -- BIT INPUT FOR RECIEVER IN UART
		synced		:	out std_logic
	);
	
end COMPONENT;

COMPONENT BaudClkGenerator is
	generic 
	(
		 NUMBER_OF_CLOCKS    : integer := 10;
		 SYS_CLK_FREQ        : integer := 50000000;
		 BAUD_RATE           : integer := 115200;
		 IS_Rx					: boolean
	);
	port
	(
		 Clk : in std_logic; -- 50MHz
		 Rst : in std_logic;
		 
		 Start   : in std_logic;
		 BaudClk : out std_logic;
		 ready   : out std_logic
	);
end COMPONENT;

COMPONENT ShiftRegister is -- SIPO
	generic (
		N	: integer := 8;
		shift_direction :	character:= 'R' -- 'L' shift_left / 'R' shift_right
	);
	port(
		clk			: in	std_logic;
		rst			: in	std_logic;
		
		shift_en		: in	std_logic;
		din			: in	std_logic;
		dout			: out	std_logic_vector(N-1 downto 0)
	);	
end COMPONENT;

type sm_type is (IDLE, COLLECT_RXDATA, ASSERT_IRQ);

signal state 							: sm_type;
signal BaudClk							: std_logic;
signal UARTRx_sync					: std_logic;
signal start							: std_logic;
signal ready							: std_logic;
signal fallingedge					: std_logic;
signal UARTRx_sync_delayed			: std_logic;


begin

	Synchroniser_unit : Synchroniser
	generic map('1')
	port map(clk,rst,UARTRx,UARTRx_sync);
	
	ShiftRegister_unit : ShiftRegister
	generic map(N,'R')
	port map(clk,rst,BaudClk,UARTRx_sync,RxData);
	
	BaudClkGenerator_unit : BaudClkGenerator
	generic map(N +1,SYS_CLK_FREQ,BAUD_RATE,true) -- we will capture start and data bit
	port map(clk,rst,Start,BaudClk,ready);
	
	falling_edge_detect : process(clk,rst) -- to start baudclk_generator
	
	begin
		if rst = '1' then
			fallingedge <= '0';
			UARTRx_sync_delayed <= '1';
		elsif rising_edge(clk) then
			UARTRx_sync_delayed <= UARTRx_sync;
			
			if UARTRx_sync = '0' and UARTRx_sync_delayed = '1' then
				fallingedge <= '1';
			else
				fallingedge <= '0';
			end if;
		end if;
	end process;
	
	RX_SatetMachine : process(clk,rst) -- to start baudclk_generator
	begin
		if rst = '1' then
			RXIRQ <= '0'; -- ACKNOWLEDGMENT
			state <= IDLE;
			start <= '0';
		elsif rising_edge(clk) then
			if RxIRQClear = '1' then 
				RXIRQ <= '0';
			end if;
			
			case state is
				when IDLE => 
					if fallingedge = '1' then
						start <= '1'; -- this is how we ensure to start only on first falling edge
					else
						start <= '0';
					end if;
					
					if ready <= '0' then
						state <= COLLECT_RXDATA;
					end if;
					
				when COLLECT_RXDATA =>
					start <= '0'; -- this is how we ensure to start only on first falling edge
					if ready = '1' then 
						state <= ASSERT_IRQ;
					end if;
				when ASSERT_IRQ =>
					RXIRQ <= '1';
					state <= IDLE;
				when others	=> state <= IDLE;
			end case;
			
		end if;
	
	end process;
	
	
end rtl;