library ieee;
use ieee.std_logic_1164.all;
entity SR_FF is
    port(
        S, R, CLOCK : in  std_logic;
        Q, QBAR     : out std_logic );
end SR_FF;
architecture behavioral of SR_FF is
begin
    process (CLOCK)
        variable tmp : std_logic := '0';  -- initialization
    begin
        if rising_edge(CLOCK) then
            if (S='0' and R='0') then
                tmp := tmp;        -- hold
            elsif (S='0' and R='1') then
                tmp := '0';        -- reset
            elsif (S='1' and R='0') then
                tmp := '1';        -- set
            else
                tmp := '0';        -- invalid state
            end if;

            Q    <= tmp;
            QBAR <= not tmp;
        end if;
 end process;
end behavioral;
