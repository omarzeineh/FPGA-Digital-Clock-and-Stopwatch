library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY bcdtoseven is

	port(
		input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(6 downto 0)
	);

end ENTITY;
 
architecture behv of bcdtoseven is
	begin
		process(input) 
			begin
				CASE input IS
					WHEN "0000" => output <= "0000001";
					WHEN "0001" => output <= "1001111";
					WHEN "0010" => output <= "0010010";
					WHEN "0011" => output <= "0000110";
					WHEN "0100" => output <= "1001100";
					WHEN "0101" => output <= "0100100";
					WHEN "0110" => output <= "0100000";
					WHEN "0111" => output <= "0001111";
					WHEN "1000" => output <= "0000000";
					WHEN "1001" => output <= "0000100";
					WHEN OTHERS => output <= "1010101";
				END CASE;
		end process;
end architecture;