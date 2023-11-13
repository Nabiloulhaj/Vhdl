library ieee;
use ieee.std_logic_1164.all;

entity State_Machine_Project is
port
(
	arst		 : in std_logic; -- From the reset button (ACTIVE LOW)
	clk	 	 : in std_logic; -- 50MHz
	sw			 : in std_logic_vector(2 downto 0);
	led		 : out std_logic_vector(2 downto 0)
);
end entity;

architecture rtl of State_Machine_Project is

component PLL is
	port (
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'; --   reset.reset
		outclk_0 : out std_logic;        -- outclk0.clk
		locked   : out std_logic         --  locked.export
	);
end component;

type StateType is (STATE1, STATE2, STATE3);

signal StateSignal 				 : StateType;
signal clk_25MHz, clk_12_5MHz, is_locked	 : std_logic;

begin
	
	PLL1: PLL 
	port map (
		refclk   => clk,  --  
		rst      => not(arst), --  the reset from pll is waiting 1 and reset from the board is active low
		outclk_0 => clk_25MHz,        -- outclk0.clk
		locked   => is_locked         --  locked.export
	);

	PLL2: PLL
	port map (
		refclk   => clk_25MHz,  --  
		rst      => not(arst), --  the reset from pll is waiting 1 and reset from the board is active low
		outclk_0 => clk_12_5MHz,        -- outclk0.clk
		locked   => is_locked         --  locked.export
	);

	process1:process(arst, clk_25MHz) is
	begin
		if arst = '0' then
			StateSignal <= STATE1;
			led <= "111"; --Disables all leds
		elsif rising_edge(clk) then
			case StateSignal is
			
				when STATE1 =>
					led(0) <= '0'; -- ON (ACTIVE LOW)
					led(1) <= '1'; -- OFF
					led(2) <= '1'; -- OFF
					-- led = "110" ;
					
					if sw(0) = '0' then
						StateSignal <= STATE2;
					end if;
					
				when STATE2 =>
					led(0) <= '1'; -- OFF
					led(1) <= '0'; -- ON
					led(2) <= '1'; -- OFF
					-- led = "101" ;
					
					if sw(1) = '0' then
						StateSignal <= STATE3;
					end if;
					
				when STATE3 =>
					led(0) <= '1'; -- OFF
					led(1) <= '1'; -- OFF
					led(2) <= '0'; -- ON
					-- led = "011" ;
					
					if sw(2) = '0' then
						StateSignal <= STATE1;
					end if;
					
				when others => 
					StateSignal <= STATE1; -- Protecting ourselves for any undesirable state (DEFAULT STATE)
				
			end case;
			
			
		end if;

	end process;



end rtl;
