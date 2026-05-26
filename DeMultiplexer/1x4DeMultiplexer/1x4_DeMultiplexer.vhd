library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourtoOneDemultiplexer is
    Port ( X : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC);
end FourtoOneDemultiplexer;

architecture Behavioral of FourtoOneDemultiplexer is

begin
A <= ((NOT S1) AND (NOT S0))AND X;
B <= ((NOT S1) AND S0)AND X;
C <= (S1 AND (NOT S0))AND X;
D <= (S1 AND S0)AND X;

end Behavioral;