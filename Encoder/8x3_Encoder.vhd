library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity EightToThreeEncoder is
    Port ( Y0 : in STD_LOGIC;
           Y1 : in STD_LOGIC;
           Y2 : in STD_LOGIC;
           Y3 : in STD_LOGIC;
           Y4 : in STD_LOGIC;
           Y5 : in STD_LOGIC;
           Y6 : in STD_LOGIC;
           Y7 : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC);
end EightToThreeEncoder;
architecture Behavioral of EightToThreeEncoder is
begin
    A <= Y4 or Y5 or Y6 or Y7;
    B <= Y2 or Y3 or Y6 or Y7;
    C <= Y1 or Y3 or Y5 or Y7;
end Behavioral;