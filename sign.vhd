library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end sign;

architecture Behavioral of sign is

component incr is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component incr;

-- define var x temporarioa
signal x_temp: STD_LOGIC_VECTOR(3 downto 0);

begin

--atribui x temp com inversao dos bits de x
x_temp<=x XOR "1111";

--iteracao do incremento de 1 em x temp
fa: incr port map (x_temp,z,cout);

end Behavioral;

