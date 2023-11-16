library ieee;
use ieee.std_logic_1164.all;

entity remainderCalc is
  port (a: in std_logic_vector (15 downto 0);
      dOut: out std_logic_vector (7 downto 0));
end remainderCalc;

architecture structure of remainderCalc is
	signal remainder	:  STD_LOGIC_VECTOR(7 downto 0);
	signal porta1, porta2, porta3, porta4, porta5, porta6, porta7, porta8, porta9, porta10, porta11,
	porta12, portaa2a6, portaa1a11, portaa7a15, portaa1a8, porta1_9,  porta2_10, porta5_a10,
	porta3_6, porta8_12, porta1_a12, porta1_a10, porta7_a14, porta4_a9, porta6_9, porta3_4, porta11_14, 
	porta5_9, porta2_11, porta5_16, porta6_9_porta2_11, porta2_10_porta3_4,porta3_6_porta8_12   : std_logic;
	
	component gateXor2
        port (a, b: in std_logic;
          y: out std_logic);
    end component;
	 
	begin
	-- Level 1
	xorPorta1: gateXor2 PORT MAP (a(0), a(7), porta1);
	xorPorta2: gateXor2 PORT MAP (a(0), a(4), porta2);
	xorPorta3: gateXor2 PORT MAP (a(1), a(5), porta3);
	xorPorta4: gateXor2 PORT MAP (a(2), a(12), porta4);
	xorPorta5: gateXor2 PORT MAP (a(2), a(13), porta5);
	xorPorta6: gateXor2 PORT MAP (a(3), a(13), porta6);
	xorPorta7: gateXor2 PORT MAP (a(3), a(10), porta7);
	xorPorta8: gateXor2 PORT MAP (a(4), a(7), porta8);
	xorPorta9: gateXor2 PORT MAP (a(5), a(9), porta9);
	xorPorta10: gateXor2 PORT MAP (a(6), a(14), porta10);
	xorPorta11: gateXor2 PORT MAP (a(6), a(8), porta11);
	xorPorta12: gateXor2 PORT MAP (a(11), a(15), porta12);
	xorPortaa2a6: gateXor2 PORT MAP (a(2), a(6), portaa2a6);
	xorPortaa1a11: gateXor2 PORT MAP (a(1), a(11), portaa1a11);
	xorPortaa7a15: gateXor2 PORT MAP (a(7), a(15), portaa7a15);
	xorPortaa1a8: gateXor2 PORT MAP (a(1), a(8), portaa1a8);
	
	-- Level 2
	xorPorta1_9: gateXor2 PORT MAP (porta1, porta9, porta1_9);
	xorPorta2_10: gateXor2 PORT MAP (porta2, porta10, porta2_10);
	xorPorta3_6: gateXor2 PORT MAP (porta3, porta6, porta3_6);
	xorPorta8_12: gateXor2 PORT MAP (porta8, porta12, porta8_12);
	xorPorta1_a12: gateXor2 PORT MAP (porta1, a(12), porta1_a12);
	--xorPorta1_a10: gateXor2 PORT MAP (porta1, a(10), porta1_a10);	
	xorPorta7_a14: gateXor2 PORT MAP (porta7, a(14), porta7_a14);
	xorPorta4_a9: gateXor2 PORT MAP (porta4, a(9), porta4_a9);
	xorPorta6_9: gateXor2 PORT MAP (porta6, porta9, porta6_9);
	xorPorta3_4: gateXor2 PORT MAP (porta3, porta7, porta3_4);
	xorPorta11_14: gateXor2 PORT MAP (porta11, portaa1a11, porta11_14);
	--xorPorta5_9: gateXor2 PORT MAP (porta5, porta9, porta5_9);
	xorPorta2_11: gateXor2 PORT MAP (porta2, porta11, porta2_11);
	xorPorta5_16: gateXor2 PORT MAP (porta5, portaa1a8, porta5_16);
	xorPorta5_a10: gateXor2 PORT MAP (porta5, a(10), porta5_a10);
	
	-- Level 3
	xorPorta6_9_porta2_11: gateXor2 PORT MAP (porta6_9, porta2_11, porta6_9_porta2_11);
	--xorPorta2_10_porta3_4: gateXor2 PORT MAP (porta2_10, porta3_4, porta2_10_porta3_4);
	xorPorta3_6_porta8_12: gateXor2 PORT MAP (porta3_6, porta8_12, porta3_6_porta8_12);

	-- Level 4
	xorRemainder0: gateXor2 PORT MAP (porta2_10, porta5_16, remainder(0));
	xorRemainder1: gateXor2 PORT MAP (porta6_9_porta2_11, portaa7a15, remainder(1));
	xorRemainder2: gateXor2 PORT MAP (porta5_a10, porta1_9, remainder(2));
	xorRemainder3: gateXor2 PORT MAP (porta7_a14, porta11_14, remainder(3));
	xorRemainder4: gateXor2 PORT MAP (porta8_12, porta4_a9, remainder(4));
	--xorRemainder5: gateXor2 PORT MAP (porta2_10_porta3_4, porta7, remainder(5));
	xorRemainder5: gateXor2 PORT MAP (porta2_10,porta3_4, remainder(5));
	xorRemainder6: gateXor2 PORT MAP (porta3_6_porta8_12, portaa2a6, remainder(6));
	xorRemainder7: gateXor2 PORT MAP (porta3_6, porta1_a12, remainder(7));
		
	dOut <= remainder;
		
end structure;

library ieee;
use ieee.std_logic_1164.all;

entity CRC8_Encoder is
  port (dIn: in std_logic_vector (15 downto 0);
      dOut: out std_logic_vector (23 downto 0));
end CRC8_Encoder;

architecture structure of CRC8_Encoder is
	component remainderCalc
		port ( a : IN STD_LOGIC_VECTOR (15 downto 0);
				 dOut : OUT STD_LOGIC_VECTOR (7 downto 0));
	end component;
	begin
	begin	
	reminderBlock: remainderCalc  port map (dIn (15 downto 0), dOut (7 downto 0));
	
	dOut (23 downto 8) <= dIn;
end structure;