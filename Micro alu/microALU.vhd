library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity microALU is
port(
	clk, reset: in std_logic;
	cout:out std_logic;
	hex0,hex1,hex2,hex3,hex4,hex5 : out std_logic_vector (6 downto 0));
end entity;

architecture bhv of microALU is
signal cableclk:std_logic;
signal cablecounts: std_logic_vector (3 downto 0);
signal cabledatos:std_logic_vector(15 downto 0);
signal cin:std_logic;
signal s:std_logic_vector(1 downto 0);
signal s2:std_logic;
signal a,b: std_logic_vector(2 downto 0);
signal datosdirc: std_logic_vector (3 downto 0);
signal sal: std_logic_vector(2 downto 0);
begin
u1: entity work.relojlento(arqrelojlento) port map (clk, cableclk);
u2: entity work.fetch(bhv) port map (cableclk, reset,cablecounts, cabledatos);
u3: entity work.decode(arq) port map (cabledatos,cablecounts, a, b, datosdirc, cin, s, s2);
u4: entity work.ALU(arqALU) port map (a,b,s,s2,cin,sal,cout);
u5: entity work.disp1(arq) port map (a,hex1);
u6: entity work.disp2(arq) port map (b,hex2);
u7: entity work.disp3(arq) port map (sal,hex3);
u9: entity work.disp0(arq) port map (cablecounts , hex0, hex4,hex5);
end architecture;