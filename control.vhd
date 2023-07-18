library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
--definicao de bibliotecas


entity control is
    Port ( o : in  STD_LOGIC_VECTOR (2 downto 0); --operador - variavel de controle
	        CLOCK_50: in std_logic;						--clock 50mhz
           z : out  STD_LOGIC_VECTOR (3 downto 0); --saida
           fz : out  STD_LOGIC;							--flag zero
           fo : out  STD_LOGIC;							--flag overflow
           fc : out  STD_LOGIC;							--flag carry out
           fsig : out  STD_LOGIC;						--flag sinal-negativo
           G_HEX0: out std_logic_vector(6 downto 0))--saida decoder 7 segmentos representando operando X
			  ;
end control;

architecture Behavioral of control is

--definicao dos componentes

component count_display is
    port (CLOCK_50: in std_logic;
    G_HEX0: out std_logic_vector(6 downto 0);
    xout: out unsigned(3 downto 0) := "0000");
end component;

signal counter: unsigned(3 downto 0) := "0000"; --variavel out do contador

component full_adder4 is
    Port ( x : in  STD_LOGIC_VECTOR(3 downto 0);
           y : in  STD_LOGIC_VECTOR(3 downto 0);
           z : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC;
           fl_over: out STD_LOGIC);

end component;

component subtractor4 is
    Port ( x : in  STD_LOGIC_VECTOR(3 downto 0);
           y : in  STD_LOGIC_VECTOR(3 downto 0);
           z : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC;
           fl_over: out STD_LOGIC);
end component;

component incr is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component;

component sign is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component;

component oand is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component oou is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component bgray is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component gbin is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

--definicao de variaveis

signal cout: STD_LOGIC;

signal x,y,z0,z1,z2,z3,z4,z5,z6,z7,z_temp : STD_LOGIC_VECTOR (3 downto 0);

signal c0,c1,c2,c3,ctemp,fo0,fo1: STD_LOGIC;


begin

counter0: count_display port map(CLOCK_50, G_HEX0, counter); --iteracao do contador
 

x <= std_logic_vector(counter); --atribuicao da saida do contador ao operando x

y <= "0010"; --operando y constante=2


--iteracao das operacoes
fa0: full_adder4 port map(x,y,z0,c0,fo0);
fa1: subtractor4 port map(x,y,z1,c1,fo1);
fa2: incr port map(x,z2,c2);
fa3: sign port map(x,z3,c3);
fa4: oand port map(x,y,z4);
fa5: oou port map(x,y,z5);
fa6: bgray port map(x,z6);
fa7: gbin port map(x,z7);

--mux das saidas x=saidas z das ops, z=saida escolhida, o= operacao-controle
z_temp <= z0 when o = "000" else
    z1 when o = "001" else
    z2 when o = "010" else
    z3 when o = "011" else
    z4 when o = "100" else
    z5 when o = "101" else
    z6 when o = "110" else
    z7;

--mux para vars de overclock
fo <= fo0 when o = "000" else fo1 when o = "001" else '0';

--mux para vars de zero
fz <= not(z_temp(0) or z_temp(1) or z_temp(2) or z_temp(3));

--mux para vars de sinal
fsig <= z_temp(3) when o = "011" else z_temp(3) when o = "001" else '0';

--mux para vars de carry out
ctemp <= c0 when o = "000" else
    c1 when o = "001" else
    c2 when o = "010" else
    c3 when o = "011" else '0';

fc <= ctemp; --carry out

z <= z_temp; --saida z

end Behavioral;
   

