library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity coffeemaker is
  Port ( clk : in  STD_LOGIC;
         led : out STD_LOGIC;
         sw  : in STD_LOGIC
       );
end coffeemaker;

architecture Behavioral of coffeemaker is
  signal pulse : std_logic := '0';
  signal count : integer range 0 to 199999999 := 0;
begin
  process(clk, sw)
  begin
    if sw = '0' then
        pulse <= '0';
    elsif clk'event and clk = '1' then
      if count = 199999999 then
        count <= 0;
        pulse <= not pulse;
      else
        count <= count + 1;
      end if;
    end if;
  end process;

  led <= pulse;
end Behavioral;
