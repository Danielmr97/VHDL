library ieee;
use ieee.std_logic_1164.all;

entity disp3 is
port(
	sal : in std_logic_vector(2 downto 0);
	hex3: out std_logic_vector (6 downto 0)
	
);
end;

architecture arq of disp3 is 
begin

with sal select 
hex3 <= 
"1000000" when "000",
"1111001" when "001",
"0100100" when "010",
"0110000" when "011",
"0011001" when "100",
"0010010" when "101",
"0000010" when "110",
"1111000" when "111",
"0000000" when others;
end architecture;