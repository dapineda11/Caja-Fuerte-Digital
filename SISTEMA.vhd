--*******************************************--
--        PONTIFICIA UNIVERSIDAD JAVERIANA   --
--              DISEÑO DE SISTEMAS DIGITALES --
--         CALCULADORA              			--
--     					                			--
--                        	        				--
-- Fecha:  	Octubre de 2018	 					--
-- Autor(es):  Brayan Lozano						--
--             Daniel Pineda 						--
--             Sebastián Corredor            --
--*******************************************--

--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************--
-- Comentarios: este VHDL corresponde al bloque global  --
-- Sistema.                                             --
--                                                      --
--******************--

entity Sistema is
port(
		sistema_clki:  in std_logic; --reloj de entrada
		sistema_columnas: in std_logic_vector(3 downto 0);
		sistema_confirmar: in std_logic;
		sistema_reset: in std_logic;
		sistema_clko: out std_logic; --reloj de salida
		sistema_filas: out std_logic_vector(3 downto 0);
		sistema_unidad: out std_logic_vector(6 downto 0);
		sistema_decena: out std_logic_vector(6 downto 0);
		sistema_centena: out std_logic_vector(6 downto 0);
		sistema_miles: out std_logic_vector(6 downto 0);
		sistema_estados: out std_logic_vector(34 downto 0);
		suma1: out std_logic_vector(3 downto 0);
		suma2: out std_logic_vector(3 downto 0);
		suma3: out std_logic_vector(3 downto 0);
		
		dato1: out std_logic_vector(3 downto 0);
		dato2: out std_logic_vector(3 downto 0);
		dato3: out std_logic_vector(3 downto 0);
		dato4: out std_logic_vector(3 downto 0);
		dato5: out std_logic_vector(3 downto 0);
		dato6: out std_logic_vector(3 downto 0);
		leer_melo: out std_logic_vector(3 downto 0);
		enable_melo: out std_logic_vector(5 downto 0);
		suma4: out std_logic;
		sistema_conversoru: out std_logic_vector(7 downto 0);
		sistema_conversord: out std_logic_vector(7 downto 0);
		sistema_conversorc: out std_logic_vector(7 downto 0);
		sistema_conversorm: out std_logic_vector(7 downto 0)
		);
end Entity Sistema;     

architecture SistemaArch of Sistema is
--Incluir componentes   
component BARRIDO is
port(
			cuenta:IN std_logic_vector(1 downto 0); --	conteo para manejar el debouncing
			filas: OUT std_logic_vector(3 downto 0) -- salida barriendo fila por fila
	  );
end component  BARRIDO;
--------------------------------------------------------------------------------
component  CONTADOR is
port(
		conteo: out std_logic;--conteo para manejar el debouncing
		columnas: in std_logic_vector(3 downto 0); --entrada en columnas del sistema
		reset_cont:  in std_logic;	
		clkCONTADOR:  in std_logic;
		cuenta: out std_logic_vector(1 downto 0) 
	 );
end component CONTADOR;   
--------------------------------------------------------------------------------
component  CONTROL is
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
		
		estados:  out std_logic_vector (34 downto 0) --variable para observar en que estado se encuentra el sistema
	 );
end component  CONTROL;  
--------------------------------------------------------------------------------
component DATO is
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
end component DATO;  
--------------------------------------------------------------------------------
component deco_c is
port(
		ent_c		: in std_logic_vector (3 downto 0); --entrada centenas de la suma
		centena	: out std_logic_vector (6 downto 0) --gfedcba
		);
	end component deco_c;
--------------------------------------------------------------------------------
component deco_d is
port(
	
		ent_d		: in std_logic_vector (3 downto 0); --entrada decenas de la suma
		decena	: out std_logic_vector (6 downto 0) --gfedcba
		);
	end component deco_d;
--------------------------------------------------------------------------------
component deco_m is
port(
		Ultracarry		: in std_logic; -- 1 si el numero sumado es mayor a mil, 0 si no se cumple
		miles	: out std_logic_vector (6 downto 0) --gfedcba
		);
	end component deco_m;
--------------------------------------------------------------------------------
component deco_u is
port(
	
		ent_u		: in std_logic_vector (3 downto 0); --entrada unidades de la suma
		unidad	: out std_logic_vector (6 downto 0) --gfedcba
		);
	end component deco_u;
--------------------------------------------------------------------------------
	component LEER is
port(
			columnas:IN std_logic_vector(3 downto 0); -- entrada en columnas
			filas: 	IN std_logic_vector(3 downto 0); -- salida en filas
			lectura:	OUT std_logic_vector(3 downto 0) -- lectura obtenida al combinar columnas con filas
	  );
end component LEER;  
--------------------------------------------------------------------------------
component SELECTOR_1 is
port(
			suma_u: IN std_logic_vector(3 downto 0); -- suma unidades
			DATO_in_1: IN std_logic_vector(3 downto 0); -- dato 1 de entrada 
			DATO_in_4: IN std_logic_vector(3 downto 0); -- dato 2 de entrada
			
			select_1:IN std_logic_vector(2 downto 0); --	selector	para unidades
			ent_u: OUT std_logic_vector(3 downto 0) 
	  );
end component SELECTOR_1;  
--------------------------------------------------------------------------------
component SELECTOR_2 is
port(
			suma_d: IN std_logic_vector(3 downto 0); -- suma decenas
			DATO_in_2: IN std_logic_vector(3 downto 0); -- dato de entrada 2
			DATO_in_5: IN std_logic_vector(3 downto 0); -- dato de entrada 5
			
			select_2:IN std_logic_vector(2 downto 0); --	selector	para decenas
			ent_d: OUT std_logic_vector(3 downto 0) 
	  );
end component SELECTOR_2; 
 
--------------------------------------------------------------------------------
component SELECTOR_3 is
port(
			suma_c: IN std_logic_vector(3 downto 0); -- suma centenas
			DATO_in_3: IN std_logic_vector(3 downto 0); -- dato de entrada 3
			DATO_in_6: IN std_logic_vector(3 downto 0); -- dato de entrada 6
			
			select_3:IN std_logic_vector(2 downto 0); --	selector	para centenas
			ent_c: OUT std_logic_vector(3 downto 0) 
			);
end component SELECTOR_3; 
--------------------------------------------------------------------------------

component SUMADOR is
port(
			DATO_out_1: IN std_logic_vector(3 downto 0); -- Número 1 IN; DATO_out_1
			DATO_out_2: IN std_logic_vector(3 downto 0); -- Número 2 IN; DATO_out_4
			DATO_out_3: IN std_logic_vector(3 downto 0); -- Número 3 IN; DATO_out_1
			DATO_out_4: IN std_logic_vector(3 downto 0); -- Número 4 IN; DATO_out_4
			DATO_out_5: IN std_logic_vector(3 downto 0); -- Número 5 IN; DATO_out_1
			DATO_out_6: IN std_logic_vector(3 downto 0); -- Número 6 IN; DATO_out_4
			suma_u: OUT std_logic_vector(3 downto 0); -- resultado de la suma_u
			suma_d: OUT std_logic_vector(3 downto 0); -- resultado de la suma_d
			suma_c: OUT std_logic_vector(3 downto 0); -- resultado de la suma_c
			Ultracarry: OUT std_logic
	  );
end component SUMADOR; 
--------------------------------------------------------------------------------
component fulladder is
port(
		a         : IN std_logic;
	   b         : IN std_logic;
		Ci        : IN std_logic;    -- Carry IN
		
		Co        : OUT std_logic;   -- Carry OUT
		S         : OUT std_logic    -- Salida
	  );
end component fulladder;   
-------------------------------------------------------------------------------
component Big_Contador is
port(
		big_conteo: out std_logic;--una señal de salida 
		EnableBigContador:  in std_logic;-- ESTE TIPO ES PARA UNA SOLA SEÑAL
		resetBigContador:  in std_logic;-- ESTE TIPO ES PARA UNA SOLA SEÑAL
		conteo_melo: out std_logic_vector(12 downto 0);
		clkBigContador:  in std_logic-- ESTE TIPO ES PARA UNA SOLA SEÑAL
	
		
	 );
end component Big_Contador; 
---------------------------------------------------------------------------
component conversor is
port(
			unidades: in std_logic_vector(3 downto 0);
			decenas: in std_logic_vector(3 downto 0);
			centenas: in std_logic_vector(3 downto 0);
			ultracarry: in std_logic;
			u_ascii: out std_logic_vector(7 downto 0);
			d_ascii: out std_logic_vector(7 downto 0);
			c_ascii: out std_logic_vector(7 downto 0);
			m_ascii: out std_logic_vector(7 downto 0)
			
	  );
end component conversor; 
---------------------------------------------------------------------------------------------
--señales de conexion ente bloques
signal contador_cuenta: std_logic_vector (1 downto 0);
signal barrido_filas: std_logic_vector (3 downto 0);
signal contador_conteo: std_logic;
signal control_resetcont: std_logic;
signal control_select1: std_logic_vector(2 downto 0);
signal control_select2: std_logic_vector(2 downto 0);
signal control_select3: std_logic_vector(2 downto 0);
signal control_enableDato: std_logic_vector(5 downto 0);
signal control_resetDato: std_logic;
signal leer_lectura: std_logic_vector(3 downto 0);
signal dato_sumador1, dato_sumador2, dato_sumador3, dato_sumador4, dato_sumador5, dato_sumador6: std_logic_vector(3 downto 0);
signal selector3_deco, selector2_deco, selector1_deco: std_logic_vector(3 downto 0);
signal sumador_carry: std_logic;
signal sumador_sumau, sumador_sumad, sumador_sumac: std_logic_vector(3 downto 0);
signal conversor_u, conversor_d, conversor_c, conversor_m: std_logic_vector(7 downto 0);
-------------------------------------------------------------------------------
begin
--declaracion de bloques
bloque_BARRIDO: BARRIDO port map(contador_cuenta, barrido_filas);
bloque_CONTADOR: CONTADOR port map( contador_conteo, sistema_columnas, control_resetcont, sistema_clki, contador_cuenta);
bloque_Control: CONTROL port map(sistema_clki, sistema_reset, sistema_confirmar, contador_conteo, sistema_columnas, control_select1, control_select2, control_select3, control_enableDato, control_resetcont, sistema_estados);
bloque_DATO: DATO port map(leer_lectura, leer_lectura, leer_lectura, leer_lectura, leer_lectura, leer_lectura, dato_sumador1, dato_sumador2, dato_sumador3, dato_sumador4, dato_sumador5, dato_sumador6, control_enableDato, control_resetDato, sistema_clki);
bloque_deco_c: deco_c port map(selector3_deco, sistema_centena);
bloque_deco_d: deco_d port map(selector2_deco, sistema_decena);
bloque_deco_m: deco_m port map(sumador_carry, sistema_miles);
bloque_deco_u: deco_u port map(selector1_deco, sistema_unidad);
bloque_LEER: LEER port map( sistema_columnas, barrido_filas, leer_lectura);
bloque_SELECTOR_1: SELECTOR_1 port map(sumador_sumau, dato_sumador1, dato_sumador4, control_select1, selector1_deco);
bloque_SELECTOR_2: SELECTOR_2 port map(sumador_sumad, dato_sumador2, dato_sumador5, control_select2, selector2_deco);
bloque_SELECTOR_3: SELECTOR_3 port map(sumador_sumac, dato_sumador3, dato_sumador6, control_select3, selector3_deco);
bloque_SUMADOR: SUMADOR port map(dato_sumador1, dato_sumador2, dato_sumador3, dato_sumador4, dato_sumador5, dato_sumador6, sumador_sumau, sumador_sumad, sumador_sumac, sumador_carry);
bloque_conversor: conversor port map(sumador_sumau, sumador_sumad, sumador_sumac, sumador_carry, conversor_u, conversor_d, conversor_c, conversor_m);
sistema_filas <= barrido_filas;

suma1 <= sumador_sumau;
suma2 <= sumador_sumad;
suma3 <= sumador_sumac;
suma4 <= sumador_carry;

dato1 <= dato_sumador1;
dato2 <= dato_sumador2;
dato3 <= dato_sumador3;
dato4 <= dato_sumador4;
dato5 <= dato_sumador5;
dato6 <= dato_sumador6;
leer_melo <= leer_lectura;
enable_melo <= control_enableDato;
sistema_conversoru <= conversor_u;
sistema_conversord <= conversor_d;
sistema_conversorc <= conversor_c;
sistema_conversorm <= conversor_m;

End SistemaArch;