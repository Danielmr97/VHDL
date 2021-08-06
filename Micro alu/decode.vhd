library ieee;
use ieee.std_logic_1164.all;

entity decode is 
port(
bus_instruc: in std_logic_vector (15 downto 0);
cablecount: in std_logic_vector(3 downto 0);
bus_datosA, bus_datosB : out std_logic_vector(2 downto 0);
bus_datosdirc: out std_logic_vector(3 downto 0);
cin: out std_logic;
s: out std_logic_vector(1 downto 0);
s2: out std_logic);
end;

architecture arq of decode is
	signal DatosdirA, DatosdirB : std_logic_vector(2 downto 0);
	begin
	DatosdirA <= bus_instruc(9 downto 7);
	DatosdirB <= bus_instruc(6 downto 4);
	s <= cablecount(1 downto 0);
	cin <= cablecount(2);
	s2 <= cablecount(3);
	bus_datosdirc <= bus_instruc(3 downto 0);
		u1: entity work.romA(arq) port map (DatosdirA,bus_datosA);
		u2: entity work.romB(arq) port map (DatosdirB,bus_datosB);
end;