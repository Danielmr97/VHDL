library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity men is 
port(
	AddrWr : in std_logic_vector(3 downto 0);
	AddrRd : in std_logic_vector(3 downto 0);
	clkWr  : in std_logic;
	clkRd  : in std_logic; 
	WrEn	 : in std_logic;
	dataIn : in std_logic_vector(3 downto 0);
	dataOut: out std_logic_vector(3 downto 0);
	ledcarga: out std_logic:='0'
);
end entity men;

architecture arq of men is
	type matrix is array (0 to 8) of std_logic_vector(3 downto 0);
	signal memory: matrix;
	signal dataInbuf : std_logic_vector(3 downto 0);
	signal addressWrite: std_logic_vector(3 downto 0);
	signal addressRead: std_logic_vector(3 downto 0);
begin 
process (ClkWr)
begin 
	if(clkWr' event and clkwr='1' and Wren='1') then 
		dataInBuf <= dataIn;
		addressWrite <= AddrRd;
	memory(to_integer(unsigned(AddressWrite))) <= dataInBuf;
	ledcarga <= '1';
	end if;
 end process;
process (clkRd)
begin 
 if(clkRd'event and clkRd='1') then
	AddressRead <= AddrRd;
	dataOut<=memory(to_integer(unsigned(AddressRead)));
	end if;
end process;
end architecture;
	