--******************--
--        PONTIFICIA UNIVERSIDAD JAVERIANA          
-- Título:  CONTADOR 	                      
--******************--

--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;


--******************************************************--
-- este bloque corresponde al contador para manejar 
--cada cuanto se tomarà la lectura	                        --
--       					        --
--                                                      --
--******************************************************--


entity CONTADOR is
port(
		conteo: out std_logic;--conteo para manejar el debouncing
		columnas: in std_logic_vector(3 downto 0); --entrada en columnas del sistema
		reset_cont:  in std_logic;	
		clkCONTADOR:  in std_logic;
		cuenta: out std_logic_vector(1 downto 0) 
	 );
end Entity CONTADOR;     

architecture CONTADORArch of CONTADOR is
--Incluir componentes
component dffe
port(
	  d,clk,clrn,prn,ena	:IN std_logic;
	  q						:OUT std_logic
	  );
end component;
-- Funcionamiento 

-- definir variables 
signal q1, q2: std_logic;
signal EnableCONTADOR: std_logic;

signal c0,c1, c2, c3: std_logic;
begin
--desarrollo 

c0 <= not columnas(0);
c1 <= not columnas(1);
c2 <= not columnas(2);
c3 <= not columnas(3);

EnableCONTADOR <= (c0 and c1 and c2 and c3) ;

FF1:  dffe port map (not(q1),  clkCONTADOR, not(reset_cont), '1', EnableCONTADOR, q1);
FF2:  dffe port map (not(q2),  clkCONTADOR, not(reset_cont), '1', EnableCONTADOR AND q1 , q2);

conteo <= q1 and q2;

cuenta(0) <= q1;
cuenta(1) <= q2;

End CONTADORArch;

