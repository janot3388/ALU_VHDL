library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity full_adder4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           fl_over: out STD_LOGIC);

end full_adder4;

architecture Behavioral of full_adder4 is

component full_adder_base is
    Port ( x : in  STD_LOGIC_VECTOR(3 downto 0);
           y : in  STD_LOGIC_VECTOR(3 downto 0);
			  cin : in STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC;
           fl_over: out STD_LOGIC);

end component;

begin

--iteracao do somador subtrator base, com cin=0
fa: full_adder_base port map (x,y,'0',z,cout,fl_over); 


end Behavioral;

