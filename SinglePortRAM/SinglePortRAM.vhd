library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SinglePortRAM is
	generic(
		Dwidth : integer;
		Awidth : integer
	);
	port(
		clk			:	in		std_logic;
		writedata	:	in		std_logic_vector(Dwidth-1 downto 0);
		readdata		:	out	std_logic_vector(Dwidth-1 downto 0);
		address		:	in		std_logic_vector(Awidth-1 downto 0);
		writeenable	:	in		std_logic
	);
end entity;

architecture rtl of SinglePortRAM is
	-- BUILD A 2D ARRAY TYPE FOR THE RAM
	type memory_t is array(0 to (2**Awidth) -1) of std_logic_vector(Dwidth-1 downto 0);
	-- DECLARE THE RAM SIGNAL
	signal MyRam : memory_t;
begin
	RAMProcess : process(clk)
	begin
		if rising_edge(clk) then
			if writeenable ='1' then
				MyRam(to_integer(unsigned(address))) <= writedata;
			end if;
			readdata <= MyRam(to_integer(unsigned(address)));
		end if;
	end process;
end rtl;
