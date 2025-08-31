library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
ENTITY ADSD is

	port(
		clock, incm, inch, startwatch, resetwatch: in std_logic;
		mode: in std_logic_vector(1 downto 0);
		output1, output2, output3, output4: out std_logic_vector(6 downto 0)
	);
	
end ENTITY;

architecture behv of ADSD is
 
	Component comparator is 
	
		generic (
			n: integer
		);
		port(
			c1, c2: in std_logic_vector(n-1 downto 0);
			output: out std_logic
		);
		
	end component;
 
	Component accu is
	
		generic (
			n: integer
		);
		port(
			reset, clk: in std_logic;
			output: buffer std_logic_vector(n-1 downto 0)
		);
		
	end Component;
	
	Component binaryToBCD is

		port( 
			input: in std_logic_vector(7 downto 0);
			d1, d2: out std_logic_vector(3 downto 0)
		);
	
	end Component;
	
	component bcdtoseven is

		port(
			input: in std_logic_vector(3 downto 0);
			output: out std_logic_vector(6 downto 0)
		);

	end component;
	
	component debouncer is
	port( 
		clk, pb: in std_logic;
		output: out std_logic
		);
	end component;

 
	signal c1: std_logic_vector(25 downto 0) := "10111110101111000010000000";
	signal cstop: std_logic_vector(19 downto 0) := "01111010000100100000";
	signal cstop2: std_logic_vector(7 downto 0) := "01100100";
	signal c2: std_logic_vector(7 downto 0) := "00111100";
	signal c3: std_logic_vector(7 downto 0) := "00111100";
	signal c4: std_logic_vector(7 downto 0) := "00011000";
 
	signal f1: std_logic_vector(25 downto 0);
	signal fstop1: std_logic_vector(19 downto 0);
	signal f2, f3, f4, fstop2, fstop3: std_logic_vector(7 downto 0);
 
	signal o1, o2, o3, o4, ostop1, ostop2, ostop3: std_logic;
	
	signal bcd1, bcd2, bcd3, bcd4, bcd5, bcd6, bcdstop1, bcdstop2, bcdstop3, bcdstop4: std_logic_vector(3 downto 0);
	signal seven1, seven2, seven3, seven4, seven5, seven6, seven7, seven8, seven9, seven10: std_logic_vector(6 downto 0);
	
	signal mpb, hpb: std_logic;


	begin
 
		--Digital Clock
 
		comp1: comparator generic map (n => 26) port map (c1 => f1, c2 => c1, output => o1);
		comp2: comparator generic map (n => 8) port map (c1 => f2, c2 => c2, output => o2);
		comp3: comparator generic map (n => 8) port map (c1 => f3, c2 => c3, output => o3);
		comp4: comparator generic map (n => 8) port map (c1 => f4, c2 => c4, output => o4);
 
		mdebounce: debouncer port map(clk => clock, pb => incm, output => mpb);
		hdebounce: debouncer port map(clk => clock, pb => inch, output => hpb);

 
		acc1: accu generic map (n => 26) port map (reset => o1, clk => clock, output => f1);
		acc2: accu generic map (n => 8) port map (reset => o2, clk => o1, output => f2);
		acc3: accu generic map (n => 8) port map (reset => o3, clk => (o2 or mpb), output => f3);
		acc4: accu generic map (n => 8) port map (reset => o4, clk => (o3 or hpb), output => f4);
		
		btobcd1: binaryToBCD port map(input => f2, d1 => bcd1, d2 => bcd2);
		btobcd2: binaryToBCD port map(input => f3, d1 => bcd3, d2 => bcd4);
		btobcd3: binaryToBCD port map(input => f4, d1 => bcd5, d2 => bcd6);
		
		bcdtoseven1: bcdtoseven port map(input => bcd1, output => seven1);
		bcdtoseven2: bcdtoseven port map(input => bcd2, output => seven2);
		bcdtoseven3: bcdtoseven port map(input => bcd3, output => seven3);
		bcdtoseven4: bcdtoseven port map(input => bcd4, output => seven4);
		bcdtoseven5: bcdtoseven port map(input => bcd5, output => seven5);
		bcdtoseven6: bcdtoseven port map(input => bcd6, output => seven6);

		--Stop Watch
		
		compstop1: comparator generic map (n => 20) port map (c1 => fstop1, c2 => cstop, output => ostop1);
		compstop2: comparator generic map (n => 8) port map (c1 => fstop2, c2 => cstop2, output => ostop2);
		compstop3: comparator generic map (n => 8) port map (c1 => fstop3, c2 => c2, output => ostop3);
		
		accstop1: accu generic map (n => 20) port map (reset => ostop1, clk => (clock and (not startwatch)), output => fstop1);
		accstop2: accu generic map (n => 8) port map (reset => (ostop2 or (not resetwatch)), clk => ostop1, output => fstop2);
		accstop3: accu generic map (n => 8) port map (reset => (ostop3 or (not resetwatch)), clk => ostop2, output => fstop3);
 
		btobcdstop1: binaryToBCD port map(input => fstop2, d1 => bcdstop1, d2 => bcdstop2);
		btobcdstop2: binaryToBCD port map(input => fstop3, d1 => bcdstop3, d2 => bcdstop4);
 
		bcdtosevenstop1: bcdtoseven port map(input => bcdstop1, output => seven7);
		bcdtosevenstop2: bcdtoseven port map(input => bcdstop2, output => seven8);
		bcdtosevenstop3: bcdtoseven port map(input => bcdstop3, output => seven9);
		bcdtosevenstop4: bcdtoseven port map(input => bcdstop4, output => seven10);
		
		process(seven1, seven2, seven3, seven4, seven5, seven6, seven7, seven8, seven9, seven10, mode)
		begin

			case mode is
				when "00" => output1 <= seven1; output2 <= seven2; output3 <= seven3; output4 <= seven4;
				when "01" => output1 <= seven3; output2 <= seven4; output3 <= seven5; output4 <= seven6;
				when "10" => output1 <= seven7; output2 <= seven8; output3 <= seven9; output4 <= seven10;
				when "11" => output1 <= seven7; output2 <= seven8; output3 <= seven9; output4 <= seven10;
			end case;
end process;
		
end behv;