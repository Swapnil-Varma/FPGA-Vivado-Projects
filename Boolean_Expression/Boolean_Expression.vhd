library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity BooleanExpression is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Z : out STD_LOGIC);
end BooleanExpression;
architecture Behavioral of BooleanExpression is
begin
Z<= (A AND B) OR ((NOT A) AND C) OR (NOT B);
end Behavioral;
