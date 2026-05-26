library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Halfsubb is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           X : out STD_LOGIC;
           Y : out STD_LOGIC);
end Halfsubb;
architecture Behavioral of Halfsubb is
begin
X <= ((NOT A) AND B) OR (A AND (NOT B));
Y <= ((NOT A) AND B);
end Behavioral;