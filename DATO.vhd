--******************************************************--
--        PONTIFICIA UNIVERSIDAD JAVERIANA              --
--              diseño de sistemas digitales            --
--                       --
--     					                --
-- Título:  proyecto 2                        	        --
-- Fecha:  	Noviembre 02 del 2019	                        --
--******************************************************--

--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************************************************--
-- este bloque corresponde al registro para guardar
-- los numeros que van a sumarse  		                        --
--       					        --
--                                                      --
--******************************************************--

entity DATO is
port(
		DATO_in_1: in std_logic_vector (3 downto 0); --dato de entrada 1
		DATO_in_2: in std_logic_vector (3 downto 0); --dato de entrada 2
		DATO_in_3: in std_logic_vector (3 downto 0); --dato de entrada 3
		DATO_in_4: in std_logic_vector (3 downto 0); --dato de entrada 4
		DATO_in_5: in std_logic_vector (3 downto 0); --dato de entrada 5
		DATO_in_6: in std_logic_vector (3 downto 0); --dato de entrada 6
		
		DATO_out_1: out std_logic_vector (3 downto 0); --dato de salida 1
		DATO_out_2: out std_logic_vector (3 downto 0); --dato de salida 2
		DATO_out_3: out std_logic_vector (3 downto 0); --dato de salida 3
		DATO_out_4: out std_logic_vector (3 downto 0); --dato de salida 4
		DATO_out_5: out std_logic_vector (3 downto 0); --dato de salida 5
		DATO_out_6: out std_logic_vector (3 downto 0); --dato de salida 6
		EnableDATO: in std_logic_vector (5 downto 0); --enable para los registros
		resetDATO:  in std_logic;
		clkDATO:  in std_logic
	 );
end Entity DATO;     

architecture DATOArch of DATO is
--Incluir componentes
component dffe
port(
	  d,clk,clrn,prn,ena: IN std_logic;
	  q:	OUT std_logic
	  );
end component;

-- Funcionamiento 

-- definir variables 
signal q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24: std_logic;
begin
--desarrollo 
FF1: dffe port map (DATO_in_1(0) , clkDATO, not(resetDATO), '1', EnableDATO(0), q1);
FF2: dffe port map (DATO_in_1(1) , clkDATO, not(resetDATO), '1', EnableDATO(0), q2);
FF3: dffe port map (DATO_in_1(2) , clkDATO, not(resetDATO), '1', EnableDATO(0), q3);
FF4: dffe port map (DATO_in_1(3) , clkDATO, not(resetDATO), '1', EnableDATO(0), q4);
FF5: dffe port map (DATO_in_2(0) , clkDATO, not(resetDATO), '1', EnableDATO(1), q5);
FF6: dffe port map (DATO_in_2(1) , clkDATO, not(resetDATO), '1', EnableDATO(1), q6);
FF7: dffe port map (DATO_in_2(2) , clkDATO, not(resetDATO), '1', EnableDATO(1), q7);
FF8: dffe port map (DATO_in_2(3) , clkDATO, not(resetDATO), '1', EnableDATO(1), q8);
FF9: dffe port map (DATO_in_3(0) , clkDATO, not(resetDATO), '1', EnableDATO(2), q9);
FF10: dffe port map (DATO_in_3(1), clkDATO, not(resetDATO), '1', EnableDATO(2), q10);
FF11: dffe port map (DATO_in_3(2), clkDATO, not(resetDATO), '1', EnableDATO(2), q11);
FF12: dffe port map (DATO_in_3(3), clkDATO, not(resetDATO), '1', EnableDATO(2), q12);
FF13: dffe port map (DATO_in_4(0), clkDATO, not(resetDATO), '1', EnableDATO(3), q13);
FF14: dffe port map (DATO_in_4(1), clkDATO, not(resetDATO), '1', EnableDATO(3), q14);
FF15: dffe port map (DATO_in_4(2), clkDATO, not(resetDATO), '1', EnableDATO(3), q15);
FF16: dffe port map (DATO_in_4(3), clkDATO, not(resetDATO), '1', EnableDATO(3), q16);
FF17: dffe port map (DATO_in_5(0), clkDATO, not(resetDATO), '1', EnableDATO(4), q17);
FF18: dffe port map (DATO_in_5(1), clkDATO, not(resetDATO), '1', EnableDATO(4), q18);
FF19: dffe port map (DATO_in_5(2), clkDATO, not(resetDATO), '1', EnableDATO(4), q19);
FF20: dffe port map (DATO_in_5(3), clkDATO, not(resetDATO), '1', EnableDATO(4), q20);
FF21: dffe port map (DATO_in_6(0), clkDATO, not(resetDATO), '1', EnableDATO(5), q21);
FF22: dffe port map (DATO_in_6(1), clkDATO, not(resetDATO), '1', EnableDATO(5), q22);
FF23: dffe port map (DATO_in_6(2), clkDATO, not(resetDATO), '1', EnableDATO(5), q23);
FF24: dffe port map (DATO_in_6(3), clkDATO, not(resetDATO), '1', EnableDATO(5), q24);


DATO_out_1(0) <= q1;
DATO_out_1(1) <= q2;
DATO_out_1(2) <= q3;
DATO_out_1(3) <= q4;

DATO_out_2(0) <= q5;
DATO_out_2(1) <= q6;
DATO_out_2(2) <= q7;
DATO_out_2(3) <= q8;

DATO_out_3(0) <= q9;
DATO_out_3(1) <= q10;
DATO_out_3(2) <= q11;
DATO_out_3(3) <= q12;

DATO_out_4(0) <= q13;
DATO_out_4(1) <= q14;
DATO_out_4(2) <= q15;
DATO_out_4(3) <= q16;

DATO_out_5(0) <= q17;
DATO_out_5(1) <= q18;
DATO_out_5(2) <= q19;
DATO_out_5(3) <= q20;

DATO_out_6(0) <= q21;
DATO_out_6(1) <= q22;
DATO_out_6(2) <= q23;
DATO_out_6(3) <= q24;
End DATOArch;