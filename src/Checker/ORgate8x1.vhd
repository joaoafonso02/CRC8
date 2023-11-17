LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL; 

ENTITY ORgate8x1 IS
  PORT (
    a: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    Result: OUT STD_LOGIC
  );
END ENTITY ORgate8x1;

ARCHITECTURE behavior OF ORgate8x1 IS
BEGIN
    y <= a(0) OR a(1) OR a(2) OR a(3) OR a(4) OR a(5) OR a(6) OR a(7);
END ARCHITECTURE behavior;
