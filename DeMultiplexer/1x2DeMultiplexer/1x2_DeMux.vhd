library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DeMux2to1 is
    Port ( A : in  STD_LOGIC;
           S : in  STD_LOGIC;
           P : out STD_LOGIC;
           Q : out STD_LOGIC);
end DeMux2to1;
architecture Behavioral of DeMux2to1 is
begin
    P <= A AND (NOT S);
    Q <= A AND S;
end Behavioral;