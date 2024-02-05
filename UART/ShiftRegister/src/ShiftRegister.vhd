library ieee;
use ieee.std_logic_1164.all;


entity ShiftRegister is -- SIPO
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
end entity;

architecture rtl of ShiftRegister is

signal temp : std_logic_vector(N-1 downto 0);

begin

	dout <= temp;
	
	SHIFT_TO_THE_RIGHT: if shift_direction = 'R' generate
	-- shift temp to the right (when data transmitted LSB FIRST)
		Shift_process:process(clk,rst)
		begin
			if rst = '1' then
				temp <= (others => '0');
			elsif rising_edge(clk) then
				if shift_en = '1' then
					temp <= din & temp(temp'left downto 1); -- Right_shift
				end if;
			end if;
		end process;
	end generate;
	
	SHIFT_TO_THE_LEFT: if shift_direction = 'L' generate
	-- shift temp to the left (when data transmitted MSB FIRST)
	Shift_process:process(clk,rst)
		begin
			if rst = '1' then
				temp <= (others => '0');
			elsif rising_edge(clk) then
				if shift_en = '1' then
					temp <= temp(temp'left -1 downto 0) & din; -- left_shift
				end if;
			end if;
		end process;
	end generate;

end rtl;