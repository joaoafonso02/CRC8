library ieee;
use ieee.std_logic_1164.all;

entity CRC8_Encoder is
	port ( a : IN STD_LOGIC_VECTOR (15 downto 0);
			dOut : OUT STD_LOGIC_VECTOR (23 downto 0));			 
end CRC8_Encoder;

architecture structure of CRC8_Encoder is
	remainder : OUT STD_LOGIC_VECTOR (7 downto 0);
	component gateXor2
		port (x0,x1 : IN STD_LOGIC;
			y: OUT STD_LOGIC);
	end component;

begin
	--Level 0-- NO OPTIMIZATION
	remainder(0) <= a(0) xor a(1) xor a(2) xor a(4) xor a(6) xor a(8) xor a(13) xor a(14); -- x^0
	remainder(1) <= a(0) xor a(3) xor a(4) xor a(5) xor a(6) xor a(7) xor a(8) xor a(9) xor a(13) xor a(15);-- x^1
	remainder(2) <= a(0) xor a(2) xor a(5) xor a(7) xor a(9) xor a(10) xor a(13); -- x^2
	remainder(3) <= a(1) xor a(3) xor a(6) xor a(8) xor a(10) xor a(11) xor a(14); -- x^3
	remainder(4) <= a(2) xor a(4) xor a(7) xor a(9) xor a(11) xor a(12) xor a(15); -- x^4
	remainder(5) <= a(0) xor a(1) xor a(2) xor a(3) xor a(4) xor a(5) xor a(6) xor a(10) xor a(12) xor a(14); -- x^5
	remainder(6) <= a(1) xor a(2) xor a(3) xor a(4) xor a(5) xor a(6) xor a(7) xor a(11) xor a(13) xor a(15); -- x^6
	remainder(7) <= a(0) xor a(1) xor a(3) xor a(5) xor a(7) xor a(12) xor a(13); -- x^7

	dOut(7 downto 0) <= remainder;
	dOut(23 downto 8) <= dIn;
	
end structure;
