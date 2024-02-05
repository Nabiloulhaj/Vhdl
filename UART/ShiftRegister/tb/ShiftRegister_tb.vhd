library ieee;
use ieee.std_logic_1164.all;


entity ShiftRegister_tb is
	generic (
		N					 : integer := 8;
		shift_direction :	character:= 'R' -- 'L' shift_left / 'R' shift_right
	);
end entity;


architecture rtl of ShiftRegister_tb is


component ShiftRegister is
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
		
		
end component;


signal clks				: std_logic:='0';
signal rsts 			: std_logic;
signal shift_ens		: std_logic;
signal dins				: std_logic;
signal douts			: std_logic_vector(N-1 downto 0);


begin
	
	clks <= not(clks) after 10ns;

	UUT: ShiftRegister
			generic map(N,shift_direction)
			port map(clks,rsts,shift_ens,dins,douts);
			
	test_process:process
	begin
		rsts <= '1';
		shift_ens <= '0';
		dins <= '0';
		wait for 100ns;
		rsts <= '0';
		
		-- RS323  transmitted here is 0x51 --> 0101 0001
		
		dins <= '1';
		wait for 4.3us; -- sampling on half bit period
		wait until rising_edge(clks);
		shift_ens <= '1'; -- should be synchronous  
		wait until rising_edge(clks);
		shift_ens <= '0';
		wait for 4.3us;
		
		dins <= '0';
		wait for 4.3us; -- sampling on half bit period
		wait until rising_edge(clks);
		shift_ens <= '1'; -- should be synchronous  
		wait until rising_edge(clks);
		shift_ens <= '0';
		wait for 4.3us;
		
		dins <= '0';
		wait for 4.3us; -- sampling on half bit period
		wait until rising_edge(clks);
		shift_ens <= '1'; -- should be synchronous  
		wait until rising_edge(clks);
		shift_ens <= '0';
		wait for 4.3us;
		
		dins <= '0';
		wait for 4.3us; -- sampling on half bit period
		wait until rising_edge(clks);
		shift_ens <= '1'; -- should be synchronous  
		wait until rising_edge(clks);
		shift_ens <= '0';
		wait for 4.3us;
		
		dins <= '1';
		wait for 4.3us; -- sampling on half bit period
		wait until rising_edge(clks);
		shift_ens <= '1'; -- should be synchronous  
		wait until rising_edge(clks);
		shift_ens <= '0';
		wait for 4.3us;
		
		dins <= '0';
		wait for 4.3us; -- sampling on half bit period
		wait until rising_edge(clks);
		shift_ens <= '1'; -- should be synchronous  
		wait until rising_edge(clks);
		shift_ens <= '0';
		wait for 4.3us;
		
		dins <= '1';
		wait for 4.3us; -- sampling on half bit period
		wait until rising_edge(clks);
		shift_ens <= '1'; -- should be synchronous  
		wait until rising_edge(clks);
		shift_ens <= '0';
		wait for 4.3us;
		
		dins <= '0';
		wait for 4.3us; -- sampling on half bit period
		wait until rising_edge(clks);
		shift_ens <= '1'; -- should be synchronous  
		wait until rising_edge(clks);
		shift_ens <= '0';
		wait for 4.3us;
		
		
		wait;
	end process;

end rtl;