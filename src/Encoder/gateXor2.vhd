library ieee;
use ieee.std_logic_1164.all;

entity gateXor2 is
	port (a, b : IN STD_LOGIC;
			y: OUT STD_LOGIC);
end gateXor2;

architecture behavioral of gateXor2 is
begin
	y <= a xor b;
end behavioral;