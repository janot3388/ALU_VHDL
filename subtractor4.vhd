library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtractor4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           fl_over: out STD_LOGIC);

end subtractor4;

architecture Behavioral of subtractor4 is

component full_adder_base is
    Port ( x : in  STD_LOGIC_VECTOR(3 downto 0);
           y : in  STD_LOGIC_VECTOR(3 downto 0);
		   cin : in STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC;
           fl_over: out STD_LOGIC);

end component; 

signal y_temp: STD_LOGIC_VECTOR(3 downto 0);

begin
-- xor entre bits de y e constante 1, para subtracao
y_temp<=y XOR "1111";

--iteracao do somador subtrator base, com cin=1
fa: full_adder_base port map (x,y_temp,'1',z,cout,fl_over);

end Behavioral;

