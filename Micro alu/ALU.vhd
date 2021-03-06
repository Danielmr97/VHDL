library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(
a,b: in std_logic_vector(2 downto 0);
s: in std_logic_vector(1 downto 0);
s2: in std_logic;
cin: in std_logic;
sal: out std_logic_vector(2 downto 0);
cout:out std_logic );
end entity ALU;

architecture arqALU of ALU is
signal cableUAMUX:std_logic_vector(2 downto 0);
signal cableULMUX:std_logic_vector(2 downto 0);
begin

u1: entity work.UA(arqUA) port map (a,b,s,cin,cableUAMUX,cout);
u2: entity work.UL(arqUL) port map (a,b,s,cableULMUX);
u3: entity work.mux2x1(arqmux2x1) port map (cableUAMUX,cableULMUX,s2,sal );

end architecture arqALU;