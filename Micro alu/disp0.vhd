library ieee;
use ieee.std_logic_1164.all;

entity disp0 is
port(
	datosdirc:std_logic_vector(3 downto 0);
	hex0,hex4,hex5: out std_logic_vector (6 downto 0)
	
);
end;

architecture arq of disp0 is 
begin

with datosdirc select 
--Numero de operación
hex0 <= 
"1000000" when "0000",
"1111001" when "0001",
"0100100" when "0010",
"0110000" when "0011",
"0011001" when "0100",
"0010010" when "0101",
"0000010" when "0110",
"1111000" when "0111",
"0000000" when "1000",
"0010000" when "1001",
"0001000" when	"1010",
"0000011" when "1011",
"1000110" when "1100",
"0100001" when	"1101",
"0000100" when	"1110",
"0001110" when	"1111",
"1000000" when others;

with datosdirc select 
hex4 <= 
"1111111" when "0000",
"0001111" when "0001",
"0001111" when "0010",
"0111111" when "0011",
"0001111" when "0100",
"0001111" when "0101",
"0001111" when "0110",
"1111111" when "0111",
--LOGICAS
"0001000" when "1000",
"1000000" when "1001",
"0101111" when	"1010",
"1111101" when "1011",
"1111111" when "1100",
"1111111" when	"1101",
"1111111" when	"1110",
"1111111" when	"1111",
"1000000" when others;

with datosdirc select 
--Numero de operación
hex5 <= 

"1011111" when "0010",
"1011111" when "0110",
"1111111" when others;


end architecture;
