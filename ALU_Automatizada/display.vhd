library ieee;
use ieee.std_logic_1164.all;

entity display is
port(
	entrada : in std_logic_vector(3 downto 0);
	hex3,hex2,hex1,hex0 : out std_logic_vector(6 downto 0)

);
end;



architecture arq of display is 

signal count,s2,s1,s0: std_logic;

begin

count <= entrada(3);
s2<= entrada (2) ;
s1<= entrada (1) ;
s0<= entrada (0) ;

with count select 
hex3 <=
"1001111" when '1',
"1000000" when others;

with s2 select 
hex2 <=
"1001111" when '1',
"1000000" when others;

with s1 select 
hex1 <=
"1001111" when '1',
"1000000" when others;

with s0 select 
hex0 <=
"1001111" when '1',
"1000000" when others;

--with operaciones select 
--hex <=
--"1000000" when "011",--A
--"1111001" when "101",--A+B
--"0100100" when "000",--A+B'
--"0110000" when "010",--A-1
--"0011001" when "100",--A+1
--"0010010" when "110",--A+B+1
--"0000010" when "001",--A-B
----"0000000" when "0011",--A
----"1111000" when "010",--AND
----"0000000" when "0011",--OR	
----"0000000" when "001",--XOR
----"0000000" WHEN "0100",--NOT A		
--"0000000" when others;


end architecture;