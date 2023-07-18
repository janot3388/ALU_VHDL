library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder_base is
    Port ( x : in  STD_LOGIC_VECTOR(3 downto 0);
           y : in  STD_LOGIC_VECTOR(3 downto 0);
           cin : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC;
           fl_over: out STD_LOGIC);
end full_adder_base;

architecture Behavioral of full_adder_base is

component full_adder1 is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
			  z : out STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC);
end component; 

--definicao da variavel de carry interno e final temporario
signal carries: STD_LOGIC_VECTOR(2 downto 0);

signal cout_t: STD_LOGIC;

begin

--iteracoes do adder de 1 bit para efetuar soma-subtracao de 4 bits

fa0: full_adder1 port map (x(0),y(0),z(0),cin,carries(0));
fa1: full_adder1 port map (x(1),y(1),z(1),carries(0),carries(1));
fa2: full_adder1 port map (x(2),y(2),z(2),carries(1),carries(2));
fa3: full_adder1 port map (x(3),y(3),z(3),carries(2),cout_t);

-- definicao do caso de overflow
fl_over <= carries(2) xor cout_t;

--atribuicao carry out
cout <= cout_t;

end Behavioral;

