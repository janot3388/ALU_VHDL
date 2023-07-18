library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity incr is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end incr;

architecture Behavioral of incr is

component full_adder_base is
    Port ( x : in  STD_LOGIC_VECTOR(3 downto 0);
           y : in  STD_LOGIC_VECTOR(3 downto 0);
			  cin : in STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC);
end component;


begin

--iteracao da soma entre x e nada, com carry in = 1 para incrementar no valor final
fa: full_adder_base port map (x,"0000",'1',z,cout);

end Behavioral;

