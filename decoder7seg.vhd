library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity decoder7seg is
port (
bcd_in: in unsigned(3 downto 0) := "0000";
seven_seg_out: out std_logic_vector(6 downto 0)
);
end decoder7seg;

architecture dataflow of decoder7seg is

begin
seven_seg_out <= "1000000" when bcd_in = "0000" else -- 0
"1111001" when bcd_in = "0001" else -- 1
"0100100" when bcd_in = "0010" else -- 2
"0110000" when bcd_in = "0011" else -- 3
"0011001" when bcd_in = "0100" else -- 4
"0010010" when bcd_in = "0101" else -- 5
"0000010" when bcd_in = "0110" else -- 6
"1111000" when bcd_in = "0111" else -- 7
"0000000" when bcd_in = "1000" else -- 8
"0011000" when bcd_in = "1001" else -- 9

"0000010" when bcd_in = "0001" else -- a
"1100000" when bcd_in = "0010" else -- b
"0110001" when bcd_in = "0011" else -- c
"1000010" when bcd_in = "0101" else -- d
"0110000" when bcd_in = "0101" else -- e
"0111000" when bcd_in = "0110" else -- f

"0111111"; -- null
end dataflow;

