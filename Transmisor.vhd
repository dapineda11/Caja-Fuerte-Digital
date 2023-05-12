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

entity Transmisor is
port(
		Big_out: in std_logic_vector(35 downto 0);
		EnableGuardar: in std_logic;
		EnableDesplazar: in std_logic;
		resetTransmisor: in std_logic;
		clkTransmisor: in std_logic;
		EnableGlobal: in std_logic;
		Salida: out std_logic
	 );
end Entity Transmisor;     

architecture TransmisorArch of Transmisor is
--Incluir componentes
component dffe
port(
	  d,clk,clrn,prn,ena: IN std_logic;
	  q:	OUT std_logic
	  );
end component;

-- Funcionamiento 

-- definir variables 
signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, q32, q33, q34, q35: std_logic;
begin
--desarrollo 
FF0: dffe port map ((Big_out(0) and EnableGuardar) or '0', clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q0);
FF1: dffe port map ((Big_out(1) and EnableGuardar) or '0', clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q1);
FF2: dffe port map ((Big_out(2) and EnableGuardar) or (q1 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q2);
FF3: dffe port map ((Big_out(3) and EnableGuardar) or (q2 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q3);
FF4: dffe port map ((Big_out(4) and EnableGuardar) or (q3 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q4);
FF5: dffe port map ((Big_out(5) and EnableGuardar) or (q4 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q5);
FF6: dffe port map ((Big_out(6) and EnableGuardar) or (q5 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q6);
FF7: dffe port map ((Big_out(7) and EnableGuardar) or (q6 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q7);
FF8: dffe port map ((Big_out(8) and EnableGuardar) or (q7 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q8);
FF9: dffe port map ((Big_out(9) and EnableGuardar) or (q8 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q9);
FF10: dffe port map ((Big_out(10) and EnableGuardar) or (q9 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q10);
FF11: dffe port map ((Big_out(11) and EnableGuardar) or (q10 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q11);
FF12: dffe port map ((Big_out(12) and EnableGuardar) or (q11 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q12);
FF13: dffe port map ((Big_out(13) and EnableGuardar) or (q12 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q13);
FF14: dffe port map ((Big_out(14) and EnableGuardar) or (q13 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q14);
FF15: dffe port map ((Big_out(15) and EnableGuardar) or (q14 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q15);
FF16: dffe port map ((Big_out(16) and EnableGuardar) or (q15 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q16);
FF17: dffe port map ((Big_out(17) and EnableGuardar) or (q16 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q17);
FF18: dffe port map ((Big_out(18) and EnableGuardar) or (q17 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q18);
FF19: dffe port map ((Big_out(19) and EnableGuardar) or (q18 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q19);
FF20: dffe port map ((Big_out(20) and EnableGuardar) or (q19 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q20);
FF21: dffe port map ((Big_out(21) and EnableGuardar) or (q20 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q21);
FF22: dffe port map ((Big_out(22) and EnableGuardar) or (q21 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q22);
FF23: dffe port map ((Big_out(23) and EnableGuardar) or (q22 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q23);
FF24: dffe port map ((Big_out(24) and EnableGuardar) or (q23 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q24);
FF25: dffe port map ((Big_out(25) and EnableGuardar) or (q24 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q25);
FF26: dffe port map ((Big_out(26) and EnableGuardar) or (q25 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q26);
FF27: dffe port map ((Big_out(27) and EnableGuardar) or (q26 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q27);
FF28: dffe port map ((Big_out(28) and EnableGuardar) or (q27 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q28);
FF29: dffe port map ((Big_out(29) and EnableGuardar) or (q28 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q29);
FF30: dffe port map ((Big_out(30) and EnableGuardar) or (q29 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q30);
FF31: dffe port map ((Big_out(31) and EnableGuardar) or (q30 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q31);
FF32: dffe port map ((Big_out(32) and EnableGuardar) or (q31 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q32);
FF33: dffe port map ((Big_out(33) and EnableGuardar) or (q32 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q33);
FF34: dffe port map ((Big_out(34) and EnableGuardar) or (q33 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q34);
FF35: dffe port map ((Big_out(35) and EnableGuardar) or (q34 and EnableDesplazar), clkTransmisor, not(resetTransmisor), '1', EnableGlobal, q35);

Salida <= q35;



End TransmisorArch;