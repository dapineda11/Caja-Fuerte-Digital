--******************--
--        PONTIFICIA UNIVERSIDAD JAVERIANA   --
--              DISEÑO DE SISTEMAS DIGITALES --
--         CALCULADORA              			--
--     					                			--
--                        	        				--
-- Fecha:  	Octubre de 2018	 
--- Autor(es): Brayan Lozano
--             Daniel Pineda 
-----          Sebastián Corredor            --
--******************--

--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************--
-- este bloque corresponde al control del sistema
-- coordina la lógica y ejecuta los bloques en el orden
-- adecuado		                        --
--       					        --
--                                                      --
--******************--

entity CONTROL is
port(		
		clk:       in std_logic; --reloj de control
		reset:     in std_logic; --reset
		Confirmar: in std_logic; --boton confirmar
		Conteo:    in std_logic; --bandera del contador
		Columnas:  in std_logic_vector (3 downto 0); --entrada en columnas
		
		select_1:  out std_logic_vector (2 downto 0); -- selector de unidades
		select_2:  out std_logic_vector (2 downto 0); --selector de decenas
		select_3:  out std_logic_vector (2 downto 0); -- selector de centenas
		EnableDATO:out std_logic_vector (5 downto 0); --enable para los registros
      reset_Cont:out std_logic; --reset para el cotnador
		
		big_conteo:in std_logic;
		conteo_bits:in std_logic;
		
		enableGuardar: out std_logic;
		enableGlobal: out std_logic;
		enableDesplazar: out std_logic;
				
		resetBigContador:  out std_logic;
		reset_cont_bits:  out std_logic;
		
		estados:  out std_logic_vector (39 downto 0) --variable para observar en que estado se encuentra el sistema
	 );
end Entity CONTROL;     

architecture CONTROLArch of CONTROL is
--Incluir componentes
component dffe
port(
	  d,clk,clrn,prn,ena	:IN std_logic;
	  q						:OUT std_logic
	  );
end component;
-- Funcionamiento 
signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, q32, q33, q34, q35, q36, q37, q38, q39: std_logic;
signal d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, d32, d33, d34, d35, d36, d37, d38, d39: std_logic;

begin
--desarrollo 
FF0:  dffe port map (d0, clk,  '1', reset, '1', q0);
FF1:  dffe port map (d1, clk,  reset, '1', '1', q1);
FF2:  dffe port map (d2, clk,  reset, '1', '1', q2);
FF3:  dffe port map (d3, clk,  reset, '1', '1', q3);
FF4:  dffe port map (d4, clk,  reset, '1', '1', q4);
FF5:  dffe port map (d5, clk,  reset, '1', '1', q5);
FF6:  dffe port map (d6, clk,  reset, '1', '1', q6);
FF7:  dffe port map (d7, clk,  reset, '1', '1', q7);
FF8:  dffe port map (d8, clk,  reset, '1', '1', q8);
FF9:  dffe port map (d9, clk,  reset, '1', '1', q9);
FF10: dffe port map (d10, clk, reset, '1', '1', q10);
FF11: dffe port map (d11, clk, reset, '1', '1', q11);
FF12: dffe port map (d12, clk, reset, '1', '1', q12);
FF13: dffe port map (d13, clk, reset, '1', '1', q13);
FF14: dffe port map (d14, clk, reset, '1', '1', q14);
FF15: dffe port map (d15, clk, reset, '1', '1', q15);
FF16: dffe port map (d16, clk, reset, '1', '1', q16);
FF17: dffe port map (d17, clk, reset, '1', '1', q17);
FF18: dffe port map (d18, clk, reset, '1', '1', q18);
FF19: dffe port map (d19, clk, reset, '1', '1', q19);
FF20: dffe port map (d20, clk, reset, '1', '1', q20);
FF21: dffe port map (d21, clk, reset, '1', '1', q21);
FF22: dffe port map (d22, clk, reset, '1', '1', q22);
FF23: dffe port map (d23, clk, reset, '1', '1', q23);
FF24: dffe port map (d24, clk, reset, '1', '1', q24);
FF25: dffe port map (d25, clk, reset, '1', '1', q25);
FF26: dffe port map (d26, clk, reset, '1', '1', q26);
FF27: dffe port map (d27, clk, reset, '1', '1', q27);
FF28: dffe port map (d28, clk, reset, '1', '1', q28);
FF29: dffe port map (d29, clk, reset, '1', '1', q29);
FF30: dffe port map (d30, clk, reset, '1', '1', q30);
FF31: dffe port map (d31, clk, reset, '1', '1', q31);
FF32: dffe port map (d32, clk, reset, '1', '1', q32);
FF33: dffe port map (d33, clk, reset, '1', '1', q33);
FF34: dffe port map (d34, clk, reset, '1', '1', q34);
FF35: dffe port map (d35, clk, reset, '1', '1', q35);
FF36: dffe port map (d36, clk, reset, '1', '1', q36);
FF37: dffe port map (d37, clk, reset, '1', '1', q37);
FF38: dffe port map (d38, clk, reset, '1', '1', q38);
FF39: dffe port map (d39, clk, reset, '1', '1', q39);
-------------------------------------------------------------
--logica del ahpl
d0 <= (q2) or (q1 and not(conteo)) or (q39 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d1 <= (q0 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d2 <= (q1 and conteo);
d3 <= (q0 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d4 <= (q3) or (q4 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d5 <= (q6 and not(conteo)) or (q7);
d6 <= ((q5 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3))) or (q4 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3))));
d7 <= (q6 and conteo);
d8 <= (q5 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d9 <= (q8) or (q9 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d10 <= (q11 and not(conteo)) or (q12);
d11 <= (q10 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3))) or (q9 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d12 <= (q11 and conteo);
d13 <= (q10 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d14 <= (q13) or (q14 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d15 <= (q16 and not(conteo)) or (q17);
d16 <= (q14 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3))) or (q15 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d17 <= (q16 and conteo);
d18 <= (q15 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d19 <= (q18) or (q19 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d20 <= (q21 and not(conteo)) or (q22);
d21 <= (q19 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3))) or (q20 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d22 <= (q21 and conteo);
d23 <= (q20 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d24 <= (q23) or (q24 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d25 <= (q26 and not(conteo)) or (q27);
d26 <= (q24 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3))) or (q25 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d27 <= (q26 and conteo);
d28 <= (q25 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d29 <= (q28) or (q29 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d30 <= (q29 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d31 <= (q30) or (q31 and not(confirmar));
d32 <= (q31 and confirmar) or (q32 and confirmar);
d33 <= (q32 and not(confirmar));
d34 <= q33;

d35 <= q34 or ((not big_conteo and not conteo_bits) and q35) or (q36 and not(conteo_bits) );
d36 <= (big_conteo or conteo_bits )and (q35);
d37 <= q36 and conteo_bits;
d38 <= q37 or (q38 and not(columnas(0) or columnas(1) or columnas(2) or columnas(3)));
d39 <= (q38 and (columnas(0) or columnas(1) or columnas(2) or columnas(3))) or (q39 and (columnas(0) or columnas(1) or columnas(2) or columnas(3)));

-------------------------------------------------------------

select_3(0) <= q3 or q4 or q5 or q6 or q7 or q8 or q9 or q10 or q11 or q12 or q13 or q14 or q15 or q16 or q17;
select_2(0) <= q8 or q9 or q10 or q11 or q12 or q13 or q14 or q15 or q16 or q17;
select_1(0) <= q13 or q14 or q15 or q16 or q17;

select_3(1) <= q18 or q19 or q20 or q21 or q22 or q23 or q24 or q25 or q26 or q27 or q28 or q29 or q30 or q31 or q32;
select_2(1) <= q23 or q24 or q25 or q26 or q27 or q28 or q29 or q30 or q31 or q32;
select_1(1) <= q28 or q29 or q30 or q31 or q32;

select_3(2) <= q33 or q34 or q35 or q36 or q37 or q38;
select_2(2) <= q33 or q34 or q35 or q36 or q37 or q38;
select_1(2) <= q33 or q34 or q35 or q36 or q37 or q38;


EnableDATO(2)<= q3;
EnableDATO(1)<= q8;
EnableDATO(0)<= q13;
EnableDATO(5)<= q18;
EnableDATO(4)<= q23;
EnableDATO(3)<= q28;

reset_Cont <= q2 or q7 or q12 or q17 or q22 or q27;

resetBigContador<= q36;
reset_cont_bits <= q37;

enableGuardar   <= q33;
enableGlobal    <= q33 or q34 or q36;
enableDesplazar <= q34 or q36;

------------------------------------------------------------



estados(0) <= q0 ;
estados(1) <= q1 ;
estados(2) <= q2 ;
estados(3) <= q3 ;
estados(4) <= q4 ;
estados(5) <= q5 ;
estados(6) <= q6 ;
estados(7) <= q7 ;
estados(8) <= q8 ;
estados(9) <= q9 ;
estados(10) <= q10 ;
estados(11) <= q11 ;
estados(12) <= q12 ;
estados(13) <= q13 ;
estados(14) <= q14 ;
estados(15) <= q15 ;
estados(16) <= q16 ;
estados(17) <= q17 ;
estados(18) <= q18 ;
estados(19) <= q19 ;
estados(20) <= q20 ;
estados(21) <= q21 ;
estados(22) <= q22 ;
estados(23) <= q23 ;
estados(24) <= q24 ;
estados(25) <= q25 ;
estados(26) <= q26 ;
estados(27) <= q27 ;
estados(28) <= q28 ;
estados(29) <= q29 ;
estados(30) <= q30 ;
estados(31) <= q31 ;
estados(32) <= q32 ;
estados(33) <= q33 ;
estados(34) <= q34 ;

estados(35) <= q35 ;
estados(36) <= q36 ;
estados(37) <= q37 ;
estados(38) <= q38 ;
estados(39) <= q39 ;
End CONTROLArch;