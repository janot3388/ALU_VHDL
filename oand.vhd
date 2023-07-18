library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity oand is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end oand;

architecture Behavioral of oand is


begin

-- z definido por and entre operandos
z <= x AND y;

end Behavioral;