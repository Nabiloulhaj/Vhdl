library ieee;
use ieee.std_logic_1164.all;

entity Serialiser_Shift_register_tb is
	generic(
		N					: integer	:= 8;
		DEFAULT_STATE  : std_logic :='1'
	);
end entity;

architecture rtl of Serialiser_Shift_register_tb is

component Serialiser_Shift_register is
	generic(
		N					: integer	:= 8;
		DEFAULT_STATE  : std_logic :='1'
	);
	port(
		clk		:	in	std_logic;
		rst		:	in std_logic;
		Shift_en	:	in std_logic;
	   load_en	:	in	std_logic;
		Din		:	in std_logic_vector(N-1 downto 0);
		Dout		:	out std_logic
	);
end component;

signal	clks		:	std_logic := '0';
signal	rsts		:	std_logic;	
signal	shift_ens:	std_logic;
signal	load_ens	:	std_logic;
signal	Dins		:	std_logic_vector(N-1 downto 0);
signal	Douts		:	std_logic;

begin

	clks <= not(clks) after 10ns; -- generating clock signal

	UUT: Serialiser_Shift_register 
		generic map(N => N, DEFAULT_STATE => DEFAULT_STATE)
		port map(clk => clks, rst => rsts, shift_en => shift_ens,
					 load_en => load_ens, Din => dins, Dout => douts);
	
	test_process: process
	begin
		rsts <= '1';
		shift_ens <= '0';
		load_ens <= '0';
		dins <= (others => '0');
		wait for 100ns;
		rsts <= '0';
		wait for 100ns; 
		
		wait until rising_edge(clks); -- It garantees that opearations below excuted on the rising_edge
		load_ens <= '1';
		dins <= x"AA";
		
		wait until rising_edge(clks);
		load_ens <= '0';
		dins <= (others => '0');
		
		for i in 0 to 7 loop
			wait for 8.7us; -- every bit width take 8.7us because the baud_rate is 115200 
			wait until rising_edge(clks);
			shift_ens <= '1';
			wait until rising_edge(clks);
			shift_ens <= '0';
		end loop;
		
		wait;
	end process;
	
	
end rtl;