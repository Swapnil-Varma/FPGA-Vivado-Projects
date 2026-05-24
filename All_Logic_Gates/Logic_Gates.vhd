library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity gates is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           ORGate : out STD_LOGIC;
           AndGate : out STD_LOGIC;
           NotGate : out STD_LOGIC;
           NandGate : out STD_LOGIC;
           NorGate : out STD_LOGIC;
           XORGate : out STD_LOGIC;
           XNORGate : out STD_LOGIC);
end gates;
architecture Behavioral of gates is
begin
ORGate <= a or b;
AndGate <= a and b;
NandGate <= a nand b;
NorGate <= a Nor b;
XNORGate <= a Xnor b;
XORGate <= a Xor b;
NotGate <= Not a;
end Behavioral;