--*************************--
-- DEFINICIÓN DE LIBRERIAS --
--*************************--
library IEEE; 
use IEEE.std_logic_1164.all;
--****--
-- DEFINICIÓN DE ENTIDAD --
--****--
	entity SELECTOR_3 is
port(
			suma_c: IN std_logic_vector(3 downto 0); --
			DATO_in_3: IN std_logic_vector(3 downto 0); -- 
			DATO_in_6: IN std_logic_vector(3 downto 0); --
			
			select_3:IN std_logic_vector(2 downto 0); --	selector	
			ent_c: OUT std_logic_vector(3 downto 0) --
			
	  );
end entity SELECTOR_3;        
--***--
--DEFINICIÓN DE ARQUITECTURA --
--***--
architecture SELECTOR_3Arch of SELECTOR_3 is
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
s0 <= select_3(0);
s1 <= select_3(1);
s2 <= select_3(2);

ent_c(0) <= (DATO_in_3(0) and s0) or (DATO_in_6(0) and s1) or (suma_c(0) and s2);
ent_c(1) <= (DATO_in_3(1) and s0) or (DATO_in_6(1) and s1) or (suma_c(1) and s2);
ent_c(2) <= (DATO_in_3(2) and s0) or (DATO_in_6(2) and s1) or (suma_c(2) and s2);  
ent_c(3) <= (DATO_in_3(3) and s0) or (DATO_in_6(3) and s1) or (suma_c(3) and s2);  

end  SELECTOR_3Arch;