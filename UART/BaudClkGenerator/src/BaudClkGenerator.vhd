
library ieee;
use ieee.std_logic_1164.all;

entity BaudClkGenerator is
	generic 
	(
		 NUMBER_OF_CLOCKS    : integer := 10;
		 SYS_CLK_FREQ        : integer := 50000000;
		 BAUD_RATE           : integer := 115200;
		 IS_Rx					: boolean -- true if baudclkgenerator used for Receiver module, otherwise false
	);
	port
	(
		 Clk : in std_logic; -- 50MHz
		 Rst : in std_logic;
		 
		 Start   : in std_logic;
		 BaudClk : out std_logic;
		 ready   : out std_logic
	);
end entity;

architecture rtl of BaudClkGenerator is

constant BIT_PERIOD         : integer := SYS_CLK_FREQ / BAUD_RATE;
constant HALF_BIT_PERIOD	 :	integer := BIT_PERIOD / 2;
signal BitPeriodCounter     : integer range 0 to BIT_PERIOD;
signal ClocksLeft           : integer range 0 to NUMBER_OF_CLOCKS;


begin

	-- For reciever : we need to have baud_clk on the midlle of the bit period
	-- 					that's why instead of BitPeriodCounter = BIT_PERIOD 
	-- 					we will use BitPeriodCounter = BIT_PERIOD / 2
    BitPeriodProcess:process(Rst,Clk)
    begin
        if Rst = '1' then
            BaudClk <= '0';
            BitPeriodCounter <= 0;
        elsif rising_edge(clk) then
            
            if ClocksLeft > 0 then
            -- if ClocksLeft > 0 then :
                if BitPeriodCounter = BIT_PERIOD then
                    BaudClk <= '1';
						  BitPeriodCounter <= 0; 
                else
                    BaudClk <= '0';
                    BitPeriodCounter <= BitPeriodCounter + 1;
                end if;
            else
            -- if ClocksLeft is equal to 0 then :
                BaudClk <= '0';
					 if IS_Rx = true then
					 -- In the case of receiver mode, we load the BitPeriodCounter with BIT_PERIOD / 2 so that the first 
					 -- BaudClk pulse occures 1/2 bit period after assering the Start port.
						BitPeriodCounter <= HALF_BIT_PERIOD; 
				    else
					 -- In the case of transmitter mode, we load the BitPeriodCounter with 0 so that the first 
					 -- BaudClk pulse occures 1 bit period after assering the Start port.
						BitPeriodCounter <= 0;
            			end if; 
        	end if;
	end if;
    end process;
    
    BeginOrEndBaudClock:process(Rst,Clk)
    begin
        if Rst = '1' then
            ClocksLeft <= 0;
        elsif rising_edge(clk) then
            if Start = '1' then
                ClocksLeft <= NUMBER_OF_CLOCKS;
            elsif BaudClk = '1' then
                ClocksLeft <= ClocksLeft - 1;
            end if;
        end if;
    end process;
    
    
    GenerateReady:process(Rst,Clk)
    begin
        if Rst = '1' then
            Ready <= '1';
        elsif rising_edge(clk) then
            if Start = '1' then
                Ready <= '0';
            elsif ClocksLeft = 0 then
                Ready <= '1';
            end if;
        end if;
    end process;
end rtl;
