library ieee;
use ieee.std_logic_1164.all;


entity Transmitter is
	generic(
		N				 :	integer	:= 8;
		SYS_CLK_FREQ : integer:= 50000000;
		BAUD_RATE    : integer := 115200
	);
	port(
		clk		:		in		std_logic;
		rst		:		in		std_logic;

		Txstart	:		in		std_logic;
		TxData	:		in		std_logic_vector(N-1 downto 0);
		TxDone	:		out	std_logic;
		uart_tx_pin	:	out	std_logic
		
	);
	
end entity;


architecture rtl of Transmitter is


---------------

component Serialiser_Shift_register is
	generic(
		N					: integer	:= 8;
		DEFAULT_STATE  : std_logic :='1'
	);

	port(
		clk		:	in	std_logic;
		rst		:	in std_logic;
		Shift_en	:	in std_logic; -- BAUD_CLOCK
	   load_en	:	in	std_logic; -- TxStart
		Din		:	in std_logic_vector(N-1 downto 0);
		Dout		:	out std_logic
	);
end component;

-------------------

component BaudClkGenerator is
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
end component;

---------------------

signal TxPacket : std_logic_vector(N+1 downto 0);
signal BaudClk	 : std_logic;

begin

	TxPacket <= '1' & TxData & '0'; -- stop bit(msb) | data | start bit (lsb)

	Serialiser_Shift_register_unit : Serialiser_Shift_register
		generic map(N + 2,'1')
		port map(clk,rst,BaudClk,Txstart,TxPacket,uart_tx_pin);

	BaudClkGenerator_unit : BaudClkGenerator
		generic map(N + 2,SYS_CLK_FREQ,BAUD_RATE,false)
		port map(clk,rst,Txstart,BaudClk,Txdone);

end rtl;