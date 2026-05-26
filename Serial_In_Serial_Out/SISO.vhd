library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity siso is
 Port ( a : in STD_LOGIC;
 clock : in STD_LOGIC;
 b : inout STD_LOGIC;
 c : inout STD_LOGIC;
 d : inout STD_LOGIC;
 f : out STD_LOGIC);
end siso;
architecture Behavioral of siso is
begin
process (a,b,c,d,clock)
begin
if(clock'event and clock='1')
then
b<=a;
c<=b;
d<=c;
f<=d;
end if;
end process;
end Behavioral;