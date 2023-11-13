library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DualPortRAM is
	generic(
		Dwidth : integer;
		Awidth : integer
	);
	port(
		clk 			:	in		std_logic;
		
		writedataA	:	in		std_logic_vector(Dwidth-1 downto 0);
		readdataA	:	out	std_logic_vector(Dwidth-1 downto 0);
		addressA		:	in		std_logic_vector(Awidth-1 downto 0);
		writeenbA	:	in		std_logic;
		
		writedataB	:	in		std_logic_vector(Dwidth-1 downto 0);
		readdataB	:	out	std_logic_vector(Dwidth-1 downto 0);
		addressB		:	in		std_logic_vector(Awidth-1 downto 0);
		writeenbB	:	in		std_logic
	);
end entity;
		
architecture rtl of DualPortRAM is
	-- BUILS 2D ARRAY FOR THE RAM
	type memory_t is array(0 to 2**Awidth -1) of std_logic_vector((Dwidth -1) down to 0);
	-- DECLARE THE RAM SIGNAL
	signal MyRam : memory_t;
begin
	RAMProcess : process(clk) begin
		if rising_edge(clk) then
			--- PORT A OF RAM
			if writeenbA = '1' then
				MyRam(to_integer(unsigned(addressA))) <= writedataA;
			end if;
			readdataA <= MyRam(to_integer(unsigned(addressA)));
			--- PORT B OF RAM
			if writeenbB = '1' then
				MyRam(to_integer(unsigned(addressB))) <= writedataB;
			end if;
			readdataB <= MyRam(to_integer(unsigned(addressB)));
		end if;
	end process;
end rtl;
