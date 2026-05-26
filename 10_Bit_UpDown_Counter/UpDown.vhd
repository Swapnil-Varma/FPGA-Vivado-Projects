library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity vhdl_binary_counter is
    port(Clk,reset,updown: in std_logic;
     Q : out std_logic_vector(9 downto 0));
end vhdl_binary_counter;
architecture behavioral of vhdl_binary_counter is
signal tmp:std_logic_vector(9 downto 0);
begin
    process (Clk,reset)
begin
       if(Clk='1' and Clk'event)then
        if (reset= '1')then
    tmp <= "0000000000";
elsif(updown='1')then
    tmp <= tmp - "0000000001";
else
        tmp<=tmp + "0000000001";
     end if;
    end if;
end process;
    Q <= tmp;
end behavioral;