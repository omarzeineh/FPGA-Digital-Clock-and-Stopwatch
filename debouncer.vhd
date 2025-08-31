library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity debouncer is
	port( 
		clk, pb: in std_logic;
		output: out std_logic
		);
end entity;

architecture behv of debouncer is

component accu is

	generic (
		n: integer
	);
	port(
		reset, clk: in std_logic;
		output: buffer std_logic_vector(n-1 downto 0)
	);

end component;

component comparator is

	generic (
		n: integer
	);
	port(
			c1, c2: in std_logic_vector(n-1 downto 0);
			output: out std_logic
	);
	
end component;

signal f1: std_logic_vector(19 downto 0);
signal f2, f: std_logic_vector(1 downto 0);

signal o1,o2: std_logic;



begin

comparator1: comparator generic map(n => 20) port map(C1 => f1, C2 => "01111010000100100000", output => o1);
comparator2: comparator generic map(n => 2) port map(C1 => f2, C2 => "01", output => o2);


acc1: accu generic map(n => 20) port map(reset => (o1 or pb), clk => (clk and not pb), output => f1);
acc2: accu generic map(n => 2) port map(reset => f2(0), clk => (o1 and (not f(0))), output => f2);
acc3: accu generic map(n => 2) port map(reset => pb, clk => o2, output => f);

output <= f(0);

end architecture;