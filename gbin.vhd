library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity gbin is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end gbin;

architecture Behavioral of gbin is

-- variavel de saida temporaria
signal z_temp: STD_LOGIC_VECTOR(3 downto 0);

begin

-- algoritmo de decodificacao de gray para binario

z_temp(3) <= x(3);
z_temp(2) <= z_temp(3) XOR x(2);
z_temp(1) <= z_temp(2) XOR x(1);
z_temp(0) <= z_temp(1) XOR x(0);

-- variavel de saida final
z <= z_temp;

end Behavioral;