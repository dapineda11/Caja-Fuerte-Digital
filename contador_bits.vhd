--******************--
--        PONTIFICIA UNIVERSIDAD JAVERIANA              --
--              diseño de sistemas digitales                     --
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

entity contador_bits is
port(
		conteo_bits: out std_logic;--una señal de salida 
		big_conteo:  in std_logic;-- ESTE TIPO ES PARA UNA SOLA SEÑAL
		reset_cont_bits:  in std_logic;-- ESTE TIPO ES PARA UNA SOLA SEÑAL
		clkcontador_bits:  in std_logic-- ESTE TIPO ES PARA UNA SOLA SEÑAL	
	 );
end Entity contador_bits;     

architecture contador_bitsArch of contador_bits is
--Incluir componentes
component dffe
port(
	  d,clk,clrn,prn,ena	:IN std_logic;
	  q						:OUT std_logic
	  );
end component;
-- Funcionamiento 

-- definir variables 
signal q1, q2, q3, q4, q5 ,q6: std_logic;
begin
--desarrollo 

FF1:  dffe port map (not(q1),  clkcontador_bits, not(reset_cont_bits), '1', big_conteo, q1);
FF2:  dffe port map (not(q2),  clkcontador_bits, not(reset_cont_bits), '1', big_conteo AND q1 , q2);
FF3:  dffe port map (not(q3),  clkcontador_bits, not(reset_cont_bits), '1', big_conteo AND q1 AND q2, q3);
FF4:  dffe port map (not(q4),  clkcontador_bits, not(reset_cont_bits), '1', big_conteo AND q1 AND q2 AND q3, q4);
FF5:  dffe port map (not(q5),  clkcontador_bits, not(reset_cont_bits), '1', big_conteo AND q1 AND q2 and q3 and q4, q5);
FF6:  dffe port map (not(q6),  clkcontador_bits, not(reset_cont_bits), '1', big_conteo AND q1 and q2 and q3 and q4 and q5, q6);

conteo_bits <= q1 and q2 and q6 and not q3 and not q4 and not q5;



End contador_bitsArch;