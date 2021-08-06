library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is
port(
	ent: in std_logic_vector(2 downto 0);
	sel: in std_logic_vector(1 downto 0);
	salmux: out std_logic_vector(2 downto 0 )
);
end;

architecture arq of mux4x1 is
begin
	with sel select
	
	salmux <= (others => '0') when "00",
					not ent 		  when "01",
					ent 			  when "10",
				(others => '1' ) when "11",
				(others => '0') when others;
end;