library ieee;
use ieee.std_logic_1164.all;

entity fetch is 
port(
clk,reset: in std_logic;
cablecounts: out std_logic_vector(3 downto 0);
bus_datos: out std_logic_vector(15 downto 0)
);
end;
architecture bhv of fetch is
	signal cablecount: std_logic_vector(3 downto 0);
	begin
		cablecounts <= cablecount;
		u1: entity work.cont4(behavior) port map (clk, reset, cablecount);
		u2: entity work.rom1(arq) port map (cablecount, bus_datos);

end;