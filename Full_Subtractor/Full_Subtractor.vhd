library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FullSubtractor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Bin : in STD_LOGIC;
           D : out STD_LOGIC;
           Bout : out STD_LOGIC);
end FullSubtractor;
architecture Behavioral of FullSubtractor is
begin
Bout <= ((NOT A) AND B) OR ((NOT A) AND Bin) OR (B AND Bin);
D <= A XOR B XOR Bin;
end Behavioral;