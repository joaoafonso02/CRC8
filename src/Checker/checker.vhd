LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Falta aqui um acho eu

library flipFlopDPET;
use flipFlopDPET.all;

LIBRARY contMem;
USE contMem.all;

LIBRARY binCounter_5bit;
USE binCounter_5bit.all;

ENTITY checker IS
 PORT (nGRst: IN STD_LOGIC;
        clk:   IN STD_LOGIC;
        dIn:   IN STD_LOGIC;
        error	: out std_logic);
END checker;

ARCHITECTURE structure OF checker IS
  SIGNAL iNSet, iNRst, iDIn, clkO: STD_LOGIC;
  SIGNAL tCntI: STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL tCntO: STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL s_error : STD_LOGIC;  
  COMPONENT flipFlopDPET
    PORT (clk, D: IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ: OUT STD_LOGIC);
  END COMPONENT;
  
  COMPONENT Control_Unit
    PORT (nGRst: IN STD_LOGIC;
          clk:   IN STD_LOGIC;
          add:   IN STD_LOGIC_VECTOR (5 DOWNTO 0);
          nRst:  OUT STD_LOGIC;
          nSetO: OUT STD_LOGIC;
          clkO:  OUT STD_LOGIC);
  END COMPONENT;
  	component gateOr8
	port(
		x0, x1, x2, x3, x4, x5, x6, x7: in std_logic;
		y : out std_logic
	);
	end component;
	component binCounter_6bit
	PORT (nRst: IN STD_LOGIC;
        clk:  IN STD_LOGIC;
        c:    OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
	end component;
BEGIN
  ff:  flipFlopDPET PORT MAP (clk, s_error, iNSet, '1', error);  -- visto
  con:   Control_Unit PORT MAP (nGRst, clk, tCntI, iNRst, iNSet, clkO); -- visto
  OR80:	 gateOr8 PORT MAP(tCntO(0), tCntO(1), tCntO(2), tCntO(3), tCntO(4), tCntO(5), tCntO(6), tCntO(7), s_error); -- visto
  bc: 	 binCounter_6bit PORT MAP (iNRst, clk, tCntI); -- pq 6 e pq 5
  -- falta um, como em cima, crc8_lfsr

  
END structure;
