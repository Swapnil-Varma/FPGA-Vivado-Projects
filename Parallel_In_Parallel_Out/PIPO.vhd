library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity pipo1 is
 Port ( i1 : in STD_LOGIC;
 i2 : in STD_LOGIC;
 i3 : in STD_LOGIC;
 i4 : in STD_LOGIC;
 clock : in STD_LOGIC;
 o1 : out STD_LOGIC;
 o2 : out STD_LOGIC;
 o3 : out STD_LOGIC;
 o4 : out STD_LOGIC);
end pipo1;
architecture Behavioral of pipo1 is
begin
process (i1,i2,i3,i4,clock)
begin
if(clock'event and clock='1')
then
o1<=i1;
o2<=i2;
o3<=i3;
o4<=i4;
end if;
end process;
end Behavioral;