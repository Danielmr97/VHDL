library ieee;
use ieee.std_logic_1164.all;
--port map(b(3), sel, salmux2x1(3)
entity mux2x1 is
port(
ua: in std_logic_vector(2 downto 0);
ul:in std_logic_vector(2 downto 0);
s2: in std_logic;
salmux2x1: out std_logic_vector(2 downto 0)
);
end;
architecture arqmux2x1 of mux2x1 is
begin
        
with s2 select
salmux2x1 <= 
            ua when '0',
	         ul when others;----opcion 1
				
end;
