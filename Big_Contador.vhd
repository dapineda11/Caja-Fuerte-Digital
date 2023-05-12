--******************--
--        PONTIFICIA UNIVERSIDAD JAVERIANA              --
--          diseño de sistemas digitales                --
--                        --
--     					                --
-- Título:  proyecto 3                      	        --
-- Fecha:  	Febrero de 2018	                        --
--******************--

--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************--
-- Comentarios  		                        --
--       					        --
--                                                      --
--******************--

entity Big_Contador is
port(
		big_conteo: out std_logic;--una señal de salida 
		EnableBigContador:  in std_logic;-- ESTE TIPO ES PARA UNA SOLA SEÑAL
		resetBigContador:  in std_logic;-- ESTE TIPO ES PARA UNA SOLA SEÑAL
		clkBigContador:  in std_logic-- ESTE TIPO ES PARA UNA SOLA SEÑAL	
	 );
end Entity Big_Contador;     

architecture Big_ContadorArch of Big_Contador is
--Incluir componentes
component dffe
port(
	  d,clk,clrn,prn,ena	:IN std_logic;
	  q						:OUT std_logic
	  );
end component;
-- Funcionamiento 

-- definir variables 
signal q1, q2, q3, q4, q5 ,q6, q7 ,q8 ,q9 , q10, q11, q12, q13: std_logic;
begin
--desarrollo 

FF1:  dffe port map (not(q1),  clkBigContador, not(resetBigContador), '1', EnableBigContador, q1);
FF2:  dffe port map (not(q2),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 , q2);
FF3:  dffe port map (not(q3),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 AND q2, q3);
FF4:  dffe port map (not(q4),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 AND q2 AND q3, q4);
FF5:  dffe port map (not(q5),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 AND q2 and q3 and q4, q5);
FF6:  dffe port map (not(q6),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 and q2 and q3 and q4 and q5, q6);
FF7:  dffe port map (not(q7),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 AND q2 and q3 and q4 and q5 and q6, q7);
FF8:  dffe port map (not(q8),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 AND q2 AND q3 and q4 and q5 and q6 and q7, q8);
FF9:  dffe port map (not(q9),  clkBigContador, not(resetBigContador), '1', EnableBigContador and q1 and q2 and q3 and q4 and q5 and q6 and q7 and q8, q9);
FF10:  dffe port map (not(q10),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 and q2 and q3 and q4 and q5 and q6 and q7 and q8 and q9, q10);
FF11:  dffe port map (not(q11),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 AND q2 and q3 and q4 and q5 and q6 and q7 and q8 and q9 and q10, q11);
FF12:  dffe port map (not(q12),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 AND q2 AND q3 and q4 and q5 and q6 and q7 and q8 and q9 and q10 and q11, q12);
FF13:  dffe port map (not(q13),  clkBigContador, not(resetBigContador), '1', EnableBigContador AND q1 AND q2 AND q3 and q4 and q5 and q6 and q7 and q8 and q9 and q10 and q11 and q12, q13);

big_conteo <= q1 and q4 and q5 and q7 and q11 and q13;

End Big_ContadorArch;