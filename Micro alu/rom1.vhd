library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom1 is
port(
bus_dir:in std_logic_vector(3 downto 0);
bus_datos: out std_logic_vector(15 downto 0)
);
end;

architecture arq of rom1 is 
type memoria is array (3 downto 0) of std_logic_vector(15 downto 0);
signal mem_rom : memoria;
attribute ram_init_file: string;
attribute ram_init_file of mem_rom: signal is "data.mif";

signal dato: std_logic_vector(15 downto 0 );
begin 
	prom: process(bus_dir)
	begin 
		dato <= mem_rom(conv_integer(bus_dir));
		end process prom;
pbuf: process (dato)
begin 
bus_datos<=dato;
end process pbuf;
end;
