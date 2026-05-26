library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourToOneMultiplexer is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Y : out STD_LOGIC);
end FourToOneMultiplexer;
architecture Behavioral of FourToOneMultiplexer is
begin
process(A, B, C, D, S0, S1)
    begin
        if (S1 = '0' and S0 = '0') then
            Y <= A;
        elsif (S1 = '0' and S0 = '1') then
            Y <= B;
        elsif (S1 = '1' and S0 = '0') then
            Y <= C;
        else Y <= D;
        end if;
    end process;
end Behavioral;