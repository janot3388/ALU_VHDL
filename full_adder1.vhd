library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder1 is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
		     z : out STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC);
end full_adder1;

architecture Behavioral of full_adder1 is

begin

z<= x XOR y XOR cin;

cout<=((x XOR y)AND cin) OR (x AND y);

end Behavioral;

