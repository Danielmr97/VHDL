library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity UA is
port(
a,b: in std_logic_vector(2 downto 0);
s: in std_logic_vector(1 downto 0);
cin: in std_logic;
salsum: out std_logic_vector(2 downto 0);
cout:out std_logic );
end entity UA;

architecture arqUA of UA is
signal cablemux4B:std_logic_vector(2 downto 0);
begin
u1: entity work.mux4x1(arqmux4x1) port map (s,b,cablemux4B);
u2: entity work.sum(arqsum) port map (a,cablemux4B,cin,salsum,cout);

end architecture arqUA;

