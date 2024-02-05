library ieee;
use ieee.std_logic_1164.all;


entity TopLevelModule is
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

end entity;


architecture rtl of TopLevelModule is

component Receiver is
	generic(
		N				 :	integer	:= 8;
		SYS_CLK_FREQ : integer  := 50000000;
		BAUD_RATE    : integer  := 115200
	);
	port(
		clk			:	in	std_logic;
		rst			:	in	std_logic;
		RxIRQClear	:	in std_logic; -- ?? TxStart?? IDLE??
		UARTRx		:	in std_logic; -- Asynchronous signal transmitted by comm port of our pc
		RxIRQ			:	out std_logic;
		RxData		:	out std_logic_vector(N-1 downto 0)
	);

end component;

component Transmitter is
	generic(
		N				 :	integer	:= 8;
		SYS_CLK_FREQ : integer  := 50000000;
		BAUD_RATE    : integer  := 115200
	);
	port(
		clk		:		in		std_logic;
		rst		:		in		std_logic;

		Txstart	:		in		std_logic;
		TxData	:		in		std_logic_vector(N-1 downto 0);
		TxDone	:		out	std_logic;
		uart_tx_pin	:	out	std_logic
		
	);
	
end component;

type SMtype is (IDLE, START_TRANSMITTER);
signal SM : SMtype;
signal TxStart : std_logic;
signal TxDone  : std_logic;
signal RxIRQ   : std_logic;
signal RxData 	: std_logic_vector(N-1 downto 0);


begin

	Transmitter_unit : Transmitter
	generic map(N,SYS_CLK_FREQ,BAUD_RATE)
	port map(clk,rst,TxStart,RxData,TxDone,uart_tx_pin);
	
	Receiver_unit : Receiver
	generic map(N,SYS_CLK_FREQ,BAUD_RATE)
	port map(clk,rst,Txstart,uart_rx_pin,RxIRQ,RxData);
	
	
	StateMachineProcess:process(Rst, Clk)
    begin
        if Rst = '1' then
            sm <= IDLE;
            TxStart <= '0';
        elsif rising_edge(CLk) then
        
            case sm is
                
                when IDLE =>
                    if RxIRQ = '1' and TxDone = '1' then
                        sm <= START_TRANSMITTER;
                        TxStart <= '1';
                    end if;
                    
                when START_TRANSMITTER =>
                    TxStart <= '0';
                    sm <= IDLE;
                    
                when others =>
                    sm <= IDLE;
                    
            end case;
            
        end if;
    end process;

	
end rtl;