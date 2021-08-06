library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ejmplo1 is
port(
	bus_dir: in std_logic_vector(1 downto 0);
	cs: in std_logic;
	bus_dato: out std_logic_vector(6 downto 0)
);
end;

architecture arq1	of ejmplo1 is 
---La letra de la palabra hola
constant LH: std_logic_vector(6 downto 0):="0001001";
constant LO: std_logic_vector(6 downto 0):="1000000";
constant LL: std_logic_vector(6 downto 0):="1000111";
conStant LA: std_logic_vector(6 downto 0):="0001000";
-- cREAR MEMORIA ENTRAN 4 DATOS POR 6 SALIDA
type memoria is array (3 downto 0) of std_logic_vector(6 downto 0);
constant mem_rom: memoria:=(LA,LL,LO,LH);

SIGNAL dato: std_logic_vector(6 downto 0);

begin
	prom: process (bus_dir)
	begin
		dato <= mem_rom(conv_integer(bus_dir));
	end process prom;
	pbuf: process (dato,cs)
	begin
		if(cs='1') then
			bus_dato <= dato;
		else
			bus_dato <= (others => 'Z');
		end if;
	end process pbuf;
end arq1;

