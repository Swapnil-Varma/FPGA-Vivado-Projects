library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Half_Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           X : out STD_LOGIC;
           Y : out STD_LOGIC);
end Half_Adder;
architecture Behavioral of Half_Adder is
begin
-- Sum = X;
X <= ((NOT A) AND B) OR (A AND (NOT B));
-- Carry = Y;
Y <= (A AND B);
end Behavioral;