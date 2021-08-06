library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topAuto is
port(
clkl, reset: in std_logic;
a,b: in std_logic_vector(2 downto 0);
--count: out std_logic;
hex3,hex2,hex1,hex0,hex4 : out std_logic_vector(6 downto 0)
--F:out std_logic_vector(2 downto 0)
);
end ;

architecture arqcont of topAuto is
signal cableclockcont: std_logic;
signal cablealu: std_logic_vector(3 downto 0);
signal F: std_logic_vector(2 downto 0);
signal count: std_logic;
signal cabledisp : std_logic_vector(3 downto 0);

begin
cabledisp<=count&F;
u1: entity work.relojlento(arqrelojlento) port map (clkl, cableclockcont);
u2: entity work.cont4(behavior) port map (cableclockcont, reset, cablealu);
u3: entity work.ALU(arqALU) port map (a,b,cablealu (1 downto 0), cablealu(3),cablealu(2),F,count);
u4: entity work.display(arq) port map (cabledisp,hex3,hex2,hex1,hex0);
u5: entity work.disp0(arq) port map (cablealu,hex4);
end architecture;
