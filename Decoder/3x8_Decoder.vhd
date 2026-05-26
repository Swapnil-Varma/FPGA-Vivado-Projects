library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ThreeToEightDecoder is
    Port ( A  : in  STD_LOGIC;
           B  : in  STD_LOGIC;
           C  : in  STD_LOGIC;
           Y0 : out STD_LOGIC;
           Y1 : out STD_LOGIC;
           Y2 : out STD_LOGIC;
           Y3 : out STD_LOGIC;
           Y4 : out STD_LOGIC;
           Y5 : out STD_LOGIC;
           Y6 : out STD_LOGIC;
           Y7 : out STD_LOGIC);
end ThreeToEightDecoder;
architecture Behavioral of ThreeToEightDecoder is
begin
    Y0 <= (not A) and (not B) and (not C);
    Y1 <= (not A) and (not B) and C;
    Y2 <= (not A) and B and (not C);
    Y3 <= (not A) and B and C;
    Y4 <= A and (not B) and (not C);
    Y5 <= A and (not B) and C;
    Y6 <= A and B and (not C);
    Y7 <= A and B and C;

end Behavioral;