library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topcont is
port(
clkl, reset: in std_logic;
count: out std_logic_vector (3 downto 0)
);
end ;

architecture arqcont of topcont is
signal cableclockcont: std_logic;

begin
u1: entity work.relojlento(arqrelojlento) port map (clkl, cableclockcont);
u2: entity work.cont4(behavior) port map (cableclockcont, reset, count);

end architecture;