library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity fsm is
    port (        
        clk : in  std_logic;
        reset : in std_logic;
        x : in std_logic;
        z : out std_logic
    );
end fsm;
 
architecture Behavioral of fsm is
  type estados_t is (q0,q1,q2,q3,q4);
  signal estado, estado_siguiente : estados_t; 

begin

  process(x,estado)
  begin
    z <= '0';
    estado_siguiente <= estado;

    case(estado) is
      when q0 =>
        z <= '0';
        if(x='0') then estado_siguiente <= q1;
        else estado_siguiente <= q2;
        end if;
      when q1 =>
        z <= '0';
        if(x='0') then estado_siguiente <= q1;
        else estado_siguiente <= q3;
        end if;
      when q2 =>
        z <= '0';
        if(x='0') then estado_siguiente <= q4;
        else estado_siguiente <= q2;
        end if;
      when q3 =>
        z <= '1';
        if(x='0') then estado_siguiente <= q4;
        else estado_siguiente <= q2;
        end if;
      when q4 =>
        z <= '1';
        if(x='0') then estado_siguiente <= q1;
        else estado_siguiente <= q3;
        end if;
      when others => null;
    end case;
  end process;

  process (clk,reset) begin
    if(reset='1') then
      estado <= q0;
    elsif rising_edge(clk) then
      estado <= estado_siguiente; 
    end if;
  end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity test is
end test;

architecture funcional of test is

  signal clk : std_logic:='0';
  signal reset : std_logic;
  signal x : std_logic;
  signal z : std_logic;
   
begin

  clk <= not(clk) after 10 ns;
  reset <= '1', '0' after 10 ns;
  x <= '0', '1' after 50 ns,'0' after 110 ns;

  fsm0 : entity work.fsm(Behavioral) port map(clk,reset,x,z);

end architecture;