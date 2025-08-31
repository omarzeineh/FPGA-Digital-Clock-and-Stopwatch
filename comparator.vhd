library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY comparator is

	generic (
		n: integer
	);
	port(
			c1, c2: in std_logic_vector(n-1 downto 0);
			output: out std_logic
	);
	
end ENTITY;
 
architecture behv of comparator is
	begin
		process(c1, c2)
			begin
				if c1 = c2 then
					output <= '1';
				else
					output <= '0';
				end if;
		end process;
end architecture;