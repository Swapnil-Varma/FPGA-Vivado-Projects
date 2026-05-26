library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Full_Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Full_Adder;
architecture Behavioral of Full_Adder is
begin
Cout <= (A AND B) OR (Cin AND (A XOR B));
S <= A XOR B XOR Cin;
end Behavioral;