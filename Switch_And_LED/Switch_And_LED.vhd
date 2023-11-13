LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY switchtoled IS
	port(
		sw1	:	in	std_logic;
		led1	:	out	std_logic
	);
end ENTITY;

ARCHITECTURE rtl OF switchtoled IS
-- NOTHING
BEGIN
	led1 <= sw1;
END rtl;
