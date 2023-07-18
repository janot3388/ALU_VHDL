library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity oou is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end oou;

architecture Behavioral of oou is


begin

-- z definido por or entre operandos
z <= x OR y;

end Behavioral;