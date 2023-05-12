--*************************--
-- DEFINICIÓN DE LIBRERIAS --
--*************************--
library IEEE; 
use IEEE.std_logic_1164.all;
--****--
-- DEFINICIÓN DE ENTIDAD --
--****--
	entity SELECTOR_2 is
port(
			suma_d: IN std_logic_vector(3 downto 0); --
			DATO_in_2: IN std_logic_vector(3 downto 0); -- 
			DATO_in_5: IN std_logic_vector(3 downto 0); --
			
			select_2:IN std_logic_vector(2 downto 0); --	selector	
			ent_d: OUT std_logic_vector(3 downto 0) --
			
	  );
end entity SELECTOR_2;        
--***--
--DEFINICIÓN DE ARQUITECTURA --
--***--
architecture SELECTOR_2Arch of SELECTOR_2 is
--***--
--DEFINICIÓN DE COMPONENTES--
--***-- 

--DEFINICIÓN DE SEÑALES DE CONEXIÓN --
--****--
signal s0: std_logic;
signal s1: std_logic;
signal s2: std_logic;

--******--
--Instancias y Conectividad
--******--
begin
s0 <= select_2(0);
s1 <= select_2(1);
s2 <= select_2(2);

ent_d(0) <= (DATO_in_2(0) and s0) or (DATO_in_5(0) and s1) or (suma_d(0) and s2);
ent_d(1) <= (DATO_in_2(1) and s0) or (DATO_in_5(1) and s1) or (suma_d(1) and s2);
ent_d(2) <= (DATO_in_2(2) and s0) or (DATO_in_5(2) and s1) or (suma_d(2) and s2);  
ent_d(3) <= (DATO_in_2(3) and s0) or (DATO_in_5(3) and s1) or (suma_d(3) and s2);  

end  SELECTOR_2Arch;