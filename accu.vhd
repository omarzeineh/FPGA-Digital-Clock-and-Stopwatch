library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY accu is

	generic (
		n: integer
	);
	port(
		reset, clk: in std_logic;
		output: buffer std_logic_vector(n-1 downto 0)
	);

end ENTITY;
 
architecture behv of accu is
	begin
		process(clk, reset)
			begin
				if reset = '1' then
					output <= (others => '0');
				elsif rising_edge(clk) then
					output <= output + 1;
				end if;
		end process;
end architecture;