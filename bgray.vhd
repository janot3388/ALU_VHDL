library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity bgray is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end bgray;

architecture Behavioral of bgray is

begin

-- algoritmo de codificacao de binario para gray

z(0) <= x(0) XOR x(1);
z(1) <= x(1) XOR x(2);
z(2) <= x(2) XOR x(3);
z(3) <= x(3);

end Behavioral;