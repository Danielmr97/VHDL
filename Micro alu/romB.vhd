library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity romB is
port(
bus_dir:in std_logic_vector(2 downto 0);
bus_datos: out std_logic_vector(2 downto 0)
);
end;

architecture arq of romB is 
type memoria is array (3 downto 0) of std_logic_vector(2 downto 0);
signal mem_rom : memoria;
attribute ram_init_file: string;
attribute ram_init_file of mem_rom: signal is "dataB.mif";

signal dato: std_logic_vector(2 downto 0 );
begin 
	prom: process(bus_dir)
	begin 
		dato <= mem_rom(conv_integer(bus_dir));
		end process prom;
pbuf: process (dato)
begin 
bus_datos<="010";
end process pbuf;
end;
